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
import { CommonConstants } from '../constants/CommonConst';

/**
 * ButtonList item information
 */
export class CommonEventBean {
  /**
   * The title of common events.
   */
  title: Resource = $r('app.string.wifi_event_title');

  /**
   * The name of common events.
   */
  name: Resource = $r('app.string.wifi_connection_state');

  /**
   * The state of common events.
   */
  state: Resource = $r('app.string.event_init_state');

  /**
   * The change state of common event state.
   */
  changeState: boolean = false;

  /**
   * The title of the button.
   */
  buttonTitle: Resource = $r('app.string.btn_title_subscribe');

  /**
   * Subscribed or not.
   */
  isSubscribe: boolean = false;

  /**
   * The subscriber of common events.
   */
  subscriber: any = null;

  /**
   * System public event name.
   */
  subEvents: string = CommonConstants.CONN_STATE;

  /**
   * The icon of open state.
   */
  onIcon: Resource = $r('app.media.ic_wifi_on');

  /**
   * The icon of closed state.
   */
  offIcon: Resource = $r('app.media.ic_wifi_off');
}