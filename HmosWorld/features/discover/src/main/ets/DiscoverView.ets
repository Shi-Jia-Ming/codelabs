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

import router from '@ohos.router';
import common from '@ohos.app.ability.common';
import promptAction from '@ohos.promptAction';
import {
  CommonConstants,
  FailureLayout,
  LearningResource,
  LoadingMoreLayout,
  LoadingStatus,
  NoMoreLayout,
  ObservedArray,
  ResourcesType
} from '@ohos/common';
import { UserModel } from '@ohos/mine';
import { TopicModel } from '@ohos/topic';
import { ArticleCardView } from './components/article/ArticleCardView';
import { FeedCardView } from './components/feed/FeedCardView';
import { DiscoverSkeletonView } from './components/skeleton/DiscoverSkeletonView';
import { DiscoverModel } from './model/DiscoverModel';
import LazyDataSource from './model/LazyData';
import hilog from '@ohos.hilog';

const context = (getContext(this) as common.UIAbilityContext);
const bundleName = context.applicationInfo.name;
const FEEDS_VISIBLE_LENGTH = 6;
const FEED_CARD_WIDTH = '43%';
const LOAD_MORE_MIN_DRAG_DISTANCE = 60;

@Component
export struct DiscoverView {
  @State userModel: UserModel = UserModel.getInstance();
  @State discoverModel: DiscoverModel = DiscoverModel.getInstance();
  topicModel: TopicModel = TopicModel.getInstance();
  @State techArticleList: ObservedArray<LearningResource> = this.discoverModel.techArticleList;
  @State articlesDataSource: LazyDataSource = new LazyDataSource();
  @State hotFeedList: ObservedArray<LearningResource> = this.discoverModel.hotFeedList;
  @State collectedIds: ObservedArray<string> = this.userModel.collectedIds;
  @State likedIds: ObservedArray<string> = this.userModel.likedIds;
  @State isListReachEnd: boolean = false;
  @StorageLink('getHomeResource') @Watch('topicChange') getResource: boolean = false;
  private swiperController: SwiperController = new SwiperController();

  aboutToAppear() {
    this.userModel.getUserData();
    this.topicChange();

    if (!this.getResource) {
      this.initLazyData();
    }
  }

  initLazyData() {
    let length = this.articlesDataSource.totalCount();
    for (let i = length - 1; i >= 0; i--) {
      this.articlesDataSource.deleteData(i);
    }

    for (let i = 0; i < this.techArticleList.length; i++) {
      this.articlesDataSource.pushData(this.techArticleList[i])
    }
  }

  isCollected(resourceId: string): boolean {
    return this.collectedIds.some((id: string) => id === resourceId);
  }

  isLiked(resourceId: string): boolean {
    return this.likedIds.some((id: string) => id === resourceId);
  }

  topicChange() {
    if (!this.getResource) {
      return;
    }

    this.getResource = false;
    this.discoverModel.loadingStatus = LoadingStatus.LOADING;
    if (AppStorage.get<boolean>('shouldUpdate')) {
      AppStorage.delete('shouldUpdate');
      this.topicModel.editTopicsFollowed().then(() => {
        this.topicModel.updateLocalTopic();
        this.discoverModel.getHomeResources().then(() => {
          this.initLazyData();
        });
      }).catch(() => {
        this.discoverModel.loadingStatus = LoadingStatus.SUCCESS;
        promptAction.showToast({
          message: $r('app.string.failed_message')
        });
      });
    } else {
      this.discoverModel.getHomeResources().then(() => {
        this.initLazyData();
      });
    }
  }

