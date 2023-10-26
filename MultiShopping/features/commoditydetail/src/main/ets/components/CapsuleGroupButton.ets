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

import { ButtonType } from '../viewmodel/TypeModel';
import { StyleConstants } from '@ohos/common';

@Component
export struct CapsuleGroupButton {
  private configs: ButtonType[] = [];

  @Styles flex(){
    .flexBasis(StyleConstants.FLEX_BASIC)
    .flexGrow(StyleConstants.FLEX_GROW)
    .flexShrink(StyleConstants.FLEX_SHRINK)
  }

  build() {
    Flex() {
      ForEach(this.configs, (config: ButtonType, index?: number) => {
        Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
          Text(config.text)
            .fontColor(Color.White)
            .fontSize($r('app.float.middle_font_size'))
            .height($r('app.float.capsule_height'))
            .textAlign(TextAlign.Center)
        }
        .border({
          radius: {
            topLeft: !!index ? 0 : $r('app.float.vp_twenty'),
            bottomLeft: !!index ? 0 : $r('app.float.vp_twenty'),
            topRight: !!index ? $r('app.float.vp_twenty') : 0,
            bottomRight: !!index ? $r('app.float.vp_twenty') : 0
          }
        })
        .onClick((event?: ClickEvent) => config.onClick(event))
      }, (config: ButtonType) => JSON.stringify(config))
    }
    .backgroundImage($r('app.media.btn_background'), ImageRepeat.NoRepeat)
    .backgroundImageSize({ width: StyleConstants.HUNDRED_FIFTEEN_WIDTH, height: StyleConstants.FULL_HEIGHT })
    .backgroundImagePosition(Alignment.Center)
    .borderRadius($r('app.float.vp_twenty'))
    .width(StyleConstants.FULL_WIDTH)
    .height($r('app.float.capsule_height'))
    .flex()
  }
}