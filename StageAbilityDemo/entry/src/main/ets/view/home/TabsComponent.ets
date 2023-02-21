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

import { AppFontSize, AppFontWeight, PERCENTAGE_100, Text_Margin } from '../../common/constants/Constants';
import { GoodsTabs } from '../../common/constants/HomeConstants';

@Component
export default struct TabsComponent {
  private tabMenus: Resource[];

  build() {
    Row() {
      Tabs({ barPosition: BarPosition.Start, }) {
        ForEach(this.tabMenus, (item, index) => {
          TabContent() {
          }
          .tabBar(this.TabBuilder(index))
        }, item => JSON.stringify(item))
      }
      .vertical(false)
      .scrollable(true)
      .barMode(BarMode.Scrollable)
      .barHeight(PERCENTAGE_100)
      .animationDuration(GoodsTabs.TIME)
      .width(GoodsTabs.TAB_WIDTH)

      Row() {
        Image($rawfile('index/tab_menu_setting.png'))
          .width(GoodsTabs.IMAGE_SIZE_WIDTH)
          .height(GoodsTabs.IMAGE_SIZE_HEIGHT)
        Blank()
          .width(GoodsTabs.SETTING_BLANK_WIDTH)
        Text($r('app.string.homepage_tab_more'))
          .fontSize(AppFontSize.MIDDLE)
          .fontColor(Color.White)
          .fontWeight(AppFontWeight.BOLD)
      }
      .width(GoodsTabs.SETTING_LAYOUT)
      .height(PERCENTAGE_100)
    }
    .width(PERCENTAGE_100)
    .padding({ right: GoodsTabs.PADDING_RIGHT })
    .height(GoodsTabs.BAR_HEIGHT)
  }

  @Builder TabBuilder(position: number) {
    Column() {
      Text(this.tabMenus[position])
        .fontColor(this.isIndexPageWithinTabs(position) ? Color.White : Color.White)
        .fontWeight(this.isIndexPageWithinTabs(position) ? FontWeight.Bold : FontWeight.Normal)
        .fontSize(AppFontSize.MIDDLE)
    }
    .height(PERCENTAGE_100)
    .margin({left:Text_Margin})
    .justifyContent(FlexAlign.Center)
    .align(Alignment.Start)
  }

  isIndexPageWithinTabs(position): boolean {
    return GoodsTabs.TABVIEW_POSITION_INDEX_PAGE === position;
  }
}