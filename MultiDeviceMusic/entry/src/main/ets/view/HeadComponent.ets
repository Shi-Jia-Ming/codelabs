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

import router from '@ohos.router';

import { StyleConstants } from '../common/constants/StyleConstants';

@Component
export struct HeadComponent {
  build() {
    Row() {
      Image($r('app.media.ic_public_back'))
        .width($r('app.float.header_image_width'))
        .height($r('app.float.header_image_height'))
        .margin({
          left: $r('app.float.header_margin_left'),
          right: $r('app.float.header_margin_right')
        })
      Text($r('app.string.comment_title'))
        .fontSize($r('app.float.header_font_size'))
        .fontColor($r('app.color.header_font_color'))
        .lineHeight($r('app.float.header_line_height'))
        .fontWeight(FontWeight.Medium)
    }
    .width(StyleConstants.FULL_WIDTH)
    .height($r('app.float.header_height'))
    .onClick(() => {
      router.back();
    })
  }
}