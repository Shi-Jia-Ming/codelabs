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
  static readonly ENTRY_ABILITY_TAG: string = 'EntryAbility';

  /**
   * The main page tag.
   */
  static readonly MAIN_PAGE_TAG: string = 'MainPage';

  /**
   * The entry form ability tag.
   */
  static readonly ENTRY_FORM_ABILITY_TAG: string = 'EntryFormAbility';

  /**
   *  The database tag.
   */
  static readonly DATABASE_TAG: string = 'DatabaseUtils';

  /**
   *  The chart data tag.
   */
  static readonly TAG_CHART: string = 'ChartDataUtils';

  /**
   * Database store configuration.
   */
  static readonly RDB_STORE_CONFIG: relationalStore.StoreConfig = {
    name: 'FormDatabase.db', securityLevel: relationalStore.SecurityLevel.S1, encrypt: false
  };

  /**
   * SQL statement for creating a form.
   */
  static readonly CREATE_TABLE_FORM: string = 'CREATE TABLE IF NOT EXISTS Form ' +
    '(id INTEGER PRIMARY KEY AUTOINCREMENT, formId TEXT NOT NULL, formName TEXT NOT NULL, dimension INTEGER)';

  /**
   * SQL statement for creating steps.
   */
  static readonly CREATE_TABLE_SENSOR_DATA: string = 'CREATE TABLE IF NOT EXISTS SensorData ' +
    '(id INTEGER PRIMARY KEY AUTOINCREMENT, date TEXT NOT NULL, stepsValue INTEGER)';

  /**
   * Table sensor name.
   */
  static readonly TABLE_SENSOR: string = 'SensorData';

  /**
   * Table form name.
   */
  static readonly TABLE_FORM: string = 'Form';

  /**
   * Step count superimposed value.
   */
  static readonly INTERVAL_STEPS_VALUE: number = 2;

  /**
   * Time interval.
   */
  static readonly INTERVAL_DELAY_TIME: number = 10000;

  /**
   * Notification ID.
   */
  static readonly NOTIFICATIONS_ID: number = 1008;

  /**
   * Chinese field judgment.
   */
  static readonly CHINESE_LANGUAGE: string = 'zh';

  /**
   * Title of the notification bar in Chinese.
   */
  static readonly NOTIFICATIONS_TITLE_GONE_TODAY_ZH: string = '今天走了';

  /**
   * Title of the notification bar in English.
   */
  static readonly NOTIFICATIONS_TITLE_GONE_TODAY_EN: string = 'Gone today ';

  /**
   * Title of the notification bar in Chinese.
   */
  static readonly NOTIFICATIONS_TITLE_STEPS_ZH: string = '步';

  /**
   * Title of the notification bar in English.
   */
  static readonly NOTIFICATIONS_TITLE_STEPS_EN: string = ' steps';

  /**
   * Form ID field in the database table.
   */
  static readonly FIELD_FORM_ID: string = 'formId';

  /**
   * Specification fields in the database table.
   */
  static readonly FIELD_DIMENSION: string = 'dimension';

  /**
   * Time field in the database table.
   */
  static readonly FIELD_DATE_NAME: string = 'date';

  /**
   * Steps value field in the database table.
   */
  static readonly FIELD_STEPS_NAME: string = 'stepsValue';

  /**
   * Top margin of main page text.
   */
  static readonly MAIN_TITLE_TEXT_MARGIN_TOP: number = 243;

  /**
   * Bottom margin of main page text.
   */
  static readonly MAIN_TITLE_TEXT_MARGIN_BOTTOM: number = 30;

  /**
   * Main page title text size.
   */
  static readonly MAIN_TITLE_TEXT_FONT_SIZE: number = 20;

  /**
   *  Main page content text size.
   */
  static readonly MAIN_CONTENT_TEXT_FONT_SIZE: number = 60;

  /**
   * ID parameter for creating a form.
   */
  static readonly FORM_PARAM_IDENTITY_KEY: string = 'ohos.extra.param.key.form_identity';

  /**
   * Name parameter for creating a form.
   */
  static readonly FORM_PARAM_NAME_KEY: string = 'ohos.extra.param.key.form_name';

  /**
   * Dimension parameter for creating a form.
   */
  static readonly FORM_PARAM_DIMENSION_KEY: string = 'ohos.extra.param.key.form_dimension';

  /**
   * Refresh time, in seconds.
   */
  static readonly FORM_NEXT_REFRESH_TIME: number = 5;

  /**
   * Chart point text position.
   */
  static readonly TEXT_LOCATION: string = 'top';

  /**
   * Chart point draw shape.
   */
  static readonly SHAPE_CIRCLE: string = 'circle';

  /**
   * Fill white color.
   */
  static readonly WHITE_COLOR: string = '#FFFFFF';

  /**
   * Fill line color.
   */
  static readonly CHART_VALUES_STROKE_COLOR: string = '#40FFFFFF';

  /**
   * Chart point fill color.
   */
  static readonly CHART_VALUES_FILL_COLOR: string = '#00000000';

  /**
   * Target steps.
   */
  static readonly TARGET_STEPS: number = 1000;

  /**
   * 2x2 Card steps progress.
   */
  static readonly HUNDRED_PERCENT: number = 100;

  /**
   * 2x4 Card dimension.
   */
  static readonly DIMENSION_TWO_BY_FOUR: number = 3;

  /**
   * Chart point size.
   */
  static readonly POINT_SIZE: number = 5;

  /**
   * Meter per step.
   */
  static readonly METER_PER_STEP: number = 0.6;

  /**
   * Obtain the data of the last three days.
   */
  static readonly THE_FIRST_THREE_DAYS: number = 3;

  /**
   * Number of milliseconds in a day.
   */
  static readonly TODAY_MILLI_SECOND: number = 86400000;

  /**
   * Add yesterday's simulation data.
   */
  static readonly SIMULATION_YESTERDAY_VALUE: number = 800;

  /**
   * Add the simulation data of the day before yesterday.
   */
  static readonly SIMULATION_BEFORE_YESTERDAY_VALUE: number = 560;

  /**
   * Add the simulation data of three days ago.
   */
  static readonly SIMULATION_THREE_DAYS_AGO_VALUE: number = 990;

  /**
   * Current month plus one.
   */
  static readonly MONTH_PLUS_ONE: number = 1;

  /**
   * Yesterday's value.
   */
  static readonly YESTERDAY: number = 1;

  /**
   * Value of the day before yesterday.
   */
  static readonly BEFORE_YESTERDAY: number = 2;

  /**
   * The value three days ago.
   */
  static readonly THREE_DAYS_AGO: number = 3;

  /**
   * Width the percentage of the 100.
   */
  static readonly FULL_WIDTH: string = '100%';

  /**
   * Height the percentage of the 100.
   */
  static readonly FULL_HEIGHT: string = '100%';
}