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

import { CommonConstants } from '../constants/CommonConstants';

@Component
export struct NoMoreLayout {
  build() {
    Row() {
      Divider()
        .color($r('app.color.no_more_divider_color'))
        .height(1)
        .layoutWeight(1)
      Text($r('app.string.no_more'))
        .fontColor($r('app.color.no_more_title_color'))
        .fontSize($r('app.float.ssm_text_size'))
        .margin($r('app.float.default_text_margin'))
      Divider()
        .color($r('app.color.no_more_divider_color'))
        .height(1)
        .layoutWeight(1)
    }
    .alignItems(VerticalAlign.Center)
    .width(CommonConstants.FULL_PERCENT)
    .margin({ bottom: $r('app.float.no_more_layout_margin') })
  }
}