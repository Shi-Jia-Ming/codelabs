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

import { AppConstants } from '../constants/AppConstants';
import { TabBarData, TabBarType, TabsInfo } from '../model/TabBarModel';

@Component
export struct CustomTabBar {
  @Link currentIndex: TabBarType;

  @Builder TabItem(index: TabBarType) {
    Column() {
      Image(this.currentIndex === index ? TabsInfo[index].activeIcon : TabsInfo[index].defaultIcon)
        .size(index === TabBarType.CHALLENGE ?
          { width: $r('app.float.tab_big_img_width'), height: $r('app.float.tab_big_img_height') } :
          { width: $r('app.float.tab_img_size'), height: $r('app.float.tab_img_size') })
        .margin({ top: index === TabBarType.CHALLENGE ? $r('app.float.tab_margin') : 0 })
      Text(TabsInfo[index].title)
        .fontSize($r('app.float.tab_font_size'))
        .margin({ top: $r('app.float.tab_title_margin') })
        .fontWeight(AppConstants.TAB_FONT_WEIGHT)
        .fontColor(index === this.currentIndex ? $r('app.color.theme_blue_color') : $r('app.color.tab_bar_color'))
    }
    .clip(false)
    .width(AppConstants.TAB_PERCENT)
    .height(AppConstants.FULL_PERCENT)
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.currentIndex = index;
    })
  }

  build() {
    Row() {
      ForEach(TabsInfo, (item: TabBarData) => {
        this.TabItem(item.id)
      })
    }
    .backgroundColor($r('app.color.hmos_light_white'))
    .border({
      width: { top: $r('app.float.tab_border_width') },
      color: $r('app.color.tab_border_color')
    })
    .margin({ top: $r('app.float.tool_bar_margin') })
    .clip(false)
    .height($r('app.float.tool_bar_height'))
    .width(AppConstants.FULL_PERCENT)
  }
}