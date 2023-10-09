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

@Component
export struct VideoImgRating {
  private rating: string = '';

  build() {
    Row() {
      Text(this.rating)
        .fontSize($r('app.float.video_img_rating_font'))
        .fontWeight(FontWeight.Normal)
        .fontColor(Color.White)
        .height($r('app.float.video_img_rating_height'))
        .width($r('app.float.video_img_rating_width'))
        .margin({
          right: $r('app.float.video_img_rating_margin'),
          bottom: $r('app.float.video_img_rating_margin')
        })
        .backgroundColor($r('app.color.main_daily_rating_background'))
        .borderRadius($r('app.float.video_img_rating_radius'))
        .textAlign(TextAlign.Center)
    }
    .justifyContent(FlexAlign.End)
    .width(CommonConstants.FULL_PERCENT)
    .visibility(this.rating === null ? Visibility.None : Visibility.Visible)
  }
}

@Component
export struct VideoTitle {
  @StorageLink('currentBreakpoint') currentBreakpoint: string = BreakpointConstants.BREAKPOINT_LG;
  @Prop currentTopIndex: number = 0;
  private title: string = '';

  build() {
    Text(this.title)
      .fontWeight(FontWeight.Normal)
      .fontSize($r('app.float.video_title_font'))
      .lineHeight($r('app.float.video_title_line'))
      .margin({ top: $r('app.float.video_title_margin') })
      .fontColor(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG && this.currentTopIndex === 2 ?
        Color.White : $r('app.color.normal_font_color'))
      .textOverflow({ overflow: TextOverflow.Ellipsis })
  }
}

@Component
export struct VideoContent {
  @StorageLink('currentBreakpoint') currentBreakpoint: string = BreakpointConstants.BREAKPOINT_LG;
  @Prop currentTopIndex: number = 0;
  private content: string = '';

  build() {
    Text(this.content)
      .fontSize($r('app.float.video_content_font'))
      .lineHeight($r('app.float.video_content_line'))
      .opacity(CommonConstants.TEXT_OPACITY[0])
      .fontWeight(FontWeight.Normal)
      .maxLines(1)
      .margin({ top: $r('app.float.video_content_margin') })
      .fontColor(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG && this.currentTopIndex === 2 ?
        Color.White : $r('app.color.normal_font_color'))
      .textOverflow({ overflow: TextOverflow.Ellipsis })
  }
}

@Component
export struct SubtitleComponent {
  @StorageLink('currentBreakpoint') currentBreakpoint: string = BreakpointConstants.BREAKPOINT_LG;
  @Prop currentTopIndex: number = 0;
  private title: string = '';

  build() {
    Row() {
      Text(this.title)
        .fontSize($r('app.float.sub_title_font'))
        .fontWeight(CommonConstants.FONT_WEIGHT_500)
        .fontColor(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG && this.currentTopIndex === 2 ?
          Color.White : $r('app.color.normal_font_color'))
    }
    .height($r('app.float.sub_title_row_height'))
    .width(CommonConstants.FULL_PERCENT)
    .margin({
      left: $r('app.float.sub_title_row_margin'),
      right: $r('app.float.sub_title_row_margin')
    })
  }
}

@Component
export struct VideoImgComponent {
  private imgSrc?: Resource;

  build() {
    Image(this.imgSrc !== undefined ? this.imgSrc : '')
      .objectFit(ImageFit.Fill)
      .width(CommonConstants.FULL_PERCENT)
      .height(CommonConstants.FULL_PERCENT)
      .draggable(false)
  }
}

@Component
export struct VideoImgPlay {
  @StorageLink('currentBreakpoint') currentBreakpoint: string = BreakpointConstants.BREAKPOINT_LG;

  build() {
    Column() {
      Image($r('app.media.new_video_play'))
        .height(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ? $r('app.float.video_img_size_lg') :
          $r('app.float.video_img_size'))
        .width(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ? $r('app.float.video_img_size_lg') :
          $r('app.float.video_img_size'))
    }
    .width(CommonConstants.FULL_PERCENT)
    .height(CommonConstants.FULL_PERCENT)
    .justifyContent(FlexAlign.Center)
  }
}