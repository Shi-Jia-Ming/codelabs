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

import { AppFontSize, AppFontWeight, PERCENTAGE_100 } from '../../common/constants/Constants';
import { GoodsPicker } from '../../common/constants/DetailsConstants';

@Component
export default struct PickerComponent {
  @Builder _init() {};
  private goodsDescription: string | Resource = ''
  @BuilderParam actionMoreBuilder: () => void = this._init;

  build() {
    Row() {
      Text($r('app.string.detail_goods_picker_left_text'))
        .maxLines(GoodsPicker.MAX_LINES)
        .lineHeight(GoodsPicker.LINE_HEIGHT_TEXT_SELECTED)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .textCase(TextCase.UpperCase)
        .fontSize(AppFontSize.SMALL)
        .fontColor(Color.Black)
        .fontWeight(AppFontWeight.BOLDER)
        .width(GoodsPicker.LAYOUT_WEIGHT_LEFT)

      Row() {
        Text(this.goodsDescription)
          .maxLines(GoodsPicker.MAX_LINES)
          .lineHeight(GoodsPicker.LINE_HEIGHT_DESCRIPTION)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .textCase(TextCase.UpperCase)
          .fontSize(AppFontSize.SMALL)
          .fontColor($r('app.color.text'))
          .fontWeight(AppFontWeight.BOLD)
          .padding({ left: GoodsPicker.MARGIN_LEFT_DESCRIPTION })
      }
      .width(GoodsPicker.LAYOUT_WEIGHT_CENTER)
      .justifyContent(FlexAlign.Start)

      Row() {
        this.actionMoreBuilder()
      }
      .width(GoodsPicker.LAYOUT_WEIGHT_RIGHT)
      .justifyContent(FlexAlign.End)

    }
    .width(PERCENTAGE_100)
  }
}