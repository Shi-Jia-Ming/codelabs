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

import NewsList from '../view/newslist';
import { CommonConstant as Const } from '../common/constant/CommonConstant';
import NewsViewModel, { NewsTypeBean } from '../viewmodel/NewsViewModel';

/**
 * The tabBar component.
 */
@Component
export default struct TabBar {
  @State tabBarArray: NewsTypeBean[] = NewsViewModel.getDefaultTypeList();
  @State currentIndex: number = 0;
  @State currentPage: number = 1;

  @Builder TabBuilder(index: number) {
    Column() {
      Text(this.tabBarArray[index].name)
        .height(Const.FULL_HEIGHT)
        .padding({ left: Const.TabBars_HORIZONTAL_PADDING, right: Const.TabBars_HORIZONTAL_PADDING })
        .fontSize(this.currentIndex === index ? Const.TabBars_SELECT_TEXT_FONT_SIZE : Const.TabBars_UN_SELECT_TEXT_FONT_SIZE)
        .fontWeight(this.currentIndex === index ? Const.TabBars_SELECT_TEXT_FONT_WEIGHT : Const.TabBars_UN_SELECT_TEXT_FONT_WEIGHT)
        .fontColor($r('app.color.fontColor_text3'))
    }
  }

  aboutToAppear() {
    // Request news category.
    NewsViewModel.getNewsTypeList().then((typeList: NewsTypeBean[]) => {
      this.tabBarArray = typeList;
    }).catch((typeList: NewsTypeBean[]) => {
      this.tabBarArray = typeList;
    });
  }

  build() {
    Tabs() {
      ForEach(this.tabBarArray, (tabsItem: NewsTypeBean) => {
        TabContent() {
          Column() {
            NewsList({ currentIndex: $currentIndex })
          }
        }
        .tabBar(this.TabBuilder(tabsItem.id))
      }, (item: NewsTypeBean) => JSON.stringify(item));
    }
    .barHeight(Const.TabBars_BAR_HEIGHT)
    .barMode(BarMode.Scrollable)
    .barWidth(Const.TabBars_BAR_WIDTH)
    .onChange((index: number) => {
      this.currentIndex = index;
      this.currentPage = 1;
    })
    .vertical(false)
  }
}