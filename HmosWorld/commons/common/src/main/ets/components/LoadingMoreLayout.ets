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
export struct LoadingMoreLayout {
  build() {
    Row() {
      LoadingProgress()
        .color($r('app.color.reload_title_color'))
        .size({ width: $r('app.float.loading_more_img_size'), height: $r('app.float.loading_more_img_size') })

      Text($r('app.string.loading'))
        .fontColor($r('app.color.reload_title_color'))
        .fontSize($r('app.float.normal_text_size1'))
        .margin({ left: $r('app.float.small_padding') })
    }
    .width(CommonConstants.FULL_PERCENT)
    .height($r('app.float.reload_height'))
    .justifyContent(FlexAlign.Center)
    .margin({ bottom: $r('app.float.page_padding') })
  }
}