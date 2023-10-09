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
import { DetailConstants } from '../constants/DetailConstants';
import { CurrentOffsetUtil } from '../utils/CurrentOffsetUtil';
import { RelatedVideo, RelatedVideoViewModel } from '../viewmodel/RelatedVideoViewModel';
import { AllComments } from './AllComments';

@Component
export struct RelatedList {
  @StorageLink('currentBreakpoint') currentBreakpoint: string = BreakpointConstants.BREAKPOINT_LG;
  @State commentImgHeight: string = DetailConstants.INITIAL_COMMENT_IMAGE_HEIGHT;
  @State commentImgWidth: string = DetailConstants.INITIAL_COMMENT_IMAGE_WIDTH;
  @Link relatedVideoHeight: number;
  @Link videoHeight: number;
  private screenHeight: number = 0;
  private relatedVideoList: RelatedVideo[] = new RelatedVideoViewModel().getRelatedVideoList();
  private peripheralVideoList: RelatedVideo[] = new RelatedVideoViewModel().getPeripheralVideoList();
  private episodes: string[] = DetailConstants.EPISODES_LIST;
  private currentIndex: number = 2;
  private iconList: Resource[] = DetailConstants.ICON_LIST;
  private scroller: Scroller = new Scroller();

  build() {
    Scroll(this.scroller) {
      Column() {
        this.RelatedVideoComponent()
        this.VideoIntroduction()
        AllComments({commentImgHeight: $commentImgHeight, commentImgWidth: $commentImgWidth})
          .visibility(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ? Visibility.None :
            Visibility.Visible)
      }
      .width(CommonConstants.FULL_PERCENT)
      .alignItems(HorizontalAlign.Start)
    }
    .layoutWeight(1)
    .scrollBar(BarState.Off)
    .onScrollFrameBegin((offset: number) => {
      if (this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG) {
        if ((offset > 0) && (this.videoHeight > DetailConstants.MIN_VIDEO_PERCENT)) {
          // Video zoom-out logic.
          // Percentage of screen height by sliding.
          let offsetPercent = (Math.abs(offset) * DetailConstants.MAX_VIDEO_PERCENT) / this.screenHeight;
          // Video shrinkage percentage.
          let heightOffset = offsetPercent < this.videoHeight - DetailConstants.MIN_VIDEO_PERCENT ? offsetPercent :
            this.videoHeight - DetailConstants.MIN_VIDEO_PERCENT;
          this.videoHeight = this.videoHeight - heightOffset;
          // Returns the actual offset 0.
          return { offsetRemain: 0 };
        } else if ((offset < 0) && (this.videoHeight < DetailConstants.MAX_VIDEO_PERCENT) &&
          (CurrentOffsetUtil.scrollToTop(JSON.stringify(this.scroller.currentOffset())))) {
          // Video magnification logic.
          let offsetPercent = (Math.abs(offset) * DetailConstants.MAX_VIDEO_PERCENT) / this.screenHeight;
          let heightOffset = offsetPercent < DetailConstants.MAX_VIDEO_PERCENT - this.videoHeight ? offsetPercent :
            DetailConstants.MAX_VIDEO_PERCENT - this.videoHeight;
          this.videoHeight = this.videoHeight + heightOffset;
          // Returns the actual offset 0.
          return { offsetRemain: 0 };
        }
        return { offsetRemain: offset };
      } else {
        if ((offset > 0) && (this.videoHeight === DetailConstants.MAX_VIDEO_PERCENT) && (this.relatedVideoHeight > 0)) {
          // Related list shrinking logic.
          // Percentage of screen height by sliding.
          let offsetPercent = (Math.abs(offset) * DetailConstants.TEN) / this.screenHeight;
          this.relatedVideoHeight = (this.relatedVideoHeight - offsetPercent * DetailConstants.RELATED_LIST_HEIGHT) <
            0 ? 0 : (this.relatedVideoHeight - offsetPercent * DetailConstants.RELATED_LIST_HEIGHT);
          // Returns the actual offset 0.
          return { offsetRemain: 0 };
        } else if ((offset > 0) && (this.videoHeight > DetailConstants.MIN_VIDEO_PERCENT) &&
          (this.relatedVideoHeight === 0)) {
          // Video zoom-out logic.
          // Percentage of screen height by sliding.
          let offsetPercent = (Math.abs(offset) * DetailConstants.MAX_VIDEO_PERCENT) / this.screenHeight;
          // Video shrinkage percentage.
          let heightOffset = offsetPercent < this.videoHeight - DetailConstants.MIN_VIDEO_PERCENT ? offsetPercent :
            this.videoHeight - DetailConstants.MIN_VIDEO_PERCENT;
          this.videoHeight = this.videoHeight - heightOffset;
          // Returns the actual offset 0.
          return { offsetRemain: 0 };
        } else if ((offset > 0) && (this.videoHeight === DetailConstants.MIN_VIDEO_PERCENT) &&
          (this.relatedVideoHeight === 0)) {
          return { offsetRemain: offset };
        } else if ((offset < 0) && (this.videoHeight < DetailConstants.MAX_VIDEO_PERCENT) &&
          (this.relatedVideoHeight === 0)) {
          if (CurrentOffsetUtil.scrollToTop(JSON.stringify(this.scroller.currentOffset()))) {
            // Video magnification logic.
            let offsetPercent = (Math.abs(offset) * DetailConstants.MAX_VIDEO_PERCENT) / this.screenHeight;
            let heightOffset = offsetPercent < DetailConstants.MAX_VIDEO_PERCENT - this.videoHeight ? offsetPercent :
              DetailConstants.MAX_VIDEO_PERCENT - this.videoHeight;
            this.videoHeight = this.videoHeight + heightOffset;
            // Returns the actual offset 0.
            return { offsetRemain: 0 };
          }
          return { offsetRemain: offset };
        } else if ((offset < 0) && (this.videoHeight === DetailConstants.MAX_VIDEO_PERCENT) &&
          (this.relatedVideoHeight >= 0)) {
          // Related list enlargement logic.
          // Percentage of screen height by sliding.
          let offsetPercent = (Math.abs(offset) * DetailConstants.TEN) / this.screenHeight;
          this.relatedVideoHeight = (this.relatedVideoHeight + offsetPercent * DetailConstants.RELATED_LIST_HEIGHT) >
            DetailConstants.RELATED_LIST_HEIGHT ? DetailConstants.RELATED_LIST_HEIGHT : (this.relatedVideoHeight +
            offsetPercent * DetailConstants.RELATED_LIST_HEIGHT);
          // Returns the actual offset 0.
          return { offsetRemain: 0 };
        }
        return { offsetRemain: 0 };
      }
    })
  }

