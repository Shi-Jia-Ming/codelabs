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
import { SearchConstants } from '../constants/SearchConstants';
import { SearchVideoImg } from '../viewmodel/SearchVideoImgViewModel';

@Component
export struct SearchContent {
  @StorageLink('currentBreakpoint') currentBreakpoint: string = BreakpointConstants.BREAKPOINT_LG;
  @State currentIndex: number = 0;
  @Link searchVideoList: SearchVideoImg[];

  build() {
    Scroll() {
      Column() {
        this.searchHistory()
        this.searchRecommend()
        this.searchHotTrending()
      }
      .alignItems(HorizontalAlign.Start)
      .width(CommonConstants.FULL_PERCENT)
    }
    .scrollable(ScrollDirection.Vertical)
    .scrollBar(BarState.Off)
  }

  @Builder
  searchHistory() {
    Row() {
      Text(SearchConstants.SEARCH_SUB_TITLES[0])
        .fontSize($r('app.float.search_history_title_font'))
        .fontWeight(CommonConstants.FONT_WEIGHT_500)
      Blank()
      Image($r('app.media.ic_public_delete'))
        .height($r('app.float.search_history_img_size'))
        .width($r('app.float.search_history_img_size'))
    }
    .margin({ top: $r('app.float.search_history_title_margin') })
    .width(CommonConstants.FULL_PERCENT)
    .height($r('app.float.search_history_title_height'))

    Row() {
      Text(SearchConstants.SEARCH_SUB_TITLES[1])
        .fontSize($r('app.float.search_history_content_font'))
        .fontWeight(CommonConstants.FONT_WEIGHT_500)
    }
    .width(CommonConstants.FULL_PERCENT)
    .height($r('app.float.search_history_content_height'))
    .margin({ top: $r('app.float.search_history_content_margin') })
  }

  @Builder
  searchRecommend() {
    Row() {
      Text(SearchConstants.SEARCH_SUB_TITLES[2])
        .fontSize($r('app.float.search_history_title_font'))
        .fontWeight(CommonConstants.FONT_WEIGHT_500)
      Blank()
      Image($r('app.media.ic_public_rotate'))
        .height($r('app.float.search_recommend_img_size'))
        .width($r('app.float.search_recommend_img_size'))
        .margin({ right: $r('app.float.search_recommend_img_margin') })
        .fillColor($r('app.color.type_tabs_font_selected'))
      Text(SearchConstants.ANOTHER_BATCH)
        .fontSize($r('app.float.search_recommend_tips'))
        .fontWeight(FontWeight.Normal)
        .opacity(CommonConstants.TEXT_OPACITY[2])
    }
    .height($r('app.float.search_recommend_row_height'))
    .width(CommonConstants.FULL_PERCENT)
    .margin({ top: $r('app.float.search_recommend_img_margin') })

    List() {
      ForEach(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ? SearchConstants.SEARCH_RECOMMEND_LARGE :
        SearchConstants.SEARCH_RECOMMEND_LARGE.slice(0, 6), (item: string, index: number) => {
        ListItem() {
          Column() {
            Row() {
              Text(item)
                .fontSize($r('app.float.search_recommend_list_font'))
                .fontWeight(CommonConstants.FONT_WEIGHT_500)
            }
            .width(CommonConstants.FULL_PERCENT)
            .height($r('app.float.search_recommend_list_row_height'))

            Divider()
              .color(Color.Black)
              .height($r('app.float.search_recommend_list_divider_height'))
              .opacity(CommonConstants.DIVIDER_OPACITY)
              .width(CommonConstants.FULL_PERCENT)
          }
          .padding({ right: this.getDividerPadding(this.currentBreakpoint, index) })
          .height($r('app.float.search_recommend_list_column_height'))
          .width(CommonConstants.FULL_PERCENT)
        }
      }, (item: string, index: number) => index + JSON.stringify(item))
    }
    .width(CommonConstants.FULL_PERCENT)
    .lanes(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ? SearchConstants.SEARCH_LIST_LANES[0] :
      SearchConstants.SEARCH_LIST_LANES[1])
  }

