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
import NewsViewModel, { NewsData } from '../../viewmodel/NewsViewModel';
import NewsModel from '../../viewmodel/NewsModel';

export function listTouchEvent(newsModel: NewsModel, event: TouchEvent) {
  switch (event.type) {
    case TouchType.Down:
      newsModel.downY = event.touches[0].y;
      newsModel.lastMoveY = event.touches[0].y;
      break;
    case TouchType.Move:
      if ((newsModel.isRefreshing === true) || (newsModel.isLoading === true)) {
        return;
      }
      let isDownPull = event.touches[0].y - newsModel.lastMoveY > 0;
      if (((isDownPull === true) || (newsModel.isPullRefreshOperation === true)) && (newsModel.isCanLoadMore === false))
      {
        // Finger movement, processing pull-down refresh.
        touchMovePullRefresh(newsModel, event);
      } else {
        // Finger movement, processing load more.
        touchMoveLoadMore(newsModel, event);
      }
      newsModel.lastMoveY = event.touches[0].y;
      break;
    case TouchType.Cancel:
      break;
    case TouchType.Up:
      if ((newsModel.isRefreshing === true) || (newsModel.isLoading === true)) {
        return;
      }
      if ((newsModel.isPullRefreshOperation === true)) {
        // Lift your finger and pull down to refresh.
        touchUpPullRefresh(newsModel);
      } else {
        // Fingers up, handle loading more.
        touchUpLoadMore(newsModel);
      }
      break;
    default:
      break;
  }
}

export function touchMovePullRefresh(newsModel: NewsModel, event: TouchEvent) {
  if (newsModel.startIndex === 0) {
    newsModel.isPullRefreshOperation = true;
    let height = vp2px(newsModel.pullDownRefreshHeight);
    newsModel.offsetY = event.touches[0].y - newsModel.downY;
    // The sliding offset is greater than the pull-down refresh layout height, and the refresh condition is met.
    if (newsModel.offsetY >= height) {
      pullRefreshState(newsModel, RefreshState.Release);
      newsModel.offsetY = height + newsModel.offsetY * Const.Y_OFF_SET_COEFFICIENT;
    } else {
      pullRefreshState(newsModel, RefreshState.DropDown);
    }
    if (newsModel.offsetY < 0) {
      newsModel.offsetY = 0;
      newsModel.isPullRefreshOperation = false;
    }
  }
}

export function touchUpPullRefresh(newsModel: NewsModel) {
  if (newsModel.isCanRefresh === true) {
    newsModel.offsetY = vp2px(newsModel.pullDownRefreshHeight);
    pullRefreshState(newsModel, RefreshState.Refreshing);
    newsModel.currentPage = 1;
    setTimeout(() => {
      let self: NewsModel = newsModel;
      NewsViewModel.getNewsList(newsModel.currentPage, newsModel.pageSize, Const.GET_NEWS_LIST).then((data:
        NewsData[]) => {
        if (data.length === newsModel.pageSize) {
          self.hasMore = true;
          self.currentPage++;
        } else {
          self.hasMore = false;
        }
        self.newsData = data;
        closeRefresh(self, true);
      }).catch((err: string | Resource) => {
        promptAction.showToast({ message: err });
        closeRefresh(self, false);
      });
    }, Const.DELAY_TIME);
  } else {
    closeRefresh(newsModel, false);
  }
}

export function pullRefreshState(newsModel: NewsModel, state: number) {
  switch (state) {
    case RefreshState.DropDown:
      newsModel.pullDownRefreshText = $r('app.string.pull_down_refresh_text');
      newsModel.pullDownRefreshImage = $r('app.media.ic_pull_down_refresh');
      newsModel.isCanRefresh = false;
      newsModel.isRefreshing = false;
      newsModel.isVisiblePullDown = true;
      break;
    case RefreshState.Release:
      newsModel.pullDownRefreshText = $r('app.string.release_refresh_text');
      newsModel.pullDownRefreshImage = $r('app.media.ic_pull_up_refresh');
      newsModel.isCanRefresh = true;
      newsModel.isRefreshing = false;
      break;
    case RefreshState.Refreshing:
      newsModel.offsetY = vp2px(newsModel.pullDownRefreshHeight);
      newsModel.pullDownRefreshText = $r('app.string.refreshing_text');
      newsModel.pullDownRefreshImage = $r('app.media.ic_pull_up_load');
      newsModel.isCanRefresh = true;
      newsModel.isRefreshing = true;
      break;
    case RefreshState.Success:
      newsModel.pullDownRefreshText = $r('app.string.refresh_success_text');
      newsModel.pullDownRefreshImage = $r('app.media.ic_succeed_refresh');
      newsModel.isCanRefresh = true;
      newsModel.isRefreshing = true;
      break;
    case RefreshState.Fail:
      newsModel.pullDownRefreshText = $r('app.string.refresh_fail_text');
      newsModel.pullDownRefreshImage = $r('app.media.ic_fail_refresh');
      newsModel.isCanRefresh = true;
      newsModel.isRefreshing = true;
      break;
    default:
      break;
  }
}

export function closeRefresh(newsModel: NewsModel, isRefreshSuccess: boolean) {
  let self = newsModel;
  setTimeout(() => {
    let delay = Const.RefreshConstant_DELAY_PULL_DOWN_REFRESH;
    if (self.isCanRefresh === true) {
      pullRefreshState(newsModel, isRefreshSuccess ? RefreshState.Success : RefreshState.Fail);
      delay = Const.RefreshConstant_DELAY_SHRINK_ANIMATION_TIME;
    }
    animateTo({
      duration: Const.RefreshConstant_CLOSE_PULL_DOWN_REFRESH_TIME,
      delay: delay,
      onFinish: () => {
        pullRefreshState(newsModel, RefreshState.DropDown);
        self.isVisiblePullDown = false;
        self.isPullRefreshOperation = false;
      }
    }, () => {
      self.offsetY = 0;
    })
  }, self.isCanRefresh ? Const.DELAY_ANIMATION_DURATION : 0);
}