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

import { HomeTabsItem, CommonConstants as Const } from '@ohos/common';
import { SwiperList } from '../viewmodel/HomeTabsModel';
import { RecentlyPlayed } from './RecentlyPlayedComponent';
import { Recommended } from './RecommendedComponent';

@Component
export struct HomeTabs {
  @Link currentBreakpoint: string;
  private scroller: Scroller = new Scroller();

  build() {
    Scroll(this.scroller) {
      GridRow({
        columns: { xs: Const.GRID_4, sm: Const.GRID_4, md: Const.GRID_8, lg: Const.GRID_12 },
        gutter: { x: $r('app.float.gutter_home') },
        breakpoints: { value: [Const.BREAKPOINTS_SM, Const.BREAKPOINTS_MD, Const.BREAKPOINTS_LG] }
      }) {
        GridCol({ span: { xs: Const.GRID_4, sm: Const.GRID_4, md: Const.GRID_8, lg: Const.GRID_12 } }) {
          Row() {
            Text($r('app.string.title_home'))
              .fontSize($r('app.float.title_font_size'))
              .fontWeight(Const.FONT_WEIGHT)
              .width(Const.FULL_SIZE)
              .margin({
                top: $r('app.float.home_title_margin'),
                bottom: $r('app.float.home_title_margin'),
                left: $r('app.float.home_title_margin')
              })
          }
        }
        .height($r('app.float.title_height'))
        .margin({ bottom: $r('app.float.home_margin1') })

        GridCol({ span: { xs: Const.GRID_4, sm: Const.GRID_4, md: Const.GRID_8, lg: Const.GRID_8 } }) {
          Search({ placeholder: Const.SEARCH_TEXT })
            .width(Const.FULL_SIZE)
            .height($r('app.float.home_search_height'))
            .margin({ bottom: $r('app.float.home_margin1') })
            .placeholderFont({ size: $r('app.float.home_search_size') })
        }
        .height($r('app.float.home_grid_height1'))

        GridCol({ span: { xs: Const.GRID_4, sm: Const.GRID_4, md: Const.GRID_8, lg: Const.GRID_12 } }) {
          Swiper() {
            ForEach(SwiperList, (item: HomeTabsItem) => {
              Stack({ alignContent: Alignment.TopStart }) {
                Image(item.img)
                  .width(Const.FULL_SIZE)
                  .height(Const.FULL_SIZE)
                  .borderRadius($r('app.float.home_swiper_radius'))
                  .objectFit(ImageFit.Cover)

                Column() {
                  Text(item.title)
                    .fontSize($r('app.float.home_text_size1'))
                    .fontColor(Color.White)
                    .margin({ bottom: $r('app.float.home_text_margin_1') })
                  Text(item.intro)
                    .fontSize($r('app.float.home_text_size3'))
                    .fontColor(Color.White)
                    .opacity(Const.OPACITY)
                }
                .alignItems(HorizontalAlign.Start)
                .margin({ top: $r('app.float.home_text_margin_3'), left: $r('app.float.home_text_margin_2') })
              }
            }, item => JSON.stringify(item))
          }
          .height($r('app.float.home_swiper_height'))
          .itemSpace(Const.ITEM_SPACE)
          .autoPlay(true)
          .displayCount(this.currentBreakpoint === Const.LG ?
          Const.NUM_3 : (this.currentBreakpoint === Const.MD ? Const.NUM_2 : Const.NUM_1))
        }
        .height($r('app.float.home_grid_height2'))

        GridCol({ span: { xs: Const.GRID_4, sm: Const.GRID_4, md: Const.GRID_8, lg: Const.GRID_12 } }) {
          RecentlyPlayed()
        }
        .height($r('app.float.home_grid_height3'))

        GridCol({ span: { xs: Const.GRID_4, sm: Const.GRID_4, md: Const.GRID_8, lg: Const.GRID_12 } }) {
          Recommended()
        }
        .height($r('app.float.home_column_height'))
      }
      .height(Const.FULL_SIZE)
    }
    .width(Const.FULL_SIZE)
    .height(Const.FULL_SIZE)
    .align(Alignment.TopStart)
    .scrollBar(BarState.Off)
  }
}