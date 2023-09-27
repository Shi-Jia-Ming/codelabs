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
import WeekCalendarMethodInfo from '../common/bean/WeekCalendarMethodInfo';

const LAZY_DATA_PAGE: number = 2; // lazy page number

interface ScrollPage {
  next: boolean;
  direction?: Axis;
}

interface ScrollTo {
  xOffset: number | string;
  yOffset: number | string;
}

function gotoPreviousWeek(that) {
  that.isPageScroll = true;
  let date: Date = new Date(that.homeStore.showDate);
  Logger.info('HomeIndex', 'gotoPreviousWeek: showDate_' + date.toISOString());

  if ((that.currentPage + LAZY_DATA_PAGE) * Const.WEEK_DAY_NUM > that.homeStore.dateArr.length) {
    // get more history data
    that.homeStore.getPreWeekData(date, () => {
      that.homeStore.setSelectedShowDate(that.homeStore.showDate - Const.WEEK_DAY_TIME);
      that.currentPage += 1;
    });
  } else {
    that.scroller.scrollPage({ next: false } as ScrollPage);
    Logger.info('HomeIndex', 'gotoPreviousWeek');
    that.homeStore.setSelectedShowDate(that.homeStore.showDate - Const.WEEK_DAY_TIME);
    that.currentPage += 1;
  }
}

function goToNextWeek(that) {
  if (that.currentPage <= 0) {
    Logger.info('HomeIndex', 'goToNextWeek: is the current week');
    return;
  }
  that.isPageScroll = that;
  Logger.info('HomeIndex', 'goToNextWeek: nextPage');
  that.homeStore.setSelectedShowDate(that.homeStore.showDate + Const.WEEK_DAY_TIME);
  that.currentPage -= 1;
  that.scroller.scrollPage({ next: true } as ScrollPage);
}

function onScrollEndAction(that) {
  if (that.isPageScroll === false) {
    let page = Math.round(that.scroller.currentOffset().xOffset / that.scrollWidth);
    page = (that.isLoadMore === true) ? page + 1 : page;
    if (that.scroller.currentOffset().xOffset % that.scrollWidth != 0 || that.isLoadMore === true) {
      let xOffset = page * that.scrollWidth;
      that.scroller.scrollTo({ xOffset, yOffset: 0 } as ScrollTo);
      that.isLoadMore = false;
    }
    that.currentPage = that.homeStore.dateArr.length / Const.WEEK_DAY_NUM - page - 1;
    Logger.info('HomeIndex', 'onScrollEnd: page ' + page + ', listLength ' + that.homeStore.dateArr.length);
    let dayModel: WeekDateModel = that.homeStore.dateArr[Const.WEEK_DAY_NUM * page+that.homeStore.selectedDay];
    Logger.info('HomeIndex', 'currentItem: ' + JSON.stringify(dayModel) + ', selectedDay  ' + that.homeStore.selectedDay);
    that.homeStore.setSelectedShowDate(dayModel.date.getTime());
  }
  that.isPageScroll = false;
}

function onScrollEdgeAction(that, side: Edge) {
  if (side === Edge.Top && that.isPageScroll === false) {
    Logger.info('HomeIndex', 'onScrollEdge: currentPage ' + that.currentPage);
    if ((that.currentPage + 2) * Const.WEEK_DAY_NUM >= that.homeStore.dateArr.length) {
      Logger.info('HomeIndex', 'onScrollEdge: load more data');
      let date: Date = new Date(that.homeStore.showDate);
      date.setDate(date.getDate() - Const.WEEK_DAY_NUM);
      that.homeStore.getPreWeekData(date);
      that.isLoadMore = true;
    }
  }
}

function calenderItemClickAction(that, item: WeekDateModel, index: number) {
  Logger.info('HomeIndex', 'click the calendarItem: ' + JSON.stringify(item));
  that.homeStore.setSelectedShowDate(item.date.getTime());
  that.homeStore.selectedDay = index % Const.WEEK_DAY_NUM;
}

const WeekCalendarMethods: WeekCalendarMethodInfo = new WeekCalendarMethodInfo();
WeekCalendarMethods.gotoPreviousWeek = gotoPreviousWeek;
WeekCalendarMethods.goToNextWeek = goToNextWeek;
WeekCalendarMethods.onScrollEndAction = onScrollEndAction;
WeekCalendarMethods.onScrollEdgeAction = onScrollEdgeAction;
WeekCalendarMethods.calenderItemClickAction = calenderItemClickAction;

export default WeekCalendarMethods;