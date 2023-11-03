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

import { classifyTitle } from '../viewmodel/HomeViewModel';
import { CommonConstants as Const } from '../common/constants/CommonConstants';

/**
 * Classify component.
 * Usage: Directly reference ClassifyComponent().
 */
@Component
export default struct ClassifyComponent {
  @State titleIndex: number = 0;

  build() {
    Flex({ justifyContent: FlexAlign.SpaceBetween }) {
      ForEach(classifyTitle, (item: Resource, index: number | undefined) => {
        if (index !== undefined) {
          Text(item)
            .fontSize($r('app.float.middle_font_size'))
            .opacity(this.titleIndex === index ? Const.FULL_OPACITY : Const.EIGHTY_OPACITY)
            .fontWeight(this.titleIndex === index ? Const.FONT_WEIGHT_FIVE : FontWeight.Normal)
            .fontColor(Color.White)
            .onClick(() => {
              this.titleIndex = index;
            })
        }
      }, (item: Resource) => JSON.stringify(item))

      Row() {
        Image($r('app.media.ic_split_line'))
          .width($r('app.float.split_line_width'))
          .height($r('app.float.split_line_height'))
        Image($r('app.media.ic_more'))
          .width($r('app.float.more_width'))
          .height($r('app.float.more_height'))
          .margin({
            left: $r('app.float.more_margin_left'),
            right: $r('app.float.more_margin_right')
          })
        Text($r('app.string.title_bar_classification'))
          .fontSize($r('app.float.middle_font_size'))
          .fontColor(Color.White)
          .opacity(this.titleIndex === Const.INVALID_INDEX ? Const.FULL_OPACITY : Const.EIGHTY_OPACITY)
          .fontWeight(this.titleIndex === Const.INVALID_INDEX ? Const.FONT_WEIGHT_FIVE : FontWeight.Normal)
      }
      .onClick(() => {
        this.titleIndex = Const.INVALID_INDEX;
      })
    }
    .width(Const.FULL_WIDTH)
    .margin({ top: $r('app.float.classify_title_margin') })
  }
}