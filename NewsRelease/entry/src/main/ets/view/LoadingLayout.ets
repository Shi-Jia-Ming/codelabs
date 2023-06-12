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
export default struct LoadingLayout {
  build() {
    Row() {
      Image($r('app.media.ic_pull_up_load'))
        .width($r('app.float.refresh_img_size'))
        .height($r('app.float.refresh_img_size'))
      Text($r('app.string.pull_up_load_text'))
        .margin({ left: $r('app.float.normal_padding') })
        .fontSize($r('app.float.title_font'))
        .textAlign(TextAlign.Center)
    }
    .width(Constants.FULL_PERCENT)
    .height(Constants.CUSTOM_LAYOUT_HEIGHT)
    .justifyContent(FlexAlign.Center)
  }
}