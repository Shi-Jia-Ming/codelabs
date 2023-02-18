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
import { getTabData } from '../utils/DataUtils';
import { DELAY_TIME, ANIMATION_DURATION, Y_OFF_SET_COEFFICIENT } from '../constant/CommonConstant';

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
  if (self.isCanLoadMore) {
    self.isLoading = true;
    setTimeout(() => {
      closeLoadMore.call(this);
      getTabData(self.currentPage, self.pageSize, self.currentIndex, {
        onSuccess: (value) => {
          self.currentPage = parseInt(value.currentPage.toString());
          self.newsData = self.newsData.concat(value.newsPageData);
        },
        onFail: (msg) => promptAction.showToast({ message: msg })
      });
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