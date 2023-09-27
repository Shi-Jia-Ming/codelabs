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

import relationalStore from '@ohos.data.relationalStore';

/**
 * Common constants for all features.
 */
export default class CommonConstants {
  /**
   * The entry ability tag.
   */
  static readonly TAG_ABILITY: string = 'EntryAbility';
  /**
   * The entry details ability tag.
   */
  static readonly TAG_DETAILS: string = 'EntryDetailsAbility';
  /**
   * The movie details page tag.
   */
  static readonly TAG_DETAILS_PAGE: string = 'MovieDetailsPage';
  /**
   * The entry form ability tag.
   */
  static readonly TAG_FORM_ABILITY: string = 'EntryFormAbility';
  /**
   * The movie item component tag.
   */
  static readonly TAG_MOVIE_ITEM: string = 'MovieItem';
  /**
   * The movie details item component tag.
   */
  static readonly TAG_DETAILS_COMPONENT: string = 'MovieDetailTitle';
  /**
   *  The common utils tag.
   */
  static readonly TAG_COMMON_UTILS: string = 'CommonUtils';
  /**
   * Database store configuration.
   */
  static readonly STORE_CONFIG: relationalStore.StoreConfig = {
    name: 'FormDatabase.db', securityLevel: relationalStore.SecurityLevel.S1, encrypt: false
  };
  /**
   * SQL statement for creating a form.
   */
  static readonly CREATE_TABLE_FORM: string = 'CREATE TABLE IF NOT EXISTS Form ' +
    '(id INTEGER PRIMARY KEY AUTOINCREMENT, formId TEXT NOT NULL, formName TEXT NOT NULL, dimension INTEGER)';
  /**
   * ID parameter for creating a form.
   */
  static readonly IDENTITY_KEY: string = 'ohos.extra.param.key.form_identity';
  /**
   * Name parameter for creating a form.
   */
  static readonly NAME_KEY: string = 'ohos.extra.param.key.form_name';
  /**
   * Dimension parameter for creating a form.
   */
  static readonly DIMENSION_KEY: string = 'ohos.extra.param.key.form_dimension';
  /**
   * Table name
   */
  static readonly TABLE_NAME: string = 'Form';
  /**
   * Form ID field in the database table.
   */
  static readonly FORM_ID: string = 'formId';
  /**
   * Time interval of the 300000.
   */
  static readonly INTERVAL_DELAY_TIME: number = 300000;
  /**
   * Random multiply ten.
   */
  static readonly MULTIPLY_TEN: number = 10;
  /**
   * Default lines of the 5.
   */
  static readonly DEFAULT_LINES: number = 5;
  /**
   * Max lines of the 10.
   */
  static readonly MAX_LINES: number = 10;
  /**
   * See button push page url.
   */
  static readonly SEE_BUTTON_PUSH: string = 'pages/MovieDetailsPage';
}