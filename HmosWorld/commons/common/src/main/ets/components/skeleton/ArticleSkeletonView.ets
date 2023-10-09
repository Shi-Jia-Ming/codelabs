/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License,Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { CommonConstants } from '../../constants/CommonConstants';

@Preview
@Component
export struct ArticleSkeletonView {
  isMine?: boolean = false;
  isFeed?: boolean = false;

  build() {
    Row() {
      Column() {
        Column({ space: CommonConstants.SM_SPACE }) {
          textArea($r('app.float.card_title_height'))
          textArea($r('app.float.card_text_height'))
        }
        .alignItems(HorizontalAlign.Start)
        .layoutWeight(1)

        if (!this.isFeed) {
          Row() {
            ActionArea()
            ActionArea()
            ActionArea()
          }
          .width(CommonConstants.FULL_PERCENT)
          .justifyContent(FlexAlign.SpaceBetween)
        } else {
          Row({ space: CommonConstants.MD_SPACE }) {
            Row()
              .width($r('app.float.lg_topic_width'))
              .topicStyle()
            Row()
              .width($r('app.float.md_topic_width'))
              .topicStyle()
          }
          .width(CommonConstants.FULL_PERCENT)
          .justifyContent(FlexAlign.Start)
        }
      }
      .layoutWeight(1)
      .height(CommonConstants.FULL_PERCENT)
      .justifyContent(FlexAlign.SpaceAround)

      Stack({ alignContent: Alignment.BottomEnd }) {
        if (this.isMine) {
          Row()
            .width($r('app.float.type_width'))
            .height($r('app.float.type_height'))
            .backgroundColor($r('app.color.skeleton_color_deep'))
            .borderRadius($r('app.float.x_small_border_radius'))
            .margin({ bottom: $r('app.float.sm_margin'), right: $r('app.float.sm_margin') })
            .zIndex(1)
        }
        Row()
          .width(CommonConstants.FULL_PERCENT)
          .height(CommonConstants.FULL_PERCENT)
          .backgroundColor($r('app.color.skeleton_color_light'))
          .borderRadius($r('app.float.small_border_radius'))
      }
      .width($r('app.float.ske_image_width'))
      .height($r('app.float.ske_image_height'))
      .padding({ left: $r('app.float.large_padding') })
    }
    .padding($r('app.float.regular_padding'))
    .borderRadius($r('app.float.large_border_radius'))
    .backgroundColor(Color.White)
    .alignItems(VerticalAlign.Top)
    .justifyContent(FlexAlign.SpaceAround)
    .width(CommonConstants.FULL_PERCENT)
    .height($r('app.float.card_height'))
  }
}

@Builder
function ActionArea() {
  Row()
    .width($r('app.float.action_area_width'))
    .height($r('app.float.action_area_height'))
    .backgroundColor($r('app.color.skeleton_color_medium'))
}

@Styles
function topicStyle() {
  .height($r('app.float.topic_height'))
  .backgroundColor($r('app.color.skeleton_color_medium'))
  .borderRadius($r('app.float.x_small_border_radius'))
}

@Builder
function textArea(height: number | Resource) {
  Row()
    .width(CommonConstants.FULL_PERCENT)
    .height(height)
    .backgroundColor($r('app.color.skeleton_color_medium'))
}