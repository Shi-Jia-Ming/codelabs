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

import BreakpointSystem from '../common/utils/BreakpointSystem';
import { HomeTabComponent } from '../view/HomeTabContent';
import { BottomTabs } from '../view/BottomTabsComponent';
import Const from '../common/constants/CommonConstants';

@Entry
@Component
struct HomeComponent {
  @State bottomTabIndex: number = 0;
  @StorageProp('currentBreakpoint') currentBreakpoint: string = 'md';
  private breakpointSystem: BreakpointSystem = new BreakpointSystem();
  private controller: TabsController = new TabsController();

  aboutToAppear(){
    this.breakpointSystem.register();
  }

  aboutToDisappear() {
    this.breakpointSystem.unregister();
  }

  build() {
    Stack({ alignContent: Alignment.BottomStart }) {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.End, justifyContent: FlexAlign.End }) {
        Tabs({ barPosition: BarPosition.End, index: 0, controller: this.controller }) {
          TabContent() {
            HomeTabComponent()
          }
          .padding({ left: $r('app.float.home_padding'), right: $r('app.float.home_padding')})

          TabContent() {
          }

          TabContent() {
          }

          TabContent() {
          }
        }
        .onChange((index: number) => {
          this.bottomTabIndex = index;
        })
        .width(Const.FULL_SIZE)
        .vertical(false)
        .barHeight(0)
        .scrollable(false)
        BottomTabs({ bottomTabIndex: $bottomTabIndex })
      }
      .width(Const.FULL_SIZE)
      .layoutWeight(Const.LAYOUT_WEIGHT)
      .backgroundColor($r('app.color.background_color'))
    }
    .width(Const.FULL_SIZE).height(Const.FULL_SIZE)
  }
}