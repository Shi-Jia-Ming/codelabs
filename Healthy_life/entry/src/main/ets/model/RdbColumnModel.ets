/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import ColumnInfo from '../viewmodel/ColumnInfo';

export const columnGlobalInfoList: Array<ColumnInfo> = [
  new ColumnInfo('id', 'integer', -1, true, true, false),
  new ColumnInfo('firstDate', 'text', -1, false, false, false),
  new ColumnInfo('lastDate', 'text', -1, false, false, false),
  new ColumnInfo('checkInDays', 'integer', -1, true, false, false),
  new ColumnInfo('achievements', 'text', -1, false, false, false)
];

export const columnDayInfoList: Array<ColumnInfo> = [
  new ColumnInfo('date', 'text', -1, false, true, false),
  new ColumnInfo('targetTaskNum', 'integer', -1, true, false, false),
  new ColumnInfo('finTaskNum', 'integer', -1, true, false, false)
];

export const columnTaskInfoInfoList: Array<ColumnInfo> = [
  new ColumnInfo('id', 'integer', -1, false, true, true),
  new ColumnInfo('date', 'TEXT', -1, false, false, false),
  new ColumnInfo('taskID', 'integer', -1, false, false, false),
  new ColumnInfo('targetValue', 'text', -1, false, false, false),
  new ColumnInfo('isAlarm', 'boolean', -1, false, false, false),
  new ColumnInfo('startTime', 'text', -1, false, false, false),
  new ColumnInfo('endTime', 'text', -1, false, false, false),
  new ColumnInfo('frequency', 'text', -1, false, false, false),
  new ColumnInfo('isDone', 'boolean', -1, true, false, false),
  new ColumnInfo('finValue', 'text', -1, false, false, false),
  new ColumnInfo('isOpen', 'boolean', -1, true, false, false)
];

export const columnFormInfoList: Array<ColumnInfo> = [
  new ColumnInfo('id', 'integer', -1, true, true, false),
  new ColumnInfo('formId', 'text', -1, false, false, false),
  new ColumnInfo('formName', 'text', -1, false, false, false),
  new ColumnInfo('formDimension', 'integer', -1, false, false, false)
];

