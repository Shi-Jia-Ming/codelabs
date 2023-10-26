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

import TaskInfo from '../viewmodel/TaskInfo';
import DayInfo from '../viewmodel/DayInfo';
import { WEEK_TITLES, dateToStr } from '../common/utils/Utils'
import Logger from '../common/utils/Logger'
import WeekCalendarInfo from '../viewmodel/WeekCalendarInfo';

// day number of on week
export const WEEK_DAY_NUM: number = 7;

export class WeekDateModel {
  weekTitle: string;
  dateStr: string;
  date: Date;
  dayInfo: DayInfo = new DayInfo('', 0, 0);
  taskList: TaskInfo[] = [];

  constructor(weekTitle: string, dateStr: string, date: Date) {
    this.weekTitle = weekTitle;
    this.dateStr = dateStr;
    this.date = date;
  }
}

/**
 * init calendar data
 *
 * @param date  today str
 */
export function initializeOnStartUp(date: Date): WeekCalendarInfo {
  let weekCalendarInfo: WeekCalendarInfo = new WeekCalendarInfo();
  let arr: Array<WeekDateModel> = [];
  let strArr: Array<string> = [];
  let currentDay = date.getDay() - 1;
  if (date.getDay() === 0) {
    currentDay = 6;
  }
  Logger.debug('WeekCalendarModel', date.toISOString());
  // monday is first day of week
  date.setDate(date.getDate() - currentDay)
  for (let index = 0; index < WEEK_DAY_NUM; index++) {
    let tempDate = new Date(date);
    tempDate.setDate(date.getDate() + index);
    let dateStr = dateToStr(tempDate);
    strArr.push(dateStr);
    arr.push(new WeekDateModel(WEEK_TITLES[tempDate.getDay()], dateStr, tempDate))
  }
  Logger.debug('WeekCalendarModel', 'initialWeekDate' + JSON.stringify(arr))
  weekCalendarInfo.arr = arr;
  weekCalendarInfo.strArr = strArr;
  return weekCalendarInfo;
}

/**
 * get previous week data
 *
 * @param showDate  base data
 */
export function getPreviousWeek(showDate: Date): WeekCalendarInfo {
  Logger.debug('WeekCalendarModel', 'get week date by date: ' + showDate.toDateString());
  let weekCalendarInfo: WeekCalendarInfo = new WeekCalendarInfo();
  let arr: Array<WeekDateModel> = [];
  let strArr: Array<string> = [];
  let currentDay = showDate.getDay() - 1;
  // monday is first day of week
  showDate.setDate(showDate.getDate() - currentDay);
  for (let index = WEEK_DAY_NUM; index > 0; index--) {
    let tempDate = new Date(showDate);
    tempDate.setDate(showDate.getDate() - index);
    let dateStr = dateToStr(tempDate);
    strArr.push(dateStr);
    arr.push(new WeekDateModel(WEEK_TITLES[tempDate.getDay()], dateStr, tempDate));
  }
  Logger.debug('WeekCalendarModel', JSON.stringify(arr));
  weekCalendarInfo.arr = arr;
  weekCalendarInfo.strArr = strArr;
  return weekCalendarInfo;
}

