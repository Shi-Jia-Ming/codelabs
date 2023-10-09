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

import { BreakpointConstants, CommonConstants } from '@ohos/commons';
import { BreakpointType } from '@ohos/commons';
import { DetailConstants } from '../constants/DetailConstants';
import { UserInfo, UserViewModel } from '../viewmodel/UserViewModel';

@Component
export struct AllComments {
  @StorageLink('currentBreakpoint') currentBreakpoint: string = BreakpointConstants.BREAKPOINT_LG;
  @Link commentImgHeight: string;
  @Link commentImgWidth: string;
  private commentsList: UserInfo[] = new UserViewModel().getRelatedVideoList();

  build() {
    Column() {
      Row() {
        this.TitleText(DetailConstants.SUB_TITLES[0])
      }
      .padding({
        left: $r('app.float.all_comments_title_row_padding'),
        right: $r('app.float.all_comments_title_row_padding')
      })
      .height($r('app.float.all_comments_title_row_height'))
      .width(CommonConstants.FULL_PERCENT)

      Column() {
        ForEach(this.commentsList, (item: UserInfo, index: number) => {
          Row() {
            Image(item.getImageSrc())
              .height($r('app.float.all_comments_profile_size'))
              .width($r('app.float.all_comments_profile_size'))
              .margin({ right: $r('app.float.all_comments_profile_margin') })

            this.TitleText(item.getName())
          }
          .height($r('app.float.all_comments_title_row_height'))
          .width(CommonConstants.FULL_PERCENT)
          .margin({ top: $r('app.float.all_comments_title_margin') })
          .alignItems(VerticalAlign.Center)

          Row() {
            Text(item.getComment())
              .margin({ left: $r('app.float.all_comments_comment_left') })
              .opacity(CommonConstants.TEXT_OPACITY[2])
              .fontSize( $r('app.float.all_comments_comment_font'))
              .lineHeight( $r('app.float.all_comments_comment_text_line'))
              .fontWeight(CommonConstants.FONT_WEIGHT_500)
          }
          .margin({ top:  $r('app.float.all_comments_comment_row_top') })
          .width(CommonConstants.FULL_PERCENT)
          .justifyContent(FlexAlign.Start)

          Row() {
            Image(item.getCommentImageSrc())
              .width(new BreakpointType(DetailConstants.COMMENT_IMAGE_WIDTH[0], DetailConstants.COMMENT_IMAGE_WIDTH[1],
                this.commentImgWidth).GetValue(this.currentBreakpoint))
              .height(new BreakpointType(DetailConstants.COMMENT_IMAGE_HEIGHT[0],
                DetailConstants.COMMENT_IMAGE_HEIGHT[1], this. commentImgHeight).GetValue(this.currentBreakpoint))
              .borderRadius( $r('app.float.all_comments_img_radius'))
              .aspectRatio(DetailConstants.COMMENT_IMAGE_ASPECT_RATIO)
          }
          .padding({ left:  $r('app.float.all_comments_img_row_padding') })
          .margin({ top:  $r('app.float.all_comments_img_row_margin') })
          .width(CommonConstants.FULL_PERCENT)
          .justifyContent(FlexAlign.Start)
          .visibility(item.getCommentImageSrc() === undefined ? Visibility.None : Visibility.Visible)

          Row() {
            Text(item.getTime())
              .opacity(CommonConstants.TEXT_OPACITY[2])
              .fontSize($r('app.float.all_comments_comment_time_font'))
              .lineHeight($r('app.float.all_comments_comment_time_line'))
              .fontWeight(FontWeight.Normal)
              .margin({ left: $r('app.float.all_comments_comment_time_margin') })

            Blank()

            IconImage({ image: $r('app.media.ic_public_comments') })
              .margin({ right: $r('app.float.all_comments_icon_margin') })
            IconImage({ image: $r("app.media.ic_public_thumb_sup") })
              .margin({ right: $r('app.float.all_comments_icon_margin') })
            IconImage({ image: $r('app.media.ic_public_share') })
          }
          .margin({ top: $r('app.float.all_comments_icon_row_top') })
          .width(CommonConstants.FULL_PERCENT)
          .justifyContent(FlexAlign.Start)

          Divider()
            .color(Color.Black)
            .opacity(CommonConstants.DIVIDER_OPACITY)
            .margin({
              top: $r('app.float.all_comments_divider_margin')
            })
            .height($r('app.float.all_comments_divider_height'))
            .width(CommonConstants.FULL_PERCENT)
            .visibility(index === this.commentsList.length - 1 ? Visibility.None : Visibility.Visible)
        }, (item: UserInfo, index: number) => index + JSON.stringify(item))
      }
      .alignItems(HorizontalAlign.Start)
      .padding({
        left: $r('app.float.all_comments_comment_col_padding'),
        right: $r('app.float.all_comments_comment_col_padding')
      })
      .width(CommonConstants.FULL_PERCENT)
    }
    .width(CommonConstants.FULL_PERCENT)
    .backgroundColor(Color.White)
    .justifyContent(FlexAlign.Start)
  }

  @Builder
  TitleText(content: string) {
    Text(content)
      .fontSize($r('app.float.all_comments_title_text_font'))
      .lineHeight($r('app.float.all_comments_title_text_line'))
      .fontWeight(CommonConstants.FONT_WEIGHT_500)
  }
}

@Component
struct IconImage {
  private image: Resource | null = null;

  build() {
    Image(this.image)
      .height($r('app.float.all_comments_icon_size'))
      .width($r('app.float.all_comments_icon_size'))
  }
}