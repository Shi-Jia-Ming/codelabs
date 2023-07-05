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

export class CommonConstants {
  /**
   * The state enum of wifi.
   */
  static readonly WIFI_STATE = [
    'Connecting',
    'Disconnected',
    'Disconnecting',
    'UnknownState',
    'ApConnected'
  ];

  /**
   * The enum of battery charge state message.
   */
  static readonly BATTERY_CHARGE_STATE = [
    0,
    1,
    2,
    3
  ];

  /**
   * The width of full screen.
   */
  static readonly FULL_SCREEN_WIDTH: string = '100%';

  /**
   * The height of full screen.
   */
  static readonly FULL_SCREEN_HEIGHT: string = '100%';

  /**
   * The font weight of 500.
   */
  static readonly FONT_WEIGHT_500: number = 500;

  /**
   * The enum of subscribe information events.
   */
  static readonly SUB_EVENTS = {
    CONN_STATE: 'usual.event.wifi.CONN_STATE',
    BATTERY_CHANGED: 'usual.event.BATTERY_CHANGED'
  };

  /**
   * The enum of battery charge state.
   */
  static readonly EXTRA_CHARGE_STATE: string = '7';

  /**
   * The auto close time of toast dialog.
   */
  static readonly AUTO_CLOSE_TIME: number = 1500;

  /**
   * Position of the pop-up window border from the bottom of the screen.
   */
  static readonly TOAST_BOTTOM: string = '48vp';
}