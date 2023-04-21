/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import featureAbility from '@ohos.ability.featureAbility';
import backgroundTaskManager from '@ohos.backgroundTaskManager';
import emitter from '@ohos.events.emitter';
import geolocation from '@ohos.geolocation';
import Notification from '@ohos.notification';
import wantAgent from '@ohos.wantAgent';
import { CommonConstants } from '../MainAbility/common/constants/CommonConstants';
import EmitterUtil from '../MainAbility/common/util/EmitterUtil';
import Logger from '../MainAbility/common/util/Logger';

let currentLocation: string = '';
let timerID: number = 0;
let latitude: number = 0;
let longitude: number = 0;
const TAG: string = 'Service';

let notificationRequest = {
  content: {
    contentType: Notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
    normal: {
      title: CommonConstants.NOTIFICATION_TITLE,
      text: currentLocation
    }
  },
  id: CommonConstants.NOTIFICATION_ID
};

function callback(err) {
  if (err) {
    Logger.error(TAG, `Operation failed cause: ${err}`);
    return;
  }
  Logger.info(TAG, `Operation startBackgroundRunning succeeded`);

  timerID = setInterval(() => {
    notificationRequest.content.normal.text = currentLocation;
    Notification.publish(notificationRequest);
  }, CommonConstants.INTERVAL_TIME);
}

function startContinuousTask() {
  featureAbility.getContext().getAbilityInfo((err, data) => {
    if (err) {
      Logger.error(TAG, 'Get bundle name error: ' + JSON.stringify(err));
      return;
    }
    let wantAgentInfo = {
      wants: [
        {
          bundleName: data.bundleName,
          abilityName:data.name
        }
      ],
      operationType: wantAgent.OperationType.START_ABILITIES,
      requestCode: 0,
      wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
    };
    wantAgent.getWantAgent(wantAgentInfo).then((data) => {
      backgroundTaskManager.startBackgroundRunning(featureAbility.getContext(),
        backgroundTaskManager.BackgroundMode.LOCATION, data, callback);
    })
  });
}

function activateLocation() {
  geolocationOn((location) => {
   if (latitude === location.latitude && longitude === location.longitude) {
     return;
   }
    latitude = location.latitude;
    longitude = location.longitude;
    let reverseGeocodeRequest = { 'latitude': latitude, 'longitude': longitude };
    geolocation.getAddressesFromLocation(reverseGeocodeRequest).then(data => {
      currentLocation = data[0].placeName;
      EmitterUtil.emitterEmit(currentLocation);
    }).catch(err => {
      Logger.error(TAG, 'GetAddressesFromLocation err ' + JSON.stringify(err));
    });
  });
}

function geolocationOn(locationChange) {
  let requestInfo: geolocation.LocationRequest = {
    priority: CommonConstants.LOCATION_PRIORITY,
    scenario: CommonConstants.LOCATION_SCENARIO,
    timeInterval: CommonConstants.LOCATION_TIME_INTERVAL,
    distanceInterval: CommonConstants.LOCATION_DISTANCE_INTERVAL,
    maxAccuracy: CommonConstants.LOCATION_MAX_ACCURACY
  }
  geolocation.on('locationChange', requestInfo, locationChange);
}

function geolocationOff() {
  geolocation.off('locationChange');
}


function emitterOn() {
  let innerEvent = {
    eventId: CommonConstants.EVENT_SERVICE_ID
  };
  let callback = (eventData) => {
    if (eventData.data.content === CommonConstants.FALSE) {
      backgroundTaskManager.stopBackgroundRunning(featureAbility.getContext());
      if (timerID !== 0) {
        clearInterval(timerID);
        timerID = 0;
      }
    }else{
      if (timerID !== 0) {
        return;
      }
      startContinuousTask();
    }
  };
  emitter.on(innerEvent, callback);
}

export default {
  onStart() {
    if (timerID !== 0) {
      return;
    }
    activateLocation();
    startContinuousTask();
    emitterOn();
  },
  onStop() {
    backgroundTaskManager.stopBackgroundRunning(featureAbility.getContext());
    if (timerID !== 0) {
      clearInterval(timerID);
      timerID = 0;
    }
    geolocationOff();
  }
}