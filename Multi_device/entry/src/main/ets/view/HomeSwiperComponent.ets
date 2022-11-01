/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { SwiperList } from '../viewmodel/HomeSwiperModel';
import Const from '../common/constants/CommonConstants';

@Component
export struct HomeSwiper {
  @StorageProp('currentBreakpoint') currentBreakpoint: string = 'md';
  private index: number = 0;

  build() {
    Swiper() {
      ForEach(SwiperList, item => {
        Stack({ alignContent: Alignment.TopStart }) {
          Image(item.img)
            .width(Const.FULL_SIZE)
            .height(Const.FULL_SIZE)
            .borderRadius(Const.BORDER_RADIUS)
            .objectFit(ImageFit.Cover)

          Column() {
            Text($r('app.string.swiper_title'))
              .fontSize($r('app.float.swiper_title_size'))
              .fontColor(Color.White)
              .opacity(Const.SWIPER_FONT_OPACITY)
              .margin({ bottom: $r('app.float.swiper_bottom_margin') })

            Text(item.title)
              .fontSize($r('app.float.swiper_font_size'))
              .fontColor(Color.White)
              .fontWeight(FontWeight.Bold)
          }
          .alignItems(HorizontalAlign.Start)
          .margin({ left: $r('app.float.swiper_left_margin'), top: $r('app.float.swiper_top_margin') })
        }
        .width(Const.FULL_SIZE)
        .height(Const.FULL_SIZE)
      })
    }
    .width(Const.FULL_SIZE)
    .height(Const.SWIPER_HEIGHT)
    .indicator(true)
    .indicatorStyle({ color: $r('app.color.swiper_indicator_color'), selectedColor: Color.White })
    .index(this.index)
    .autoPlay(true)
    .itemSpace(Const.ITEM_SPACE)
    .displayCount(this.currentBreakpoint === 'sm' ?
                  Const.SWIPER_COUNT_1:
                  (this.currentBreakpoint === 'md') ? Const.SWIPER_COUNT_2: Const.SWIPER_COUNT_3)
    .margin({ bottom: Const.SWIPER_MARGIN })
  }
}