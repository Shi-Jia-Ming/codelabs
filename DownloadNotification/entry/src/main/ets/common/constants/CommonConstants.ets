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
   * The width or height is full.
   */
  static readonly FULL_LENGTH: string = '100%';

  /**
   * The width of title.
   */
  static readonly TITLE_WIDTH: string = '86.7%';

  /**
   * The width of download card.
   */
  static readonly CARD_WIDTH: string = '93.3%';

  /**
   * The weight of image.
   */
  static readonly IMAGE_WEIGHT: number = 1;

  /**
   * The weight of card content.
   */
  static readonly CARD_CONTENT_WEIGHT: number = 5;

  /**
   * The width of download content.
   */
  static readonly CARD_CONTENT_WIDTH: string = '70%';

  /**
   * The width of download image.
   */
  static readonly CARD_IMAGE_WIDTH: string = '30%';

  /**
   * The name of download file.
   */
  static readonly DOWNLOAD_FILE: string = '1653067.mp4';

  /**
   * The size of download file.
   */
  static readonly FILE_SIZE: string = '25.01MB';

  /**
   * Font weight of Large.
   */
  static readonly FONT_WEIGHT_LAGER: number = 500;

  /**
   * Font opacity.
   */
  static readonly FONT_OPACITY: number = 0.6;

  /**
   * Progress total.
   */
  static readonly PROGRESS_TOTAL: number = 100;

  /**
   * Progress Update speed.
   */
  static readonly PROGRESS_SPEED: number = 2;

  /**
   * Progress Update frequency.
   */
  static readonly UPDATE_FREQUENCY: number = 1000;

  /**
   * Notification id.
   */
  static readonly NOTIFICATION_ID: number = 1000;
}

/**
 * Download status.
 */
export enum DOWNLOAD_STATUS {
  INITIAL,
  DOWNLOADING,
  PAUSE,
  FINISHED
}