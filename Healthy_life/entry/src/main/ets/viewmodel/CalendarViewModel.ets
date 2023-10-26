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

import { WeekDateModel } from '../model/WeekCalendarModel';
import Logger from '../common/utils/Logger';
import { CommonConstants as Const } from '../common/constants/CommonConstants';
import WeekCalendarMethodInfo from './WeekCalendarMethodInfo';
import { HomeStore } from './HomeViewModel';

const LAZY_DATA_PAGE: number = 2; // lazy page number

export interface ScrollPage {
  next: boolean;
  direction?: Axis;
}

export interface ScrollTo {
  xOffset: number | string;
  yOffset: number | string;
}

function gotoPreviousWeek(isPageScroll: Boolean, homeStore: HomeStore, currentPage: number, scroller: Scroller) {
  isPageScroll = true;
  let date: Date = new Date(homeStore.showDate);
  Logger.info('HomeIndex', 'gotoPreviousWeek: showDate_' + date.toISOString());

  if ((currentPage + LAZY_DATA_PAGE) * Const.WEEK_DAY_NUM > homeStore.dateArr.length) {
    // get more history data
    homeStore.getPreWeekData(date, () => {
      homeStore.setSelectedShowDate(homeStore.showDate - Const.WEEK_DAY_TIME);
      currentPage += 1;
    });
  } else {
    scroller.scrollPage({ next: false } as ScrollPage);
    Logger.info('HomeIndex', 'gotoPreviousWeek');
    homeStore.setSelectedShowDate(homeStore.showDate - Const.WEEK_DAY_TIME);
    currentPage += 1;
  }
}

function goToNextWeek(currentPage: number, isPageScroll: Boolean, homeStore: HomeStore, scroller: Scroller) {
  if (currentPage <= 0) {
    Logger.info('HomeIndex', 'goToNextWeek: is the current week');
    return;
  }
  isPageScroll = true;
  Logger.info('HomeIndex', 'goToNextWeek: nextPage');
  homeStore.setSelectedShowDate(homeStore.showDate + Const.WEEK_DAY_TIME);
  currentPage -= 1;
  scroller.scrollPage({ next: true } as ScrollPage);
}

function calenderItemClickAction(item: WeekDateModel, index: number, homeStore: HomeStore) {
  Logger.info('HomeIndex', 'click the calendarItem: ' + JSON.stringify(item));
  homeStore.setSelectedShowDate(item.date.getTime());
  homeStore.selectedDay = index % Const.WEEK_DAY_NUM;
}

const WeekCalendarMethods: WeekCalendarMethodInfo = new WeekCalendarMethodInfo();
WeekCalendarMethods.gotoPreviousWeek = gotoPreviousWeek;
WeekCalendarMethods.goToNextWeek = goToNextWeek;
WeekCalendarMethods.calenderItemClickAction = calenderItemClickAction;

export default WeekCalendarMethods;