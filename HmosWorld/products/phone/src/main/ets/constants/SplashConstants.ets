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

export class SplashConstants {
  static readonly FULL_SIZE = '100%';
  static readonly MORNING_TIME: number = 6;
  static readonly EVENING_TIME: number = 18;
  static readonly NIGHT_TIME: number = 19;
  static readonly SPLASH_DURATION: number = 3000;
  static readonly LOADING_RESOURCE_DURATION: number = 1000;
  static readonly PERCENTAGE_16: string = '16%';
  static readonly PERCENTAGE_25: string = '25%';
  static readonly BUTTON_FONT_WEIGHT: number = 500;
  static readonly BUTTON_BLUR: number = 250;
  static readonly BLUR_SCALE: number = 0.15;
  static readonly TEXT_FONT_WEIGHT: number = 400;
  static readonly TEXT_OPACITY: number = 0.7;
  static readonly BUTTON_TEXT_OPACITY: number = 0.8;
  static readonly SPLASH_OPACITY_DURATION = 300;
  static readonly SPLASH_ICON_OPACITY_DURATION = 1000;
}

export interface BgInfo {
  time: string;
  index: number;
}