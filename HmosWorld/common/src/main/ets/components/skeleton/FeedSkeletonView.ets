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

@Component
export struct FeedSkeletonView {
  build() {
    Column() {
      Stack({ alignContent: Alignment.BottomEnd }) {
        Row()
          .borderRadius({
            topLeft: $r('app.float.large_border_radius'),
            topRight: $r('app.float.large_border_radius')
          })
          .height(CommonConstants.FULL_PERCENT)
          .width(CommonConstants.FULL_PERCENT)
        Row()
          .width($r('app.float.view_area_width'))
          .height($r('app.float.view_area_height'))
          .backgroundColor($r('app.color.skeleton_color_deep'))
          .borderRadius($r('app.float.regular_border_radius'))
          .margin({
            right: $r('app.float.view_area_border_radius'),
            bottom: $r('app.float.view_area_border_radius') })
      }
      .borderRadius($r('app.float.large_border_radius'))
      .backgroundColor($r('app.color.skeleton_color_light'))
      .height($r('app.float.feed_image_height'))
      .width(CommonConstants.FULL_PERCENT)

      Column({ space: CommonConstants.MD_SPACE }) {
        BriefArea()
        BriefArea()

        Row({ space: CommonConstants.SM_SPACE }) {
          Row()
            .width($r('app.float.lg_topic_width'))
            .topicStyle()
          Row()
            .width($r('app.float.md_topic_width'))
            .topicStyle()
        }
        .justifyContent(FlexAlign.Start)
        .width($r('app.float.topic_width'))
      }
      .width(CommonConstants.FULL_PERCENT)
      .padding({
        top: $r('app.float.medium_margin'),
        bottom: $r('app.float.small_margin'),
        left: $r('app.float.large_margin'),
        right: $r('app.float.large_margin')
      })
    }
    .width($r('app.float.feed_width'))
    .height($r('app.float.feed_height'))
    .backgroundColor(Color.White)
    .borderRadius($r('app.float.large_border_radius'))
  }
}

@Builder
function BriefArea() {
  Row()
    .width($r('app.float.brief_area_width'))
    .height($r('app.float.brief_area_height'))
    .backgroundColor($r('app.color.skeleton_color_medium'))
}

@Styles
function topicStyle() {
  .height($r('app.float.topic_height'))
  .backgroundColor($r('app.color.skeleton_color_medium'))
  .borderRadius($r('app.float.x_small_border_radius'))
}