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

import { Outer } from '../view/OuterComponent';
import { Inner } from '../view/InnerComponent';
import { CommonConstants } from '../common/constants/CommonConst';

@Entry
@Component
struct Index {
  private controller: TabsController = new TabsController();
  @State currentIndex: number = 0;

  @Builder NavigationTitle() {
    Column() {
      Text($r('app.string.main_title'))
        .fontColor(Color.Black)
        .lineHeight($r('app.float.default_33'))
        .fontSize($r('app.float.fontSize_24'))
        .fontWeight(FontWeight.Bold)
    }
    .height($r('app.float.default_56'))
    .justifyContent(FlexAlign.Center)
  }

  @Builder TabBuilder(index: number) {
    Column() {
      Column() {
        Text(index === CommonConstants.FIRST_TAB ? $r('app.string.tab_title_inner') : $r('app.string.tab_title_outer'))
          .fontColor(this.currentIndex === index ? $r('app.color.tab_selectedColor') : $r('app.color.tab_fontColor'))
          .fontSize($r('app.float.fontSize_16'))
      }
      .height(CommonConstants.CONTAINER_HEIGHT)
      .justifyContent(FlexAlign.Center)
      .border(this.currentIndex === index
        ? {width: { bottom: $r('app.float.default_1') }, color: $r('app.color.tab_selectedColor') }
        : {}
      )
    }
    .height($r('app.float.default_56'))
    .padding({ top: $r('app.float.default_10'), bottom: $r('app.float.default_10') })
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column() {
      Navigation() {
        Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
          TabContent() {
            Inner()
          }.tabBar(this.TabBuilder(CommonConstants.FIRST_TAB))

          TabContent() {
            Outer()
          }.tabBar(this.TabBuilder(CommonConstants.SECOND_TAB))
        }
        .barWidth(CommonConstants.BAR_WIDTH)
        .barHeight($r('app.float.default_56'))
        .onChange((index: number) => {
          this.currentIndex = index;
        })
      }
      .titleMode(NavigationTitleMode.Mini)
      .title(this.NavigationTitle)
      .hideBackButton(true)
    }
    .backgroundColor($r('app.color.app_bg'))
  }
}
