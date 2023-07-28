/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import promptAction from '@ohos.promptAction';
import { DELAY_TIME, ANIMATION_DURATION, Y_OFF_SET_COEFFICIENT, GET_NEWS_LIST } from '../constant/CommonConstant';
import NewsViewModel from '../../viewmodel/NewsViewModel';
import Logger from './Logger';

export function touchMoveLoadMore(event: TouchEvent) {
  if (this.endIndex === this.newsData.length - 1 || this.endIndex === this.newsData.length) {
    this.offsetY = event.touches[0].y - this.downY;
    if (Math.abs(this.offsetY) > vp2px(this.pullUpLoadHeight) / 2) {
      this.isCanLoadMore = true;
      this.isVisiblePullUpLoad = true;
      this.offsetY = -vp2px(this.pullUpLoadHeight) + this.offsetY * Y_OFF_SET_COEFFICIENT;
    }
  }
}

export function touchUpLoadMore() {
  let self = this;
  animateTo({
    duration: ANIMATION_DURATION,
  }, () => {
    self.offsetY = 0;
  })
  if (self.isCanLoadMore && self.hasMore) {
    self.isLoading = true;
    setTimeout(() => {
      closeLoadMore.call(this);
      NewsViewModel.getNewsList(self.currentPage, self.pageSize, GET_NEWS_LIST).then((data) => {
        if (data.length === self.pageSize) {
          self.currentPage++;
          self.hasMore = true;
        } else {
          self.hasMore = false;
        }
        self.newsData = [...self.newsData, ...data];
      }).catch((err) => {
        promptAction.showToast({ message: err });
      })
    }, DELAY_TIME);
  } else {
    closeLoadMore.call(this);
  }
}

export function closeLoadMore() {
  this.isCanLoadMore = false;
  this.isLoading = false;
  this.isVisiblePullUpLoad = false;
}