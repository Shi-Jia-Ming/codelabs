/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License,Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { searchSwiper, classifyTitle, swiperImage, activityTitle, ActivityTitleModel } from '../viewmodel/HomeData';
import { LocalDataManager, CommodityList, Commodity, StyleConstants, BreakpointConstants } from '@ohos/common';

@Component
export struct Home {
  @StorageProp('currentBreakpoint') currentBreakpoint: string = 'sm';
  @State commodityList: Commodity[] = [];
  @State titleIndex: number = 0;
  @State activityTitleIndex: number = 0;
  private localDataManger: LocalDataManager = LocalDataManager.instance();
  private onClickItem = (Commodity: Commodity) => {};

  aboutToAppear() {
    this.commodityList = this.localDataManger.queryCommodityList();
  }

  @Builder
  SearchTitle() {
    Column() {
      Flex({ justifyContent: FlexAlign.SpaceBetween }) {
        Image($r('app.media.ic_eshop'))
          .height(StyleConstants.FULL_HEIGHT)
          .aspectRatio(1)
        Image($r('app.media.ic_scan'))
          .height(StyleConstants.FULL_HEIGHT)
          .aspectRatio(1)
      }
      .height($r('app.float.vp_twenty_four'))
      .width(StyleConstants.FULL_WIDTH)
      .margin({ bottom: $r('app.float.vp_eight') })

      Row() {
        Image($r('app.media.ic_search'))
          .width($r('app.float.vp_twenty'))
          .height($r('app.float.vp_twenty'))
          .margin({
            left: $r('app.float.vp_twelve'),
            right: $r('app.float.vp_eight')
          })
        Swiper() {
          ForEach(searchSwiper, (item: Resource) => {
            Column() {
              Text(item)
                .fontSize($r('app.float.small_font_size'))
                .fontColor(Color.Black)
            }
            .alignItems(HorizontalAlign.Start)
          }, (item: Resource) => JSON.stringify(item))
        }
        .autoPlay(true)
        .loop(true)
        .vertical(true)
        .indicator(false)
      }
      .height($r('app.float.search_swiper_height'))
      .width(StyleConstants.FULL_WIDTH)
      .borderRadius($r('app.float.vp_twenty'))
      .backgroundColor(Color.White)
    }
    .width(StyleConstants.FULL_WIDTH)
    .padding({ top: $r('app.float.vp_twelve'), bottom: $r('app.float.vp_twelve') })
  }

  @Builder
  ClassifyTitle() {
    Flex({ justifyContent: FlexAlign.SpaceBetween }) {
      ForEach(classifyTitle, (item: Resource, index?: number) => {
        Text(item)
          .fontSize($r('app.float.middle_font_size'))
          .opacity(this.titleIndex === index ? StyleConstants.FULL_OPACITY : StyleConstants.EIGHTY_OPACITY)
          .fontWeight(this.titleIndex === index ? StyleConstants.FONT_WEIGHT_SEVEN : StyleConstants.FONT_WEIGHT_FOUR)
          .fontColor(Color.White)
          .onClick(() => {
            if (index !== undefined) {
              this.titleIndex = index;
            }
          })
      }, (item: Resource) => JSON.stringify(item))
      Row() {
        Image($r('app.media.ic_split_line'))
          .width($r('app.float.vp_one'))
          .height($r('app.float.vp_fourteen'))
        Image($r('app.media.ic_more'))
          .width($r('app.float.vp_sixteen'))
          .height($r('app.float.vp_sixteen'))
          .margin({
            left: $r('app.float.vp_two'),
            right: $r('app.float.vp_two')
          })
        Text($r('app.string.title_bar_classification'))
          .fontSize($r('app.float.middle_font_size'))
          .fontColor(Color.White)
          .opacity(this.titleIndex === undefined ? StyleConstants.FULL_OPACITY : StyleConstants.EIGHTY_OPACITY)
          .fontWeight(this.titleIndex === undefined ?
          StyleConstants.FONT_WEIGHT_SEVEN : StyleConstants.FONT_WEIGHT_FOUR)
      }
      .onClick(() => {
        this.titleIndex = 0;
      })
    }
    .margin({ top: $r('app.float.vp_eight') })
    .width(StyleConstants.FULL_WIDTH)
  }

