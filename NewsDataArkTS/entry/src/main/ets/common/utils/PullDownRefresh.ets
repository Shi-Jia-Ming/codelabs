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
import { getTabData } from './DataUtils';
import { touchMoveLoadMore, touchUpLoadMore } from './PullUpLoadMore';
import {
  DELAY_TIME,
  DELAY_ANIMATION_DURATION,
  Y_OFF_SET_COEFFICIENT,
  RefreshState,
  RefreshConstant
} from '../constant/CommonConstant';

export function listTouchEvent(event: TouchEvent) {
  switch (event.type) {
    case TouchType.Down:
      this.downY = event.touches[0].y;
      this.lastMoveY = event.touches[0].y;
      break;
    case TouchType.Move:
      if (this.isRefreshing || this.isLoading) {
        return;
      }
      let isDownPull = event.touches[0].y - this.lastMoveY > 0;
      if ((isDownPull || this.isPullRefreshOperation) && !this.isCanLoadMore) {
        // Finger movement, processing pull-down refresh.
        touchMovePullRefresh.call(this, event);
      } else {
        // Finger movement, processing load more.
        touchMoveLoadMore.call(this, event);
      }
      this.lastMoveY = event.touches[0].y;
      break;
    case TouchType.Cancel:
      break;
    case TouchType.Up:
      if (this.isRefreshing || this.isLoading) {
        return;
      }
      if (this.isPullRefreshOperation) {
        // Lift your finger and pull down to refresh.
        touchUpPullRefresh.call(this);
      } else {
        // Fingers up, handle loading more.
        touchUpLoadMore.call(this);
      }
      break;
    default:
      break;
  }
}

export function touchMovePullRefresh(event: TouchEvent) {
  if (this.startIndex === 0) {
    this.isPullRefreshOperation = true;
    let height = vp2px(this.pullDownRefreshHeight);
    this.offsetY = event.touches[0].y - this.downY;
    // The sliding offset is greater than the pull-down refresh layout height, and the refresh condition is met.
    if (this.offsetY >= height) {
      pullRefreshState.call(this, RefreshState.Release);
      this.offsetY = height + this.offsetY * Y_OFF_SET_COEFFICIENT;
    } else {
      pullRefreshState.call(this, RefreshState.DropDown);
    }
    if (this.offsetY < 0) {
      this.offsetY = 0;
      this.isPullRefreshOperation = false;
    }
  }
}

export function touchUpPullRefresh() {
  if (this.isCanRefresh) {
    this.offsetY = vp2px(this.pullDownRefreshHeight);
    pullRefreshState.call(this, RefreshState.Refreshing);
    setTimeout(() => {
      let self = this;
      getTabData(self.currentPage, self.pageSize, self.currentIndex, {
        onSuccess: (value) => {
          self.currentPage = parseInt(value.currentPage.toString());
          self.newsData = value.newsPageData;
          closeRefresh.call(self, true);
        },
        onFail: (msg) => {
          promptAction.showToast({ message: msg });
          closeRefresh.call(self, false);
        }
      });
    }, DELAY_TIME);
  } else {
    closeRefresh.call(this, false);
  }
}

export function pullRefreshState(state: number) {
  switch (state) {
    case RefreshState.DropDown:
      this.pullDownRefreshText = $r('app.string.pull_down_refresh_text');
      this.pullDownRefreshImage = $r("app.media.ic_pull_down_refresh");
      this.isCanRefresh = false;
      this.isRefreshing = false;
      this.isVisiblePullDown = true;
      break;
    case RefreshState.Release:
      this.pullDownRefreshText = $r('app.string.release_refresh_text');
      this.pullDownRefreshImage = $r("app.media.ic_pull_up_refresh");
      this.isCanRefresh = true;
      this.isRefreshing = false;
      break;
    case RefreshState.Refreshing:
      this.offsetY = vp2px(this.pullDownRefreshHeight);
      this.pullDownRefreshText = $r('app.string.refreshing_text');
      this.pullDownRefreshImage = $r("app.media.ic_pull_up_load");
      this.isCanRefresh = true;
      this.isRefreshing = true;
      break;
    case RefreshState.Success:
      this.pullDownRefreshText = $r('app.string.refresh_success_text');
      this.pullDownRefreshImage = $r("app.media.ic_succeed_refresh");
      this.isCanRefresh = true;
      this.isRefreshing = true;
      break;
    case RefreshState.Fail:
      this.pullDownRefreshText = $r('app.string.refresh_fail_text');
      this.pullDownRefreshImage = $r("app.media.ic_fail_refresh");
      this.isCanRefresh = true;
      this.isRefreshing = true;
      break;
    default:
      break;
  }
}

export function closeRefresh(isRefreshSuccess: boolean) {
  let self = this;
  setTimeout(() => {
    let delay = RefreshConstant.DELAY_PULL_DOWN_REFRESH;
    if (self.isCanRefresh) {
      pullRefreshState.call(this, isRefreshSuccess ? RefreshState.Success : RefreshState.Fail);
      delay = RefreshConstant.DELAY_SHRINK_ANIMATION_TIME;
    }
    animateTo({
      duration: RefreshConstant.CLOSE_PULL_DOWN_REFRESH_TIME,
      delay: delay,
      onFinish: () => {
        pullRefreshState.call(this, RefreshState.DropDown);
        self.isVisiblePullDown = false;
        self.isPullRefreshOperation = false;
      }
    }, () => {
      self.offsetY = 0;
    })
  }, self.isCanRefresh ? DELAY_ANIMATION_DURATION : 0);
}