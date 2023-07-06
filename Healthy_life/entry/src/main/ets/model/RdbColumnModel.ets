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

import ColumnInfo from '../common/bean/ColumnInfo';

export const columnGlobalInfoList: Array<ColumnInfo> = [
  {
    name: 'id',
    type: 'integer',
    primary: true,
    nullable: true
  },
  {
    name: 'firstDate',
    type: 'text'
  },
  {
    name: 'lastDate',
    type: 'text'
  },
  {
    name: 'checkInDays',
    type: 'integer',
    nullable: true
  },
  {
    name: 'achievements',
    type: 'text'
  }
];

export const columnDayInfoList: Array<ColumnInfo> = [
  {
    name: 'date',
    type: 'text',
    primary: true
  },
  {
    name: 'targetTaskNum',
    type: 'integer',
    nullable: true
  },
  {
    name: 'finTaskNum',
    type: 'integer',
    nullable: true
  }
];

export const columnTaskInfoInfoList: Array<ColumnInfo> = [
  {
    name: 'id',
    type: 'integer',
    primary: true,
    autoincrement: true
  },
  {
    name: 'date',
    type: 'TEXT'
  },
  {
    name: 'taskID',
    type: 'integer'
  },
  {
    name: 'targetValue',
    type: 'text'
  },
  {
    name: 'isAlarm',
    type: 'boolean'
  },
  {
    name: 'startTime',
    type: 'text'
  },
  {
    name: 'endTime',
    type: 'text'
  },
  {
    name: 'frequency',
    type: 'text'
  },
  {
    name: 'isDone',
    type: 'boolean',
    nullable: true
  },
  {
    name: 'finValue',
    type: 'text'
  },
  {
    name: 'isOpen',
    type: 'boolean',
    nullable: true
  }
];

export const columnFormInfoList: Array<ColumnInfo> = [
  {
    name: 'id',
    type: 'integer',
    primary: true,
    nullable: true
  },
  {
    name: 'formId',
    type: 'text'
  },
  {
    name: 'formName',
    type: 'text'
  },
  {
    name: 'formDimension',
    type: 'integer'
  }
];

