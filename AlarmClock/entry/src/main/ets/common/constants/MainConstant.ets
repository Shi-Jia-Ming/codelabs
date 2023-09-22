/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

/**
 * Main page constant description.
 */
export class MainConstant {
  /**
   * Main page times list.
   */
  static readonly TIMES: number[] = [3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 1, 2];
  /**
   * Default single digit max.
   */
  static readonly DEFAULT_SINGLE_DIGIT_MAX: number = 9;
  /**
   * Default horizontal angle.
   */
  static readonly DEFAULT_HORIZONTAL_ANGLE: number = 180;
  /**
   * Default one second ms.
   */
  static readonly DEFAULT_ONE_SECOND_MS: number = 1000;
  /**
   * Default zeroing.
   */
  static readonly DEFAULT_ZEROING: string = '0';
  /**
   * Default string morning.
   */
  static readonly DEFAULT_STRING_MORNING: string = '上午';
  /**
   * Default string afternoon.
   */
  static readonly DEFAULT_STRING_AFTERNOON: string = '下午';
  /**
   * Default string alarm name.
   */
  static readonly DEFAULT_STRING_ALARM: string = '闹钟';
  /**
   * Default string quotation.
   */
  static readonly DEFAULT_STRING_NULL: string = '';
  /**
   * Default string colon.
   */
  static readonly DEFAULT_STRING_COLON: string = ':';
  /**
   * Default clock time font size unit.
   */
  static readonly CLOCK_TIME_FONT_SIZE_UNIT: string = 'px';
  /**
   * Hour pointer image url.
   */
  static readonly HOUR_POINTER_IMAGE_URL: string = '../../../resources/base/media/ic_hour_pointer.png';
  /**
   * Minute pointer image url.
   */
  static readonly MINUTE_POINTER_IMAGE_URL: string = '../../../resources/base/media/ic_minute_pointer.png';
  /**
   * Second pointer image url.
   */
  static readonly SECOND_POINTER_IMAGE_URL: string = '../../../resources/base/media/ic_second_pointer.png';
  /**
   * Clock pan image url.
   */
  static readonly CLOCK_PAN_IMAGE_URL: string = '../../../resources/base/media/ic_clock_pan.png';
}