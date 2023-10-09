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

import {
  CommonConstants,
  LearningResource,
  LoadingMoreLayout,
  LoadingStatus,
  NoMoreLayout,
  ObservedArray
} from '@ohos/common';
import { FeedCardView } from '../components/feed/FeedCardView';
import { FeedDetailView } from '../components/FeedDetailView';
import { TopNavigationView } from '../components/TopNavigationView';
import { DiscoverModel } from '../model/DiscoverModel';

const LOAD_MORE_MIN_DRAG_DISTANCE = 60;

@Entry
@Component
export struct FeedPage {
  @Provide('feedPathStack') pathStack: NavPathStack = new NavPathStack();
  @State webViewController?: WebviewController = undefined;

  @Builder
  myRouter(name: string, param: LearningResource) {
    NavDestination() {
      FeedDetailView({
        resourceId: param.id,
        webViewController: $webViewController,
        onBackClick: () => {
          this.onDestinationBack();
        }
      })
    }
    .hideTitleBar(true)
    .onBackPressed(() => this.onDestinationBack())
  }

  onDestinationBack() {
    if (this.webViewController?.accessBackward()) {
      this.webViewController.backward();
    } else {
      this.pathStack.pop();
    }
    return true;
  }

  build() {
    Navigation(this.pathStack) {
      Column() {
        TopNavigationView({
          title: $r('app.string.hot_feeds')
        })
        HotFeeds()
      }
      .padding({
        top: AppStorage.get<number>('statusBarHeight'),
      })
      .justifyContent(FlexAlign.Center)
      .constraintSize({ minHeight: CommonConstants.FULL_PERCENT })
      .backgroundColor($r('app.color.page_background_color'))
      .width(CommonConstants.FULL_PERCENT)
    }
    .navDestination(this.myRouter)
    .mode(NavigationMode.Stack)
    .hideTitleBar(true)
  }
}

@Component
struct HotFeeds {
  @State discoverModel: DiscoverModel = DiscoverModel.getInstance();
  @State hotFeedList: ObservedArray<LearningResource> = this.discoverModel.hotFeedList;
  @State isListReachEnd: boolean = false;

  build() {
    List() {
      ListItem() {
        Column() {
          List({ space: CommonConstants.SPACE_12 }) {
            ForEach(this.hotFeedList, (item: LearningResource, index?: number) => {
              ListItem() {
                NavRouter({ name: '', param: item }) {
                  FeedCardView({ feedItem: item })
                }
              }
              .padding({
                left: index && index % 2 !== 0 ? $r('app.float.feed_card_padding') : 0,
                right: index && index % 2 === 0 ? $r('app.float.feed_card_padding') : 0
              })
            }, (item: LearningResource) => item.id)
          }
          .lanes(2)
          .alignListItem(ListItemAlign.Start)
          .scrollBar(BarState.Off)
        }
      }

      if (this.discoverModel.loadingFeedStatus === LoadingStatus.LOADING) {
        ListItem() {
          LoadingMoreLayout()
        }
      }

      if (!this.discoverModel.hasNextFeed) {
        ListItem() {
          NoMoreLayout()
        }
      }
    }
    .onReachEnd(() => {
      this.isListReachEnd = true;
    })
    .parallelGesture(
      PanGesture({ direction: PanDirection.Up, distance: LOAD_MORE_MIN_DRAG_DISTANCE })
        .onActionStart(() => {
          if (this.isListReachEnd) {
            this.discoverModel.loadMoreFeed();
            this.isListReachEnd = false;
          }
        })
    )
    .padding({
      left: $r('app.float.md_padding_margin'),
      right: $r('app.float.md_padding_margin')
    })
    .width(CommonConstants.FULL_PERCENT)
    .scrollBar(BarState.Off)
    .layoutWeight(1)
  }
}