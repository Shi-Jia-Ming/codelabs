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

import Constants from '../common/constants/Constants';

@Component
export default struct FailureLayout {
  reloadAction = () => {};

  build() {
    Column() {
      Image($r('app.media.ic_none'))
        .height($r('app.float.no_data_img_size'))
        .width($r('app.float.no_data_img_size'))
      Text($r('app.string.page_none_msg'))
        .opacity($r('app.float.no_data_opacity'))
        .fontSize($r('app.float.title_font'))
        .fontColor($r('app.color.title_color'))
        .margin({ top: $r('app.float.common_padding') })
      Text($r('app.string.click_reload'))
        .opacity($r('app.float.no_data_opacity'))
        .fontSize($r('app.float.title_font'))
        .fontColor($r('app.color.color_index'))
        .padding($r('app.float.common_padding'))
        .onClick(this.reloadAction)
    }
    .width(Constants.FULL_PERCENT)
    .height(Constants.FULL_PERCENT)
    .justifyContent(FlexAlign.Center)
  }
}