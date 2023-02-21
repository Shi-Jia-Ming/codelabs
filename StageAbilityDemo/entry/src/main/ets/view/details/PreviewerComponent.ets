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

import { AppFontSize, PERCENTAGE_100 } from '../../common/constants/Constants';
import { GoodsPreviewer } from '../../common/constants/DetailsConstants';

@Component
export default struct PreviewerComponent {
  goodsImg: string | Resource;

  build() {
    Column() {
      Row() {
        Image(this.goodsImg)
          .height(PERCENTAGE_100)
          .width(PERCENTAGE_100)
          .objectFit(ImageFit.Contain)
          .padding({ top: GoodsPreviewer.PADDING_IMAGE_TOP,
            bottom: GoodsPreviewer.PADDING_IMAGE_BOTTOM })
      }
      .width(PERCENTAGE_100)
      .height(PERCENTAGE_100)

      Row() {
        Text(GoodsPreviewer.INDICATOR_TEXT)
          .fontColor(Color.White)
          .fontSize(AppFontSize.SMALLER)
      }
      .zIndex(GoodsPreviewer.INDEX)
      .alignSelf(ItemAlign.End)
      .position({ x: GoodsPreviewer.LOCATION,
        y: GoodsPreviewer.LOCATION })
      .backgroundColor($r('app.color.detail_goods_previewer_indicator'))
      .borderRadius(GoodsPreviewer.BORDER_RADIUS)
      .padding({
        top: GoodsPreviewer.INDICATOR_PADDING_TOP,
        bottom: GoodsPreviewer.INDICATOR_PADDING_BOTTOM,
        right: GoodsPreviewer.INDICATOR_PADDING_HORIZONTAL,
        left: GoodsPreviewer.INDICATOR_PADDING_HORIZONTAL
      })
      .margin({ bottom: GoodsPreviewer.INDICATOR_MARGIN_BOTTOM,
        right: GoodsPreviewer.INDICATOR_MARGIN_RIGHT })
    }
  }
}