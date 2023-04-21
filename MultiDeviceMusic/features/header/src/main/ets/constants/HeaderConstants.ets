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

/**
 * Constants for header area.
 */
export class HeaderConstants {
  /**
   * The font size of the title is larger.
   */
  static readonly TITLE_FONT_SIZE_PLUS: number = 4;

  /**
   * The font weight of the title.
   */
  static readonly TITLE_FONT_WEIGHT: number = 500;

  /**
   * Letter spacing of the title.
   */
  static readonly LETTER_SPACING: number = 2;

  /**
   * Title bar z-index.
   */
  static readonly Z_INDEX: number = 2;

  /**
   * SystemCapability that indicates audio device management capability.
   */
  static readonly SYSCAP_ETHERNET: string = 'SystemCapability.Multimedia.Audio.Device';

  /**
   * SystemCapability name: audio device service.
   */
  static readonly AUDIO_DEVICE_SERVICE: string = '音频设备管理';

  /**
   * Toast duration is 2000ms.
   */
  static readonly TOAST_DURATION: number = 2000;
}