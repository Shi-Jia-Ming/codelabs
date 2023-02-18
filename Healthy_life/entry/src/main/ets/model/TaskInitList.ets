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

import TaskInfo from '../common/bean/TaskInfo';
import {
  GET_UP_TASK_NAME,
  DRINK_TASK_NAME,
  EAT_APPLE_TASK_NAME,
  SMILE_TASK_NAME,
  BRUSH_TEETH_TASK_NAME,
  SLEEP_TASK_NAME,
  GET_UP_CONTENT,
  DRINK_CONTENT,
  EAT_APPLE_CONTENT,
  SMILE_CONTENT,
  BRUSH_TEETH_CONTENT,
  SLEEP_CONTENT
} from '../common/constants/CommonConstants';

export interface ITaskItem {
  taskID: number;
  taskName: Resource;
  isOpen: boolean;
  unit: string;
  icon: Resource;
  dialogBg: Resource;
  targetValue: string;
  isAlarm: boolean;
  startTime: string;
  endTime: string;
  frequency: string;
  isInit: boolean;
  step: number;
}

export interface TaskInitListType {
  [key: number]: ITaskItem;
}

export interface FrequencyContentType {
  id: number,
  label: string,
  isChecked: boolean
}

export const TaskList: TaskInfo[] = [
  {
    id: 0,
    taskID: 1,
    isOpen: true,
    date: '',
    targetValue: '7:00',
    isAlarm: true,
    startTime: '',
    endTime: ';',
    frequency: '',
    isDone: false,
    finValue: ''
  },
  {
    id: 1,
    taskID: 2,
    isOpen: true,
    date: '',
    targetValue: '1.5',
    isAlarm: true,
    startTime: '',
    endTime: ';',
    frequency: '',
    isDone: false,
    finValue: ''
  },
  {
    id: 2,
    taskID: 3,
    isOpen: true,
    date: '',
    targetValue: '3',
    startTime: '08: 00',
    endTime: '',
    isAlarm: true,
    frequency: '',
    isDone: false,
    finValue: ''
  },
  {
    id: 3,
    taskID: 4,
    isOpen: true,
    date: '',
    targetValue: '1',
    isAlarm: true,
    startTime: '',
    endTime: ';',
    frequency: '',
    isDone: false,
    finValue: ''
  },
  {
    id: 4,
    taskID: 5,
    isOpen: true,
    date: '',
    targetValue: '21:30',
    isAlarm: true,
    startTime: '',
    endTime: ';',
    frequency: '',
    isDone: false,
    finValue: ''
  },
  {
    id: 5,
    taskID: 6,
    isOpen: true,
    date: '',
    targetValue: '22:00',
    isAlarm: true,
    startTime: '',
    endTime: ';',
    frequency: '',
    isDone: false,
    finValue: ''
  }
]

export const TaskMapById: TaskInitListType = {
  1: {
    taskID: 1,
    taskName: $r('app.string.task_morning'),
    icon: $r('app.media.morning'),
    dialogBg: $rawfile('dialog/getUpEarly.png'),
    targetValue: '08: 00',
    isOpen: false,
    unit: '',
    step: 0,
    isInit: true,
    isAlarm: false,
    startTime: '08: 00',
    endTime: '00: 00',
    frequency: '1, 2, 3, 4, 5, 6, 7'
  },
  2: {
    taskID: 2,
    taskName: $r('app.string.task_water'),
    icon: $r('app.media.water'),
    dialogBg: $rawfile('dialog/drink.png'),
    targetValue: '0.25',
    isOpen: false,
    unit: 'L',
    step: 0,
    isInit: true,
    isAlarm: false,
    startTime: '08: 00',
    endTime: '00: 00',
    frequency: '1, 2, 3, 4, 5, 6, 7'
  },
  3: {
    taskID: 3,
    taskName: $r('app.string.task_apple'),
    icon: $r('app.media.apple'),
    dialogBg: $rawfile('dialog/eatApples.png'),
    targetValue: '1',
    isOpen: false,
    unit: '个',
    step: 1,
    isInit: true,
    isAlarm: false,
    startTime: '08: 00',
    endTime: '00: 00',
    frequency: '1, 2, 3, 4, 5, 6, 7'
  },
  4: {
    taskID: 4,
    taskName: $r('app.string.task_smile'),
    icon: $r('app.media.smile'),
    dialogBg: $rawfile('dialog/dailySmile.png'),
    targetValue: '1',
    isOpen: false,
    unit: '次',
    step: 0,
    isInit: true,
    isAlarm: false,
    startTime: '08: 00',
    endTime: '00: 00',
    frequency: '1, 2, 3, 4, 5, 6, 7'
  },
  5: {
    taskID: 5,
    taskName: $r('app.string.task_brush'),
    icon: $r('app.media.brush'),
    dialogBg: $rawfile('dialog/brushTeeth.png'),
    targetValue: '1',
    isOpen: false,
    unit: '次',
    step: 0,
    isInit: true,
    isAlarm: false,
    startTime: '08: 00',
    endTime: '00: 00',
    frequency: '1, 2, 3, 4, 5, 6, 7'
  },
  6: {
    taskID: 6,
    taskName: $r('app.string.task_night'),
    icon: $r('app.media.night'),
    dialogBg: $rawfile('dialog/sleepEarly.png'),
    targetValue: '20: 00',
    isOpen: false,
    unit: '',
    step: 0,
    isInit: true,
    isAlarm: false,
    startTime: '08: 00',
    endTime: '00: 00',
    frequency: '1, 2, 3, 4, 5, 6, 7'
  }
}

export const TaskItem: TaskInfo = {
  id: 1,
  taskID: 0,
  isOpen: false,
  date: '',
  targetValue: '7:00',
  isAlarm: true,
  startTime: 'string',
  endTime: 'string;',
  frequency: '',
  isDone: true,
  finValue: '6:58'
};

export const RemindContentMap = {
  1: {
    title: GET_UP_TASK_NAME,
    content: GET_UP_CONTENT
  },
  2: {
    title: DRINK_TASK_NAME,
    content: DRINK_CONTENT
  },
  3: {
    title: EAT_APPLE_TASK_NAME,
    content: EAT_APPLE_CONTENT
  },
  4: {
    title: SMILE_TASK_NAME,
    content: SMILE_CONTENT
  },
  5: {
    title: BRUSH_TEETH_TASK_NAME,
    content: BRUSH_TEETH_CONTENT
  },
  6: {
    title: SLEEP_TASK_NAME,
    content: SLEEP_CONTENT
  },
};

export const ACHIEVEMENT_LEVEL_LIST = [3, 7, 30, 50, 73, 99];