  @Builder
  searchHotTrending() {
    List({ space: new BreakpointType(SearchConstants.HOT_TRENDING_LIST_SPACES[0],
      SearchConstants.HOT_TRENDING_LIST_SPACES[1], SearchConstants.HOT_TRENDING_LIST_SPACES[2],)
      .GetValue(this.currentBreakpoint) }) {
      ForEach(SearchConstants.SEARCH_TABS, (item: string, index: number) => {
        ListItem() {
          Row() {
            Text(item)
              .fontSize(index === this.currentIndex ? $r('app.float.hot_trending_font_selected') :
                $r('app.float.hot_trending_font'))
              .lineHeight(index === this.currentIndex ? $r('app.float.hot_trending_line_selected') :
                $r('app.float.hot_trending_line'))
              .fontWeight(CommonConstants.FONT_WEIGHT_500)
              .opacity(index !== this.currentIndex ? CommonConstants.TEXT_OPACITY[2] : CommonConstants.TEXT_OPACITY[3])
          }
          .height($r('app.float.hot_trending_tab_height'))
          .alignItems(VerticalAlign.Center)
        }
        .onClick(() => {
          this.currentIndex = index;
        })
      })
    }
    .listDirection(Axis.Horizontal)
    .scrollBar(BarState.Off)

    List({ space: SearchConstants.HOT_TRENDING_LIST_SPACES[1] }) {
      ForEach(this.searchVideoList, (item: SearchVideoImg, index: number) => {
        ListItem() {
          Row() {
            Image(item.getImgSrc())
              .height(CommonConstants.FULL_PERCENT)
              .width($r('app.float.hot_video_img_width'))
              .margin({ right: $r('app.float.hot_video_img_margin') })

            Column() {
              Text(item.getTitle())
                .fontSize($r('app.float.hot_video_title_font'))
                .fontWeight(CommonConstants.FONT_WEIGHT_500)
                .maxLines(1)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
              Text(item.getContent())
                .fontSize($r('app.float.hot_video_content_font'))
                .fontWeight(FontWeight.Normal)
                .opacity(CommonConstants.TEXT_OPACITY[0])
                .maxLines(1)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
            }
            .height(CommonConstants.FULL_PERCENT)
            .layoutWeight(1)
            .justifyContent(FlexAlign.SpaceEvenly)
            .alignItems(HorizontalAlign.Start)
          }
          .width(CommonConstants.FULL_PERCENT)
          .height(CommonConstants.FULL_PERCENT)
        }
        .height($r('app.float.hot_video_row_height'))
      }, (item: SearchVideoImg, index: number) => index + JSON.stringify(item))
    }
    .width(CommonConstants.FULL_PERCENT)
    .height($r('app.float.hot_video_list_height'))
    .lanes(new BreakpointType(SearchConstants.SEARCH_LIST_LANES[2], SearchConstants.SEARCH_LIST_LANES[1],
      SearchConstants.SEARCH_LIST_LANES[0]).GetValue(this.currentBreakpoint), $r('app.float.hot_video_list_lane_space'))
    .padding({
      top: $r('app.float.hot_video_list_padding'),
      bottom: $r('app.float.hot_video_list_padding')
    })
  }

  getDividerPadding(breakpoint: string, index: number): string {
    if (breakpoint === BreakpointConstants.BREAKPOINT_LG) {
      if (index % SearchConstants.SEARCH_LIST_LANES[0] !== 2) {
        return SearchConstants.SEARCH_RECOMMEND_DIVIDER_PADDING;
      }
    } else {
      if (index % SearchConstants.SEARCH_LIST_LANES[1] === 0) {
        return SearchConstants.SEARCH_RECOMMEND_DIVIDER_PADDING;
      }
    }
    return '0';
  }
}