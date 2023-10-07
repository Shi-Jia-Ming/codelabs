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
 * Common constants for Audio features.
 */
export class LearningConstants {

  /**
   * Swiper aspect ratio.
   */
  static readonly SWIPER_ASPECT_RATIO: number = 4 / 3;

  /**
   * Achievement image aspect ratio.
   */
  static readonly ACHIEVEMENT_ASPECT_RATIO: number = 2;

  /**
   * Achievement image zIndex.
   */
  static readonly ACHIEVEMENT_Z_INDEX: number = 2;

  /**
   * Swiper default width percent.
   */
  static readonly SWIPER_DEFAULT_WIDTH: string = '66%';

  /**
   * Swiper transition duration.
   */
  static readonly SWIPER_DURATION: number = 300;

  /**
   * Image item shadow radius.
   */
  static readonly SHADOW_RADIUS: number = 50;

  /**
   * Image item shadow color.
   */
  static readonly SHADOW_COLOR: string = 'rgba(0,0,0,0.3)';

  /**
   * Double number.
   */
  static readonly DOUBLE_NUM: number = 2;

  /**
   * Title font weight.
   */
  static readonly TITLE_FONT_WEIGHT: number = 500;

  /**
   * 100 percent.
   */
  static readonly FULL_PERCENT: string = '100%';

  /**
   * Image blur reduce.
   */
  static readonly IMAGE_BLUR_REDUCE: number = 10;

  /**
   * Animation duration normal.
   */
  static readonly ANIMATION_DURATION_NORMAL: number = 1000;

  /**
   * Guide swiper item width default.
   */
  static readonly ITEM_WIDTH = 86;

  /**
   * Guide swiper item width default.
   */
  static readonly SHOW_COUNT = 5;

  /**
   * Guide swiper item width default.
   */
  static readonly HALF_COUNT = Math.floor(LearningConstants.SHOW_COUNT / 2);

  /**
   * Guide swiper item opacity coefficients.
   */
  static readonly OPACITY_COEFFICIENTS = 0.1;

  /**
   * Guide swiper item offset coefficients.
   */
  static readonly  OFFSET_COEFFICIENTS = 10;

  /**
   * Guide swiper item max offset y.
   */
  static readonly MAX_OFFSET_Y = 100;

  /**
   * Guide swiper item max move offset.
   */
  static readonly MAX_MOVE_OFFSET = 50;

  /**
   * The opacity of map bottom panel.
   */
  static readonly  ACHIEVE_DIALOG_WIDTH ='80%';
  static readonly  ACHIEVE_DIALOG_HEIGHT ='60%';
}
