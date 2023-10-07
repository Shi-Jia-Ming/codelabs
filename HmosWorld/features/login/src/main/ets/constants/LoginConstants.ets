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

export class Constants {
  /**
   * Full screen.
   */
  static readonly FULL_SCREEN: string = '100%';

  /**
   * GridRow column sm.
   */
  static readonly COLUMN_SM: number = 4;

  /**
   * GridRow column md.
   */
  static readonly COLUMN_MD: number = 8;

  /**
   * GridRow column lg.
   */
  static readonly COLUMN_LG: number = 12;

  /**
   * GridCol span sm.
   */

  static readonly SPAN_SM: number = 4;

  /**
   * GridCol span md.
   */

  static readonly SPAN_MD: number = 4;

  /**
   * GridCol span lg.
   */
  static readonly SPAN_LG: number = 4;

  /**
   * GridCol offset sm.
   */
  static readonly OFFSET_SM: number = 0;

  /**
   * GridCol offset md.
   */
  static readonly OFFSET_MD: number = 2;

  /**
   * GridCol offset lg.
   */
  static readonly OFFSET_LG: number = 4;

  /**
   * Portrait opacity.
   */
  static readonly PORTRAIT_OPACITY: number = 0.5;

  /**
   * Password max length.
   */
  static readonly MAX_LENGTH: number = 12;

  /**
   * Login title font weight.
   */
  static readonly LOGIN_TITLE_FONT_WEIGHT: number = 500;

  /**
   * Account list translate y.
   */
  static readonly ACCOUNT_LIST_TRANSLATE_Y: number = -5;

  /**
   * Account list animation duration.
   */
  static readonly ACCOUNT_LIST_ANIMATION_DURATION: number = 200;

  /**
   * Signing context duration.
   */
  static readonly SIGNING_CONTEXT_DURATION: number = 750;

  /**
   * Init password.
   */
  static readonly INIT_PASSWORD: string = '123456';

  /**
   * Storage name user.
   */
  static readonly STORAGE_NAME_USER: string = 'user';

  /**
   * Storage name user.
   */
  static readonly STORAGE_NAME_IS_LOGGED: string = 'isLogged';

  /**
   * Router parameter background.
   */
  static readonly ROUTER_PARAMETER_BACKGROUND: string = 'current_swiper';

  /**
   * Time type day.
   */
  static readonly TIME_TYPE_DAY: string = 'day';

  /**
   * Time type dusk.
   */
  static readonly TIME_TYPE_DUSK: string = 'dusk';
}

/**
 * Account list.
 */
export const ACCOUNT_LIST: string[] = ['developer1', 'developer2', 'developer3', 'developer4', 'developer5',];

/**
 * Background info.
 */
export interface BgInfo {
  time: string;
  index: number;
}

/**
 * Url parameter.
 */
export interface UrlParam {
  firstTopic: boolean;
}