  @Builder
  RelatedVideoComponent() {
    Column() {
      this.SubTitleAndMore(DetailConstants.SUB_TITLES[1])

      Row() {
        List({ space: CommonConstants.LIST_SPACE }) {
          ForEach(this.relatedVideoList, (item: RelatedVideo) => {
            ListItem() {
              Column() {
                Image(item.getImageSrc())
                  .height($r('app.float.related_img_height'))
                  .width($r('app.float.related_img_width'))
                  .objectFit(ImageFit.Cover)
                  .borderRadius($r('app.float.related_img_radius'))
                  .margin({ bottom: $r('app.float.related_img_margin') })

                Text(item.getName())
                  .fontSize($r('app.float.related_name_font'))
                  .lineHeight($r('app.float.related_name_line'))
                  .fontWeight(CommonConstants.FONT_WEIGHT_500)
                  .opacity(CommonConstants.TEXT_OPACITY[2])
              }
            }
            .margin({
              top: $r('app.float.related_list_top'),
              bottom: $r('app.float.related_list_bottom')
            })
          }, (item: RelatedVideo, index: number) => index + JSON.stringify(item))
        }
        .listDirection(Axis.Horizontal)
        .scrollBar(BarState.Off)
      }
      .padding({
        left: $r('app.float.related_row_left'),
        bottom: $r('app.float.related_row_bottom')
      })
      .height($r('app.float.related_row_height'))
      .width(CommonConstants.FULL_PERCENT)
    }
    .height(this.relatedVideoHeight + DetailConstants.LENGTH_UNIT)
  }

