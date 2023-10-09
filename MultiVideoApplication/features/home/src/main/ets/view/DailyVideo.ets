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
import { HomeConstants } from '../constants/HomeConstants';
import { VideoImage, VideoImgViewModel } from '../viewmodel/VideoImgViewModel';
import { SubtitleComponent, VideoImgComponent, VideoImgPlay, VideoImgRating } from './CommonView';

@Component
export struct DailyVideo {
  @StorageLink('currentBreakpoint') currentBreakpoint: string = BreakpointConstants.BREAKPOINT_LG;
  @Prop windowWidth: number = 0;
  @Prop currentTopIndex: number = 0;
  private dailyVideoImgList: VideoImage[] = new VideoImgViewModel().getDailyVideoImgList();
  private mainDailyVideoImg: VideoImage = new VideoImgViewModel().getMainDailyVideoImg();

  build() {
    Column() {
      SubtitleComponent({ currentTopIndex: this.currentTopIndex, title: HomeConstants.HOME_SUB_TITLES[1] })

      GridRow({
        columns: {
          sm: BreakpointConstants.GRID_ROW_COLUMNS[2],
          md: BreakpointConstants.GRID_ROW_COLUMNS[0],
          lg: BreakpointConstants.GRID_ROW_COLUMNS[0]
        },
        gutter: $r('app.float.grid_row_gutter')
      }) {
        // Main video section.
        GridCol({
          span: {
            sm: BreakpointConstants.GRID_COLUMN_SPANS[5],
            md: BreakpointConstants.GRID_COLUMN_SPANS[1],
            lg: BreakpointConstants.GRID_COLUMN_SPANS[1]
          }
        }) {
          Column() {
            Stack({ alignContent: Alignment.Bottom }) {
              VideoImgComponent({ imgSrc: this.mainDailyVideoImg.getImgSrc() })
              VideoImgPlay()

              Row() {
                Text(this.mainDailyVideoImg.getTitle())
                  .fontSize(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
                    $r('app.float.main_daily_title_font_lg') : $r('app.float.main_daily_title_font'))
                  .fontColor(Color.White)
                  .fontWeight(CommonConstants.FONT_WEIGHT_700)
                  .margin({ left: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
                    $r('app.float.main_daily_margin_lg') : $r('app.float.main_daily_margin') })
                  .layoutWeight(1)
                  .maxLines(1)

                Text(this.mainDailyVideoImg.getRating())
                  .fontSize(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
                    $r('app.float.main_daily_rating_font_lg') : $r('app.float.main_daily_rating_font'))
                  .fontWeight(FontWeight.Normal)
                  .fontColor(Color.White)
                  .height(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
                    $r('app.float.main_daily_rating_height_lg') : $r('app.float.main_daily_rating_height'))
                  .width(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
                    $r('app.float.main_daily_rating_width_lg') : $r('app.float.main_daily_rating_width'))
                  .margin({
                    right: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG?
                      $r('app.float.main_daily_rating_right_lg') : $r('app.float.main_daily_rating_right'),
                    top: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
                      $r('app.float.main_daily_rating_top_lg') : $r('app.float.main_daily_rating_top')
                  })
                  .backgroundColor($r('app.color.main_daily_rating_background'))
                  .borderRadius(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
                    $r('app.float.main_daily_rating_radius_lg') : $r('app.float.main_daily_rating_radius'))
                  .textAlign(TextAlign.Center)
              }
              .alignItems(VerticalAlign.Top)
              .justifyContent(FlexAlign.Start)
              .width(CommonConstants.FULL_PERCENT)
              .height(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
                $r('app.float.main_daily_row_height_lg') : $r('app.float.main_daily_row_height'))
            }
            .width(CommonConstants.FULL_PERCENT)
            .layoutWeight(5)

            Row() {
              Image($r('app.media.daily_small_video'))
                .height(new BreakpointType($r('app.float.small_daily_image_height_sm'),
                  $r('app.float.small_daily_image_height_md'), $r('app.float.small_daily_image_height_lg'))
                  .GetValue(this.currentBreakpoint))
                .width(new BreakpointType($r('app.float.small_daily_image_width_sm'),
                  $r('app.float.small_daily_image_width_md'), $r('app.float.small_daily_image_width_lg'))
                  .GetValue(this.currentBreakpoint))

              Column() {
                Text(this.mainDailyVideoImg.getOtherInfo())
                  .fontSize(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
                    $r('app.float.main_daily_other_font_lg') : $r('app.float.main_daily_other_font'))
                  .fontWeight(FontWeight.Normal)
                  .maxLines(1)
                Text(this.mainDailyVideoImg.getContent())
                  .opacity(CommonConstants.TEXT_OPACITY[0])
                  .fontSize(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
                    $r('app.float.main_daily_content_font_lg') : $r('app.float.main_daily_content_font'))
                  .fontWeight(FontWeight.Normal)
                  .maxLines(1)
              }
              .margin({
                left: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
                  $r('app.float.small_daily_column_margin_lg'): $r('app.float.small_daily_column_margin'),
                right: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
                  $r('app.float.small_daily_column_margin_lg'): $r('app.float.small_daily_column_margin')
              })
              .alignItems(HorizontalAlign.Start)
              .layoutWeight(1)

              Button(HomeConstants.HOME_BUTTON_TEXT[0])
                .fontSize(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
                  $r('app.float.main_daily_button_font_lg'): $r('app.float.main_daily_button_font'))
                .fontColor($r('app.color.tab_sel_color'))
                .fontWeight(CommonConstants.FONT_WEIGHT_500)
                .height(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
                  $r('app.float.main_daily_button_height_lg') : $r('app.float.main_daily_button_height_lg'))
                .width(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
                  $r('app.float.main_daily_button_width_lg') : $r('app.float.main_daily_button_width_lg'))
                .borderRadius($r('app.float.main_daily_button_radius'))
                .backgroundColor($r('app.color.button_background'))
            }
            .alignItems(VerticalAlign.Center)
            .padding({
              left: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
                $r('app.float.small_daily_row_padding_lg') : $r('app.float.small_daily_row_padding'),
              right: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
                $r('app.float.small_daily_row_padding_lg') : $r('app.float.small_daily_row_padding')
            })
            .layoutWeight(2)
          }
          .width(CommonConstants.FULL_PERCENT)
          // Dynamically setting the height at different breakpoints.
          .height(this.getDailyVideoHeight(this.currentBreakpoint, this.windowWidth, true))
          .borderRadius($r('app.float.card_radius'))
          .backgroundColor($r('app.color.home_component_background'))
        }

        // Sub video section.
        GridCol({
          span: {
            sm: BreakpointConstants.GRID_COLUMN_SPANS[5],
            md: BreakpointConstants.GRID_COLUMN_SPANS[1],
            lg: BreakpointConstants.GRID_COLUMN_SPANS[1]
          }
        }) {
          Grid() {
            ForEach(this.dailyVideoImgList, (item: VideoImage) => {
              GridItem() {
                Column() {
                  Stack({ alignContent: Alignment.Bottom }) {
                    VideoImgComponent({ imgSrc: item.getImgSrc() })
                    VideoImgPlay()
                    VideoImgRating({ rating: item.getRating() })
                  }
                  .width(CommonConstants.FULL_PERCENT)
                  // The width and height vary with the container assembly and the aspect ratio remains unchanged.
                  .aspectRatio(HomeConstants.VIDEO_DIALOG_ASPECT_RATIO)

                  Text(item.getTitle())
                    .fontSize(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
                      $r('app.float.daily_title_font_lg') : $r('app.float.daily_title_font'))
                    .fontWeight(FontWeight.Normal)
                    .lineHeight(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
                      $r('app.float.video_title_line_lg') : $r('app.float.video_title_line'))
                    .margin({ top: $r('app.float.daily_title_margin') })
                    .fontColor(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG && this.currentTopIndex ===
                      2 ? Color.White : $r('app.color.normal_font_color'))

                  Text(item.getContent())
                    .fontSize($r('app.float.daily_content_font'))
                    .fontWeight(FontWeight.Normal)
                    .lineHeight($r('app.float.video_content_line'))
                    .margin({ top: $r('app.float.daily_content_margin') })
                    .opacity(CommonConstants.TEXT_OPACITY[0])
                    .visibility(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ? Visibility.Visible :
                      Visibility.None)
                }
                .alignItems(HorizontalAlign.Start)
              }
            }, (item: VideoImage, index: number) => index + JSON.stringify(item))
          }
          // Dynamically setting the height at different breakpoints.
          .height(this.getDailyVideoHeight(this.currentBreakpoint, this.windowWidth, false))
          .width(CommonConstants.FULL_PERCENT)
          // Sets the number of grid layout columns and evenly divides the height.
          .columnsTemplate(CommonConstants.VIDEO_GRID_COLUMNS[0])
          .rowsTemplate(CommonConstants.VIDEO_GRID_COLUMNS[0])
          .rowsGap($r('app.float.daily_grid_gap'))
          .columnsGap($r('app.float.daily_grid_gap'))
        }
      }
    }
    .padding({ left: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG && this.currentTopIndex === 2 ?
      $r('app.float.side_bar_width') : 0 })
  }

