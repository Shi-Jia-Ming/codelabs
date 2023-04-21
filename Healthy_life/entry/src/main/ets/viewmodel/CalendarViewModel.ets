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
import { WEEK_DAY_NUM, WEEK_DAY_TIME } from '../common/constants/CommonConstants';

const LAZY_DATA_PAGE: number = 2; // lazy page number

function gotoPreviousWeek() {
  this.isPageScroll = true;
  let date: Date = new Date(this.homeStore.showDate);
  Logger.info('HomeIndex', 'gotoPreviousWeek: showDate_' + date.toISOString());

  if ((this.currentPage + LAZY_DATA_PAGE) * WEEK_DAY_NUM > this.homeStore.dateArr.length) {
    // get more history data
    this.homeStore.getPreWeekData(date, () => {
      this.homeStore.setSelectedShowDate(this.homeStore.showDate - WEEK_DAY_TIME);
      this.currentPage += 1;
    });
  } else {
    this.scroller.scrollPage({ next: false });
    Logger.info('HomeIndex', 'gotoPreviousWeek');
    this.homeStore.setSelectedShowDate(this.homeStore.showDate - WEEK_DAY_TIME);
    this.currentPage += 1;
  }
}

function goToNextWeek() {
  if (this.currentPage <= 0) {
    Logger.info('HomeIndex', 'goToNextWeek: is the current week');
    return;
  }
  this.isPageScroll = true;
  Logger.info('HomeIndex', 'goToNextWeek: nextPage');
  this.homeStore.setSelectedShowDate(this.homeStore.showDate + WEEK_DAY_TIME);
  this.currentPage -= 1;
  this.scroller.scrollPage({ next: true });
}

function onScrollEndAction() {
  if (!this.isPageScroll) {
    let page = Math.round(this.scroller.currentOffset().xOffset / this.scrollWidth);
    page = this.isLoadMore ? page + 1 : page;
    if (this.scroller.currentOffset().xOffset % this.scrollWidth != 0 || this.isLoadMore) {
      let xOffset = page * this.scrollWidth;
      this.scroller.scrollTo({ xOffset, yOffset: 0 });
      this.isLoadMore = false;
    }
    this.currentPage = this.homeStore.dateArr.length / WEEK_DAY_NUM - page - 1;
    Logger.info('HomeIndex', 'onScrollEnd: page ' + page + ', listLength ' + this.homeStore.dateArr.length);
    let dayModel = this.homeStore.dateArr[WEEK_DAY_NUM * page+this.homeStore.selectedDay];
    Logger.info('HomeIndex', 'currentItem: ' + JSON.stringify(dayModel) + ', selectedDay  ' + this.homeStore.selectedDay);
    this.homeStore.setSelectedShowDate(dayModel.date.getTime());
  }
  this.isPageScroll = false;
}

function onScrollEdgeAction(side: Edge) {
  if (side == Edge.Top && !this.isPageScroll) {
    Logger.info('HomeIndex', 'onScrollEdge: currentPage ' + this.currentPage);
    if ((this.currentPage + 2) * WEEK_DAY_NUM >= this.homeStore.dateArr.length) {
      Logger.info('HomeIndex', 'onScrollEdge: load more data');
      let date: Date = new Date(this.homeStore.showDate);
      date.setDate(date.getDate() - WEEK_DAY_NUM);
      this.homeStore.getPreWeekData(date);
      this.isLoadMore = true;
    }
  }
}

function calenderItemClickAction(item: WeekDateModel, index: number) {
  Logger.info('HomeIndex', 'click the calendarItem: ' + JSON.stringify(item));
  this.homeStore.setSelectedShowDate(item.date.getTime());
  this.homeStore.selectedDay = index % WEEK_DAY_NUM;
}

const WeekCalendarMethods = {
  gotoPreviousWeek,
  goToNextWeek,
  onScrollEndAction,
  onScrollEdgeAction,
  calenderItemClickAction
}

export default WeekCalendarMethods;