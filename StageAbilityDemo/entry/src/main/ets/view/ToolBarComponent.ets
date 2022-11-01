/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import ToolBarData from '../common/bean/ToolBarData';
import { AppFontSize, AppFontWeight, PERCENTAGE_100, ToolBarStyle } from '../common/constants/Constants';

@Component
export default struct ToolBarComponent {
  @Link navCurrentPosition: number;
  toolBarConfigs: ToolBarData[];
  controller: TabsController;

  build() {
    Column() {
      Divider()
        .backgroundColor(Color.Black)
        .height(ToolBarStyle.DIVIDER_HEIGHT)
        .opacity(ToolBarStyle.DIVIDER_OPACITY)
      Row() {
        ForEach(this.toolBarConfigs, (item, index) => {
          Column() {
            Image(this.navCurrentPosition === index ? item?.icon_after : item?.icon)
              .height(ToolBarStyle.IMAGE_SIZE)
              .margin({ bottom: ToolBarStyle.MARGIN_BOTTOM })
              .objectFit(ImageFit.Contain)
            Text(item?.text)
              .fontColor(this.navCurrentPosition === index ? $r('app.color.index_navigation_selected_text') : $r('app.color.text'))
              .fontWeight(AppFontWeight.BOLDER)
              .fontSize(AppFontSize.SMALLER)
              .textAlign(TextAlign.Center)
          }
          .width(ToolBarStyle.LAYOUT_WEIGHT)
          .onClick(() => {
            this.navCurrentPosition = item.num
            this.controller.changeIndex(this.navCurrentPosition)
          })
        })
      }
    }
    .backgroundColor(Color.White)
    .height(PERCENTAGE_100)
  }
}

