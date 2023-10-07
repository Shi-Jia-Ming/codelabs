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


import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import common from '@ohos.app.ability.common';
import geoLocationManager from '@ohos.geoLocationManager';
import promptAction from '@ohos.promptAction';
import sensor from '@ohos.sensor';
import Intl from '@ohos.intl';
import { BackgroundUtil } from '../common/utils/BackgroundUtil';
import { CompletionStatus } from '../view/CompletionStatus';
import { CommonConstants } from '../common/constants/CommonConstants';
import { CurrentSituation } from '../view/CurrentSituation';
import LocationUtil from '../common/utils/LocationUtil';
import Logger from '../common/utils/Logger';
import NumberUtil from '../common/utils/NumberUtil';
import StepsUtil from '../common/utils/StepsUtil';

const TAG: string = 'HomePage';

@Entry
@Component
struct HomePage {
  @State currentSteps: string = CommonConstants.INITIALIZATION_VALUE;
  @Provide stepGoal: string = '';
  @State oldSteps: string = '';
  @State startPosition: string = '';
  @State currentLocation: string = '';
  @State locale: string = new Intl.Locale().language;
  @State latitude: number = 0;
  @State longitude: number = 0;
  @State progressValue: number = 0;
  @State isStart: boolean = false;
  private context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;

  onPageShow() {
    this.init();
    this.requestPermissions();
  }

  onPageHide() {
    sensor.off(sensor.SensorId.PEDOMETER);
  }

  init() {
    StepsUtil.getStorageValue(CommonConstants.IS_START).then((res: string) => {
      if (res === CommonConstants.TRUE) {
        this.isStart = true;
        StepsUtil.getStorageValue(CommonConstants.CURRENT_STEPS).then((res: string) => {
          if (StepsUtil.checkStrIsEmpty(res)) {
            return;
          }
          this.currentSteps = res;
        });

        StepsUtil.getStorageValue(CommonConstants.PROGRESS_VALUE_TAG).then((res: string) => {
          if (StepsUtil.checkStrIsEmpty(res)) {
            return;
          }
          this.progressValue = NumberUtil._parseInt(res, 10);
        });

        StepsUtil.getStorageValue(CommonConstants.START_POSITION).then((res: string) => {
          if (StepsUtil.checkStrIsEmpty(res)) {
            return;
          }
          this.startPosition = res;
        });

        StepsUtil.getStorageValue(CommonConstants.OLD_STEPS).then((res: string) => {
          if (StepsUtil.checkStrIsEmpty(res)) {
            return;
          }
          this.oldSteps = res;
        });
      } else {
        this.isStart = false;
      }
    })

    StepsUtil.getStorageValue(CommonConstants.STEP_GOAL).then((res: string) => {
      if (StepsUtil.checkStrIsEmpty(res)) {
        return;
      }
      this.stepGoal = res;
    });
  }

  requestPermissions(): void {
    let atManager = abilityAccessCtrl.createAtManager();
    try {
      atManager.requestPermissionsFromUser(this.context, CommonConstants.REQUEST_PERMISSIONS).then((data) => {
        if (data.authResults[0] !== 0 || data.authResults[1] !== 0) {
          return;
        }
        const that = this;
        try {
          sensor.on(sensor.SensorId.PEDOMETER, (data) => {
            try {
              if (that.isStart) {
                if (StepsUtil.checkStrIsEmpty(that.oldSteps)) {
                  that.oldSteps = data.steps.toString();
                  StepsUtil.putStorageValue(CommonConstants.OLD_STEPS, that.oldSteps);
                } else {
                  that.currentSteps = (data.steps - NumberUtil._parseInt(that.oldSteps, 10)).toString();
                }
              } else {
                that.currentSteps = data.steps.toString();
              }

              if (StepsUtil.checkStrIsEmpty(that.stepGoal) || !that.isStart) {
                return;
              }
              StepsUtil.putStorageValue(CommonConstants.CURRENT_STEPS, that.currentSteps);
              that.progressValue = StepsUtil.getProgressValue(NumberUtil._parseInt(that.stepGoal, 10),
                NumberUtil._parseInt(that.currentSteps, 10));
              StepsUtil.putStorageValue(CommonConstants.PROGRESS_VALUE_TAG, String(that.progressValue));
            } catch (err) {
              Logger.error(TAG, 'Sensor on err' + JSON.stringify(err));
            }
          }, { interval: CommonConstants.SENSOR_INTERVAL });

        } catch (err) {
          console.error('On fail, errCode: ' + JSON.stringify(err));
        }

        LocationUtil.geolocationOn((location: geoLocationManager.Location) => {
          if (this.latitude === location.latitude && this.longitude === location.longitude) {
            return;
          }
          this.latitude = location.latitude;
          this.longitude = location.longitude;
          let reverseGeocodeRequest: geoLocationManager.ReverseGeoCodeRequest = {
            'locale': this.locale.toString().includes('zh') ? 'zh' : 'en',
            'latitude': this.latitude,
            'longitude': this.longitude
          };
          geoLocationManager.getAddressesFromLocation(reverseGeocodeRequest).then(data => {
            if (data[0].placeName) {
              this.currentLocation = data[0].placeName;
            }
          }).catch((err: Error) => {
            Logger.error(TAG, 'GetAddressesFromLocation err ' + JSON.stringify(err));
          });
        });
      }).catch((err: Error) => {
        Logger.error(TAG, 'requestPermissionsFromUser err' + JSON.stringify(err));
      })
    } catch (err) {
      Logger.error(TAG, 'requestPermissionsFromUser err' + JSON.stringify(err));
    }
  }

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      CompletionStatus({
        progressValue: $progressValue
      })

      CurrentSituation({
        currentSteps: this.currentSteps,
        startPosition: this.startPosition,
        currentLocation: this.currentLocation
      })

      Row() {
        Button(this.isStart ? $r('app.string.stop') : $r('app.string.start'))
          .width($r('app.float.start_button_width'))
          .height($r('app.float.start_button_height'))
          .borderRadius($r('app.float.start_button_radius'))
          .backgroundColor($r('app.color.button_background'))
          .fontSize($r('app.float.start_font_size'))
          .fontColor(Color.White)
          .fontWeight(CommonConstants.BIG_FONT_WEIGHT)
          .onClick(() => {
            if (this.isStart) {
              this.isStart = false;
              this.oldSteps = '';
              StepsUtil.CleanStepsData();
              BackgroundUtil.stopContinuousTask(this.context);
            } else {
              if (this.stepGoal === '' || this.currentLocation === '') {
                promptAction.showToast({ message: CommonConstants.WAIT });
              } else {
                this.isStart = true;
                this.startPosition = this.currentLocation;
                StepsUtil.putStorageValue(CommonConstants.START_POSITION, this.startPosition);
                this.currentSteps = CommonConstants.INITIALIZATION_VALUE;
                this.progressValue = 0;
                BackgroundUtil.startContinuousTask(this.context);
              }
            }
            StepsUtil.putStorageValue(CommonConstants.IS_START, String(this.isStart));
          })
      }
      .width(CommonConstants.FULL_WIDTH)
      .height($r('app.float.button_height'))
      .margin({ top: $r('app.float.button_margin_top') })
      .justifyContent(FlexAlign.Center)
    }
    .width(CommonConstants.FULL_WIDTH)
    .height(CommonConstants.FULL_HEIGHT)
    .backgroundColor(Color.White)
  }
}