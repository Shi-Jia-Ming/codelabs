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
export default struct UploadingLayout {

  build() {
    Column() {
      Image($r('app.media.ic_pull_up_load'))
        .width($r('app.float.btn_size'))
        .height($r('app.float.btn_size'))
      Text($r('app.string.uploading_text'))
        .margin({ top: $r('app.float.common_padding') })
        .fontSize($r('app.float.title_font'))
        .fontColor($r('app.color.title_color'))
        .textAlign(TextAlign.Center)
    }
    .width(Constants.FULL_PERCENT)
    .height(Constants.FULL_PERCENT)
    .justifyContent(FlexAlign.Center)
  }
}