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
import { CommonUtil } from '../utils/CommonUtil';

@Component
export struct ActionButtonView {
  @Prop imgResource: Resource = $r('app.media.ic_failure');
  @Prop count: number = 0;
  @Prop imageSize: number = 16;
  @Prop fontSize: Resource = $r('app.float.small_text_size');
  @Prop textWidth: Resource = $r('app.float.default_icon_width');
  private horizontalAlign: FlexAlign = FlexAlign.Center;

  build() {
    Row() {
      Image(this.imgResource)
        .size({ width: this.imageSize, height: this.imageSize })
        .margin({ right: $r('app.float.action_button_margin_right') })
      Text(CommonUtil.transNumberOverOneThousand(this.count))
        .fontFamily(CommonConstants.HARMONY_HEI_TI_FONT_FAMILY)
        .fontSize(this.fontSize)
        .width(this.textWidth)
        .opacity(CommonConstants.SECOND_LEVEL_OPACITY)
    }
    .width($r('app.float.action_button_width'))
    .padding({ top: $r('app.float.small_padding') })
    .alignItems(VerticalAlign.Center)
    .justifyContent(this.horizontalAlign)
  }
}