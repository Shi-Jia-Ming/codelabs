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

import { StyleConstants } from '../constants/StyleConstants';

@Component
export struct EmptyComponent {
  private outerHeight?: number | string = StyleConstants.FULL_HEIGHT;

  build() {
    Flex({
      justifyContent: FlexAlign.Center,
      alignItems: ItemAlign.Center,
      direction: FlexDirection.Column
    }) {
      Image($r('app.media.ic_empty'))
        .width($r('app.float.empty_image_size'))
        .height($r('app.float.empty_image_size'))
      Text($r('app.string.empty_text'))
        .fontSize($r('app.float.micro_font_size'))
        .margin({ top: $r('app.float.vp_ten') })
    }
    .width(StyleConstants.FULL_WIDTH)
    .height(this.outerHeight !== undefined ? this.outerHeight : StyleConstants.FULL_HEIGHT)
  }
}
