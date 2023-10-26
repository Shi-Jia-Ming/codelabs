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

import { StyleConstants } from '../common/constants/StyleConstants';
import { Comment } from '../viewmodel/Comment';
import { CommonConstants } from '../common/constants/CommonConstants';

@Component
export struct ListItemComponent {
  private item: Comment = new Comment('', '', '', $r('app.media.ic_avatar1'));

  build() {
    Row() {
      Image(this.item.icon)
        .width($r('app.float.list_image_width'))
        .height($r('app.float.list_image_height'))
        .borderRadius($r('app.float.list_border_radius'))
        .margin({
          right: $r('app.float.list_image_margin_right')
        })
      Column() {
        Row() {
          Column() {
            Text(this.item.nickname)
              .fontSize($r('app.float.nickname_font_size'))
              .fontColor($r('app.color.nickname_color'))
              .fontWeight(FontWeight.Regular)
            Text(this.item.time)
              .fontSize($r('app.float.time_font_size'))
              .fontColor($r('app.color.time_color'))
              .fontWeight(FontWeight.Regular)
              .margin({
                top: $r('app.float.time_margin_top')
              })
            Text(this.item.content)
              .fontSize($r('app.float.content_font_size'))
              .fontColor($r('app.color.content_color'))
              .fontWeight(FontWeight.Regular)
              .margin({
                top: $r('app.float.content_margin_top')
              })
          }
          .alignItems(HorizontalAlign.Start)
          .layoutWeight(1)

          Blank()
          Image($r('app.media.ic_good'))
            .width($r('app.float.good_width'))
            .height($r('app.float.good_height'))
            .margin({
              top: $r('app.float.good_margin_top')
            })
        }
        .width(StyleConstants.FULL_WIDTH)
        .alignItems(VerticalAlign.Top)

        if (this.item.commentList && this.item.commentList.length > 0) {
          Row() {
            Column() {
              Text() {
                Span(CommonConstants.NICKNAME_PREV + this.item.commentList[0].nickname +
                CommonConstants.NICKNAME_SUFFIX)
                  .fontSize($r('app.float.span_font_size'))
                  .fontColor($r('app.color.span_color'))
                  .fontWeight(FontWeight.Regular)
                Span(this.item.commentList[0].content)
                  .fontSize($r('app.float.span_font_size'))
                  .fontColor($r('app.color.span_color'))
                  .fontWeight(FontWeight.Regular)
              }
            }
            .backgroundColor($r('app.color.review_color'))
            .padding($r('app.float.review_padding'))
          }
          .margin({
            top: $r('app.float.review_margin_top')
          })
          .width(StyleConstants.FULL_WIDTH)
          .justifyContent(FlexAlign.Start)
        }
      }
      .layoutWeight(1)
    }
    .width(StyleConstants.FULL_WIDTH)
    .alignItems(VerticalAlign.Top)
    .padding({
      top: $r('app.float.list_padding_top')
    })
  }
}