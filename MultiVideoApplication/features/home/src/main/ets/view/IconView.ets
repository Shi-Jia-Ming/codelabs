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
export struct IconView {
  @StorageLink('currentBreakpoint') currentBreakpoint: string = BreakpointConstants.BREAKPOINT_LG;
  @Prop currentTopIndex: number = 0;
  @State currentDotIndex: number = 2;
  private iconList: string[] = HomeConstants.ICON_LIST;
  private dotIndicatorList: number[] = HomeConstants.DOT_INDICATOR_NUMBER;

  build() {
    // Icon swiper.
    Column() {
      Swiper() {
        ForEach(this.iconList, (item: string) => {
          Column() {
            Image($r('app.media.ic_entrance'))
              .width($r('app.float.icon_img_size'))
              .height($r('app.float.icon_img_size'))
              .margin({ bottom: $r('app.float.icon_img_bottom_margin') })
            Text(item)
              .fontSize($r('app.float.icon_list_font_size'))
              .fontWeight(FontWeight.Normal)
          }
          .alignItems(HorizontalAlign.Center)
          .height($r('app.float.icon_list_height'))
        }, (item: string) => JSON.stringify(item))
      }
      // The number of different breakpoints is different.
      .displayCount(new BreakpointType(HomeConstants.FIVE, HomeConstants.SIX, HomeConstants.NINE)
        .GetValue(this.currentBreakpoint))
      .indicator(false)
      .width(CommonConstants.FULL_PERCENT)
      .loop(false)
      .onChange((index: number) => {
        this.currentDotIndex = index;
      })
      .index(this.currentDotIndex)
      .effectMode(EdgeEffect.None)
      .displayMode(SwiperDisplayMode.AUTO_LINEAR)

      // Set the navigation point.
      Row() {
        ForEach(this.dotIndicatorList, (item: number, index: number) => {
          Image('')
            .backgroundColor(this.currentDotIndex === index ? $r('app.color.swiper_indicator_color_selected') :
              $r('app.color.swiper_indicator_color'))
            .width(this.currentDotIndex === index ? $r('app.float.swiper_indicator_width_selected') :
              $r('app.float.swiper_indicator_size'))
            .height($r('app.float.swiper_indicator_size'))
            .borderRadius($r('app.float.swiper_indicator_radius'))
            .margin({ right: $r('app.float.swiper_indicator_margin') })
        }, (item: number, index: number) => index + JSON.stringify(item))
      }
      .height($r('app.float.swiper_row_height'))
      .width(CommonConstants.FULL_PERCENT)
      .justifyContent(FlexAlign.Center)
      .visibility(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ? Visibility.None : Visibility.Visible)
    }
    .padding({
      left: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ? $r('app.float.icon_list_column_padding_sm') :
        $r('app.float.icon_list_column_padding'),
      right: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ? $r('app.float.icon_list_column_padding_sm') :
        $r('app.float.icon_list_column_padding')
    })
    .margin({ top: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ?
      $r('app.float.icon_list_column_margin_sm') : $r('app.float.icon_list_column_margin') })
    .visibility(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG && this.currentTopIndex === 2 ?
      Visibility.None : Visibility.Visible)
  }
}