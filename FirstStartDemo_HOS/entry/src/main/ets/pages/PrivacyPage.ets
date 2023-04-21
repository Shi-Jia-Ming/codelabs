/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import CommonConstants from '../common/constants/CommonConstants';

/**
 * The privacy agreement page displays the agreement content.
 */
@Entry
@Component
struct PrivacyPage {
  build() {
    Column() {
      Text($r('app.string.privacy_text_title'))
        .fontSize($r('app.float.privacy_text_title_size'))
        .textAlign(TextAlign.Center)
        .margin({
          top: $r('app.float.privacy_text_margin_top'),
          bottom: $r('app.float.privacy_text_margin_bottom')
        })
      Text($r('app.string.privacy_text_content'))
        .fontSize($r('app.float.dialog_common_text_size'))
        .margin({
          left: $r('app.float.privacy_text_content_left'),
          right: $r('app.float.privacy_text_content_right')
        })
      Text($r('app.string.privacy_back'))
        .fontColor($r('app.color.privacy_back_text'))
        .fontSize($r('app.float.privacy_back_text_size'))
        .textAlign(TextAlign.Center)
        .fontWeight(FontWeight.Medium)
        .onClick(() => {
          globalThis.isJumpPrivacy = false;
          router.back();
        })
        .margin({ top: $r('app.float.privacy_bottom_text_margin') })
    }
    .justifyContent(FlexAlign.Center)
    .height(CommonConstants.FULL_HEIGHT)
  }

  onBackPress() {
    globalThis.isJumpPrivacy = false;
  }
}