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
   * Input length of the account.
   */
  static readonly INPUT_ACCOUNT_LENGTH: number = 11;

  /**
   *  Input length of the password.
   */
  static readonly INPUT_PASSWORD_LENGTH: number = 8;

  /**
   * Common Spacing of Components.
   */
  static readonly COMMON_SPACE: number = 12;

  /**
   * Login wait time.
   */
  static readonly LOGIN_WAIT_TIME: number = 2000;

  /**
   * Success page url.
   */
  static readonly SUCCESS_PAGE_URL: string = 'pages/SuccessPage';

  /**
   * Home page url.
   */
  static readonly HOME_PAGE_URL: string = 'pages/HomePage';

  /**
   * Login page url.
   */
  static readonly LOGIN_PAGE_URL: string = 'pages/LoginPage';

  /**
   * Verify page url.
   */
  static readonly VERIFY_PAGE_URL: string = 'pages/VerifyPage';

  /**
   * Home page url.
   */
  static readonly HOME_PAGE_ACTION: string = 'startHomePage';

  /**
   * Sub window name.
   */
  static readonly SUB_WINDOW_NAME: string = 'subWindow';

  /**
   * Status bar color.
   */
  static readonly STATUS_BAR_COLOR: string = '#F1F3F5';

  /**
   * Status bar content color.
   */
  static readonly STATUS_BAR_CONTENT_COLOR: string = '#000000';

  /**
   * Sub window width ratio in screen width.
   */
  static readonly SUB_WINDOW_WIDTH_RATIO: number = 0.93;

  /**
   * Sub window aspect ratio.
   */
  static readonly SUB_WINDOW_ASPECT_RATIO: number = 1.5;

  /**
   * The width or height of the component is spread across the parent component.
   */
  static readonly FULL_PARENT: string = '100%';

  /**
   * The width of button.
   */
  static readonly BUTTON_WIDTH: string = '86.7%';

  /**
   * The columns is four.
   */
  static readonly GRID_FOUR_COLUMNS: string = '1fr 1fr 1fr 1fr';

  /**
   * The row is two.
   */
  static readonly GRID_TWO_ROWS: string = '1fr 1fr';

  /**
   * The columns is two.
   */
  static readonly GRID_TWO_COLUMNS: string = '1fr 1fr';

  /**
   * The row is four.
   */
  static readonly GRID_THREE_ROWS: string = '1fr 1fr 1fr';
}

