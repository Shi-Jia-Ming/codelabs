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
import GoodsData from '../../common/bean/GoodsData';
import { GoodsListItem } from '../../common/constants/HomeConstants';

@Component
export default struct GoodsItemComponent {
  private config: GoodsData = new GoodsData();

  build() {
    Column() {
      Image(this.config?.goodsImg)
        .width(GoodsListItem.GOODS_IMAGE_SIZE)
        .height(GoodsListItem.GOODS_IMAGE_SIZE)
        .margin({ top: GoodsListItem.GOODS_IMAGE_MARGIN_TOP })
      Column() {
        Row() {
          Text(this.config?.goodsName)
            .fontSize(AppFontSize.MIDDLE)
            .fontWeight(AppFontWeight.BOLD)
            .maxLines(GoodsListItem.MAX_LINE_GOODS_NAME)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
        }
        .height(GoodsListItem.CONTAINER_GOODS_NAME_HEIGHT)
        .alignItems(VerticalAlign.Top)

        Text(this.config?.discounts)
          .fontSize(AppFontSize.SMALLER)
          .margin({ bottom: GoodsListItem.MARGIN_DISCOUNTS })
          .fontWeight(AppFontWeight.BOLD)
          .fontColor($r('app.color.description'))
        Text() {
          Span($r('app.string.detail_price_symbol'))
            .textCase(TextCase.UpperCase)
            .fontSize(AppFontSize.SMALL)
            .fontColor(Color.Red)
            .fontWeight(AppFontWeight.BOLD)
          Span(this.config?.price)
            .textCase(TextCase.UpperCase)
            .fontSize(AppFontSize.MIDDLE)
            .fontColor(Color.Red)
            .fontWeight(AppFontWeight.BOLD)
          if (this.config?.originalPrice !== '') {
            Span($r('app.string.detail_price_symbol'))
              .textCase(TextCase.UpperCase)
              .fontSize(AppFontSize.SMALLER)
              .fontColor($r('app.color.description'))
              .fontWeight(AppFontWeight.BOLD)
          }
          Span(this.config?.originalPrice)
            .textCase(TextCase.UpperCase)
            .fontSize(AppFontSize.SMALLER)
            .decoration({ type: TextDecorationType.LineThrough, color: $r('app.color.description') })
            .fontColor($r('app.color.description'))
            .fontWeight(AppFontWeight.BOLD)
        }

        Button({ type: ButtonType.Normal }) {
          Text(this.config?.label)
            .fontColor(Color.White)
            .fontSize(AppFontSize.SMALLER)
            .padding({
              left: GoodsListItem.PADDING_LABEL_HORIZONTAL,
              right: GoodsListItem.PADDING_LABEL_HORIZONTAL,
              bottom: GoodsListItem.PADDING_LABEL_VERTICAL,
              top: GoodsListItem.PADDING_LABEL_VERTICAL
            })
            .fontWeight(AppFontWeight.BOLDER)
        }
        .borderRadius(GoodsListItem.BORDER_RADIUS_LABEL)
        .margin({ top: GoodsListItem.CONTAINER_LABEL_MARGIN_TOP,
          bottom: GoodsListItem.CONTAINER_LABEL_MARGIN_BOTTOM })
        .backgroundColor($r('app.color.homepage_goodsList_activity_background'))

      }
      .width(GoodsListItem.TEXT_LAYER_WIDTH)
      .alignItems(HorizontalAlign.Start)
      .margin({ top: GoodsListItem.TEXT_LAYER_MARGIN_TOP })
    }
    .width(PERCENTAGE_100)
    .border({
      width: GoodsListItem.BORDER_WIDTH,
      color: Color.White,
      radius: GoodsListItem.BORDER_RADIUS
    })
    .backgroundColor(Color.White)
    .padding({ left: GoodsListItem.ITEM_PADDING_HORIZONTAL,
      right: GoodsListItem.ITEM_PADDING_HORIZONTAL })
  }
}