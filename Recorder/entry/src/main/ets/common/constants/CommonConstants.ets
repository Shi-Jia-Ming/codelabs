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

import { Permissions } from '@ohos.abilityAccessCtrl';

/**
 * Common constants.
 */
export class CommonConstants {
  /**
   * Permissions.
   */
  static readonly INTERNET: Permissions = 'ohos.permission.INTERNET';
  static readonly MEDIA_LOCATION: Permissions = 'ohos.permission.MEDIA_LOCATION';
  static readonly READ_MEDIA: Permissions = 'ohos.permission.READ_MEDIA';
  static readonly WRITE_MEDIA: Permissions = 'ohos.permission.WRITE_MEDIA';
  static readonly MICROPHONE: Permissions = 'ohos.permission.MICROPHONE';

  /**
   * State of player or recorder.
   */
  static readonly IDLE: string = 'idle';
  static readonly INITIALIZED: string = 'initialized';
  static readonly PREPARED: string = 'prepared';
  static readonly PLAYING: string = 'playing';
  static readonly PAUSED: string = 'paused';
  static readonly COMPLETED: string = 'completed';
  static readonly STARTED: string = 'started';
  static readonly STOPPED: string = 'stopped';
  static readonly RELEASED: string = 'released';
  static readonly ERROR: string = 'error';

  /**
   * Config of recorder.
   */
  static readonly BIT_RATE: number = 48000;
  static readonly CHANNEL: number = 2;
  static readonly SAMPLE_RATE: number = 48000;
  static readonly LATITUDE: number = 30;
  static readonly LONGITUDE: number = 130;

  /**
   * Constants of time.
   */
  static readonly TIME_10: number = 10;
  static readonly TIME_60: number = 60;
  static readonly TIME_1000: number = 1000;
  static readonly TIME_3600: number = 3600;
  static readonly TIME_60000: number = 60000;
  static readonly NUMBER_2: number = 2;
  static readonly NUMBER_3: number = 3;
  static readonly STRING_0: string = '0';
  static readonly STRING_SLASH: string = '/';
  static readonly STRING_COLON: string = ':';
  static readonly STRING_COLON_0: string = ':0';
  static readonly STRING_TIME: string = '00:00:00';

  /**
   * Initial value of time scale.
   */
  static readonly TIME_SCALE: Array<string> = ['00:00', '00:01', '00:02', '00:03', '00:04'];

  /**
   * Constants of checking permissions.
   */
  static readonly NUMBER_5: number = 5;
  static readonly TITLE: string = '警告';
  static readonly MESSAGE: string = '没有权限，请自行去<设置>添加权限';

  /**
   * Size of components.
   */
  static readonly FULL_SIZE: string = '100%';
  static readonly POSITION_X: string = '50%';
  static readonly POSITION_Y: string = '90%';
  static readonly ICON_POSITION_X: string = '75%';
  static readonly ICON_POSITION_Y: string = '92%';
  static readonly TIME_SLIDER_WIDTH: string = '20%';
  static readonly TIME_SLIDER_IMAGE_WIDTH: string = '120%';
  static readonly INIT_TRANSLATE: string = '0%';
  static readonly TRANSLATE_TEXT: string = '20%'; //
  static readonly TRANSLATE_IMAGE: string = '16.6%'; //
}