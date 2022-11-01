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

/*
 * The config of Image Rotate animation.
 */
export enum RotatePosition {
  X = 0,
  Y = 0,
  Z = 1,
};

/*
 * The config is a option of Slider which control speed.
 */
export enum SliderSpeed {
  MIN = 1,
  MAX = 10,
  STEP = 1,
};

/*
 * The config is a option of Slider which control scale.
 */
export enum SliderScale {
  MIN = 0.5,
  MAX = 2.5,
  STEP = 0.1,
};

/*
 * The mode display the different styles of Slider.
 */
export enum SliderMode {
  SPEED = 1,
  SCALE = 2,
};

/*
 * The constants of the application.
 */
export class Constants {

  /*
   * The font size of app.
   */
  static readonly FONT_SIZE = 14;

  /*
   * The layout weight of slider.
   */
  static readonly LAYOUT_WEIGHT = 1;

  /**
   * The percentage of 100.
   */
  static readonly PERCENTAGE_100 = '100%';

  /**
   * The delay time of interval to slider speed.
   */
  static readonly DELAY_TIME = 15;

  /**
   * The color of slider.
   */
  static readonly SLIDER_SKIN = $r('app.color.slider_color');

  /**
   * The time of slider interval.
   */
  static readonly INTERVAL = 0;

  /**
   * The speed of slider interval.
   */
  static readonly SPEED = 5;

  /**
   * The margin value of the windmill image.
   */
  static readonly WEIGHT_BLANK_IMAGE = '15%';

  /**
   * The top margin value of slider panel.
   */
  static readonly PANEL_MARGIN_TOP = '4%';

  /**
   * The bottom margin value of slider panel.
   */
  static readonly PANEL_MARGIN_BOTTOM = '5%';

  /**
   * The size of the windmill image.
   */
  static readonly IMAGE_SIZE = 150;

  /**
   * The angle of the windmill image.
   */
  static readonly ANGLE = 0;

  /**
   * The default size of the windmill image.
   */
  static readonly IMAGE_SIZE_INITIAL = 1;

  /**
   * The text config of panel component.
   */
  static readonly FRACTION_DIGITS = 1;

  /**
   * The padding of panel component title.
   */
  static readonly TITLE_PADDING = 5;

  /**
   * The margin of panel component title.
   */
  static readonly TITLE_MARGIN_HORIZONTAL = 10;

  /**
   * The bottom margin of panel component text.
   */
  static readonly SPEED_MARGIN_BOTTOM = 6;

  /**
   * The margin of slider.
   */
  static readonly SLIDER_MARGIN_HORIZONTAL = 11;

  /**
   * The radius of panel.
   */
  static readonly PANEL_RADIUS = 24;

  /**
   * The width of panel image.
   */
  static readonly PANEL_IMAGE_WIDTH = 19;

  /**
   * The height of panel image.
   */
  static readonly PANEL_IMAGE_HEIGHT = 16;

  /**
   * The height of panel big image.
   */
  static readonly PANEL_IMAGE_BIG_HEIGHT = 18;

  /**
   * The width of panel big image.
   */
  static readonly PANEL_IMAGE_BIG_WIDTH = 22;

  /**
   * The width of panel.
   */
  static readonly PANEL_WIDTH = '98%';

  /**
   * The font size of panel left.
   */
  static readonly PANEL_FONT_SIZE = 20;

  /**
   * The font size of panel end.
   */
  static readonly PANEL_END_FONT_SIZE = 24;

  /**
   * The scale text of panel.
   */
  static readonly PANEL_HOLDER = 'A';

  /**
   * The height of panel.
   */
  static readonly PANEL_HEIGHT = 100;

  /**
   * The padding of panel.
   */
  static readonly PANEL_PADDING = 10;

  /**
   * The margin of panel.
   */
  static readonly PANEL_MARGIN = 10;
}












