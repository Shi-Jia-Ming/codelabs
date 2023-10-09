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
import router from '@ohos.router';
import { SearchConstants } from '../constants/SearchConstants';
import { SearchVideoImg, SearchVideoImgModel } from '../viewmodel/SearchVideoImgViewModel';

@Component
export struct SearchResult {
  @StorageLink('currentBreakpoint') currentBreakpoint: string = BreakpointConstants.BREAKPOINT_LG;
  @State resultTabIndex: number = 0;

  build() {
    Scroll() {
      Column() {
        this.typeTabs()
        this.resultVideos()
      }
      .alignItems(HorizontalAlign.Start)
    }
    .scrollBar(BarState.Off)
  }

  @Builder
  typeTabs() {
    Row() {
      List() {
        ForEach(SearchConstants.SEARCH_RESULT_TAB_LIST, (item: string, index: number) => {
          ListItem() {
            Column() {
              Text(item)
                .fontSize($r('app.float.type_tabs_font'))
                .fontWeight(index === this.resultTabIndex ? CommonConstants.FONT_WEIGHT_500 : FontWeight.Normal)
                .fontColor(index === this.resultTabIndex ? $r('app.color.type_tabs_font_selected') :
                  $r('app.color.type_tabs_font'))
                .lineHeight($r('app.float.type_tabs_text_line'))
                .margin({ top: $r('app.float.type_tabs_text_margin') })

              Divider()
                .strokeWidth(SearchConstants.TYPE_TABS_DIVIDER_STROKE_WIDTH)
                .width(item.length === SearchConstants.SEARCH_INDEX[0] ? $r('app.float.type_tabs_divider_width_two') :
                  $r('app.float.type_tabs_divider_width_three'))
                .color($r('app.color.type_tabs_font_selected'))
                .margin({ top: $r('app.float.type_tabs_divider_margin') })
                .visibility(index === this.resultTabIndex ? Visibility.Visible : Visibility.None)
            }
            .width($r('app.float.type_tabs_col_width'))
            .height(CommonConstants.FULL_PERCENT)
            .margin({ right: index !== SearchConstants.SEARCH_RESULT_TAB_LIST.length - 1 ?
              $r('app.float.type_tabs_col_margin'): 0 })
            .onClick(() => {
              this.resultTabIndex = index;
            })
          }
        }, (item: string, index: number) => index + JSON.stringify(item))
      }
      .scrollBar(BarState.Off)
      .listDirection(Axis.Horizontal)

      Blank()

      Image($r('app.media.ic_public_sift'))
        .height($r('app.float.sift_img_size'))
        .width($r('app.float.sift_img_size'))
    }
    .alignItems(VerticalAlign.Center)
    .width(CommonConstants.FULL_PERCENT)
    .height($r('app.float.type_tabs_row_height'))
    .margin({ top: $r('app.float.type_tabs_row_margin') })
  }

