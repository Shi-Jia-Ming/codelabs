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

import { StyleConstants } from '@ohos/common';
import { addressInfo, AddressInfoParams } from '../viewmodel/OrderData';

@Component
export struct AddressInfo {
  private info?: AddressInfoParams;

  aboutToAppear() {
    this.info = addressInfo[0];
  }

  build() {
    Flex({
      justifyContent: FlexAlign.Start,
      alignItems: ItemAlign.Center
    }) {
      Image($r('app.media.ic_location'))
        .width($r('app.float.vp_eighteen'))
        .height($r('app.float.vp_eighteen'))
        .margin({ right: $r('app.float.vp_twelve') })
      Flex({
        justifyContent: FlexAlign.SpaceBetween,
        alignItems: ItemAlign.Center
      }) {
        Column(){
          Row() {
            Text(this.info?.name)
              .fontSize($r('app.float.small_font_size'))
              .margin({ right: $r('app.float.vp_twelve') })
              .fontColor(Color.Black)
            Text(this.info?.phone)
              .fontSize($r('app.float.small_font_size'))
              .fontColor($r("app.color.sixty_alpha_black"))
          }
          .margin({ bottom: $r('app.float.vp_eight') })
          Text(`${this.info?.province}${this.info?.city}${this.info?.region} ${this.info?.detailAddress}`)
            .fontSize($r('app.float.smaller_font_size'))
            .fontColor($r("app.color.sixty_alpha_black"))
        }
        .alignItems(HorizontalAlign.Start)

        Image($r('app.media.ic_point'))
          .height($r('app.float.vp_twelve'))
          .width($r('app.float.vp_six'))
      }
    }
    .width(StyleConstants.FULL_WIDTH)
    .backgroundColor(Color.White)
    .borderRadius($r('app.float.vp_sixteen'))
    .margin({ bottom: $r('app.float.vp_twelve') })
    .padding($r('app.float.vp_sixteen'))
  }
}