/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { CommonConstant as Const, PageState } from '../common/constant/CommonConstant';
import { NewsData } from './NewsViewModel';

export default class NewsModel {
  newsData: Array<NewsData> = [];
  currentPage: number = 1;
  pageSize: number = Const.PAGE_SIZE;
  pullDownRefreshText: Resource = $r('app.string.pull_down_refresh_text');
  pullDownRefreshImage: Resource = $r('app.media.ic_pull_down_refresh');
  pullDownRefreshHeight: number = Const.CUSTOM_LAYOUT_HEIGHT;
  isVisiblePullDown: boolean = false;
  pullUpLoadText: Resource = $r('app.string.pull_up_load_text');
  pullUpLoadImage: Resource = $r('app.media.ic_pull_up_load');
  pullUpLoadHeight: number = Const.CUSTOM_LAYOUT_HEIGHT;
  isVisiblePullUpLoad: boolean = false;
  offsetY: number = 0;
  pageState: number = PageState.Loading;
  hasMore: boolean = true;
  startIndex = 0;
  endIndex = 0;
  downY = 0;
  lastMoveY = 0;
  isRefreshing: boolean = false;
  isCanRefresh = false;
  isPullRefreshOperation = false;
  isLoading: boolean = false;
  isCanLoadMore: boolean = false;
}