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

import { BreakpointSystem, CommonConstants as Const } from '@ohos/common';
import { BottomTabs } from '../view/BottomTabsComponent';
import { LeftTabs } from '../view/LeftTabsComponent';
import { HomeTabs } from '../view/HomeTabsComponent';
import { FindTabs } from '../view/FindTabsComponent';
import { DriveTabs } from '../view/DriveTabsComponent';
import { MineTabs } from '../view/MineTabsComponent';

@Entry
@Component
struct MainPage {
  @State @Watch('onIndexChange') bottomTabIndex: number = 0;
  @StorageProp('currentBreakpoint') currentBreakpoint: string = Const.MD;
  private breakpointSystem: BreakpointSystem = new BreakpointSystem();
  private controller: TabsController = new TabsController();

  aboutToAppear(){
    this.breakpointSystem.register();
  }

  aboutToDisappear() {
    this.breakpointSystem.unregister();
  }

  onIndexChange() {
    this.controller.changeIndex(this.bottomTabIndex);
  }

  build() {
    SideBarContainer(SideBarContainerType.Embed) {
      LeftTabs({ bottomTabIndex: $bottomTabIndex });

      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.End, justifyContent: FlexAlign.End }) {
        Tabs({ barPosition: BarPosition.End, index: 0, controller: this.controller }) {
          TabContent() {
            HomeTabs({ currentBreakpoint: $currentBreakpoint })
          }
          .padding({
            left: this.currentBreakpoint === Const.SM ? $r('app.float.main_page_padding1') : (this.currentBreakpoint === Const.MD ? $r('app.float.main_page_padding3') : 0),
            right: this.currentBreakpoint === Const.SM ? $r('app.float.main_page_padding1') : $r('app.float.main_page_padding3')
          })

          TabContent() {
            FindTabs()
          }
          .padding({
            left: this.currentBreakpoint === Const.SM ? $r('app.float.main_page_padding2') : (this.currentBreakpoint === Const.MD ? $r('app.float.main_page_padding3') : 0),
            right: this.currentBreakpoint === Const.SM ? $r('app.float.main_page_padding2') : $r('app.float.main_page_padding3')
          })

          TabContent() {
            DriveTabs()
          }
          .padding({
            left: this.currentBreakpoint === Const.SM ? $r('app.float.main_page_padding1') : (this.currentBreakpoint === Const.MD ? $r('app.float.main_page_padding3') : 0),
            right: this.currentBreakpoint === Const.SM ? $r('app.float.main_page_padding1') : $r('app.float.main_page_padding3')
          })

          TabContent() {
            MineTabs()
          }
        }
        .onChange((index: number) => {
          this.bottomTabIndex = index;
        })
        .width(Const.FULL_SIZE)
        .vertical(false)
        .barHeight(0)

        if (this.currentBreakpoint !== Const.LG) {
          BottomTabs({ bottomTabIndex: $bottomTabIndex })
        }
      }
      .width(Const.FULL_SIZE)
      .backgroundColor($r('app.color.background_color'))
    }
    .showSideBar(this.currentBreakpoint === Const.LG)
    .showControlButton(false)
    .sideBarWidth(Const.SIDEBAR_WIDTH)
    .maxSideBarWidth(Const.SIDEBAR_WIDTH_MAX)
    .minSideBarWidth(Const.SIDEBAR_WIDTH_MIN)
  }
}