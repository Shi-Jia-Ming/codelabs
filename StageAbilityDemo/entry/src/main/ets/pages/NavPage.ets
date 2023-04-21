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

import HomePage from '../view/home/HomePage';
import NavViewModel from '../viewmodel/NavViewModel';
import ToolBarData from '../common/bean/ToolBarData';
import ToolBarComponent from '../view/ToolBarComponent';
import { AppFontSize, NavPageStyle, PERCENTAGE_100 } from '../common/constants/Constants';

const HOME: number = 0;
let viewModel: NavViewModel = new NavViewModel();

@Extend(Navigation) function setNavStyle() {
  .hideTitleBar(true)
  .width(PERCENTAGE_100)
  .height(PERCENTAGE_100)
}

@Extend(Tabs) function setTabStyle() {
  .barHeight(NavPageStyle.BAR_HEIGHT)
  .scrollable(false)
}

@Entry
@Component
struct NavPage {
  @State toolBarConfigs: ToolBarData[] = []; // bottom navigation data.
  navCurrentPosition: number = NavPageStyle.POSITION_INITIAL;
  private controller: TabsController = new TabsController();

  aboutToAppear() {
    this.toolBarConfigs = viewModel.loadNavigationTab();
  }

  build() {
    Navigation() {
      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        ForEach(this.toolBarConfigs, (item: ToolBarData, index) => {
          TabContent() {
            if (index === HOME) {
              HomePage()
            } else {
              this.HolderPage(item?.text)
            }
          }
        }, item => JSON.stringify(item))
      }.setTabStyle()
    }
    .toolBar(this.ToolBarBuilder())
    .setNavStyle()
  }

  @Builder ToolBarBuilder() {
    ToolBarComponent({
      controller: this.controller,
      toolBarConfigs: this.toolBarConfigs,
      navCurrentPosition: this.navCurrentPosition
    })
      .backgroundColor(Color.White)
      .height(PERCENTAGE_100)
  }

  @Builder HolderPage(text: Resource) {
    Column() {
      Text(text)
        .fontSize(AppFontSize.LARGER)
        .backgroundColor(Color.White)
        .height(PERCENTAGE_100)
        .width(PERCENTAGE_100)
        .textAlign(TextAlign.Center)
    }.justifyContent(FlexAlign.Center)
  }
}