  getDailyVideoHeight(currentBreakpoint: string, windowWidth: number, isMain: boolean): string {
    // Obtain the window width and subtract the blank parts on both sides.
    let result: number = px2vp(windowWidth) - HomeConstants.VIDEO_GRID_MARGIN - HomeConstants.VIDEO_GRID_ITEM_SPACE * 2;
    // Calculate the width of a single image based on the number of grid columns.
    if (currentBreakpoint === BreakpointConstants.BREAKPOINT_LG) {
      result = (result - HomeConstants.LG_SIDEBAR_WIDTH) / HomeConstants.TWO;
    } else if (currentBreakpoint === BreakpointConstants.BREAKPOINT_MD) {
      result /= HomeConstants.TWO;
    } else {
      result /= 1;
    }
    // Calculate the height of a single image and title, and calculate the total height of the grid layout.
    result = (result - HomeConstants.VIDEO_GRID_ITEM_SPACE) / HomeConstants.VIDEO_DIALOG_ASPECT_RATIO;
    if (currentBreakpoint === BreakpointConstants.BREAKPOINT_SM && isMain === false) {
      return (result + HomeConstants.DAILY_VIDEO_DESCRIPTION_HEIGHT[0] + HomeConstants.HEIGHT_UNIT);
    } else {
      return (result + HomeConstants.DAILY_VIDEO_DESCRIPTION_HEIGHT[1] + HomeConstants.HEIGHT_UNIT);
    }
  }
}