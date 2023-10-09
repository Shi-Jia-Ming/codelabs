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
import { PreviousVideoUtil } from '../utils/PreviousVideoUtil';
import { SubtitleComponent } from './CommonView';

@Component
export struct PreviousVideo {
  @StorageLink('currentBreakpoint') currentBreakpoint: string = BreakpointConstants.BREAKPOINT_LG;
  @State previousVideoImgListTwo: VideoImage[] = new VideoImgViewModel().getPreviousVideoTwo(this.currentBreakpoint);
  @Prop currentTopIndex: number = 0;
  private previousVideoImgListOne: VideoImage[] = new VideoImgViewModel().getPreviousVideoOne();

  build() {
    Column() {
      SubtitleComponent({ currentTopIndex: this.currentTopIndex, title: HomeConstants.HOME_SUB_TITLES[2] })

      GridRow({
        columns: {
          sm: BreakpointConstants.GRID_ROW_COLUMNS[2],
          md: BreakpointConstants.GRID_ROW_COLUMNS[0],
          lg: BreakpointConstants.GRID_ROW_COLUMNS[1]
        },
        gutter: $r('app.float.grid_row_gutter')
      }) {
        ForEach(this.previousVideoImgListOne, (item: VideoImage, index: number) => {
          GridCol({
            span: {
              sm: BreakpointConstants.GRID_COLUMN_SPANS[5],
              md: BreakpointConstants.GRID_COLUMN_SPANS[1],
              lg: BreakpointConstants.GRID_COLUMN_SPANS[3]
            }
          }) {
            Row() {
              Image(item.getImgSrc())
                .objectFit(ImageFit.Fill)
                .margin({ right: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ?
                  $r('app.float.previous_one_image_margin_sm') : $r('app.float.previous_one_image_margin') })
                .layoutWeight(CommonConstants.THREE)
                .height(CommonConstants.FULL_PERCENT)

              Column() {
                Text(item.getTitle())
                  .fontSize(new BreakpointType($r('app.float.previous_one_title_font_sm'),
                    $r('app.float.previous_one_title_font_md'), $r('app.float.previous_one_title_font_lg'))
                    .GetValue(this.currentBreakpoint))
                  .fontWeight(CommonConstants.FONT_WEIGHT_500)
                  .maxLines(2)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                Text(item.getContent())
                  .fontSize(new BreakpointType($r('app.float.previous_one_content_font_sm'),
                    $r('app.float.previous_one_content_font_md'), $r('app.float.previous_one_content_font_lg'))
                    .GetValue(this.currentBreakpoint))
                  .opacity(CommonConstants.TEXT_OPACITY[1])
                  .fontWeight(FontWeight.Normal)
                  .margin({ top: $r('app.float.previous_one_content_margin') })
                  .maxLines(1)
                Text(item.getOtherInfo())
                  .fontSize(new BreakpointType($r('app.float.previous_one_content_font_sm'),
                    $r('app.float.previous_one_content_font_md'), $r('app.float.previous_one_content_font_lg'))
                    .GetValue(this.currentBreakpoint))
                  .opacity(CommonConstants.TEXT_OPACITY[1])
                  .fontWeight(FontWeight.Normal)
                  .margin({ top: $r('app.float.previous_one_content_margin') })
                  .maxLines(1)

                Row() {
                  Button(index === 0 ? HomeConstants.HOME_BUTTON_TEXT[1] : HomeConstants.HOME_BUTTON_TEXT[2])
                    .borderRadius($r('app.float.previous_one_button_radius'))
                    .backgroundColor($r('app.color.previous_one_button_origin'))
                    .fontWeight(CommonConstants.FONT_WEIGHT_500)
                    .fontSize(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
                      $r('app.float.previous_one_button_font_lg') : $r('app.float.previous_one_button_font'))
                    .fontColor(Color.White)
                    .height(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
                      $r('app.float.previous_one_button_height_lg') : $r('app.float.previous_one_button_height'))
                    .layoutWeight(1)

                  Blank()
                    .width(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_MD ?
                      $r('app.float.previous_blank_width_md') : $r('app.float.previous_blank_width'))

                  Button(HomeConstants.HOME_BUTTON_TEXT[3])
                    .borderRadius($r('app.float.previous_one_button_radius'))
                    .backgroundColor($r('app.color.button_background'))
                    .fontWeight(CommonConstants.FONT_WEIGHT_500)
                    .fontSize(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
                      $r('app.float.previous_one_button_font_lg') : $r('app.float.previous_one_button_font'))
                    .fontColor($r('app.color.previous_one_button_origin'))
                    .height(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
                      $r('app.float.previous_one_button_height_lg') : $r('app.float.previous_one_button_height'))
                    .layoutWeight(1)
                }
                .width(CommonConstants.FULL_PERCENT)
                .alignItems(VerticalAlign.Bottom)
                .layoutWeight(1)
              }
              .alignItems(HorizontalAlign.Start)
              .justifyContent(FlexAlign.Start)
              .layoutWeight(CommonConstants.FOUR)
            }
            .aspectRatio(CommonConstants.PREVIOUS_ONE_ROW_RATIO)
            .width(CommonConstants.FULL_PERCENT)
            .padding({
              top: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ?
                $r('app.float.previous_one_row_padding_sm'): $r('app.float.previous_one_row_padding'),
              bottom: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ?
                $r('app.float.previous_one_row_padding_sm'): $r('app.float.previous_one_row_padding'),
              left: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ?
                $r('app.float.previous_one_row_padding_sm'): $r('app.float.previous_one_row_padding'),
              right: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ?
                $r('app.float.previous_one_row_padding_sm'): $r('app.float.previous_one_row_padding')
            })
            .backgroundColor($r('app.color.home_component_background'))
            .borderRadius($r('app.float.card_radius'))
          }
        }, (item: VideoImage, index: number) => index + JSON.stringify(item))

        ForEach(this.previousVideoImgListTwo, (item: VideoImage, index: number) => {
          GridCol({
            span: {
              sm: BreakpointConstants.GRID_COLUMN_SPANS[6],
              md: BreakpointConstants.GRID_COLUMN_SPANS[4],
              lg: BreakpointConstants.GRID_COLUMN_SPANS[4]
            }
          }) {
            Column() {
              Image(item.getImgSrc())
                .width(CommonConstants.FULL_PERCENT)
                .aspectRatio(PreviousVideoUtil.getImgAspectRatio(this.currentBreakpoint, index))
                .objectFit(ImageFit.Fill)
              Column() {
                Text(item.getTitle())
                  .fontWeight(FontWeight.Normal)
                  .fontSize(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
                    $r('app.float.previous_two_title_font_lg') : $r('app.float.previous_two_title_font'))
                  .maxLines(1)
                  .lineHeight(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
                    $r('app.float.previous_two_title_line_lg') : $r('app.float.previous_two_title_line'))
                Text(item.getContent())
                  .fontWeight(FontWeight.Normal)
                  .fontSize(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
                    $r('app.float.previous_two_content_font_lg') : $r('app.float.previous_two_content_font'))
                  .margin({ top: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
                    $r('app.float.previous_two_content_margin_lg') : $r('app.float.previous_two_content_margin') })
                  .opacity(CommonConstants.TEXT_OPACITY[0])
                  .maxLines(1)
                  .lineHeight(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
                    $r('app.float.previous_two_content_line_lg') : $r('app.float.previous_two_content_line'))
              }
              .alignItems(HorizontalAlign.Start)
              .height(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
                $r('app.float.previous_two_column_height_lg') : $r('app.float.previous_two_column_height'))
              .width(CommonConstants.FULL_PERCENT)
              .padding({
                top: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
                  $r('app.float.previous_two_column_padding_lg') : $r('app.float.previous_two_column_padding'),
                bottom: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
                  $r('app.float.previous_two_column_bottom_lg') : $r('app.float.previous_two_column_bottom'),
                left: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
                  $r('app.float.previous_two_column_padding_lg') : $r('app.float.previous_two_column_padding'),
                right: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
                  $r('app.float.previous_two_column_padding_lg') : $r('app.float.previous_two_column_padding')
              })
            }
            .translate({ y: ((index === 2 || index === 3) && (this.currentBreakpoint ===
              BreakpointConstants.BREAKPOINT_MD)) ? HomeConstants.PREVIOUS_TWO_TRANSLATE_MD : '0'})
            .backgroundColor($r('app.color.home_component_background'))
            .borderRadius($r('app.float.previous_two_radius'))
          }
        }, (item: VideoImage, index: number) => index + JSON.stringify(item))
      }
      .onBreakpointChange((breakPoints) => {
        this.currentBreakpoint = breakPoints;
        this.previousVideoImgListTwo = new VideoImgViewModel().getPreviousVideoTwo(breakPoints);
      })
    }
    .padding({ left: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG && this.currentTopIndex === 2 ?
      $r('app.float.side_bar_width') : 0 })
  }
}