/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License,Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import CommonEventManager from '@ohos.commonEventManager';
import { CommonEventBean } from '../bean/CommonEventBean';
import { CommonConstants } from '../constants/CommonConst';
import Logger from './Logger';

class CommonEventUtil {
  subscribe(item: CommonEventBean, callback: Function): void {
    let toastMsg: Resource;
    let theItem = item;
    // The information of subscribe.
    const subscribeInfo = {
      events: [item.subEvents]
    };

    // Create subscriber.
    CommonEventManager.createSubscriber(subscribeInfo, (err, subscriber) => {
      if (err) {
        toastMsg = $r('app.string.subscribe_fail');
        Logger.error(`[CommonEvent]CreateSubscriberCallBack err= ${JSON.stringify(err)}`);
        callback(toastMsg, theItem);
      } else {
        Logger.info(`[CommonEvent]CreateSubscriber: ${JSON.stringify(subscriber)}`);
        theItem.subscriber = subscriber;
      }

      // The callback of subscribing common events.
      if (theItem.subscriber !== null) {
        CommonEventManager.subscribe(theItem.subscriber, (err, data) => {
          if (err) {
            toastMsg = $r('app.string.subscribe_fail');
            Logger.error(`[CommonEvent]SubscribeCallBack err= ${JSON.stringify(err)}`);
            callback(toastMsg, theItem);
          } else {
            let stateChanged: boolean = false;
            Logger.info(`[CommonEvent]SubscribeCallBack data= ${JSON.stringify(data)}`);
            if (data.event === CommonConstants.SUB_EVENTS.BATTERY_CHANGED) {
              switch (data?.parameters[CommonConstants.EXTRA_CHARGE_STATE]) {
                case CommonConstants.BATTERY_CHARGE_STATE[0]:
                  theItem.state = $r('app.string.battery_not_charged');
                  break;
                case CommonConstants.BATTERY_CHARGE_STATE[1]:
                  theItem.state = $r('app.string.battery_charging');
                  break;
                case CommonConstants.BATTERY_CHARGE_STATE[2]:
                  theItem.state = $r('app.string.battery_stop');
                  break;
                case CommonConstants.BATTERY_CHARGE_STATE[3]:
                  theItem.state = $r('app.string.battery_fully_charged');
                  break;
              }
              stateChanged = true;
            }
            if (data.event === CommonConstants.SUB_EVENTS.CONN_STATE) {
              switch (data?.data) {
                case CommonConstants.WIFI_STATE[0]:
                  theItem.state = $r('app.string.wifi_state_connecting');
                  break;
                case CommonConstants.WIFI_STATE[1]:
                  theItem.state = $r('app.string.wifi_state_disconnected');
                  break;
                case CommonConstants.WIFI_STATE[2]:
                  theItem.state = $r('app.string.wifi_state_disconnecting');
                  break;
                case CommonConstants.WIFI_STATE[3]:
                  theItem.state = $r('app.string.state_unknown');
                  break;
                case CommonConstants.WIFI_STATE[4]:
                  theItem.state = $r('app.string.wifi_state_connected');
                  break;
              }
              stateChanged = true;
            }
            callback(toastMsg, theItem, stateChanged);
          }
        })
        toastMsg = $r('app.string.subscribe_success');
        theItem.buttonTitle = $r('app.string.btn_title_unsubscribe');
        theItem.isSubscribe = true;
      } else {
        toastMsg = $r('app.string.need_subscriber');
      }
      callback(toastMsg, theItem);
    })
  }

  unsubscribe(item: CommonEventBean, callback: Function): void {
    let toastMsg: Resource;
    let theItem = item;
    // Unsubscribe common events.
    CommonEventManager.unsubscribe(item.subscriber, (err) => {
      if (err) {
        toastMsg = $r('app.string.unsubscribe_fail');
        Logger.error(`[CommonEvent]UnsubscribeCallBack err= ${JSON.stringify(err)}`);
        callback(toastMsg, theItem);
      } else {
        Logger.info(`[CommonEvent]Unsubscribe success`);
        theItem.buttonTitle = $r('app.string.btn_title_subscribe');
        theItem.isSubscribe = false;
        theItem.subscriber = null;
        theItem.state = $r('app.string.event_init_state');
        toastMsg = $r('app.string.unsubscribe_success');
      }
      callback(toastMsg, theItem);
    });
  }
}

let commonEventUtil = new CommonEventUtil();

export default commonEventUtil as CommonEventUtil;