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

@Component
export default struct PriceComponent {
  private price: string = '';

  build() {
    Column() {
      Text() {
        Span($r('app.string.detail_price_symbol'))
          .textCase(TextCase.UpperCase)
          .fontSize(AppFontSize.SMALL)
          .decoration({ type: TextDecorationType.None })
          .fontColor(Color.Red)
          .fontWeight(AppFontWeight.BOLD)
        Span(this.price)
          .textCase(TextCase.UpperCase)
          .fontSize(AppFontSize.LARGE)
          .decoration({ type: TextDecorationType.None, color: Color.Red })
          .fontColor(Color.Red)
          .fontWeight(AppFontWeight.BOLDER)
      }
    }
    .alignItems(HorizontalAlign.Start)
    .width(PERCENTAGE_100)
  }
}