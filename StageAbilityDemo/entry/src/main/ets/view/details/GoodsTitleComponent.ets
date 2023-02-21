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
import { GoodsTitle } from '../../common/constants/DetailsConstants';

@Component
export default struct GoodsTitleComponent {
  private title: Resource

  build() {
    Column() {
      Text(this.title)
        .maxLines(GoodsTitle.MAX_LINE)
        .lineHeight(GoodsTitle.LINE_HEIGHT)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .textCase(TextCase.UpperCase)
        .fontSize(AppFontSize.MIDDLE)
        .textAlign(TextAlign.Start)
        .fontColor($r('app.color.text'))
        .fontWeight(AppFontWeight.BOLD)
    }
    .width(PERCENTAGE_100)
    .alignItems(HorizontalAlign.Start)
  }
}