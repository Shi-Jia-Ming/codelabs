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

import { TopTabsList } from '../viewmodel/TopTabsModel';
import Const from '../common/constants/CommonConstants';

@Component
export struct TopTabs {
  build() {
    Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
      Row() {
        ForEach(TopTabsList, item => {
          if (TopTabsList.indexOf(item) === 0) {
            Text(item)
              .fontSize($r('app.float.top_font_size_selected'))
              .fontWeight(FontWeight.Bold)
          } else {
            Text(item)
              .fontSize($r('app.float.top_font_size'))
              .fontWeight(FontWeight.Medium)
              .fontColor($r('app.color.top_tabs_font_color'))
              .opacity(Const.TOP_FONT_OPACITY)
              .margin({ left: Const.TOP_FONT_MARGIN })
          }
        })
      }
      .height(Const.FULL_SIZE)
      .layoutWeight(Const.LAYOUT_WEIGHT)
    }
    .width(Const.FULL_SIZE)
    .height(Const.TOP_TAB_HEIGHT)
    .alignSelf(ItemAlign.Start)
  }
}