  @Builder
  VideoIntroduction() {
    Column() {
      this.SubTitle(DetailConstants.SUB_TITLES[3])

      Column() {
        this.IntroductionContent(DetailConstants.INTRODUCTION_CONTENT[0])
        this.IntroductionContent(DetailConstants.INTRODUCTION_CONTENT[1])
      }
      .padding({
        left: $r('app.float.sub_title_row_padding'),
        right: $r('app.float.sub_title_row_padding')
      })
      .width(CommonConstants.FULL_PERCENT)
      .alignItems(HorizontalAlign.Start)

      Row() {
        ForEach(this.iconList, (item: Resource, index: number) => {
          Image(item)
            .height($r('app.float.introduction_icon_size'))
            .width($r('app.float.introduction_icon_size'))
        }, (item: Resource, index: number) => index + JSON.stringify(item))
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .padding({
        top: $r('app.float.introduction_row_padding'),
        bottom: $r('app.float.introduction_row_padding'),
        left: $r('app.float.sub_title_row_padding'),
        right: $r('app.float.sub_title_row_padding')
      })
      .height($r('app.float.sub_title_row_height'))
      .width(CommonConstants.FULL_PERCENT)

      this.SubTitle(DetailConstants.SUB_TITLES[4])

      List({ space: CommonConstants.LIST_SPACE }) {
        ForEach(this.episodes, (item: string, index: number) => {
          ListItem() {
            Row() {
              Image($r('app.media.video_playing'))
                .height($r('app.float.is_playing_icon_size'))
                .width($r('app.float.is_playing_icon_size'))
                .position({ x: $r('app.float.is_playing_icon_x'), y: $r('app.float.is_playing_icon_y') })
                .visibility((index + 1) === this.currentIndex ? Visibility.Visible : Visibility.None)

              Text(item)
                .fontSize($r('app.float.episodes_text_font'))
                .fontWeight(FontWeight.Normal)
                .height($r('app.float.episodes_text_height'))
                .fontColor((index + 1) === this.currentIndex ? $r('app.color.episodes_font') : Color.Black)
            }
            .justifyContent(FlexAlign.Center)
            .backgroundColor($r('app.color.episodes_background'))
            .height($r('app.float.episodes_list_height'))
            .width($r('app.float.episodes_list_width'))
            .borderRadius($r('app.float.episodes_list_radius'))
          }
        }, (item: string, index: number) => index + JSON.stringify(item))
      }
      .scrollBar(BarState.Off)
      .listDirection(Axis.Horizontal)
      .padding({ left: $r('app.float.sub_title_row_padding') })
      .margin({ bottom: $r('app.float.episodes_list_margin') })
      .width(CommonConstants.FULL_PERCENT)

      this.SubTitleAndMore(DetailConstants.SUB_TITLES[5])

      List({ space: CommonConstants.LIST_SPACE }) {
        ForEach(this.peripheralVideoList, (item: RelatedVideo, index: number) => {
          ListItem() {
            Column() {
              Image(item.getImageSrc())
                .height($r('app.float.peripheral_img_height'))
                .width($r('app.float.peripheral_img_width'))
                .margin({ bottom: $r('app.float.peripheral_img_margin') })
                .borderRadius($r('app.float.peripheral_img_radius'))

              Text(item.getName())
                .lineHeight($r('app.float.peripheral_name_line'))
                .fontSize($r('app.float.peripheral_name_font'))
                .opacity(CommonConstants.TEXT_OPACITY[2])
                .fontWeight(CommonConstants.FONT_WEIGHT_500)
            }
          }
        }, (item: RelatedVideo, index: number) => index + JSON.stringify(item))
      }
      .scrollBar(BarState.Off)
      .listDirection(Axis.Horizontal)
      .margin({ top: $r('app.float.peripheral_list_margin') })
      .padding({
        left: $r('app.float.sub_title_row_padding'),
        right: $r('app.float.sub_title_row_padding')
      })
      .width(CommonConstants.FULL_PERCENT)
    }
    .width(CommonConstants.FULL_PERCENT)
    .backgroundColor(Color.White)
    .visibility(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ? Visibility.Visible : Visibility.None)
  }

  @Builder
  SubTitle(subtitle: string) {
    Row() {
      Text(subtitle)
        .fontSize($r('app.float.sub_title_font'))
        .lineHeight($r('app.float.sub_title_text_line'))
        .fontWeight(CommonConstants.FONT_WEIGHT_500)
    }
    .padding({
      left: $r('app.float.sub_title_row_padding'),
      right: $r('app.float.sub_title_row_padding')
    })
    .height($r('app.float.sub_title_row_height'))
    .width(CommonConstants.FULL_PERCENT)
  }

  @Builder
  SubTitleAndMore(subtitle: string) {
    Row() {
      Text(subtitle)
        .fontSize($r('app.float.sub_title_font'))
        .lineHeight($r('app.float.sub_title_text_line'))
        .fontWeight(CommonConstants.FONT_WEIGHT_500)

      Blank()

      Text(DetailConstants.SUB_TITLES[2])
        .fontSize($r('app.float.sub_title_font_more'))
        .lineHeight($r('app.float.sub_title_text_line_more'))
        .fontWeight(FontWeight.Normal)
        .opacity(CommonConstants.TEXT_OPACITY[2])
      Image($r('app.media.ic_public_arrow_right'))
        .height($r('app.float.arrow_img_size'))
        .width($r('app.float.arrow_img_size'))
    }
    .padding({
      left: $r('app.float.sub_title_row_padding'),
      right: $r('app.float.sub_title_row_padding')
    })
    .height($r('app.float.sub_title_row_height'))
    .width(CommonConstants.FULL_PERCENT)
    .alignItems(VerticalAlign.Center)
  }

  @Builder
  IntroductionContent(content: string) {
    Text(content)
      .fontSize($r('app.float.introduction_content_font'))
      .lineHeight($r('app.float.introduction_content_line'))
      .fontWeight(CommonConstants.FONT_WEIGHT_500)
      .opacity(CommonConstants.TEXT_OPACITY[2])
  }
}