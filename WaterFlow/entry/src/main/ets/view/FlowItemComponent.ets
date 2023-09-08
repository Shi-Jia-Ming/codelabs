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
import ProductBean from '../common/bean/ProductBean';
import { waterFlowData } from '../viewmodel/HomeViewModel';

/**
 * Flow item component.
 * Usage: This component is used in FlowItem.
 */
@Component
export default struct FlowItemComponent {
  item: ProductBean = waterFlowData[0];

  build() {
    Column() {
      Image(this.item?.image_url)
        .width($r('app.float.product_image_size'))
        .height($r('app.float.product_image_size'))
        .objectFit(ImageFit.Contain)
        .margin({
          top: $r('app.float.water_flow_image_top'),
          bottom: $r('app.float.water_flow_image_bottom')
        })
      Text(this.item?.name)
        .fontSize($r('app.float.small_font_size'))
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Normal)
        .alignSelf(ItemAlign.Start)
      Text(this.item?.discount)
        .fontSize($r('app.float.smaller_font_size'))
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Normal)
        .opacity(Const.SIXTY_OPACITY)
        .alignSelf(ItemAlign.Start)
        .margin({
          bottom: $r('app.float.discount_text_bottom')
        })
      Text(this.item?.price)
        .fontSize($r('app.float.middle_font_size'))
        .fontColor($r('app.color.focus_color'))
        .fontWeight(FontWeight.Normal)
        .alignSelf(ItemAlign.Start)
        .lineHeight($r('app.float.piece_line_height'))
      Row() {
        if (this.item?.promotion) {
          Text(`${this.item?.promotion}`)
            .height($r('app.float.promotion_text_height'))
            .fontSize($r('app.float.promotion_font_size'))
            .fontColor(Color.White)
            .borderRadius($r('app.float.promotion_radius'))
            .backgroundColor($r('app.color.focus_color'))
            .padding({
              left: $r('app.float.promotion_padding_left'),
              right: $r('app.float.promotion_padding_right')
            })
            .margin({
              top: $r('app.float.promotion_margin_top'),
              right: $r('app.float.promotion_margin_right')
            })
        }
        if (this.item?.bonus_points) {
          Text(`${this.item?.bonus_points}`)
            .height($r('app.float.promotion_text_height'))
            .fontSize($r('app.float.promotion_font_size'))
            .fontColor($r('app.color.focus_color'))
            .borderRadius($r('app.float.promotion_radius'))
            .borderWidth($r('app.float.bonus_points_radius_width'))
            .borderColor($r('app.color.focus_color'))
            .padding({
              left: $r('app.float.bonus_points_padding_left'),
              right: $r('app.float.bonus_points_padding_right')
            })
            .margin({ top: $r('app.float.bonus_points_margin_top') })
        }
      }
      .width(Const.FULL_WIDTH)
      .justifyContent(FlexAlign.Start)
    }
    .borderRadius($r('app.float.product_layout_radius'))
    .backgroundColor(Color.White)
    .padding({
      left: $r('app.float.product_layout_margin_left'),
      right: $r('app.float.product_layout_margin_right'),
      bottom: $r('app.float.product_layout_margin_bottom')
    })
  }
}