  @Builder
  resultVideos() {
    Row() {
      Text(SearchConstants.SEARCH_RESULT_TITLE)
        .fontSize($r('app.float.search_result_font'))
        .fontWeight(CommonConstants.FONT_WEIGHT_500)
    }
    .height($r('app.float.search_result_row_height'))
    .margin({
      top: $r('app.float.search_result_row_margin'),
      bottom: $r('app.float.search_result_row_margin')
    })

    GridRow({
      columns: {
        sm: BreakpointConstants.GRID_ROW_COLUMNS[2],
        md: BreakpointConstants.GRID_ROW_COLUMNS[0],
        lg: BreakpointConstants.GRID_ROW_COLUMNS[1]
      },
      gutter: $r('app.float.grid_row_gutter')
    }){
      ForEach(new SearchVideoImgModel().getSearchResultImgList(), (item: SearchVideoImg, index: number) => {
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
                .fontSize(new BreakpointType($r('app.float.search_result_title_font_sm'),
                  $r('app.float.search_result_title_font_md'), $r('app.float.search_result_title_font_lg'))
                  .GetValue(this.currentBreakpoint))
                .fontWeight(CommonConstants.FONT_WEIGHT_500)
                .maxLines(2)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
              Text(item.getContent())
                .fontSize(new BreakpointType($r('app.float.search_result_content_font_sm'),
                  $r('app.float.search_result_content_font_md'), $r('app.float.search_result_content_font_lg'))
                  .GetValue(this.currentBreakpoint))
                .opacity(CommonConstants.TEXT_OPACITY[1])
                .fontWeight(FontWeight.Normal)
                .margin({ top: $r('app.float.search_result_content_margin') })
                .maxLines(1)
              Text(item.getOtherInfo())
                .fontSize(new BreakpointType($r('app.float.search_result_content_font_sm'),
                  $r('app.float.search_result_content_font_md'), $r('app.float.search_result_content_font_lg'))
                  .GetValue(this.currentBreakpoint))
                .opacity(CommonConstants.TEXT_OPACITY[1])
                .fontWeight(FontWeight.Normal)
                .margin({ top: $r('app.float.search_result_more_margin') })
                .maxLines(1)

              Row() {
                Button(SearchConstants.SEARCH_RESULT_BUTTON_TEXTS[0])
                  .backgroundColor($r('app.color.button_background_1'))
                  .fontWeight(CommonConstants.FONT_WEIGHT_500)
                  .borderRadius($r('app.float.search_result_button_radius'))
                  .fontSize(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
                    $r('app.float.search_result_button_font_lg') : $r('app.float.search_result_button_font'))
                  .height(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
                    $r('app.float.search_result_button_height_lg') : $r('app.float.search_result_button_height'))
                  .fontColor(Color.White)
                  .layoutWeight(1)
                  .onClick(() => {
                    router.pushUrl({
                      url: SearchConstants.VIDEO_DETAIL_URL,
                      params: {
                        currentTime: 0
                      }
                    })
                  })

                Blank()
                  .width(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_MD ?
                    $r('app.float.search_result_button_blank_md') : $r('app.float.search_result_button_blank'))

                Button(SearchConstants.SEARCH_RESULT_BUTTON_TEXTS[1])
                  .backgroundColor($r('app.color.button_background_2'))
                  .fontWeight(CommonConstants.FONT_WEIGHT_500)
                  .borderRadius($r('app.float.search_result_button_radius'))
                  .fontSize(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
                    $r('app.float.search_result_button_font_lg') : $r('app.float.search_result_button_font'))
                  .height(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
                    $r('app.float.search_result_button_height_lg') : $r('app.float.search_result_button_height'))
                  .fontColor($r('app.color.button_background_1'))
                  .layoutWeight(1)
              }
              .width(CommonConstants.FULL_PERCENT)
              .alignItems(VerticalAlign.Bottom)
              .layoutWeight(1)
            }
            .alignItems(HorizontalAlign.Start)
            .justifyContent(FlexAlign.Start)
            .layoutWeight(3)
          }
          .aspectRatio(CommonConstants.PREVIOUS_ONE_ROW_RATIO)
          .height(new BreakpointType($r('app.float.result_list_row_height_sm'),
            $r('app.float.result_list_row_height_md'), $r('app.float.result_list_row_height_lg'))
            .GetValue(this.currentBreakpoint))
          .width(CommonConstants.FULL_PERCENT)
          .padding({
            top: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ?
              $r('app.float.result_list_row_padding_sm') : $r('app.float.result_list_row_padding'),
            bottom: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ?
              $r('app.float.result_list_row_padding_sm') : $r('app.float.result_list_row_padding'),
            left: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ?
              $r('app.float.result_list_row_padding_sm') : $r('app.float.result_list_row_padding'),
            right: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ?
              $r('app.float.result_list_row_padding_sm') : $r('app.float.result_list_row_padding')
          })
          .backgroundColor($r('app.color.result_background'))
          .borderRadius($r('app.float.result_list_row_radius'))
        }
      }, (item: SearchVideoImg, index: number) => index + JSON.stringify(item))
    }
    .margin({ bottom: $r('app.float.result_grid_row_margin') })
  }
}