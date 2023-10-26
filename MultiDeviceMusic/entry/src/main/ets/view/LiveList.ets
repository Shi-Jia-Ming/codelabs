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

import { LiveStream } from '../viewmodel/LiveStream';
import { LiveConstants } from '../common/constants/LiveConstants';
import { LiveStreamViewModel } from '../viewmodel/LiveStreamViewModel';

@Component
export struct LiveList {
  private scroller: Scroller = new Scroller();
  @State liveStreams: LiveStream[] = new LiveStreamViewModel().getLiveStreamList();
  @State currentBreakpoint: string = LiveConstants.CURRENT_BREAKPOINT;

  build() {
    GridRow({
      columns: {
        sm: LiveConstants.FOUR_COLUMN,
        md: LiveConstants.EIGHT_COLUMN,
        lg: LiveConstants.TWELVE_COLUMN
      },
      breakpoints: {
        value: [
        LiveConstants.SMALL_DEVICE_TYPE,
        LiveConstants.MIDDLE_DEVICE_TYPE,
        LiveConstants.LARGE_DEVICE_TYPE
        ]
      },
      gutter: { x: $r('app.float.grid_row_gutter') }
    }) {
      GridCol({
        span: {
          sm: LiveConstants.FOUR_COLUMN,
          md:LiveConstants.SIX_COLUMN,
          lg: LiveConstants.EIGHT_COLUMN
        },
        offset: {
          sm: LiveConstants.ZERO_COLUMN,
          md: LiveConstants.ONE_COLUMN,
          lg: LiveConstants.TWO_COLUMN
        }
      }) {
        Scroll(this.scroller) {
          Column() {
            ForEach(this.liveStreams, (item: LiveStream, index?: number) => {
              this.LiveItem(item, index)
            }, (item: LiveStream, index?: number) => index + JSON.stringify(item))
          }
          .width(LiveConstants.FULL_WIDTH_PERCENT)
        }
        .align(Alignment.Top)
        .scrollBar(BarState.Off)
        .margin({
          bottom: $r('app.float.scroll_margin_bottom')
        })
      }
      .margin({ left: $r('app.float.grid_col_left_margin'), right: $r('app.float.grid_col_right_margin') })
    }
    .onBreakpointChange((breakPoints) => {
      this.currentBreakpoint = breakPoints;
    })
  }

  @Builder
  LiveItem(item: LiveStream, index?: number) {
    Stack({ alignContent: Alignment.Center }) {
      Image(item.liveBackground)
        .size({ width: LiveConstants.FULL_WIDTH_PERCENT, height: $r('app.float.live_image_height') })
        .borderRadius($r('app.float.live_image_border_radius'))

      Column() {
        Row() {
          Image($r('app.media.ic_video'))
            .width($r('app.float.video_width'))
            .height($r('app.float.video_height'))
            .margin({ top: this.currentBreakpoint === LiveConstants.CURRENT_BREAKPOINT
              ? $r('app.float.video_top_margin_small') : $r('app.float.video_top_margin_middle_large') })
        }
        .height($r('app.float.video_row_height'))
        .width(LiveConstants.FULL_WIDTH_PERCENT)
        .alignItems(VerticalAlign.Top)
        .justifyContent(FlexAlign.End)

        Column() {
          Row() {
            Text(item.title)
              .fontColor($r('app.color.white'))
              .fontWeight(LiveConstants.LIVE_TITLE_FONT_WEIGHT)
              .fontFamily(LiveConstants.LIVE_ITEM_TITLE_FONT_FAMILY)
              .fontSize($r('app.float.live_item_title_font_size'))
          }
          .height($r('app.float.live_item_title_height'))
          .margin({ top: this.currentBreakpoint === LiveConstants.CURRENT_BREAKPOINT
            ? $r('app.float.live_item_top_margin_phone') : $r('app.float.live_item_top_margin_tablet')})
          .width(LiveConstants.FULL_WIDTH_PERCENT)

          Row() {
            Text(item.liveIntroduction)
              .fontFamily(LiveConstants.LIVE_ITEM_INTRODUCTION_FONT_FAMILY)
              .fontSize($r('app.float.live_introduction_font_size'))
              .fontColor($r('app.color.live_introduction'))
              .fontWeight(LiveConstants.LIVE_INTRODUCTION_FONT_WEIGHT)
          }
          .width(LiveConstants.FULL_WIDTH_PERCENT)
          .height($r('app.float.live_introduction_height'))
          .margin({ top: $r('app.float.live_introduction_top_margin') })
        }
        .height($r('app.float.live_item_row_height'))
        .alignItems(HorizontalAlign.Start)
        .justifyContent(FlexAlign.Start)
      }
      .height($r('app.float.live_image_height'))
      .padding({
        left: this.currentBreakpoint === LiveConstants.CURRENT_BREAKPOINT
          ? $r('app.float.small_left_right_padding') : $r('app.float.middle_large_left_right_padding'),
        right: this.currentBreakpoint === LiveConstants.CURRENT_BREAKPOINT
          ? $r('app.float.small_left_right_padding') : $r('app.float.middle_large_left_right_padding')
      })
    }
    .width(LiveConstants.FULL_WIDTH_PERCENT)
    .margin({
      top: index === 0 ? $r('app.float.stack_top_margin_small') : 0,
      bottom: $r('app.float.stack_top_margin_middle'
      )
    })
  }
}