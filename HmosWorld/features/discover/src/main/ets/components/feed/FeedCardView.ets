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

import { CommonConstants, CommonUtil, LearningResource } from '@ohos/common';

const IMAGE_HEIGHT = '55%';
const TITLE_HEIGHT = '28%';
const TOPICS_HEIGHT = '16%';
const MAX_TOPIC_NUM = 2;

@Component
export struct FeedCardView {
  @Prop feedItem: LearningResource = new LearningResource();

  build() {
    Column() {
      Stack({ alignContent: Alignment.BottomEnd }) {
        Image(this.feedItem.headerImageUrl)
          .alt($r('app.media.img_placeholder'))
          .borderRadius({
            topLeft: $r('app.float.lg_border_radius'),
            topRight: $r('app.float.lg_border_radius')
          })
          .objectFit(ImageFit.Cover)
          .height(CommonConstants.FULL_PERCENT)
          .width(CommonConstants.FULL_PERCENT)
        ViewsCountLabel({ viewsCount: this.feedItem.viewsCount })
      }
      .height(IMAGE_HEIGHT)
      .width(CommonConstants.FULL_PERCENT)

      Text(this.feedItem.title)
        .width(CommonConstants.FULL_PERCENT)
        .fontSize($r('app.float.md_font_size'))
        .textAlign(TextAlign.Start)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(CommonConstants.MAX_LINE_TWO)
        .height(TITLE_HEIGHT)
        .padding({
          top: $r('app.float.sm_padding_margin'),
          bottom: $r('app.float.xs_padding_margin'),
          left: $r('app.float.md_padding_margin'),
          right: $r('app.float.md_padding_margin')
        })

      Row() {
        if (this.feedItem.topics.length > 0) {
          ForEach(this.feedItem.topics.slice(0, MAX_TOPIC_NUM), (topic: string) => {
            LabelCard({ text: topic })
              .margin({ right: $r('app.float.xs_padding_margin') })
          })
        }
      }
      .width(CommonConstants.FULL_PERCENT)
      .height(TOPICS_HEIGHT)
      .borderRadius({
        bottomLeft: $r('app.float.lg_border_radius'),
        bottomRight: $r('app.float.lg_border_radius')
      })
      .padding({
        left: $r('app.float.md_padding_margin'),
        right: $r('app.float.md_padding_margin'),
        bottom: $r('app.float.md_padding_margin')
      })
    }
    .backgroundColor(Color.White)
    .borderRadius($r('app.float.lg_border_radius'))
    .height($r('app.float.feed_card_height'))
  }
}

@Component
struct LabelCard {
  @Prop text: string = '';

  build() {
    Text(this.text)
      .fontSize($r('app.float.xs_font_size'))
      .fontColor($r('app.color.theme_blue_color'))
      .textAlign(TextAlign.Center)
      .fontWeight(FontWeight.Medium)
      .fontFamily(CommonConstants.HARMONY_HEITI_MEDIUM_FONT_FAMILY)
      .backgroundColor($r('app.color.theme_blue_background_color'))
      .borderRadius($r('app.float.xs_border_radius'))
      .padding({
        left: $r('app.float.sm_padding_margin'),
        right: $r('app.float.sm_padding_margin'),
        top: $r('app.float.feed_label_padding'),
        bottom: $r('app.float.feed_label_padding')
      })
  }
}

@Component
struct ViewsCountLabel {
  @Prop viewsCount: number = 0;

  build() {
    Row() {
      Image($r('app.media.ic_eye_open'))
        .size({ width: $r('app.float.icon_size'), height: $r('app.float.icon_size') })
        .fillColor(Color.White)
        .margin({ right: $r('app.float.xs_padding_margin') })

      Text(CommonUtil.transNumberOverOneThousand(this.viewsCount))
        .fontSize($r('app.float.sm_font_size'))
        .textAlign(TextAlign.Center)
        .fontColor(Color.White)
        .opacity(CommonConstants.FIRST_LEVEL_OPACITY)
    }
    .padding($r('app.float.xs_padding_margin'))
    .backgroundColor($r('app.color.view_counts_bg_color'))
    .borderRadius($r('app.float.md_border_radius'))
    .margin({ right: $r('app.float.sm_padding_margin'), bottom: $r('app.float.sm_padding_margin') })
  }
}