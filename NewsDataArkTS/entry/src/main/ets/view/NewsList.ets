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
import {
  CommonConstant as Const,
  PageState
} from '../common/constant/CommonConstant';
import NewsItem from './NewsItem';
import LoadMoreLayout from './LoadMoreLayout';
import RefreshLayout from './RefreshLayout';
import CustomRefreshLoadLayout from './CustomRefreshLoadLayout';
import { CustomRefreshLoadLayoutClass, NewsData } from '../common/bean/NewsData';
import { listTouchEvent } from '../common/utils/PullDownRefresh';
import NewsViewModel from '../viewmodel/NewsViewModel';
import NoMoreLayout from './NoMoreLayout';

/**
 * The news list component.
 */
@Component
export default struct NewsList {
  @Watch('changeCategory') @Link currentIndex: number;
  @State newsData: Array<NewsData> = [];
  @State currentPage: number = 1;
  @State pageSize: number = Const.PAGE_SIZE;
  @State pullDownRefreshText: Resource = $r('app.string.pull_down_refresh_text');
  @State pullDownRefreshImage: Resource = $r('app.media.ic_pull_down_refresh');
  @State pullDownRefreshHeight: number = Const.CUSTOM_LAYOUT_HEIGHT;
  @State isVisiblePullDown: boolean = false;
  @State pullUpLoadText: Resource = $r('app.string.pull_up_load_text');
  @State pullUpLoadImage: Resource = $r('app.media.ic_pull_up_load');
  @State pullUpLoadHeight: number = Const.CUSTOM_LAYOUT_HEIGHT;
  @State isVisiblePullUpLoad: boolean = false;
  @State offsetY: number = 0;
  @State pageState: number = PageState.Loading;
  @State hasMore: boolean = true;
  private startIndex = 0;
  private endIndex = 0;
  private downY = 0;
  private lastMoveY = 0;
  private isRefreshing: boolean = false;
  private isCanRefresh = false;
  private isPullRefreshOperation = false;
  private isLoading: boolean = false;
  private isCanLoadMore: boolean = false;

  changeCategory() {
    this.currentPage = 1;
    NewsViewModel.getNewsList(this.currentPage, this.pageSize, Const.GET_NEWS_LIST).then((data: NewsData[]) => {
      this.pageState = PageState.Success;
      if (data.length === this.pageSize) {
        this.currentPage++;
        this.hasMore = true;
      } else {
        this.hasMore = false;
      }
      this.newsData = data;
    }).catch((err: string | Resource) => {
      promptAction.showToast({
        message: err,
        duration: Const.ANIMATION_DURATION
      });
      this.pageState = PageState.Fail;
    });
  }

  aboutToAppear() {
    // Request news data.
    this.changeCategory();
  }

  build() {
    Column() {
      if (this.pageState === PageState.Success) {
        this.ListLayout()
      } else if (this.pageState === PageState.Loading) {
        this.LoadingLayout()
      } else {
        this.FailLayout()
      }
    }
    .width(Const.FULL_WIDTH)
    .height(Const.FULL_HEIGHT)
    .justifyContent(FlexAlign.Center)
    .onTouch((event: TouchEvent | undefined) => {
      if (event) {
        if (this.pageState === PageState.Success) {
          listTouchEvent(this, event);
        }
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

      ForEach(this.newsData, (item: NewsData) => {
        ListItem() {
          NewsItem({ newsData: item })
        }
        .height(Const.NewsListConstant_ITEM_HEIGHT)
        .backgroundColor($r('app.color.white'))
        .margin({ top: Const.NewsListConstant_ITEM_MARGIN_TOP})
        .borderRadius(Const.NewsListConstant_ITEM_BORDER_RADIUS)
      }, (item: NewsData, index?: number) => JSON.stringify(item) + index)

      ListItem() {
        if (this.hasMore) {
          LoadMoreLayout({
            loadMoreLayoutClass: new CustomRefreshLoadLayoutClass(this.isVisiblePullUpLoad, this.pullUpLoadImage,
              this.pullUpLoadText, this.pullUpLoadHeight)
          })
        } else {
          NoMoreLayout()
        }
      }
    }
    .width(Const.NewsListConstant_LIST_WIDTH)
    .height(Const.FULL_HEIGHT)
    .margin({ left: Const.NewsListConstant_LIST_MARGIN_LEFT, right: Const.NewsListConstant_LIST_MARGIN_RIGHT })
    .backgroundColor($r('app.color.listColor'))
    .divider({
      color: $r('app.color.dividerColor'),
      strokeWidth: Const.NewsListConstant_LIST_DIVIDER_STROKE_WIDTH,
      endMargin: Const.NewsListConstant_LIST_MARGIN_RIGHT
    })
    // Remove the rebound effect.
    .edgeEffect(EdgeEffect.None)
    .offset({ x: 0, y: `${this.offsetY}px` })
    .onScrollIndex((start: number, end: number) => {
      // Listen to the first index of the current list.
      this.startIndex = start;
      this.endIndex = end;
    })
  }

  @Builder FailLayout() {
    Image($r('app.media.none'))
      .height(Const.NewsListConstant_NONE_IMAGE_SIZE)
      .width(Const.NewsListConstant_NONE_IMAGE_SIZE)
    Text($r('app.string.page_none_msg'))
      .opacity(Const.NewsListConstant_NONE_TEXT_opacity)
      .fontSize(Const.NewsListConstant_NONE_TEXT_size)
      .fontColor($r('app.color.fontColor_text3'))
      .margin({ top: Const.NewsListConstant_NONE_TEXT_margin })
  }
}