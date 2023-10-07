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
import common from '@ohos.app.ability.common';
import { ChallengeConstants as Const } from '../constants/ChallengeConstants';

@Component
export default struct ChallengeItem {
  build() {
    Row() {
      Column() {
        Column() {
          Text($r('app.string.code_lab_challenge'))
            .fontWeight(FontWeight.Medium)
            .lineHeight($r('app.float.medium_line_height'))
            .fontSize($r('app.float.challenge_title_size'))
          Text($r('app.string.challenge_desc'))
            .lineHeight($r('app.float.smaller_line_height'))
            .fontColor($r('app.color.train_interval'))
            .fontSize($r('app.float.smaller_font_size'))
        }
        .alignItems(HorizontalAlign.Start)

        Button($r('app.string.go_now'))
          .height($r('app.float.small_btn_height'))
          .fontSize($r('app.float.small_font_size'))
          .onClick(() => {
            let bundleName = (getContext(this) as common.UIAbilityContext).applicationInfo.name;
            router.pushUrl({
              url: `@bundle:${bundleName}/challenge/ets/pages/ChallengeDetailPage`
            });
          })
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(HorizontalAlign.Start)
      .borderRadius($r('app.float.introduction_image_border_radius'))
      .width(Const.FULL_PERCENT)
      .backgroundImage($r('app.media.ic_challenge_bg'))
      .backgroundImageSize(ImageSize.Cover)
      .aspectRatio(2.5)
      .padding({
        left: $r('app.float.guide_padding'),
        top: $r('app.float.normal_padding'),
        bottom: $r('app.float.normal_padding')
      })
    }
    .padding({
      left: $r('app.float.guide_padding'),
      right: $r('app.float.guide_padding'),
      bottom: $r('app.float.guide_padding')
    })
  }
}