  @Builder
  CustomSwiper() {
    Swiper() {
      ForEach(swiperImage, (item: Resource) => {
        Image(item)
          .width(StyleConstants.FULL_WIDTH)
          .aspectRatio(StyleConstants.IMAGE_ASPECT_RATIO)
          .borderRadius($r('app.float.vp_sixteen'))
          .backgroundColor(Color.White)
      }, (item: Resource) => JSON.stringify(item))
    }
    .indicatorStyle({ selectedColor: $r('app.color.indicator_select') })
    .autoPlay(true)
    .itemSpace(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ? 0 : StyleConstants.ITEM_SPACE)
    .width(StyleConstants.FULL_WIDTH)
    .indicator(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM)
    .displayCount(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ? StyleConstants.DISPLAY_THREE :
      (this.currentBreakpoint === BreakpointConstants.BREAKPOINT_MD ? StyleConstants.DISPLAY_TWO :
      StyleConstants.DISPLAY_ONE))
    .margin({ top: $r('app.float.vp_twelve'), bottom: $r('app.float.vp_twelve') })
  }

  @Builder
  ActivityTitle() {
    Flex({ justifyContent: FlexAlign.SpaceAround }) {
      ForEach(activityTitle, (item: ActivityTitleModel, index?: number) => {
        Flex({
          direction: FlexDirection.Column,
          justifyContent: FlexAlign.Center,
          alignItems: ItemAlign.Center
        }) {
          Text(item.title)
            .fontSize($r('app.float.small_font_size'))
            .fontWeight(StyleConstants.FONT_WEIGHT_FIVE)
            .fontColor(Color.Black)
          Text(item.desc)
            .fontSize($r('app.float.smaller_font_size'))
            .fontWeight(StyleConstants.FONT_WEIGHT_FOUR)
            .fontColor(this.activityTitleIndex === index ? $r('app.color.focus_color') : Color.Black)
            .opacity(this.activityTitleIndex === index ? StyleConstants.FULL_OPACITY : StyleConstants.SIXTY_OPACITY)
        }
        .onClick(() => {
          if (index !== undefined) {
            this.activityTitleIndex = index;
          }
        })
        .height(StyleConstants.FULL_HEIGHT)
      }, (item: ActivityTitleModel) => JSON.stringify(item))
    }
    .height($r('app.float.activity_title_height'))
    .width(StyleConstants.FULL_WIDTH)
    .padding($r('app.float.vp_twelve'))
    .margin({ bottom: $r('app.float.vp_six'), top: $r('app.float.vp_six') })
    .backgroundColor($r('app.color.page_background'))
    .borderRadius($r('app.float.vp_sixteen'))
  }

  build() {
    Stack({ alignContent: Alignment.Top }) {
      Image($r('app.media.ic_app_background'))
        .width(StyleConstants.FULL_WIDTH)
        .height($r('app.float.image_background_height'))
        .objectFit(ImageFit.Auto)
      Flex({ direction: FlexDirection.Column }) {
        this.SearchTitle()
        Scroll() {
          Column() {
            this.ClassifyTitle()
            this.CustomSwiper()
            this.ActivityTitle()

            CommodityList({
              commodityList: $commodityList,
              column: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ? StyleConstants.DISPLAY_FOUR :
                (this.currentBreakpoint === BreakpointConstants.BREAKPOINT_MD ?
                StyleConstants.DISPLAY_THREE : StyleConstants.DISPLAY_TWO),
              onClickItem: (data: Commodity): void => this.onClickItem(data)
            })
          }
        }
        .scrollBar(BarState.Off)
      }
      .padding({ left: $r('app.float.vp_twelve'), right: $r('app.float.vp_twelve') })
    }
  }
}