  build() {
    Column() {
      Header()
      if (this.discoverModel.loadingStatus === LoadingStatus.LOADING) {
        DiscoverSkeletonView()
      }
      if (this.discoverModel.loadingStatus === LoadingStatus.FAILED) {
        FailureLayout({
          handleReload: () => this.discoverModel.getHomeResources().then(() => {
            this.initLazyData();
          })
        })
      }
      if (this.discoverModel.loadingStatus === LoadingStatus.SUCCESS) {
        List({ space: CommonConstants.SPACE_16 }) {
          ListItem() {
            Swiper(this.swiperController) {
              ForEach(this.discoverModel.swiperData, (item: LearningResource) => {
                Image(item.bannerSrc)
                  .width(CommonConstants.FULL_PERCENT)
                  .height(CommonConstants.FULL_PERCENT)
                  .borderRadius($r('app.float.lg_border_radius'))
                  .onClick(() => router.pushUrl({
                    url: `@bundle:${bundleName}${item.type === ResourcesType.FEED ?
                    CommonConstants.DISCOVER_FEED_DETAIL_PAGE :
                    CommonConstants.DISCOVER_ARTICLE_DETAIL_PAGE}`,
                    params: { resourceId: item.id }
                  }))
              }, (item: LearningResource) => item.id)
            }
            .height($r('app.float.swiper_height'))
            .width(CommonConstants.FULL_PERCENT)
            .itemSpace(CommonConstants.SPACE_12)
            .indicator(Indicator.dot()
              .color($r('app.color.swiper_indicator_color'))
              .selectedColor($r('app.color.theme_blue_color')))
            .autoPlay(true)
            .loop(true)
          }

          ListItem() {
            Column({ space: CommonConstants.SPACE_12 }) {
              Row() {
                Text($r('app.string.hot_feeds'))
                  .padding({
                    left: $r('app.float.md_padding_margin'),
                  })
                  .fontSize($r('app.float.lg_font_size'))
                  .fontWeight(FontWeight.Medium)
                  .fontFamily(CommonConstants.HARMONY_HEITI_MEDIUM_FONT_FAMILY)
                Row() {
                  Text($r('app.string.more'))
                    .fontSize($r('app.float.md_font_size'))
                    .padding({ right: $r('app.float.xs_padding_margin') })
                    .opacity(CommonConstants.SECOND_LEVEL_OPACITY)

                  Image($r('app.media.ic_public_arrow_right'))
                    .objectFit(ImageFit.Contain)
                    .opacity(CommonConstants.THIRD_LEVEL_OPACITY)
                    .size({
                      width: $r('app.float.more_arrow_icon_width'),
                      height: $r('app.float.more_arrow_icon_height')
                    })
                }
                .onClick(() => router.pushUrl({
                  url: `@bundle:${bundleName}/discover/ets/pages/FeedPage`
                }))
              }
              .alignItems(VerticalAlign.Center)
              .width(CommonConstants.FULL_PERCENT)
              .justifyContent(FlexAlign.SpaceBetween)

              List({ space: CommonConstants.SPACE_12 }) {
                ForEach(this.hotFeedList.slice(0, FEEDS_VISIBLE_LENGTH), (item: LearningResource) => {
                  ListItem() {
                    FeedCardView({ feedItem: item })
                      .onClick(() => router.pushUrl({
                        url: `@bundle:${bundleName}${CommonConstants.DISCOVER_FEED_DETAIL_PAGE}`,
                        params: { resourceId: item.id }
                      }))
                  }.width(FEED_CARD_WIDTH)
                }, (item: LearningResource) => item.id)
              }
              .scrollBar(BarState.Off)
              .listDirection(Axis.Horizontal)

              Text($r('app.string.technical_articles'))
                .fontSize($r('app.float.lg_font_size'))
                .width(CommonConstants.FULL_PERCENT)
                .fontFamily(CommonConstants.HARMONY_HEITI_MEDIUM_FONT_FAMILY)
                .fontWeight(FontWeight.Medium)
                .padding({ left: $r('app.float.md_padding_margin') })
                .margin({
                  top: $r('app.float.xs_border_radius')
                })

              List({ space: CommonConstants.SPACE_12 }) {
                LazyForEach(this.articlesDataSource, (item: LearningResource) => {
                  ListItem() {
                    ArticleCardView({
                      articleItem: item,
                      isLiked: this.isLiked(item.id),
                      isCollected: this.isCollected(item.id),
                      onCollected: () => {
                        context.eventHub.emit(CommonConstants.COLLECTED_EVENT, {
                          resourceId: item.id,
                          resourceType: item.type,
                          actionValue: !this.isCollected(item.id)
                        });
                      },
                      onLiked: () => {
                        context.eventHub.emit(CommonConstants.LIKED_EVENT, {
                          resourceId: item.id,
                          resourceType: item.type,
                          actionValue: !this.isLiked(item.id)
                        });
                      }
                    })
                      .reuseId(item.type.toString())
                      .onClick(() => router.pushUrl({
                        url: `@bundle:${bundleName}${CommonConstants.DISCOVER_ARTICLE_DETAIL_PAGE}`,
                        params: { resourceId: item.id }
                      }))
                  }
                }, (item: LearningResource) => item.id)
              }
            }
          }

          if (this.discoverModel.loadingArticleStatus === LoadingStatus.LOADING) {
            ListItem() {
              LoadingMoreLayout()
            }
          }

          if (!this.discoverModel.hasNextArticle) {
            ListItem() {
              NoMoreLayout()
            }
          }
        }
        .scrollBar(BarState.Off)
        .onReachEnd(() => {
          this.isListReachEnd = true;
        })
        .layoutWeight(1)
        .parallelGesture(
          PanGesture({ direction: PanDirection.Up, distance: LOAD_MORE_MIN_DRAG_DISTANCE })
            .onActionStart(() => {
              if (this.isListReachEnd && this.discoverModel.hasNextArticle) {
                this.discoverModel.loadMoreArticle().then((data) => {
                  for (let i = 0; i < data.length; i++) {
                    this.articlesDataSource.pushData(data[i]);
                  }
                });
                this.isListReachEnd = false;
              }
            })
        )
      }
    }
    .padding({
      top: AppStorage.get<number>('statusBarHeight'),
      left: $r('app.float.md_padding_margin'),
      right: $r('app.float.md_padding_margin')
    })
    .height(CommonConstants.FULL_PERCENT)
    .width(CommonConstants.FULL_PERCENT)
  }
}

@Builder
function Header() {
  Row() {
    Text($r('app.string.discover'))
      .fontSize($r('app.float.header_font_size'))
      .fontWeight(FontWeight.Bold)
      .textAlign(TextAlign.Start)
      .width(CommonConstants.FULL_PERCENT)
      .fontFamily(CommonConstants.HARMONY_HEITI_BOLD_FONT_FAMILY)
      .padding({ left: $r('app.float.md_padding_margin') })
  }
  .height($r('app.float.top_navigation_height'))
}