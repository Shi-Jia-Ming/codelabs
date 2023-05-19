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

import CommonConstants from '../common/constants/CommonConstants';
import WindowModel from '../model/WindowModel';

/**
 * Success page in sub window.
 */
@Entry
@Component
struct SuccessPage {
  aboutToAppear() {
    setTimeout(() => {
      WindowModel.getInstance().destroySubWindow();
      getContext(this).eventHub.emit(CommonConstants.HOME_PAGE_ACTION);
    }, CommonConstants.LOGIN_WAIT_TIME);
  }

  build() {
    Column() {
      Column() {
        Text($r('app.string.success'))
          .fontSize($r('app.float.large_text_size'))
          .padding({
            left: $r('app.float.verify_padding'),
            top: $r('app.float.verify_padding')
          })
          .width(CommonConstants.FULL_PARENT)
        Image($r('app.media.ic_success'))
          .width($r('app.float.success_image_size'))
          .height($r('app.float.success_image_size'))
          .margin({
            top: $r('app.float.success_image_margin'),
            bottom: $r('app.float.success_image_margin')
          })
        Text($r('app.string.success_login_hints'))
          .fontSize($r('app.float.small_text_size'))
          .fontColor($r('app.color.placeholder_color'))
          .margin({
            bottom: $r('app.float.verify_auto_jump_bottom_margin')
          })
      }
      .backgroundColor(Color.White)
      .height(CommonConstants.FULL_PARENT)
      .borderRadius($r('app.float.verify_ok_margin'))
    }
    .padding({ bottom: $r('app.float.verify_bottom_padding') })
    .height(CommonConstants.FULL_PARENT)
  }
}