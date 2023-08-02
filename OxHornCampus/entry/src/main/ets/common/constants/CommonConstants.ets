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

export class CommonConstants {
  /**
   * Component size.
   */
  static readonly SWIPER_DEFAULT_WIDTH: string = '66%';
  static readonly FULL_PERCENT: string = '100%';
  static readonly HALF_PERCENT: string = '50%';
  static readonly IMAGE_CONTAINER_HEIGHT: string = '42%';
  static readonly FULL_SIZE: string = '100%';
  static readonly ICON_SIZE: string = '40%';
  static readonly BAR_WEIGHT: string = '25%';
  static readonly BAR_HEIGHT: string = '10%';
  static readonly CONTENT_WIDTH_PERCENT: string = '87%';
  static readonly SEARCHBAR_WIDTH: string = '91.1%'
  static readonly IMAGE_HEIGHT_MIN: string = '78%';

  /**
   * Component location.
   */
  static readonly PERCENTAGE_78: string = '78%';
  static readonly PERCENTAGE_15: string = '15%';
  static readonly PERCENTAGE_25: string = '25%';

  /**
   * Component constants.
   */
  static readonly OPACITY: number = 0.6;
  static readonly BORDER_WIDTH: number = 0.5;
  static readonly COUNTDOWN: number = 5;

  /**
   * Time constants.
   */
  static readonly TRANSITION_DURATION: number = 600;
  static readonly DURATION: number = 1000;
  static readonly MORNING_TIME: number = 6;
  static readonly EVENING_TIME: number = 18;
  static readonly NIGHT_TIME: number = 19;
  static readonly SPLASH_DURATION: number = 3000;

  /**
   * Color constants.
   */
  static readonly TRANSPARENT_COLOR: string = '#00ffffff';
  static readonly NAVIGATION_BAR_COLOR: string = '#00ff00';
  static readonly STATUS_BAR_CONTENT_COLOR: string = '#ffffff';
  static readonly NAVIGATION_BAR_CONTENT_COLOR: string = '#ffffff';
  static readonly THEME_COLOR: string = '#c82424';

  /**
   * Title text.
   */
  static readonly SPLASH_DES: string = '溪流背坡村';
  static readonly SPLASH_WELCOME: string = '溪村欢迎您';
  static readonly INTRODUCTION_TITLE: string = '区域导览';
  static readonly TRAIN_TITLE: string = "小火车";

  /**
   * Default content in the search box.
   */
  static readonly PANEL_PLACEHOLDER: string = 'A区入口...';
  /**
   * Number of columns.
   */
  static readonly GRID_COLUMNS: string = '1fr 1fr 1fr 1fr 1fr';

