/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License,Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

export class CommonConstants {
  /**
   * database preference id.
   */
  static readonly PREFERENCE_ID = 'storageId';
  /**
   * database alarm data key.
   */
  static readonly ALARM_KEY = 'alarmData';
  /**
   * common full length
   */
  static readonly FULL_LENGTH: string = '100%';
  /**
   * default string space.
   */
  static readonly DEFAULT_STRING_SPACE: string = ' ';
  /**
   * default string comma.
   */
  static readonly DEFAULT_STRING_COMMA: string = '，';
  /**
   * default string no repeat.
   */
  static readonly DEFAULT_STRING_NO_REPEAT: string = '不重复';
  /**
   * default number negative.
   */
  static readonly DEFAULT_NUMBER_NEGATIVE: number = -1;
  /**
   * default layout weight.
   */
  static readonly DEFAULT_LAYOUT_WEIGHT: number = 1;
  /**
   * default single.
   */
  static readonly DEFAULT_SINGLE: number = 1;
  /**
   * default double.
   */
  static readonly DEFAULT_DOUBLE: number = 2;
  /**
   * default data picker hour selection.
   */
  static readonly DEFAULT_DATA_PICKER_HOUR_SELECTION: number = 2;
  /**
   * default total minute.
   */
  static readonly DEFAULT_TOTAL_MINUTE: number = 60;
  /**
   * default string monday.
   */
  static readonly DEFAULT_STRING_MONDAY: string = '周一';
  /**
   * default string tuesday.
   */
  static readonly DEFAULT_STRING_TUESDAY: string = '周二';
  /**
   * default string wednesday.
   */
  static readonly DEFAULT_STRING_WEDNESDAY: string = '周三';
  /**
   * default string thursday.
   */
  static readonly DEFAULT_STRING_THURSDAY: string = '周四';
  /**
   * default string friday.
   */
  static readonly DEFAULT_STRING_FRIDAY: string = '周五';
  /**
   * default string saturday.
   */
  static readonly DEFAULT_STRING_SATURDAY: string = '周六';
  /**
   * default string sunday.
   */
  static readonly DEFAULT_STRING_SUNDAY: string = '周日';
  /**
   * default number moment.
   */
  static readonly DEFAULT_NUMBER_MOMENT: number = 3;
  /**
   * default interval step.
   */
  static readonly DEFAULT_INTERVAL_STEP: number = 5;
  /**
   * default common degree
   */
  static readonly DEFAULT_COMMON_DEGREE: number = 6;
  /**
   * default pointer width.
   */
  static readonly DEFAULT_POINTER_WIDTH: number = 10;
  /**
   * default total hour.
   */
  static readonly DEFAULT_TOTAL_HOUR: number = 12;
  /**
   * default interval time max.
   */
  static readonly DEFAULT_INTERVAL_TIME_MAX: number = 10;
  /**
   * default interval minute max.
   */
  static readonly DEFAULT_INTERVAL_MINUTE_MAX: number = 30;
  /**
   * bundle name.
   */
  static readonly BUNDLE_NAME: string = 'com.huawei.alarmclock';
  /**
   * ability name.
   */
  static readonly ABILITY_NAME: string = 'EntryAbility';
}

/**
 * Default number for a week.
 */
export enum WeekDays {
  DEFAULT_NUMBER_MONDAY = 1,
  DEFAULT_NUMBER_TUESDAY = 2,
  DEFAULT_NUMBER_WEDNESDAY = 3,
  DEFAULT_NUMBER_THURSDAY = 4,
  DEFAULT_NUMBER_FRIDAY = 5,
  DEFAULT_NUMBER_SATURDAY = 6,
  DEFAULT_NUMBER_SUNDAY = 7
}