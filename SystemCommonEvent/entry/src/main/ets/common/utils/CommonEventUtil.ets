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
  subscribe(commonEventItem: CommonEventBean, callback: Function): void {
    let toastMsg: Resource;
    let commonEvent = commonEventItem;
    // The information of subscribe.
    const subscribeInfo = {
      events: [commonEventItem.subEvents]
    };

    // Create subscriber.
    CommonEventManager.createSubscriber(subscribeInfo, (err, subscriber) => {
      commonEvent.changeState = false;
      if (err) {
        toastMsg = $r('app.string.subscribe_fail');
        Logger.error(`[CommonEvent]CreateSubscriberCallBack err= ${JSON.stringify(err)}`);
        callback(commonEvent, toastMsg);
        return;
      }
      commonEvent.subscriber = subscriber;
      // The callback of subscribing common events.
      if (commonEvent.subscriber === null) {
        toastMsg = $r('app.string.need_subscriber');
        callback(commonEvent, toastMsg);
        return;
      }

      CommonEventManager.subscribe(commonEvent.subscriber, (err, data) => {
        if (err) {
          toastMsg = $r('app.string.subscribe_fail');
          Logger.error(`[CommonEvent]SubscribeCallBack err= ${JSON.stringify(err)}`);
          callback(commonEvent, toastMsg);
          return;
        }
        if (data.event === CommonConstants.SUB_EVENTS.BATTERY_CHANGED) {
          switch (data?.parameters[CommonConstants.EXTRA_CHARGE_STATE]) {
            case CommonConstants.BATTERY_CHARGE_STATE[0]:
              commonEvent.state = $r('app.string.battery_not_charged');
              break;
            case CommonConstants.BATTERY_CHARGE_STATE[1]:
              commonEvent.state = $r('app.string.battery_charging');
              break;
            case CommonConstants.BATTERY_CHARGE_STATE[2]:
              commonEvent.state = $r('app.string.battery_stop');
              break;
            case CommonConstants.BATTERY_CHARGE_STATE[3]:
              commonEvent.state = $r('app.string.battery_fully_charged');
              break;
            default:
              break;
          }
        }
        if (data.event === CommonConstants.SUB_EVENTS.CONN_STATE) {
          switch (data?.data) {
            case CommonConstants.WIFI_STATE[0]:
              commonEvent.state = $r('app.string.wifi_state_connecting');
              break;
            case CommonConstants.WIFI_STATE[1]:
              commonEvent.state = $r('app.string.wifi_state_disconnected');
              break;
            case CommonConstants.WIFI_STATE[2]:
              commonEvent.state = $r('app.string.wifi_state_disconnecting');
              break;
            case CommonConstants.WIFI_STATE[3]:
              commonEvent.state = $r('app.string.state_unknown');
              break;
            case CommonConstants.WIFI_STATE[4]:
              commonEvent.state = $r('app.string.wifi_state_connected');
              break;
            default:
              break;
          }
        }
        commonEvent.changeState = true;
        // Modifying the state of a common event
        callback(commonEvent);
      })
      toastMsg = $r('app.string.subscribe_success');
      commonEvent.buttonTitle = $r('app.string.btn_title_unsubscribe');
      commonEvent.isSubscribe = true;
      // Modify the subscription status and pop-up window content.
      callback(commonEvent, toastMsg);
    })
  }

  unsubscribe(commonEventItem: CommonEventBean, callback: Function): void {
    let toastMsg: Resource;
    let commonEvent = commonEventItem;
    // Unsubscribe common events.
    CommonEventManager.unsubscribe(commonEventItem.subscriber, (err) => {
      if (err) {
        toastMsg = $r('app.string.unsubscribe_fail');
        Logger.error(`[CommonEvent]UnsubscribeCallBack err= ${JSON.stringify(err)}`);
        callback(commonEvent, toastMsg);
        return;
      }
      commonEvent.buttonTitle = $r('app.string.btn_title_subscribe');
      commonEvent.isSubscribe = false;
      commonEvent.subscriber = null;
      commonEvent.state = $r('app.string.event_init_state');
      toastMsg = $r('app.string.unsubscribe_success');
      callback(commonEvent, toastMsg);
    });
  }
}

let commonEventUtil = new CommonEventUtil();

export default commonEventUtil as CommonEventUtil;