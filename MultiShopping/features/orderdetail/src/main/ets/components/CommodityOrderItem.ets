/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { Order, StyleConstants } from '@ohos/common';

@Component
export struct CommodityOrderItem {
  private orderData?: Order;
  private onCommodityClick: () => void = () => {};

  @Styles flexStyles(){
    .flexShrink(StyleConstants.FLEX_SHRINK)
    .flexGrow(StyleConstants.FLEX_GROW)
    .flexBasis(StyleConstants.FLEX_BASIC)
  }

  build() {
    if (this.orderData) {
      Flex() {
        Image($rawfile(this.orderData.image))
          .height(StyleConstants.FULL_HEIGHT)
          .aspectRatio(1)
        Flex({ direction: FlexDirection.Column }) {
          Flex({
            justifyContent: FlexAlign.SpaceBetween,
            alignItems: ItemAlign.Center
          }) {
            Flex() {
              Text($r('app.string.commodity_piece_description', this.orderData.title, this.orderData.description))
                .width(StyleConstants.FULL_WIDTH)
                .fontColor(Color.Black)
                .maxLines(StyleConstants.TWO_TEXT_LINE)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
                .fontSize($r('app.float.smaller_font_size'))
                .lineHeight($r('app.float.vp_twenty'))
                .margin({ bottom: $r('app.float.vp_four') })
            }
            .flexStyles()

            Flex({
              justifyContent: FlexAlign.Center,
              direction: FlexDirection.Column,
              alignItems: ItemAlign.End
            }) {
              Text($r('app.string.commodity_piece', this.orderData.price))
                .fontSize($r('app.float.small_font_size'))
            }
            .padding({ left: $r('app.float.vp_eight') })
          }
          .flexStyles()

          Flex({ justifyContent: FlexAlign.SpaceBetween }) {
            Flex({ direction: FlexDirection.Column }) {
              Text(this.orderData.specifications.length === 2 ?
                this.orderData.specifications[0].value + '，' + this.orderData.specifications[1].value:
                  this.orderData.specifications.length === 3 ?
                  this.orderData.specifications[0].value + '，' + this.orderData.specifications[1].value + '，' + this.orderData.specifications[2].value :
                    this.orderData.specifications.length === 4 ?
                    this.orderData.specifications[0].value + '，' + this.orderData.specifications[1].value + '，' + this.orderData.specifications[2].value + '，' + this.orderData.specifications[3].value : ''
              )
                .fontSize($r('app.float.smaller_font_size'))
                .fontColor($r("app.color.sixty_alpha_black"))
            }
            .width(StyleConstants.SEVENTY_HEIGHT)

            Flex({
              direction: FlexDirection.Column,
              alignItems: ItemAlign.End
            }) {
              Text(`x${this.orderData.count}`)
                .fontSize($r('app.float.small_font_size'))
                .fontColor($r("app.color.sixty_alpha_black"))
            }
            .padding({ left: $r('app.float.vp_eight') })
          }
          .width(StyleConstants.FULL_WIDTH)
          .flexStyles()
        }
        .margin({ left: $r('app.float.vp_eight') })
        .flexStyles()
      }
      .height($r('app.float.order_height'))
      .margin({ bottom: $r('app.float.vp_eight') })
      .onClick(() => this.onCommodityClick())
    }
  }
}