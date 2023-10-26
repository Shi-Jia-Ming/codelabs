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

import { oneWeekDictFunc } from '../common/utils/Utils';

/**
 * TaskInfo
 *
 * @param id
 * @param date
 * @param taskID
 * @param targetValue
 * @param isAlarm
 * @param startTime
 * @param endTime
 * @param frequency
 * @param isDone
 * @param doneValue
 * @param isOpen
 */
export default class TaskInfo {
    id: number;
    date: string;
    taskID: number;
    targetValue: string;
    isAlarm: boolean;
    startTime: string;
    endTime: string;
    frequency: string;
    isDone: boolean;
    finValue: string;
    isOpen: boolean;

    constructor(id: number, date: string, taskID: number, targetValue: string, isAlarm: boolean, startTime: string,
                endTime: string, frequency: string, isDone: boolean, finValue: string, isOpen = false) {
        this.id = id;
        this.date = date;
        this.taskID = taskID;
        this.targetValue = targetValue;
        this.isAlarm = isAlarm;
        this.startTime = startTime;
        this.endTime = endTime;
        this.frequency = frequency;
        this.isDone = isDone;
        this.finValue = finValue;
        this.isOpen = isOpen;
    }
}

export enum taskType {
    'getup' = 1,
    'drinkWater',
    'eatApple',
    'smile',
    'brushTeeth',
    'sleepEarly'
}

export const oneWeek = oneWeekDictFunc();
