/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

export class CommonConstant {

  static readonly WEB_PAGE_URI: string = 'pages/WebPage';

  static readonly LOCAL_PATH: Resource = $rawfile('index.html');

  /**
   * The host address of the server.
   */
  static readonly CLOUD_PATH: string = 'http://xxx.xxx.xxx.xxx:9588/index.html';

  static readonly WEB_ALERT_DIALOG_TEXT_VALUE: string = '恭喜您抽中:';

  static readonly WebConstant_FULL_WIDTH: string = '100%';
  static readonly WebConstant_FULL_HEIGHT: string = '100%';
  static readonly WebConstant_WIDTH: string = '93.3%';
  static readonly WebConstant_HEIGHT: string = '55.9%';
  static readonly WebConstant_MARGIN_TOP: string = '7.1%';
  static readonly WebConstant_MARGIN_LEFT: string = '3.3%';
  static readonly WebConstant_MARGIN_RIGHT: string = '3.3%';
  static readonly WebConstant_TOP_ROW_HEIGHT: string = '7.2%';
  static readonly WebConstant_IMAGE_WIDTH: string = '5.6%';
  static readonly WebConstant_IMAGE_HEIGHT: string = '32%';
  static readonly WebConstant_IMAGE_MARGIN_LEFT: string = '7.2%';
  static readonly WebConstant_TEXT_VALUE_WIDTH: string = '35.6%';
  static readonly WebConstant_TEXT_VALUE_HEIGHT: string = '3.1%';
  static readonly WebConstant_TEXT_VALUE_MARGIN_TOP: string = '3.1%';
  static readonly WebConstant_TEXT_VALUE_FONT_SIZE: number = 18;
  static readonly WebConstant_TEXT_VALUE_FONT_WEIGHT: number = 500;
  static readonly WebConstant_TIP_TEXT_VALUE_WIDTH: string = '15.6%';
  static readonly WebConstant_TIP_TEXT_VALUE_HEIGHT: string = '2.4%';
  static readonly WebConstant_TIP_TEXT_VALUE_FONT_SIZE: number = 14;
  static readonly WebConstant_TIP_TEXT_VALUE_MARGIN_TOP: string = '0.9%';
  static readonly WebConstant_TIP_TEXT_VALUE_OPACITY: number = 0.6;
  static readonly WebConstant_TOP_TEXT_WIDTH: string = '82.2%';
  static readonly WebConstant_TOP_TEXT_HEIGHT: string = '50%';
  static readonly WebConstant_TOP_TEXT_MARGIN_LEFT: string = '5%';
  static readonly WebConstant_TOP_TEXT_FONT_SIZE: number = 20;
  static readonly WebConstant_BUTTON_WIDTH: string = '86.7%';
  static readonly WebConstant_BUTTON_HEIGHT: string = '5.1%';
  static readonly WebConstant_BUTTON_MARGIN_TOP: string = '10%';
  static readonly WebConstant_BUTTON_BORDER_RADIUS: string = '20';
  static readonly WebConstant_BUTTON_FONT_SIZE: number = 16;
  static readonly WebConstant_DURATION: number = 3000;
  static readonly WebConstant_PROGRESS_MIN: number = 0;
  static readonly WebConstant_PROGRESS_MAX: number = 100;
  static readonly WebConstant_PROGRESS_STEP: number = 10;
  static readonly WebConstant_MILLI_SECONDS: number = 100;
  static readonly WebConstant_PROGRESS_STROKE_WIDTH: number = 15;
  static readonly WebConstant_PROGRESS_SCALE_COUNT: number = 15;
  static readonly WebConstant_PROGRESS_SCALE_WIDTH: number = 5;
  static readonly WebConstant_PROGRESS_WIDTH: number = 80;
  static readonly WebConstant_PROGRESS_POSITION_X: string = '40%';
  static readonly WebConstant_PROGRESS_POSITION_Y: string = '30%';

  static readonly MainConstant_FULL_HEIGHT: string = '100%';
  static readonly MainConstant_IMAGE_HEIGHT: string = '38.7%';
  static readonly MainConstant_BUTTON_MARGIN_TOP_BUTTON: string = '3.1%';
  static readonly MainConstant_BUTTON_HEIGHT: string = '5.1%';
  static readonly MainConstant_BUTTON_MARGIN_TOP: string = '4.6%';
  static readonly MainConstant_BUTTON_WIDTH: string = '86.7%';
  static readonly MainConstant_BUTTON_BORDER_RADIUS: number = 20;
  static readonly MainConstant_BUTTON_FONT_SIZE: number = 16;
}

