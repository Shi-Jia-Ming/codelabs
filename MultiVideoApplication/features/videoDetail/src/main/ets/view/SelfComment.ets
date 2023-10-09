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

import { CommonConstants } from '@ohos/commons';
import { Logger } from '@ohos/commons';
import { DetailConstants } from '../constants/DetailConstants';
import { UserInfo, UserViewModel } from '../viewmodel/UserViewModel';

@Component
export struct SelfComment {
  private selfInfo: UserInfo = new UserViewModel().getSelfInfo();

  build() {
    Row() {
      Image(this.selfInfo.getImageSrc())
        .height($r('app.float.self_comment_profile_size'))
        .width($r('app.float.self_comment_profile_size'))
        .borderRadius($r('app.float.self_comment_profile_radius'))
        .margin({
          left: $r('app.float.self_comment_profile_left'),
          right: $r('app.float.self_comment_profile_right')
        })

      Stack({ alignContent: Alignment.Start }) {
        TextInput({ placeholder: DetailConstants.COMMENT_PLACEHOLDER })
          .placeholderFont({
            size: $r('app.float.self_comment_input_font'),
            weight: FontWeight.Normal
          })
          .height($r('app.float.self_comment_input_height'))
          .fontSize($r('app.float.self_comment_input_font'))
          .padding({
            left: $r('app.float.self_comment_input_left'),
            right: $r('app.float.self_comment_input_right')
          })
          .width(CommonConstants.FULL_PERCENT)
          .onClick(() => {
            Logger.info(`placeholder ${DetailConstants.COMMENT_PLACEHOLDER}`);
          })

        Image($r('app.media.ic_public_comment'))
          .height($r('app.float.self_comment_comment_size'))
          .width($r('app.float.self_comment_comment_size'))
          .margin({
            top: $r('app.float.self_comment_comment_margin'),
            bottom: $r('app.float.self_comment_comment_margin'),
            left: $r('app.float.self_comment_comment_margin'),
            right: $r('app.float.self_comment_comment_right')
          })

        Row() {
          Image($r('app.media.ic_public_emoji'))
            .height($r('app.float.self_comment_emoji_size'))
            .width($r('app.float.self_comment_emoji_size'))
            .margin({ right: $r('app.float.self_comment_emoji_margin') })
        }
        .width(CommonConstants.FULL_PERCENT)
        .height(CommonConstants.FULL_PERCENT)
        .justifyContent(FlexAlign.End)
        .alignItems(VerticalAlign.Center)
      }
      .alignSelf(ItemAlign.Center)
      .layoutWeight(1)
      .borderRadius($r('app.float.self_comment_stack_radius'))
      .height($r('app.float.self_comment_stack_height'))
    }
    .shadow({
      radius: DetailConstants.SHADOW_RADIUS,
      color: $r('app.color.shadow_color'),
      offsetY: DetailConstants.SHADOW_OFFSET_Y
    })
    .height($r('app.float.self_comment_row_height'))
    .width(CommonConstants.FULL_PERCENT)
    .alignItems(VerticalAlign.Center)
    .backgroundColor(Color.White)
    .padding({ right: $r('app.float.self_comment_row_padding') })
  }
}