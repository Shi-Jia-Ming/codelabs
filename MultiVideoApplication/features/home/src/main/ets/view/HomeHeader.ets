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

@Component
export struct HomeHeader {
  @Link scrollHeight: number;
  @Link isSearching: boolean;
  @Link currentTopIndex: number;
  @StorageLink('currentBreakpoint') currentBreakpoint: string =  BreakpointConstants.BREAKPOINT_LG;

  build() {
    GridRow({
      columns: {
        sm: BreakpointConstants.GRID_ROW_COLUMNS[2],
        md: BreakpointConstants.GRID_ROW_COLUMNS[0],
        lg: BreakpointConstants.GRID_ROW_COLUMNS[0]
      }
    }) {
      GridCol({
        span: {
          sm: BreakpointConstants.GRID_COLUMN_SPANS[5],
          md: BreakpointConstants.GRID_COLUMN_SPANS[2],
          lg: BreakpointConstants.GRID_COLUMN_SPANS[2]
        }
      }) {
        this.TopTabBar()
      }
      .height($r('app.float.search_top_height'))

      GridCol({
        span: {
          sm: BreakpointConstants.GRID_COLUMN_SPANS[5],
          md: BreakpointConstants.GRID_COLUMN_SPANS[3],
          lg: BreakpointConstants.GRID_COLUMN_SPANS[3]
        }
      }) {
        this.searchBar()
      }
      .height($r('app.float.search_top_height'))
    }
    // The background color of the top tab bar is changed during the slide-down process.
    .backgroundColor(this.scrollHeight >= HomeConstants.BACKGROUND_CHANGE_HEIGHT && this.currentTopIndex === 2 ?
      $r('app.color.home_content_background') : $r('app.color.top_bar_background'))
    .padding({
      left: $r('app.float.search_top_padding'),
      right: $r('app.float.search_top_padding')
    })
  }

  @Builder
  TopTabBar() {
    Row() {
      Column() {
        List({
          space: new BreakpointType(HomeConstants.SEARCH_TAB_LIST_SPACES[0], HomeConstants.SEARCH_TAB_LIST_SPACES[1],
            HomeConstants.SEARCH_TAB_LIST_SPACES[2]).GetValue(this.currentBreakpoint)
        }) {
          ForEach(HomeConstants.TOP_TOPIC_LIST, (item: string, index: number) => {
            ListItem() {
              Column() {
                Text(item)
                  .fontSize(index === this.currentTopIndex ? $r('app.float.search_tab_font_selected') :
                    $r('app.float.search_tab_font'))
                  .fontWeight(index === this.currentTopIndex ? CommonConstants.FONT_WEIGHT_700 :
                    CommonConstants.FONT_WEIGHT_500)
                  .fontColor(this.currentTopIndex === 2 && this.currentBreakpoint ===
                    BreakpointConstants.BREAKPOINT_LG ? Color.White : $r('app.color.normal_font_color'))
              }
              .height(index === this.currentTopIndex ? $r('app.float.top_tab_list_height_selected') :
                $r('app.float.top_tab_list_height'))
            }
            .margin({
              top: this.currentTopIndex === index ? $r('app.float.top_tab_list_top_selected') :
                $r('app.float.top_tab_list_top'),
              bottom: this.currentTopIndex === index ? $r('app.float.top_tab_list_bottom_selected') :
                $r('app.float.top_tab_list_bottom')
            })
            .onClick(() => {
              this.currentTopIndex = index;
              this.scrollHeight = 0;
            })
          }, (item: number, index: number) => index + JSON.stringify(item))
        }
        .scrollBar(BarState.Off)
        .listDirection(Axis.Horizontal)
      }
      .alignItems(HorizontalAlign.Center)
      .layoutWeight(1)

      Image($r('app.media.ic_public_more'))
        .width($r('app.float.top_tab_img_size'))
        .height($r('app.float.top_tab_img_size'))
        .margin({ left: $r('app.float.top_tab_img_margin') })
        .visibility(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ? Visibility.Visible : Visibility.None)
    }
    .height($r('app.float.tab_size'))
    .width(CommonConstants.FULL_PERCENT)
  }

  @Builder
  searchBar() {
    Row() {
      Stack({ alignContent: Alignment.Start }) {
        TextInput({ placeholder: HomeConstants.SEARCH_PLACEHOLDER })
          .placeholderFont({
            size: $r('app.float.search_input_font'),
            weight: FontWeight.Normal
          })
          .placeholderColor(this.currentTopIndex === 2 && this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
            Color.White : $r('app.color.normal_font_color'))
          .height($r('app.float.search_input_height'))
          .fontSize($r('app.float.search_input_font'))
          .padding({
            left: $r('app.float.search_input_left'),
            right: $r('app.float.search_input_right')
          })
          .width(CommonConstants.FULL_PERCENT)
          .onClick(() => {
            this.isSearching = true;
          })
          .enableKeyboardOnFocus(false)

        // Search image.
        Image(this.currentTopIndex === 2 && this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
          $r("app.media.ic_public_search_white") : $r('app.media.ic_public_search'))
          .width($r('app.float.search_img_size'))
          .height($r('app.float.search_img_size'))
          .margin({ left: $r('app.float.search_img_left') })
      }
      .alignSelf(ItemAlign.Center)
      .layoutWeight(1)

      // History image.
      Image(this.currentTopIndex === 2 && this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
        $r('app.media.ic_public_history_white') : $r('app.media.ic_public_history'))
        .width($r('app.float.history_img_size'))
        .height($r('app.float.history_img_size'))
        .margin({ left: $r('app.float.history_img_left') })

      Image(this.currentTopIndex === 2 && this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
        $r('app.media.ic_public_more_white') : $r('app.media.ic_public_more'))
        .width($r('app.float.history_img_size'))
        .height($r('app.float.history_img_size'))
        .margin({ left: $r('app.float.history_img_left') })
        .visibility(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ? Visibility.None : Visibility.Visible)
    }
    .padding({ left: this.currentBreakpoint !== BreakpointConstants.BREAKPOINT_SM ?
      $r('app.float.search_bar_row_padding') : '0' })
    .justifyContent(FlexAlign.Center)
    .width(CommonConstants.FULL_PERCENT)
    .height(CommonConstants.FULL_PERCENT)
  }
}