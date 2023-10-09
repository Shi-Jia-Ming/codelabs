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
 * Common constants for Challenge features.
 */
export class ChallengeConstants {
  /**
   * Swiper transition duration.
   */
  static readonly SWIPER_DURATION: number = 500;
  /**
   * 100 percent.
   */
  static readonly FULL_PERCENT: string = '100%';
  /**
   * 50 percent.
   */
  static readonly HALF_PERCENT: string = '50%';
  /**
   * 0.5.
   */
  static readonly HALF_NUMBER: number = 0.5;
  /**
   * Spring motion response: 0.6.
   */
  static readonly SPRING_RESPONSE: number = 0.6;

  /**
   * Spring motion dampingFraction: 1.2.
   */
  static readonly DAMPING_FRACTION: number = 1.2;
  /**
   * Introduction page top image aspect ratio.
   */
  static readonly IMG_ASPECT_RATIO: number = 10 / 13;
  /**
   * Introduction page top image ratio coefficient.
   */
  static readonly IMG_COEFFICIENT: number = 80;
  /**
   * Introduction page building image ratio coefficient.
   */
  static readonly BUILDING_COEFFICIENT: number = 60;
  /**
   * Image x offset max.
   */
  static readonly IMAGE_X_OFFSET_MAX: number = 70;
  /**
   * Image x offset min.
   */
  static readonly IMAGE_x_OFFSET_MIN: number = 45;
  /**
   * Image aspect ratio of list group header.
   */
  static readonly HEAD_IMG_ASPECT: number = 3;
  /**
   * Image aspect ratio of star.
   */
  static readonly STAR_IMG_ASPECT: number = 10;
  /**
   * Image aspect ratio of top pic.
   */
  static readonly TOP_IMG_ASPECT: number = 31 / 21;
  /**
   * Image aspect ratio.
   */
  static readonly IMAGE_ASPECT_RATIO: number = 16 / 21;
  /**
   * Image height min.
   */
  static readonly IMAGE_HEIGHT_MIN: string = '78%';
  /**
   * Image width offset.
   */
  static readonly IMAGE_WIDTH_OFFSET: number = 6.7;
  /**
   * Animation duration normal.
   */
  static readonly ANIMATION_DURATION_NORMAL: number = 1000;
  /**
   * Title icon animation duration.
   */
  static readonly TITLE_ICON_ANIMATION_DURATION: number = 500;
  /**
   * Guide swiper item width default.
   */
  static readonly SHOW_COUNT: number = 5;
  /**
   * Guide swiper item width default.
   */
  static readonly HALF_COUNT = Math.floor(ChallengeConstants.SHOW_COUNT / 2);
  /**
   * Image item shadow radius.
   */
  static readonly SHADOW_RADIUS: number = 20;
  /**
   * Image item shadow color.
   */
  static readonly SHADOW_COLOR: string = 'rgba(0,0,0,0.3)';
  /**
   * Double number.
   */
  static readonly DOUBLE_NUM: number = 2;
  /**
   *  map element icon translate size
   */
  static readonly MAP_ICON_TRANSLATE_Y: number = 10;
  /**
   * map element icon scale ratio
   */
  static readonly MAP_ICON_SCALE_X: number = 1.05;
  /**
   * map element icon scale ratio
   */
  static readonly MAP_ICON_SCALE_Y: number = 0.95;
  /**
   * icon random delay time.
   */
  static readonly ICON_RANDOM_DELAY: number = 2000;
  /**
   * map element icon animation speed
   */
  static readonly MAP_ICON_ANIMATION_SPEED = 10;

  /**
   * Component size.
   */
  static readonly MAX_SCALE: number = 4;
  /**
   * Full percent number.
   */
  static readonly FULL_PERCENT_NUMBER: number = 100;
  /**
   * Image swiper cache count.
   */
  static readonly IMAGE_SWIPER_CACHE_COUNT: number = 3;
  /**
   * Home icon margin top.
   */
  static readonly HOME_ICON_MARGIN_TOP: number = 80;
  /**
   * Image animation duration.
   */
  static readonly IMAGE_ANIMATION_DURATION: number = 300;
  /**
   * textShadow offsetX.
   */
  static readonly TEXT_Shadow_OFFSET_X: number = 5;
  /**
   * textShadow offsetY.
   */
  static readonly TEXT_Shadow_OFFSET_Y: number = 3;
  /**
   * map icon font style
   */
  static readonly MAP_ICON_FONT_STYLE: string = '40px bolder';
  /**
   * Actual width of the map image, in px.
   */
  static readonly MAP_REAL_WIDTH: number = 2744;
  /**
   * Actual height of the map image, in px.
   */
  static readonly MAP_REAL_HEIGHT: number = 1826;
}



