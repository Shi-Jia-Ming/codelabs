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

export interface TaskListItem {
  taskID: number;
  taskName: Resource;
  isOpen: boolean;
  unit: string;
  icon: Resource;
  targetValue: string;
  isAlarm: boolean;
  startTime: string;
  frequency: string;
}

export interface FrequencyContentType {
  id: number,
  label: string,
  isChecked: boolean
}

export const TaskInitList: TaskListItem[] = [
  { // 早起
    taskID: 1,
    taskName: $r('app.string.task_morning'),
    icon: $r('app.media.morning'),
    targetValue: '08: 00',
    isOpen: true,
    unit: '',
    isAlarm: false,
    startTime: '08: 00',
    frequency: '1, 2, 3, 4, 5, 6, 7'
  },
  { // 喝水
    taskID: 2,
    taskName: $r('app.string.task_water'),
    icon: $r('app.media.water'),
    targetValue: '0.25',
    isOpen: true,
    unit: 'L',
    isAlarm: false,
    startTime: '08: 00',
    frequency: '1, 2, 3, 4, 5, 6, 7'
  },
  { // 吃苹果
    taskID: 3,
    taskName: $r('app.string.task_apple'),
    icon: $r('app.media.apple'),
    targetValue: '1',
    isOpen: true,
    unit: '个',
    isAlarm: false,
    startTime: '08: 00',
    frequency: '1, 2, 3, 4, 5, 6, 7'
  },
  { // 每日微笑
    taskID: 4,
    taskName: $r('app.string.task_smile'),
    icon: $r('app.media.smile'),
    targetValue: '1',
    isOpen: false,
    unit: '次',
    isAlarm: false,
    startTime: '08: 00',
    frequency: '1, 2, 3, 4, 5, 6, 7'
  },
  { // 刷牙
    taskID: 5,
    taskName: $r('app.string.task_brush'),
    icon: $r('app.media.brush'),
    targetValue: '1',
    isOpen: false,
    unit: '次',
    isAlarm: false,
    startTime: '08: 00',
    frequency: '1, 2, 3, 4, 5, 6, 7'
  },
  { // 早睡
    taskID: 6,
    taskName: $r('app.string.task_night'),
    icon: $r('app.media.night'),
    targetValue: '20: 00',
    isOpen: false,
    unit: '',
    isAlarm: false,
    startTime: '08: 00',
    frequency: '1, 2, 3, 4, 5, 6, 7'
  }
]