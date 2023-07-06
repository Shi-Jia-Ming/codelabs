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

import { CommonEventBean } from '../common/bean/CommonEventBean';
import { CommonConstants } from '../common/constants/CommonConst';

class MainPageViewModel {
  getCommonEventData() {
    let CommonEventData: Array<CommonEventBean> = [];
    for (let i = 0; i < COMMON_EVENT.length; i++) {
      let CommonEventItem = new CommonEventBean();
      CommonEventItem = { ...COMMON_EVENT[i] };
      CommonEventData.push(CommonEventItem);
    }
    return CommonEventData;
  }
}

const COMMON_EVENT = [
  {
    title: $r('app.string.wifi_event_title'),
    state: $r('app.string.event_init_state'),
    changeState: false,
    name: $r('app.string.wifi_connection_state'),
    buttonTitle: $r('app.string.btn_title_subscribe'),
    isSubscribe: false,
    subscriber: null,
    subEvents: CommonConstants.SUB_EVENTS.CONN_STATE,
    onIcon: $r('app.media.ic_wifi_on'),
    offIcon: $r('app.media.ic_wifi_off')
  },
  {
    title: $r('app.string.charge_event_title'),
    state: $r('app.string.event_init_state'),
    changeState: false,
    name: $r('app.string.battery_charge_state'),
    buttonTitle: $r('app.string.btn_title_subscribe'),
    isSubscribe: false,
    subscriber: null,
    subEvents: CommonConstants.SUB_EVENTS.BATTERY_CHANGED,
    onIcon: $r('app.media.ic_batteries_on'),
    offIcon: $r('app.media.ic_batteries_off')
  }
];

let mainPageViewModel = new MainPageViewModel();

export default mainPageViewModel as MainPageViewModel;