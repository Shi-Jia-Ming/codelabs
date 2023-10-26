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

import NewsItem from './NewsItem';
import LoadMoreLayout from './LoadMoreLayout';
import RefreshLayout from './RefreshLayout';
import { NewsData } from '../viewmodel/NewsData';
import Constants, { PageState } from '../common/constants/Constants';
import NewsViewModel from '../viewmodel/NewsViewModel';
import { showToast } from '../common/utils/ToastUtil';
import FailureLayout from './FailureLayout';
import LoadingLayout from './LoadingLayout';
import NoMoreLayout from './NoMoreLayout';
import RefreshListViewModel from '../viewmodel/RefreshListViewModel';

/**
 * The news list component.
 */
@Component
export default struct NewsList {
  index: number = 0;
  @Watch('changeCategory') @Link currentIndex: number;
  @State refreshStore: RefreshListViewModel = new RefreshListViewModel();

  changeCategory() {
    if (this.currentIndex !== this.index) {
      return;
    }
    this.refreshStore.currentPage = 1;
    NewsViewModel.getNewsList(this.refreshStore.currentPage, this.refreshStore.pageSize).then((data: NewsData[]) => {
      this.refreshStore.pageState = PageState.Success;
      if (data.length === this.refreshStore.pageSize) {
        this.refreshStore.currentPage++;
        this.refreshStore.hasMore = true;
      } else {
        this.refreshStore.hasMore = false;
      }
      this.refreshStore.newsData = data;
    }).catch((err: string | Resource) => {
      showToast(err);
      this.refreshStore.pageState = PageState.Fail;
    });
  }

  aboutToAppear() {
    // Load data.
    this.changeCategory();
  }

  reloadAction() {
    this.refreshStore.pageState = PageState.Loading;
    this.changeCategory();
  }

  build() {
    Column() {
      if (this.refreshStore.pageState === PageState.Loading) {
        LoadingLayout()
      } else if (this.refreshStore.pageState === PageState.Success) {
        this.ListLayout()
      } else {
        FailureLayout({ reloadAction: () => {
          this.reloadAction();
        } })
      }
    }
    .width(Constants.FULL_PERCENT)
    .height(Constants.FULL_PERCENT)
    .justifyContent(FlexAlign.Center)
    .onTouch((event?: TouchEvent) => {
      if (event) {
        if (this.refreshStore.pageState === PageState.Success) {
          this.refreshStore.listTouchEvent(event);
        }
      }
    })
  }

  @Builder ListLayout() {
    List({ space: Constants.LIST_SPACE }) {
      ListItem() {
        RefreshLayout({ refreshLoadingClass: this.refreshStore.refreshLayoutClass })
      }
      ForEach(this.refreshStore.newsData, (item: NewsData) => {
        ListItem() {
          NewsItem({ newsData: item })
        }
        .backgroundColor($r('app.color.white'))
        .borderRadius($r('app.float.item_border_radius'))
      }, (item: NewsData, index?: number) => JSON.stringify(item) + index)
      ListItem() {
        if (this.refreshStore.hasMore) {
          LoadMoreLayout({ loadMoreLayoutClass: this.refreshStore.loadingMoreClass })
        } else {
          NoMoreLayout()
        }
      }
    }
    .width(Constants.FULL_PERCENT)
    .height(Constants.FULL_PERCENT)
    .padding({ left: $r('app.float.common_padding'), right: $r('app.float.common_padding') })
    .backgroundColor($r('app.color.listColor'))
    .edgeEffect(EdgeEffect.None)
    .onScrollIndex((start: number, end: number) => {
      // Listen to the first index of the current list.
      this.refreshStore.startIndex = start;
      this.refreshStore.endIndex = end;
    })
  }
}