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
import { CommonConstants, ResourceDetail } from '@ohos/common';

interface ActionButton {
  icon: Resource,
  onClick?: (detail: ResourceDetail) => void
}

@Extend(Image)
function imageStyle() {
  .width($r('app.float.top_navigation_button_size'))
  .height($r('app.float.top_navigation_button_size'))
}

@Component
export struct TopNavigationView {
  title?: Resource;
  actionButtons: ActionButton[] = [];
  detail?: ResourceDetail;
  leftAndRightPadding: Resource = $r('app.float.xxl_padding_margin');

  build() {
    Row() {
      Image($r('app.media.ic_back'))
        .imageStyle()
        .margin({ right: $r('app.float.lg_padding_margin') })
        .onClick(() => router.back())

      Text(this.title)
        .fontSize($r('app.float.nav_title_font_size'))
        .fontWeight(FontWeight.Medium)
        .textAlign(TextAlign.Start)
        .layoutWeight(1)

      Row() {
        ForEach(this.actionButtons, (button: ActionButton) => {
          Image(button.icon)
            .imageStyle()
            .margin({ left: $r('app.float.sm_padding_margin') })
            .onClick(() => {
              if (this.detail !== undefined) {
                button.onClick?.(this.detail)
              }
            })
        })
      }
    }
    .alignItems(VerticalAlign.Center)
    .justifyContent(FlexAlign.SpaceBetween)
    .width(CommonConstants.FULL_PERCENT)
    .height($r('app.float.top_navigation_height'))
    .padding({
      left: this.leftAndRightPadding,
      right: this.leftAndRightPadding
    })
  }
}


