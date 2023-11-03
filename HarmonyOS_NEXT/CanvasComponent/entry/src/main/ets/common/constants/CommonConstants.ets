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
 * Common constants for all features.
 */
export default class CommonConstants {
  /**
   * Watermelon image url.
   */
  static readonly WATERMELON_IMAGE_URL: string = 'resources/base/media/ic_watermelon.png';

  /**
   * Hamburg image url.
   */
  static readonly HAMBURG_IMAGE_URL: string = 'resources/base/media/ic_hamburg.png';

  /**
   * Cake image url.
   */
  static readonly CAKE_IMAGE_URL: string = 'resources/base/media/ic_cake.png';

  /**
   * Beer image url.
   */
  static readonly BEER_IMAGE_URL: string = 'resources/base/media/ic_beer.png';

  /**
   * Smile image url.
   */
  static readonly SMILE_IMAGE_URL: string = 'resources/base/media/ic_smile.png';

  /**
   * Transform angle.
   */
  static readonly TRANSFORM_ANGLE: number = -120;

  /**
   * 360 degrees.
   */
  static readonly CIRCLE: number = 360;

  /**
   * 180 degrees.
   */
  static readonly HALF_CIRCLE: number = 180;

  /**
   * count.
   */
  static readonly COUNT: number = 6;

  /**
   * Small circle count.
   */
  static readonly SMALL_CIRCLE_COUNT: number = 8;

  /**
   * Image size.
   */
  static readonly IMAGE_SIZE: number = 40;

  /**
   * Prize angle.
   */
  static readonly ANGLE: number = 270;

  /**
   * duration.
   */
  static readonly DURATION: number = 4000;

  /**
   * One.
   */
  static readonly ONE: number = 1;

  /**
   * Two.
   */
  static readonly TWO: number = 2;

  /**
   * Three.
   */
  static readonly THREE: number = 3;

  /**
   * Four.
   */
  static readonly FOUR: number = 4;

  /**
   * Five.
   */
  static readonly FIVE: number = 5;

  /**
   * Six.
   */
  static readonly SIX: number = 6;

  /**
   * Flower point y ratios.
   */
  static readonly FLOWER_POINT_Y_RATIOS: number = 0.255;

  /**
   * Flower radius ratios.
   */
  static readonly FLOWER_RADIUS_RATIOS: number = 0.217;

  /**
   * Flower inner radius ratios.
   */
  static readonly FLOWER_INNER_RATIOS: number = 0.193;

  /**
   * Out circle ratios.
   */
  static readonly OUT_CIRCLE_RATIOS: number = 0.4;

  /**
   * Small circle ratios.
   */
  static readonly SMALL_CIRCLE_RATIOS: number = 0.378;

  /**
   * Small circle radius.
   */
  static readonly SMALL_CIRCLE_RADIUS: number = 4.1;

  /**
   * Inner circle ratios.
   */
  static readonly INNER_CIRCLE_RATIOS: number = 0.356;

  /**
   * Inner white circle ratios.
   */
  static readonly INNER_WHITE_CIRCLE_RATIOS: number = 0.339;

  /**
   * Inner arc ratios.
   */
  static readonly INNER_ARC_RATIOS: number = 0.336;

  /**
   * Image dx ratios.
   */
  static readonly IMAGE_DX_RATIOS: number = 0.114;

  /**
   * Image dy ratios.
   */
  static readonly IMAGE_DY_RATIOS: number = 0.052;

  /**
   * Arc text start angle.
   */
  static readonly ARC_START_ANGLE: number = 34;

  /**
   * Arc text end angle.
   */
  static readonly ARC_END_ANGLE: number = 26;

  /**
   * Text align.
   */
  static readonly TEXT_ALIGN: CanvasTextAlign = 'center';

  /**
   * Text base line.
   */
  static readonly TEXT_BASE_LINE: CanvasTextBaseline = 'middle';

  /**
   * Canvas font.
   */
  static readonly CANVAS_FONT: string = 'px sans-serif';
}

/**
 * Enumerated Value.
 */
export enum EnumeratedValue {
  ONE = 1,
  TWO = 2,
  THREE = 3,
  FOUR = 4,
  FIVE = 5,
  SIX = 6
}