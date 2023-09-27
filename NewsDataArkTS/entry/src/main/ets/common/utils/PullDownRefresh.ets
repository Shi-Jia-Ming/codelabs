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
import { touchMoveLoadMore, touchUpLoadMore } from './PullUpLoadMore';
import {
  CommonConstant as Const,
  RefreshState
} from '../constant/CommonConstant';
import NewsViewModel from '../../viewmodel/NewsViewModel';
import { NewsData } from '../bean/NewsData';

export function listTouchEvent(that, event: TouchEvent) {
  switch (event.type) {
    case TouchType.Down:
      that.downY = event.touches[0].y;
      that.lastMoveY = event.touches[0].y;
      break;
    case TouchType.Move:
      if ((that.isRefreshing === true) || (that.isLoading === true)) {
        return;
      }
      let isDownPull = event.touches[0].y - that.lastMoveY > 0;
      if (((isDownPull === true) || (that.isPullRefreshOperation === true)) && (that.isCanLoadMore === false)) {
        // Finger movement, processing pull-down refresh.
        touchMovePullRefresh(that, event);
      } else {
        // Finger movement, processing load more.
        touchMoveLoadMore(that, event);
      }
      that.lastMoveY = event.touches[0].y;
      break;
    case TouchType.Cancel:
      break;
    case TouchType.Up:
      if ((that.isRefreshing === true) || (that.isLoading === true)) {
        return;
      }
      if ((that.isPullRefreshOperation === true)) {
        // Lift your finger and pull down to refresh.
        touchUpPullRefresh(that);
      } else {
        // Fingers up, handle loading more.
        touchUpLoadMore(that);
      }
      break;
    default:
      break;
  }
}

export function touchMovePullRefresh(that, event: TouchEvent) {
  if (that.startIndex === 0) {
    that.isPullRefreshOperation = true;
    let height = vp2px(that.pullDownRefreshHeight);
    that.offsetY = event.touches[0].y - that.downY;
    // The sliding offset is greater than the pull-down refresh layout height, and the refresh condition is met.
    if (that.offsetY >= height) {
      pullRefreshState(that, RefreshState.Release);
      that.offsetY = height + that.offsetY * Const.Y_OFF_SET_COEFFICIENT;
    } else {
      pullRefreshState(that, RefreshState.DropDown);
    }
    if (that.offsetY < 0) {
      that.offsetY = 0;
      that.isPullRefreshOperation = false;
    }
  }
}

export function touchUpPullRefresh(that) {
  if (that.isCanRefresh === true) {
    that.offsetY = vp2px(that.pullDownRefreshHeight);
    pullRefreshState(that, RefreshState.Refreshing);
    that.currentPage = 1;
    setTimeout(() => {
      let self = that;
      NewsViewModel.getNewsList(that.currentPage, that.pageSize, Const.GET_NEWS_LIST).then((data: NewsData[]) => {
        if (data.length === that.pageSize) {
          self.hasMore = true;
          self.currentPage++;
        } else {
          self.hasMore = false;
        }
        self.newsData = data;
        closeRefresh(self, true);
      }).catch((err: string | Resource) => {
        promptAction.showToast({ message: err });
        // closeRefresh.call(self, false);
        closeRefresh(self, false);
      });
    }, Const.DELAY_TIME);
  } else {
    closeRefresh(that, false);
  }
}

export function pullRefreshState(that, state: number) {
  switch (state) {
    case RefreshState.DropDown:
      that.pullDownRefreshText = $r('app.string.pull_down_refresh_text');
      that.pullDownRefreshImage = $r("app.media.ic_pull_down_refresh");
      that.isCanRefresh = false;
      that.isRefreshing = false;
      that.isVisiblePullDown = true;
      break;
    case RefreshState.Release:
      that.pullDownRefreshText = $r('app.string.release_refresh_text');
      that.pullDownRefreshImage = $r("app.media.ic_pull_up_refresh");
      that.isCanRefresh = true;
      that.isRefreshing = false;
      break;
    case RefreshState.Refreshing:
      that.offsetY = vp2px(that.pullDownRefreshHeight);
      that.pullDownRefreshText = $r('app.string.refreshing_text');
      that.pullDownRefreshImage = $r("app.media.ic_pull_up_load");
      that.isCanRefresh = true;
      that.isRefreshing = true;
      break;
    case RefreshState.Success:
      that.pullDownRefreshText = $r('app.string.refresh_success_text');
      that.pullDownRefreshImage = $r("app.media.ic_succeed_refresh");
      that.isCanRefresh = true;
      that.isRefreshing = true;
      break;
    case RefreshState.Fail:
      that.pullDownRefreshText = $r('app.string.refresh_fail_text');
      that.pullDownRefreshImage = $r("app.media.ic_fail_refresh");
      that.isCanRefresh = true;
      that.isRefreshing = true;
      break;
    default:
      break;
  }
}

export function closeRefresh(that, isRefreshSuccess: boolean) {
  let self = that;
  setTimeout(() => {
    let delay = Const.RefreshConstant_DELAY_PULL_DOWN_REFRESH;
    if (self.isCanRefresh === true) {
      pullRefreshState(that, isRefreshSuccess ? RefreshState.Success : RefreshState.Fail);
      delay = Const.RefreshConstant_DELAY_SHRINK_ANIMATION_TIME;
    }
    animateTo({
      duration: Const.RefreshConstant_CLOSE_PULL_DOWN_REFRESH_TIME,
      delay: delay,
      onFinish: () => {
        pullRefreshState(that, RefreshState.DropDown);
        self.isVisiblePullDown = false;
        self.isPullRefreshOperation = false;
      }
    }, () => {
      self.offsetY = 0;
    })
  }, self.isCanRefresh ? Const.DELAY_ANIMATION_DURATION : 0);
}