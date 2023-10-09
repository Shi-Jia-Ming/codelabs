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

import { SearchView } from '@ohos/search';
import { BreakpointConstants, CommonConstants } from '@ohos/commons';
import { FooterTab, FooterTabViewModel } from '../viewmodel/FooterTabViewModel';
import { HomeConstants } from '../constants/HomeConstants';
import { HomeHeader } from './HomeHeader';
import { HomeContent } from './HomeContent';

@Component
export struct Home {
  @State currentBottomIndex: number = 0;
  @State currentTopIndex: number = 0;
  @State isSearching: boolean = false;
  @State currentSideBarIndex: number = 0;
  @State scrollHeight: number = 0;
  @StorageLink('currentBreakpoint') currentBreakpoint: string = BreakpointConstants.BREAKPOINT_LG;
  private tabList: FooterTab[] = new FooterTabViewModel().getTabList();
  private scroller: Scroller = new Scroller();
  private sideScroller: Scroller = new Scroller();

  @Builder
  BottomTabBuilder(item: FooterTab, index: number) {
    Column() {
      Image(index !== this.currentBottomIndex ? item.getIcon() : item.getIconSelected())
        .width($r('app.float.icon_tab_width'))
        .height($r('app.float.icon_tab_height'))
      Text(item.getName())
        .fontSize($r('app.float.tab_font_size'))
        .fontWeight(CommonConstants.FONT_WEIGHT_500)
        .fontColor(index === this.currentBottomIndex ? $r('app.color.tab_sel_color') : $r('app.color.tab_normal_color'))
        .margin({ top: $r('app.float.tab_top_margin') })
        .opacity(index === this.currentBottomIndex ? CommonConstants.TEXT_OPACITY[3] : CommonConstants.TEXT_OPACITY[0])
    }
    .height(CommonConstants.FULL_PERCENT)
    .width(CommonConstants.FULL_PERCENT)
    .justifyContent(FlexAlign.Center)
    .backgroundColor($r('app.color.side_bar_background'))
  }

  build() {
    Column() {
      if (this.currentBreakpoint !== BreakpointConstants.BREAKPOINT_LG || this.currentTopIndex !== 2) {
        // Non-immersive design for the home page.
        Column() {
          Tabs({ barPosition: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ? BarPosition.Start :
            BarPosition.End }) {
            ForEach(this.tabList, (item: FooterTab, index: number) => {
              TabContent() {
                Column() {
                  HomeHeader({ currentTopIndex: $currentTopIndex, isSearching: $isSearching, scrollHeight: $scrollHeight
                  })
                    .visibility(this.isSearching === false ? Visibility.Visible : Visibility.None)

                  Scroll(this.scroller) {
                    Column() {
                      HomeContent({ currentTopIndex: this.currentTopIndex })
                        .visibility(this.isSearching === false ? Visibility.Visible : Visibility.None)

                      SearchView({ isSearching: $isSearching, currentTopIndex: $currentTopIndex })
                        .visibility(this.isSearching === false ? Visibility.None : Visibility.Visible)
                    }
                    .width(CommonConstants.FULL_PERCENT)
                  }
                  .layoutWeight(1)
                  .scrollBar(BarState.Off)
                }
                .height(CommonConstants.FULL_PERCENT)
                .width(CommonConstants.FULL_PERCENT)
              }
              .tabBar(this.BottomTabBuilder(item, index))
            }, (item: FooterTab, index: number) => index + JSON.stringify(item))
          }
          // Change the position and size of the tab at the bottom.
          .barWidth(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
            $r('app.float.bottom_tab_bar_width_lg') : CommonConstants.FULL_PERCENT)
          .barHeight(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ? HomeConstants.HALF_PERCENT :
            $r('app.float.tab_size'))
          .vertical(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG)
          .onChange((index: number) => {
            this.currentBottomIndex = index;
          })
          .scrollable(false)
        }
      } else {
        // The immersive design of the 2in1 home page is displayed when the top tab is switched to 2.
        SideBarContainer(SideBarContainerType.Overlay) {
          Column() {
            Blank()
              .layoutWeight(1)
            List() {
              ForEach(this.tabList, (item: FooterTab, index: number) => {
                ListItem() {
                  Column() {
                    Image(index !== this.currentSideBarIndex ? item.getIconWhite() : item.getIconSelected())
                      .width($r('app.float.icon_tab_width'))
                      .height($r('app.float.icon_tab_height'))
                      .fillColor(index !== this.currentSideBarIndex ? Color.White : $r('app.color.tab_sel_color'))
                    Text(item.getName())
                      .fontSize($r('app.float.tab_font_size'))
                      .fontWeight(CommonConstants.FONT_WEIGHT_500)
                      .fontColor(index === this.currentSideBarIndex ? $r('app.color.tab_sel_color') : Color.White)
                      .margin({ top: $r('app.float.tab_top_margin') })
                      .opacity(index === this.currentSideBarIndex ? CommonConstants.TEXT_OPACITY[3] :
                        CommonConstants.TEXT_OPACITY[0])
                  }
                  .height(HomeConstants.SIDE_ICON_LIST_HEIGHT)
                  .width(CommonConstants.FULL_PERCENT)
                  .justifyContent(FlexAlign.Center)
                }
                .onClick(() => {
                  this.currentSideBarIndex = index;
                })
              }, (item: FooterTab, index: number) => index + JSON.stringify(item))
            }
            .layoutWeight(2)
            Blank()
              .layoutWeight(1)
          }
          .height(CommonConstants.FULL_PERCENT)
          .width(CommonConstants.FULL_PERCENT)
          // Set transparent background color.
          .backgroundColor($r('app.color.side_bar_background'))

          // Main content area on the home page.
          Stack() {
            Scroll(this.sideScroller) {
              Column() {
                HomeContent({ currentTopIndex: this.currentTopIndex })
                  .visibility(this.isSearching === false ? Visibility.Visible : Visibility.None)

                SearchView({ isSearching: $isSearching, currentTopIndex: $currentTopIndex })
                  .visibility(this.isSearching === false ? Visibility.None : Visibility.Visible)
              }
              .width(CommonConstants.FULL_PERCENT)

            }
            .scrollBar(BarState.Off)
            .height(CommonConstants.FULL_PERCENT)
            // Obtains the sliding offset on the y axis during sliding.
            .onScroll(() => {
              this.scrollHeight = this.sideScroller.currentOffset().yOffset;
            })

            // Control the top-level display of the top tab bar.
            HomeHeader({ currentTopIndex: $currentTopIndex, isSearching: $isSearching, scrollHeight: $scrollHeight })
              .visibility(this.isSearching === false ? Visibility.Visible : Visibility.None)
              .padding({ left: $r('app.float.side_bar_width') })
          }
          .height(CommonConstants.FULL_PERCENT)
          .width(CommonConstants.FULL_PERCENT)
          .alignContent(Alignment.Top)
        }
        .showSideBar(true)
        .showControlButton(false)
        .sideBarWidth($r('app.float.side_bar_width'))
        .autoHide(false)
        .minSideBarWidth($r('app.float.side_bar_width'))
        .maxSideBarWidth($r('app.float.side_bar_width'))
      }
    }
    .height(CommonConstants.FULL_PERCENT)
    .width(CommonConstants.FULL_PERCENT)
  }
}