  /**
   * The start time of the line 1.
   */
  static readonly LINE_ONE_START_TIME: string = "08:00";
  /**
   * The end time of the line 1.
   */
  static readonly LINE_ONE_END_TIME: string = "18:30";
  /**
   * The start time of the line 2.
   */
  static readonly LINE_TWO_START_TIME: string = "08:00";
  /**
   * The end time of the line 2.
   */
  static readonly LINE_TWO_END_TIME: string = "18:32";
  /**
   * The weekday start time of the line 3.
   */
  static readonly LINE_THREE_START_TIME: string = "08:00";
  /**
   * The weekday end time of the line 3.
   */
  static readonly LINE_THREE_END_TIME: string = "17:55";
  /**
   * The weekend start time of the line 3.
   */
  static readonly LINE_THREE_WEEKEND_START_TIME: string = "07:57";
  /**
   * The weekend end time of the line 3.
   */
  static readonly LINE_THREE_WEEKEND_END_TIME: string = "18:30";
  /**
   * Introduction page url.
   */
  static readonly INTRODUCTION_URL: string = 'pages/IntroductionPage';
  /**
   * The arrow url of the train.
   */
  static readonly ARROW_URL: string = "common/images/ic_train_arrow.png";
  /**
   * The url of the train.
   */
  static readonly TRAIN_URL: string = "common/images/ic_train.png";
  /**
   * The circle url of the train.
   */
  static readonly CIRCLE_URL: string = "common/images/ic_circle.png";
  /**
   * Icon subtitle array.
   */
  static readonly ICON_SUBTITLE_ARRAY: Array<string> = ['DESIGN STYLE', 'BUILDING INFORMATION', 'GEOGRAPHIC LOCATION'];
  /**
   * Geography light.
   */
  static readonly GEOGRAPHY_LIGHT: string = 'geography_light';
  /**
   * Geography dark.
   */
  static readonly GEOGRAPHY_DARK: string = 'geography_dark';
  /**
   * Building text.
   */
  static readonly BUILDING_TEXT: string = 'building';
  /**
   * Page transition exit delay.
   */
  static readonly EXIT_DELAY: number = 100;
  /**
   * Swiper transition duration.
   */
  static readonly SWIPER_DURATION: number = 300;
  /**
   * Shared transition duration.
   */
  static readonly SHARED_DURATION: number = 800;
  /**
   * Image item shadow radius.
   */
  static readonly SHADOW_RADIUS: number = 50;
  /**
   * Double number.
   */
  static readonly DOUBLE_NUM: number = 50;
  /**
   * Max scale.
   */
  static readonly MAX_SCALE: number = 4;
  /**
   * Color scale.
   */
  static readonly COLOR_SCALE_1: number = 0.8;
  /**
   * Color scale.
   */
  static readonly COLOR_SCALE_2: number = 1.0;
  /**
   * Swiper aspect ratio.
   */
  static readonly SWIPER_ASPECT_RATIO: number = 6 / 5;
  /**
   * Constant used to convert angles to radians.
   */
  static readonly RADIAN_CONSTANT: number = Math.PI / 180.0;
  /**
   * Bottom Latitude.
   */
  static readonly SOUTH_LATITUDE: number = 22.875142;
  /**
   * Top Latitude.
   */
  static readonly NORTH_LATITUDE: number = 22.885136;
  /**
   * Left Longitude.
   */
  static readonly WEST_LONGITUDE: number = 113.882035;
  /**
   * Right Longitude.
   */
  static readonly EAST_LONGITUDE: number = 113.890274;
  /**
   * Pixel width of the base map.
   */
  static readonly MAP_WIDTH: number = 2744;
  /**
   * Pixel height of the base map.
   */
  static readonly MAP_HEIGHT: number = 1826;
  /**
   * X-axis adjustment value.
   */
  static readonly X_ADJ: number = -480;
  /**
   * Y-axis adjustment value.
   */
  static readonly Y_ADJ: number = -78;
  /**
   * Quarter circle.
   */
  static readonly QUARTER_CIRCLE: number = Math.PI / 4;
  /**
   * Operation constant.
   */
  static readonly DOUBLE_OR_HALF: number = 2;
  /**
   * Number of landmarks on the map
   */
  static MAP_LANDMARKS_LENGTH: number = 10;
  /**
   * Map Zoom Ratio.
   */
  static readonly MAP_ZOOM_RATIO: number = 1.1;
  /**
   * Maximum number of magnifications.
   */
  static readonly ZOOM_MAX_TIMES: number = 4;
  /**
   * Coordinate dimension.
   */
  static readonly MAP_LANDMARKS_SIZE: number = 40;
  /**
   * Scale precision of kneading gestures.
   */
  static readonly MAP_SCALE_ACCURACY: number = 2;
  /**
   * Map font horizontal offset.
   */
  static readonly MAP_TEXT_OFFSET_X: number = 42;
  /**
   * Map font vertical offset.
   */
  static readonly MAP_TEXT_OFFSET_Y: number = 8;
  /**
   * Map Operation Finger Count.
   */
  static readonly MAP_FINGER_COUNT: number = 2;
  /**
   *  Transparency at presentation.
   */
  static readonly PANEL_HIGH_OPACITY: number = 0.8;
  /**
   * Transparency when folded.
   */
  static readonly PANEL_LOW_OPACITY: number = 0.3;
  /**
   * Height when unfolded.
   */
  static readonly PANEL_FULL_HEIGHT: number = 258;
  /**
   * Animation duration.
   */
  static readonly ANIMATION_DURATION: number = 750;
  /**
   * Normal font color opacity.
   */
  static readonly FONT_COLOR_OPACITY_NORMAL: number = 0.6;
  /**
   * Full percent number.
   */
  static readonly FULL_PERCENT_NUMBER: number = 100;
  /**
   * Image swiper cache count.
   */
  static readonly IMAGE_SWIPER_CACHE_COUNT: number = 3;
  /**
   * Animation duration normal.
   */
  static readonly ANIMATION_DURATION_NORMAL: number = 1000;
  /**
   * List position begin.
   */
  static readonly LIST_POSITION_BEGIN: number = 0;
  /**
   * List position middle.
   */
  static readonly LIST_POSITION_MIDDLE: number = 1;
  /**
   * List position end.
   */
  static readonly LIST_POSITION_END: number = 2;
  /**
   * Opacity min.
   */
  static readonly OPACITY_MIN: number = 0;
  /**
   * Opacity max.
   */
  static OPACITY_MAX: number = 1;
  /**
   * List scroll down threshold.
   */
  static readonly LIST_SCROLL_DOWN_THRESHOLD: number = -40;
  /**
   * Home icon margin top.
   */
  static readonly HOME_ICON_MARGIN_TOP: number = 80;
  /**
   * Device dpi.
   */
  static readonly DEVICE_DPI: number = 160;
  /**
   * Offset sum threshold.
   */
  static readonly OFFSET_SUM_THRESHOLD: number = 10;
  /**
   * Offset divide ratio.
   */
  static readonly OFFSET_DIVIDE_RATIO: number = 5;
  /**
   * Scroll up top threshold.
   */
  static readonly SCROLL_UP_TOP_THRESHOLD: number = -100;
  /**
   * Star icon margin.
   */
  static readonly STAR_ICON_MARGIN: number = 80;

