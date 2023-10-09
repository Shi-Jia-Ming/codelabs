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

import { ArticleSkeletonView, CommonConstants, FeedSkeletonView } from '@ohos/common';

const MORE_DEFAULT_WIDTH = '8%';
const TITLE_DEFAULT_WIDTH = '43%';
const FEED_VISIBLE_LENGTH = 3;
const ARTICLE_VISIBLE_LENGTH = 3;

@Component
export struct DiscoverSkeletonView {
  hotFeeds: Array<Number> = new Array(FEED_VISIBLE_LENGTH).fill(0);
  articles: Array<Number> = new Array(ARTICLE_VISIBLE_LENGTH).fill(0);
  @State columnOpacity: number = 1;

  startAnimation(): void {
    animateTo(CommonConstants.SKELETON_ANIMATION, () => {
      this.columnOpacity = 0.5;
    });
  }

  build() {
    Column() {
      List({ space: CommonConstants.SPACE_16 }) {
        ListItem() {
          Row()
            .borderRadius($r('app.float.lg_border_radius'))
            .backgroundColor($r('app.color.skeleton_color'))
            .height($r('app.float.swiper_height'))
            .width(CommonConstants.FULL_PERCENT)
        }

        ListItem() {
          Column() {
            Row() {
              Row()
                .width(TITLE_DEFAULT_WIDTH)
                .height($r('app.float.header_font_size'))
                .backgroundColor($r('app.color.skeleton_color'))
                .padding({
                  left: $r('app.float.md_padding_margin'),
                })
              Row()
                .width(MORE_DEFAULT_WIDTH)
                .height($r('app.float.header_font_size'))
                .backgroundColor($r('app.color.skeleton_color'))
            }
            .width(CommonConstants.FULL_PERCENT)
            .alignItems(VerticalAlign.Center)
            .justifyContent(FlexAlign.SpaceBetween)
            .margin({
              bottom: $r('app.float.sm_padding_margin')
            })

            List({ space: CommonConstants.SPACE_12 }) {
              ForEach(this.hotFeeds, () => {
                ListItem() {
                  FeedSkeletonView()
                }
                .width(TITLE_DEFAULT_WIDTH)
              })
            }
            .scrollBar(BarState.Off)
            .listDirection(Axis.Horizontal)

            Row()
              .backgroundColor($r('app.color.skeleton_color'))
              .width(TITLE_DEFAULT_WIDTH)
              .height($r('app.float.header_font_size'))
              .margin({
                top: $r('app.float.lg_padding_margin'),
                bottom: $r('app.float.sm_padding_margin')
              })

            Column({ space: CommonConstants.SPACE_12 }) {
              ForEach(this.articles, () => {
                ArticleSkeletonView()
              })
            }
          }
          .alignItems(HorizontalAlign.Start)
        }
      }
      .scrollBar(BarState.Off)
    }
    .height(CommonConstants.FULL_PERCENT)
    .opacity(this.columnOpacity)
    .onAppear(() => {
      this.startAnimation();
    })
  }
}