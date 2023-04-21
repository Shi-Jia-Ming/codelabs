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

import NewsItem from './NewsItem';
import LoadMoreLayout from './LoadMoreLayout';
import RefreshLayout from './RefreshLayout';
import CustomRefreshLoadLayout from './CustomRefreshLoadLayout';
import { getTabData } from '../common/utils/DataUtils';
import { CustomRefreshLoadLayoutClass } from '../common/bean/NewsData';
import { listTouchEvent } from '../common/utils/PullDownRefresh';
import {
  CUSTOM_LAYOUT_HEIGHT,
  NewsListConstant,
  FULL_WIDTH,
  FULL_HEIGHT,
  PageState
} from '../common/constant/CommonConstant';

/**
 * The news list component.
 */
@Component
export default struct NewsList {
  @Watch('changeCategory') @Link currentIndex: number;
  @State newsData: Array<any> = [];
  @State currentPage: number = 1;
  @State pageSize: number = 10;
  @State pullDownRefreshText: Resource = $r('app.string.pull_down_refresh_text');
  @State pullDownRefreshImage: Resource = $r('app.media.ic_pull_down_refresh');
  @State pullDownRefreshHeight: number = CUSTOM_LAYOUT_HEIGHT;
  @State isVisiblePullDown: boolean = false;
  @State pullUpLoadText: Resource = $r('app.string.pull_up_load_text');
  @State pullUpLoadImage: Resource = $r('app.media.ic_pull_up_load');
  @State pullUpLoadHeight: number = CUSTOM_LAYOUT_HEIGHT;
  @State isVisiblePullUpLoad: boolean = false;
  private startIndex = 0;
  private endIndex = 0;
  @State offsetY: number = 0;
  private downY = 0;
  private lastMoveY = 0;
  private isRefreshing: boolean = false;
  private isCanRefresh = false;
  private isPullRefreshOperation = false;
  private isLoading: boolean = false;
  private isCanLoadMore = false;
  @State pageState: number = PageState.Loading;

  changeCategory() {
    getTabData(this.currentPage - 1, this.pageSize, this.currentIndex, {
      onSuccess: (value) => {
        this.pageState = PageState.Success;
        this.newsData = value.newsPageData;
      },
      onFail: () => this.pageState = PageState.Fail
    })
  }

  aboutToAppear() {
    // Request news data.
    this.changeCategory();
  }

  build() {
    Column() {
      if (this.pageState === PageState.Loading) {
        this.LoadingLayout()
      } else if (this.pageState === PageState.Success) {
        this.ListLayout()
      } else {
        this.FailLayout()
      }
    }
    .width(FULL_WIDTH)
    .height(FULL_HEIGHT)
    .justifyContent(FlexAlign.Center)
    .onTouch((event) => {
      if (this.pageState === PageState.Success) {
        listTouchEvent.call(this, event);
      }
    })
  }

  @Builder LoadingLayout() {
    CustomRefreshLoadLayout({ customRefreshLoadClass: new CustomRefreshLoadLayoutClass(true,
      $r('app.media.ic_pull_up_load'), $r('app.string.pull_up_load_text'), this.pullDownRefreshHeight) })
  }

  @Builder ListLayout() {
    List() {
      ListItem() {
        RefreshLayout({
          refreshLayoutClass: new CustomRefreshLoadLayoutClass(this.isVisiblePullDown, this.pullDownRefreshImage,
            this.pullDownRefreshText, this.pullDownRefreshHeight)
        })
      }

      ForEach(this.newsData, item => {
        ListItem() {
          NewsItem({ newsData: item })
        }
        .height(NewsListConstant.ITEM_HEIGHT)
        .backgroundColor($r('app.color.white'))
        .margin({ top: NewsListConstant.ITEM_MARGIN_TOP})
        .borderRadius(NewsListConstant.ITEM_BORDER_RADIUS)
      }, (item, index) => JSON.stringify(item) + index.toString())
      ListItem() {
        LoadMoreLayout({
          loadMoreLayoutClass: new CustomRefreshLoadLayoutClass(this.isVisiblePullUpLoad, this.pullUpLoadImage,
            this.pullUpLoadText, this.pullUpLoadHeight)
        })
      }
    }
    .width(NewsListConstant.LIST_WIDTH)
    .height(FULL_HEIGHT)
    .margin({ left: NewsListConstant.LIST_MARGIN_LEFT, right: NewsListConstant.LIST_MARGIN_RIGHT })
    .backgroundColor($r('app.color.listColor'))
    .divider({
      color: $r('app.color.dividerColor'),
      strokeWidth: NewsListConstant.LIST_DIVIDER_STROKE_WIDTH,
      endMargin: NewsListConstant.LIST_MARGIN_RIGHT
    })
    // Remove the rebound effect.
    .edgeEffect(EdgeEffect.None)
    .offset({ x: 0, y: `${this.offsetY}px` })
    .onScrollIndex((start, end) => {
      // Listen to the first index of the current list.
      this.startIndex = start;
      this.endIndex = end;
    })
  }

  @Builder FailLayout() {
    Image($r('app.media.none'))
      .height(NewsListConstant.NONE_IMAGE_SIZE)
      .width(NewsListConstant.NONE_IMAGE_SIZE)
    Text($r('app.string.page_none_msg'))
      .opacity(NewsListConstant.NONE_TEXT_opacity)
      .fontSize(NewsListConstant.NONE_TEXT_size)
      .fontColor($r('app.color.fontColor_text3'))
      .margin({ top: NewsListConstant.NONE_TEXT_margin })
  }
}

