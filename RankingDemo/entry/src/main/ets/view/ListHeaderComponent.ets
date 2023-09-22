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

import { FontSize, ListHeaderStyle } from '../common/constants/Constants';

@Component
export struct ListHeaderComponent {
  paddingValue: Padding | Length = 0;
  widthValue: Length = 0;

  build() {
    Row() {
      Text($r('app.string.page_number'))
        .fontSize(FontSize.SMALL)
        .width(ListHeaderStyle.LAYOUT_WEIGHT_LEFT)
        .fontWeight(ListHeaderStyle.FONT_WEIGHT)
        .fontColor($r('app.color.font_description'))
      Text($r('app.string.page_type'))
        .fontSize(FontSize.SMALL)
        .width(ListHeaderStyle.LAYOUT_WEIGHT_CENTER)
        .fontWeight(ListHeaderStyle.FONT_WEIGHT)
        .fontColor($r('app.color.font_description'))
      Text($r('app.string.page_vote'))
        .fontSize(FontSize.SMALL)
        .width(ListHeaderStyle.LAYOUT_WEIGHT_RIGHT)
        .fontWeight(ListHeaderStyle.FONT_WEIGHT)
        .fontColor($r('app.color.font_description'))
    }
    .width(this.widthValue)
    .padding(this.paddingValue)
  }
}