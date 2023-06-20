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
   * Initial canvas width and height.
   */
  static INIT_CANVAS_LENGTH = 300;

  /**
   * Divided by two.
   */
  static HALF = 2;

  /**
   * Take one decimal place.
   */
  static SINGLE_DIGIT = 1;

  /**
   * Image pixel format.
   */
  static PIXEL_FORMAT = 3;

  /**
   * Rounding 10.
   */
  static TEN_DIGIT = 10;

  /**
   * Slider end.
   */
  static SLIDER_MODE_END = 'end';

  /**
   * slider click.
   */
  static SLIDER_MODE_CLICK = 'click';

  /**
   * Max value of slider.
   */
  static SLIDER_MAX_VALUE = 100;

  /**
   * Pixel step.
   */
  static PIXEL_STEP = 4;

  /**
   * Decimal two.
   */
  static DECIMAL_TWO = 2;

  /**
   * Color level max.
   */
  static COLOR_LEVEL_MAX = 255;

  /**
   * Convert int.
   */
  static CONVERT_INT = 100;

  /**
   * Angle 60.
   */
  static ANGLE_60 = 60;

  /**
   * Angle 120.
   */
  static ANGLE_120 = 120;

  /**
   * Angle 240.
   */
  static ANGLE_240 = 240;

  /**
   * Angle 300.
   */
  static ANGLE_360 = 360;

  /**
   * MOD 2.
   */
  static MOD_2 = 2;

  /**
   * Brightness worker file.
   */
  static BRIGHTNESS_WORKER_FILE = 'workers/adjustBrightnessWork.js';

  /**
   * Brightness worker file.
   */
  static  SATURATION_WORKER_FILE = 'workers/adjustSaturationWork.js';

  /**
   * Image name.
   */
  static  IMAGE_PREFIX = 'image';

  /**
   * Image format.
   */
  static  IMAGE_FORMAT = '.jpg';

  /**
   * Encode format.
   */
  static ENCODE_FORMAT = 'image/jpeg';

  /**
   * Encode file permission.
   */
  static ENCODE_FILE_PERMISSION = 'rw';

  /**
   * Encode quality.
   */
  static ENCODE_QUALITY = 100;
  
  /**
   * Index of RGB.
   */
  static RGBIndex = {
    RED: 0,
    GREEN: 1,
    BLUE: 2
  }

  /**
   * Index of HSV.
   */
  static HSVIndex = {
    HUE: 0,
    SATURATION: 1,
    VALUE: 2
  }

  /**
   * Angel category.
   */
  static AngelRange = {
    ANGEL_0_60: 0,
    ANGEL_60_120: 1,
    ANGEL_120_180: 2,
    ANGEL_180_240: 3,
    ANGEL_240_300: 4,
    ANGEL_300_360: 5
  }

  /**
   * Adjustment type.
   */
  static AdjustId = {
    BRIGHTNESS: 0,
    TRANSPARENCY: 1,
    SATURATION: 2
  };

  /**
   * Crop type.
   */
  static CropType = {
    ORIGINAL: 0,
    ONE_TO_ONE: 1,
    SIXTEEN_TO_NINE: 2,
    FOUR_TO_THREE: 3
  };

  /**
   * Edit type.
   */
  static EditType = {
    CROP: 0,
    ROTATE: 1,
    ADJUST: 2
  };

  /**
   * Crop ratio.
   */
  static CropRatio = {
    THREE: 3,
    FOUR: 4,
    NINE: 9,
    SIXTEEN: 16
  };

  /**
   * Image name.
   */
  static IMAGE_NAME = 'ic_image.jpg';

  /**
   * Path of crop icons.
   */
  static CROP_IMAGE = [
    'common/images/ic_original.png',
    'common/images/ic_one2one.png',
    'common/images/ic_sixteen2nine.png',
    'common/images/ic_four2three.png'
  ];

  /**
   * Path of crop click icons.
   */
  static CROP_IMAGE_FILL = [
    'common/images/ic_original_filled.png',
    'common/images/ic_one2one_filled.png',
    'common/images/ic_sixteen2nine_filled.png',
    'common/images/ic_four2three_filled.png'
  ];

  /**
   * Path of adjust icons.
   */
  static ADJUST_IMAGE = [
    'common/images/ic_brightness.png',
    'common/images/ic_transparency.png',
    'common/images/ic_saturation.png'
  ];

  /**
   * Path of adjust click icons.
   */
  static ADJUST_IMAGE_FILL = [
    'common/images/ic_brightness_filled.png',
    'common/images/ic_transparency_filled.png',
    'common/images/ic_saturation_filled.png'
  ];

  /**
   * Alpha of the unselected area.
   */
  static UNSELECT_AREA_ALPHA = 0.6;

  /**
   * Color of the box selection lines.
   */
  static LINES_COLOR = '#FF000000';
}