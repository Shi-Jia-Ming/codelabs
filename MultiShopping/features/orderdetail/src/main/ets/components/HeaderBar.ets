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

@Component
export struct HeaderBar {
  private title: string | Resource = '';
  private onBack: () => void = () => {};

  build() {
    Flex({ alignItems: ItemAlign.Center }) {
      Button() {
        Image($r('app.media.ic_back'))
          .width($r('app.float.vp_twenty'))
          .height($r('app.float.vp_twenty'))
          .margin({
            left: $r('app.float.title_image_margin_left'),
            right: $r('app.float.vp_eighteen'),
            top: $r('app.float.vp_sixteen'),
            bottom: $r('app.float.vp_sixteen')
          })
      }
      .backgroundColor($r("app.color.zero_alpha_black"))
      .onClick(() => this.onBack())

      if (this.title) {
        Text(this.title)
          .fontSize($r('app.float.bigger_font_size'))
          .margin({ left: $r('app.float.title_text_margin_left') })
      }
    }
    .backgroundColor($r('app.color.page_background'))
    .height($r('app.float.vp_fifty_six'))
    .width(StyleConstants.FULL_WIDTH)
  }
}