  /**
   * Fixed item Height.
   */
  static readonly FIXED_ITEM_HEIGHT: number = 500;
  /**
   * Sticky height.
   */
  static readonly STICKY_HEIGHT: number = 229;
  /**
   * Second list item height.
   */
  static readonly SECOND_LIST_ITEM_HEIGHT: number = 350;
  /**
   * Min image height.
   */
  static readonly MIN_IMAGE_HEIGHT: number = 40;
  /**
   * Introduction image count.
   */
  static readonly INTRODUCTION_IMAGE_COUNT: number = 5;
  /**
   * Image animation duration.
   */
  static readonly IMAGE_ANIMATION_DURATION: number = 300;
  /**
   * Image divide number.
   */
  static readonly HALF_COUNT = Math.floor(CommonConstants.INTRODUCTION_IMAGE_COUNT / CommonConstants.DOUBLE_OR_HALF);
  /**
   * Image width offset.
   */
  static readonly IMAGE_WIDTH_OFFSET: number = 6.7;
  /**
   * Image x offset max.
   */
  static readonly IMAGE_X_OFFSET_MAX: number = 70;
  /**
   * Image x offset min.
   */
  static readonly IMAGE_x_OFFSET_MIN: number = 45;
  /**
   * Image opacity reduce.
   */
  static readonly IMAGE_OPACITY_REDUCE: number = 0.1;
  /**
   * Image aspect ratio.
   */
  static readonly IMAGE_ASPECT_RATIO: number = 16 / 21;
  /**
   * Image blur reduce.
   */
  static readonly IMAGE_BLUR_REDUCE: number = 10;
  /**
   * Title icon animation duration.
   */
  static readonly TITLE_ICON_ANIMATION_DURATION: number = 500;
  /**
   * The space of the train component.
   */
  static readonly TRAIN_SPACE: number = 12;
  /**
   * The aspectRatio of the train map image.
   */
  static readonly TRAIN_ASPECT_RATIO: number = 1.75;
  /**
   * The borderRadius of the train map image.
   */
  static readonly TRAIN_BORDER_RADIUS: number = 8;
  /**
   * The fontWeight of the train operation.
   */
  static readonly OPERATION_FONT_WEIGHT: number = 500;
  /**
   * The fontWeight of the train interval.
   */
  static readonly INTERVAL_FONT_WEIGHT: number = 400;
  /**
   * The padding left of the train.
   */
  static readonly TRAIN_PADDING_LEFT: number = 12;
  /**
   * The padding right of the train.
   */
  static readonly TRAIN_PADDING_RIGHT: number = 12;
  /**
   * The padding top of the train.
   */
  static readonly TRAIN_PADDING_TOP: number = 17;
  /**
   * The padding bottom of the train.
   */
  static readonly TRAIN_PADDING_BOTTOM: number = 18;
  /**
   * The aspectRatio of the canvas.
   */
  static readonly CANVAS_ASPECT_RADIO: number = 2.22;
  /**
   * The borderRadius of the canvas.
   */
  static readonly CANVAS_BORDER_RADIUS: number = 4;
  /**
   * The width of the canvas.
   */
  static readonly CANVAS_WIDTH: number = 865;
  /**
   * The height of the canvas.
   */
  static readonly CANVAS_HEIGHT: number = 494;
  /**
   * The width of the arrow.
   */
  static readonly ARROW_WIDTH: number = 28;
  /**
   * The height of the arrow.
   */
  static readonly ARROW_HEIGHT: number = 28;
  /**
   * The offset x of the arrow.
   */
  static readonly ARROW_OFFSET_X: number = 28 / 2;
  /**
   * The offset y of the arrow.
   */
  static readonly ARROW_OFFSET_Y: number = 28 / 2;
  /**
   * The width of the train.
   */
  static readonly TRAIN_WIDTH: number = 10;
  /**
   * The height of the train.
   */
  static readonly TRAIN_HEIGHT: number = 10;
  /**
   * The offset x of the train.
   */
  static readonly TRAIN_OFFSET_X: number = 5;
  /**
   * The offset y of the train.
   */
  static readonly TRAIN_OFFSET_Y: number = 5.5;
  /**
   * The width of the circle.
   */
  static readonly CIRCLE_WIDTH: number = 32;
  /**
   * The height of the circle.
   */
  static readonly CIRCLE_HEIGHT: number = 32;
  /**
   * The offset x of the circle.
   */
  static readonly CIRCLE_OFFSET_X: number = 16;
  /**
   * The offset y of the circle.
   */
  static readonly CIRCLE_OFFSET_Y: number = 16;
  /**
   * The init rotate angle of the train.
   */
  static readonly INIT_ROTATE_ANGLE: number = -115 - 90;
  /**
   * The millisecond of line 1.
   */
  static readonly LINE_ONE_TIME: number = 10 * 60 * 1000;
  /**
   * The millisecond of line 2.
   */
  static readonly LINE_TWO_TIME: number = 17 * 60 * 1000;
  /**
   * The millisecond of line 3.
   */
  static readonly LINE_THREE_TIME: number = 37 * 60 * 1000;
  /**
   * The Horizontal threshold of canvas.
   */
  static readonly HORIZONTAL_THRESHOLD: number = 20;
  /**
   * The vertical threshold of canvas.
   */
  static readonly VERTICAL_THRESHOLD: number = 10;
  /**
   * The average error of position.
   */
  static readonly AVERAGE_ERROR: number = 2;
  /**
   * The basic rotate angle of the train.
   */
  static readonly BASIC_ROTATE_ANGLE: number = -115;
  /**
   * The direction angle of the train.
   */
  static readonly DIRECTION: number = 90;
  /**
   * The PI angle of the train.
   */
  static readonly PI_ANGLE: number = 180;
}

/**
 * Train route.
 */
export enum TrainsLine {
  LINE_ONE = 0,
  LINE_TWO = 1,
  LINE_THREE = 2,
}


/**
 * Landmark type.
 */
export enum PositionType {
  TRAIN_STATION = 1,
  MOTHER_CHILD_ROOM = 2,
  CAR_ROAD = 3,
  CAFE = 4,
  SMOKING_AREA = 5,
  CONVENIENCE_STORE = 6,
  GYMNASIUM = 7,
  RESTAURANT = 8,
  SIDE_WALK = 9,
  LIBRARY = 10
}
