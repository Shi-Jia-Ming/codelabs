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

import { CommonConstants as Const } from '../common/constants/CommonConstants';
import { BottomTabs } from '../view/BottomTabsComponent';
import { Map } from '../view/MapComponent';
import { Zones } from '../view/ZonesComponent';
import { Trains } from '../view/TrainsComponent';

@Entry
@Component
struct MainPage {
  @State @Watch('onIndexChange') bottomTabIndex: number = 1;
  private controller: TabsController = new TabsController();

  onIndexChange() {
    this.controller.changeIndex(this.bottomTabIndex);
  }

  pageTransition() {
    PageTransitionEnter({ duration: Const.SHARED_DURATION })
      .slide(SlideEffect.Top)
    PageTransitionEnter({ delay: Const.EXIT_DELAY })
      .opacity(0)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.End, justifyContent: FlexAlign.End }) {
      Tabs({ barPosition: BarPosition.End, index: 1, controller: this.controller }) {
        TabContent() {
          Map()
        }

        TabContent() {
          Zones()
        }

        TabContent() {
          Trains()
        }
      }
      .width(Const.FULL_PERCENT)
      .vertical(false)
      .scrollable(false)
      .barHeight(0)
      .onChange((index: number) => {
        this.bottomTabIndex = index;
      })

      BottomTabs({ bottomTabIndex: $bottomTabIndex })
    }
    .width(Const.FULL_PERCENT)
  }
}