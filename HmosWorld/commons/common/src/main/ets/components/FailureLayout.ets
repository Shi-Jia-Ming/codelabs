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
export struct FailureLayout {
  handleReload?: () => void;

  build() {
    Row() {
      Column() {
        Image($r('app.media.ic_failure'))
          .width($r('app.float.failure_img_size'))
          .height($r('app.float.failure_img_size'))
        Text($r('app.string.load_failed'))
          .fontColor($r('app.color.reload_title_color'))
          .fontFamily(CommonConstants.HARMONY_HEI_TI_FONT_FAMILY)
          .fontSize($r('app.float.normal_text_size1'))
          .margin({ top: $r('app.float.failed_title_margin') })
        Row() {
          Text($r('app.string.reload'))
            .fontColor($r('app.color.main_red_color'))
            .fontFamily(CommonConstants.HARMONY_HEI_TI_FONT_FAMILY)
            .fontSize($r('app.float.small_text_size'))
            .width(CommonConstants.FULL_PERCENT)
            .textAlign(TextAlign.Center)
        }
        .height($r('app.float.reload_btn_height'))
        .width($r('app.float.reload_btn_width'))
        .margin({ top: $r('app.float.failed_title_margin') })
        .borderWidth(1)
        .borderColor($r('app.color.main_red_color'))
        .borderRadius($r('app.float.reload_btn_radius'))
        .onClick(() => this.handleReload?.())
      }
    }
    .justifyContent(FlexAlign.Center)
    .layoutWeight(1)
  }
}