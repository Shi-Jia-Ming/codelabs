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

export const RDB_NAME = { dbname: 'taskInfo.db' }; // db name

/** day info table */
export const DAY_INFO = {
  tableName: 'dayInfo',
  columns: ['date', 'targetTaskNum', 'finTaskNum']
}

/** global info table */
export const GLOBAL_INFO = {
  tableName: 'globalInfo',
  columns: ['id', 'firstDate', 'lastDate', 'checkInDays', 'achievements']
}

/** task info table */
export const TASK_INFO = {
  tableName: 'taskInfo',
  columns: [
    'id',
    'date',
    'taskID',
    'targetValue',
    'isAlarm',
    'startTime',
    'endTime',
    'frequency',
    'isDone',
    'finValue',
    'isOpen'
  ],
}

// TaskNum
export const TASK_NUM = 6;

// THOUSANDTH
export const THOUSANDTH_15: string = '1.5%'; // ‘1.5%’
export const THOUSANDTH_12: string = '2.2%'; // ‘2.2%’
export const THOUSANDTH_33: string = '3.3%'; // ‘3.3%’
export const THOUSANDTH_50: string = '5%'; // ‘5%’
export const THOUSANDTH_66: string = '6.6%'; // ‘6.6%’
export const THOUSANDTH_80: string = '8%'; // ‘8%’
export const THOUSANDTH_100: string = '10%'; // ‘10%’
export const THOUSANDTH_120: string = '12%'; // ‘12%’
export const THOUSANDTH_160: string = '16%'; // ‘16%’
export const THOUSANDTH_400: string = '40%'; // ‘40%’
export const THOUSANDTH_420: string = '42%'; // ‘42%’
export const THOUSANDTH_500: string = '50%'; // ‘50%’
export const THOUSANDTH_560: string = '56%'; // ‘56%’
export const THOUSANDTH_800: string = '80%'; // ‘80%’
export const THOUSANDTH_830: string = '83%'; // ‘83%’
export const THOUSANDTH_880: string = '88%'; // ‘88%’
export const THOUSANDTH_900: string = '90%'; // ‘90%’
export const THOUSANDTH_940: string = '94%'; // ‘90%’
export const THOUSANDTH_1000: string = '100%'; // ‘100%’

export const DEFAULT_2: number = 2;

export const DEFAULT_6: number = 6;

export const DEFAULT_8: number = 8;

export const DEFAULT_12: number = 12;

export const DEFAULT_10: number = 10;

export const DEFAULT_16: number = 16;

export const DEFAULT_18: number = 18;

export const DEFAULT_20: number = 20;

export const DEFAULT_24: number = 24;

export const DEFAULT_28: number = 28;

export const DEFAULT_32: number = 32;

export const DEFAULT_48: number = 48;

export const DEFAULT_56: number = 56;

export const DEFAULT_60: number = 60;

export const DEFAULT_100: number = 100;

export const DEFAULT_180: number = 180;

// fontWeight
export const FONT_WEIGHT_400: number = 400;

export const FONT_WEIGHT_500: number = 500;

export const FONT_WEIGHT_700: number = 700;

export const FONT_WEIGHT_900: number = 900;


// opacity
export const OPACITY_4: number = 0.4;

export const OPACITY_6: number = 0.6;

// radius
export const BORDER_RADIUS_PERCENT_50: string = '50%';

// duration
export const AD_DURATION: number = 5; // 5s
export const LAUNCHER_DELAY_TIME: number = 2000; // 2000ms
export const DURATION_1000: number = 1000; // 1000ms
export const DURATION_800: number = 800; // 700ms
export const DURATION_100: number = 100; // 100ms


// list space
export const LIST_ITEM_SPACE: number = 2;

export const SPACE_4: number = 4;

// navigation title
export const ADD_TASK_TITLE: string = '添加任务';

export const EDIT_TASK_TITLE: string = '编辑任务';

// prompt message
export const SETTING_FINISHED_MESSAGE = '设置完成！！！';

export const SETTING_FINISH_FAILED_MESSAGE = '网络连接错误';

export const CHOOSE_TIME_OUT_RANGE: string = '选择时间超出范围';

export const NICK_NAME = 'JoIin';

export const SIGNATURE = '这是一条简短地个人签';

export const HOME_BTN_Z = 2;

// date format
export const TODAY: string = new Date().toDateString();

// time range
export const DEFAULT_TIME: string = '08:00';

export const GET_UP_TIME_RANGE: string = '(06:00 - 09:00)';

export const SLEEP_TIME_RANGE: string = '(20:00 - 23:00)';

export const GET_UP_EARLY_TIME: string = '06:00';

export const GET_UP_LATE_TIME: string = '09:00';

export const SLEEP_EARLY_TIME: string = '20:00';

export const SLEEP_LATE_TIME: string = '23:00';

export const DEFAULT_SELECTED_TIME: Date = new Date(`${TODAY} 8:00:00`);

// frequency Dialog
export const EVERYDAY: string = '每天';

export const NO_LENGTH: number = 0;

export const INIT_WEEK_IDS: string = '1, 2, 3, 4, 5, 6, 7';

// unit
export const PER_DAY: string = '/ 天';

// global data key
export const GLOBAL_KEY: string = 'global';

// RemindContent
export const GET_UP_TASK_NAME: string = '早起';

export const DRINK_TASK_NAME: string = '喝水';

export const EAT_APPLE_TASK_NAME: string = '吃苹果';

export const SMILE_TASK_NAME: string = '每日微笑';

export const BRUSH_TEETH_TASK_NAME: string = '每日刷牙';

export const SLEEP_TASK_NAME: string = '早睡';

export const GET_UP_CONTENT: string = '该早起啦';

export const DRINK_CONTENT: string = '该喝水啦';

export const EAT_APPLE_CONTENT: string = '该吃苹果啦';

export const SMILE_CONTENT: string = '请保持微笑';

export const BRUSH_TEETH_CONTENT: string = '每日刷牙';

export const SLEEP_CONTENT: string = '早睡';

// offset
export const ZERO: number = 0;

export const MINUS_20: number = -20;

export const HAS_NO_INDEX: number = -1;

export const OFFSET_24: number = -24;

// targetSetting Range
export const DRINK_STEP: number = 25;

export const DRINK_MAX_RANGE: number = 500;

export const TIMES_100: number = 100;

export const EAT_APPLE_RANGE: number = 100;


// letter spacing
export const LETTER_1: number = 0.1;

export const LETTER_34: number = 3.4;

// achievement
export const ACHIEVE_CARD_IMG_HEIGHT: number = 88;

export const ACHIEVE_CARD_TOP: number = 38;

export const ACHIEVE_CARD_BOTTOM: number = 10;

export const ACHIEVE_SPLIT_RATIO: number = 1 / 3;

export const ACHIEVE_TITLE_BAR_LEFT: number = 20;

export const ACHIEVE_TITLE_BAR_TOP: number = 15;

export const FULL_WIDTH: string = '100%';

export const FULL_HEIGHT: string = '100%';

export const WEEK_DAY_NUM: number = 7; // number days of one week
export const WEEK_DAY_TIME: number = WEEK_DAY_NUM * 24 * 60 * 60 * 1000;