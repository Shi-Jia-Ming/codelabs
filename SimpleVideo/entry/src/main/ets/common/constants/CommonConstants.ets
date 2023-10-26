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
 * route for second page
 */
export const SECOND_PAGE: string = 'pages/SimpleVideoPlay';

/**
 * route param
 */
export const SOURCE: string = 'source';

/**
 * video net address
 */
export const NET: string = '网络视频地址*****';

/**
 * toast message
 */
export const MESSAGE: string = '请检查网络';

/**
 * init time of string
 */
export const START_TIME: string = '00:00';

/**
 * video net address
 */
export const ZERO_STR: string = '0';

/**
 * time split
 */
export const SPLIT: string = ':';

/**
 * default opacity
 */
export const DEFAULT_OPACITY: number = Number.parseFloat('0.2');

/**
 * slider small track thick ness
 */
export const SMALL_TRACK_THICK_NESS: number = 2;

/**
 * slider big track thick ness
 */
export const BIG_TRACK_THICK_NESS: number = 4;

/**
 * the divide of single and double
 */
export const COMMON_NUM_DOUBLE: number = 10;

/**
 * the minute of one hour
 */
export const COMMON_NUM_MINUTE: number = 60;

/**
 * common font weight
 */
export const COMMON_NUM_FONT_WEIGHT: number = 500;

/**
 * toast duration
 */
export const COMMON_NUM_DURATION: number = 5000;

/**
 * module list
 */
export const LIST: string[] = ['最近播放', '为你推荐'];

/**
 * full percent
 */
export const ALL_PERCENT: string = '100%';

/**
 * Image Size
 */
export const IMAGE_SIZE: number = 24;

/**
 * component with or height percent
 */
export const enum STRING_PERCENT {
  SLIDER_WITH = '46.7%',
  NINETY_PERCENT = '88%',
  INDEX_COMPONENT_WITH_PERCENT = '93.3%',
  INDEX_SWIPER_HEIGHT_PERCENT = '24.1%',
  INDEX_MODULE_HEIGHT_PERCENT = '22.8%',
  INDEX_SWIPER_LEFT_RIGHT_MARGIN = '3.3%'
}

/**
 * margin or font size
 */
export const enum MARGIN_FONT_SIZE {
  FIRST_MARGIN = 12,
  SECOND_MARGIN = 16,
  THIRD_MARGIN = 18,
  FOURTH_MARGIN = 24,
  FIFTH_MARGIN = 50,
  SIXTH_MARGIN = 94,
  SEVENTH_MARGIN = 132
}

/**
 * video resource type
 */
export const enum VIDEO_TYPE {
  INNER = 'inner',
  NET = 'net'
}

/**
 * Attribute Styles in a Stack Layout
 */
export const enum STACK_STYLE {
  IMAGE_Z_INDEX = 2,
  PROGRESS_VALUE = 0,
  PROGRESS_TOTAL = 100,
  PROGRESS_STROKE_WIDTH = 15,
  PROGRESS_SCALE_COUNT = 15,
  PROGRESS_SCALE_WIDTH = 5,
  PROGRESS_Z_INDEX = 1,
  PROGRESS_WIDTH = 80,
  PROGRESS_STEP = 10,
  MILLI_SECONDS = 100
}