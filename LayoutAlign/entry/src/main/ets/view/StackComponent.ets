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

import { MARGIN_FONT_SIZE_SPACE, SHOW_LIST_HEIGHT_PERCENT,ALL_PERCENT } from '../common/Constants/CommonConstants';
import { StackAlignRadioList } from './StackAlignRadioList';

/**
 *Show child component  in Stack
 */
@Component
export struct StackComponent {
  @Consume currentStackAlignContent: Alignment;
  @Consume message: string;
  @State textAl: TextAlign = TextAlign.Center;

  build() {
    Column() {
      Stack({ alignContent: this.currentStackAlignContent }) {
        Text('')
          .width(ALL_PERCENT)
          .height(ALL_PERCENT)
          .fontSize(MARGIN_FONT_SIZE_SPACE.FOURTH_MARGIN)
          .backgroundColor($r('app.color.show_list_backgroundColor'))
        Text(this.message)
          .fontSize(MARGIN_FONT_SIZE_SPACE.FOURTH_MARGIN)
          .fontColor($r('app.color.white'))
          .width(SHOW_LIST_HEIGHT_PERCENT.STACK_SHOW_SMALL_HEIGHT)
          .height(SHOW_LIST_HEIGHT_PERCENT.STACK_SHOW_SMALL_HEIGHT)
          .textAlign(this.textAl)
          .backgroundColor($r("app.color.show_list_fontColor"))
      }
      .margin({ top: MARGIN_FONT_SIZE_SPACE.FIRST_MARGIN })
      .width(ALL_PERCENT)
      .height(SHOW_LIST_HEIGHT_PERCENT.STACK_SHOW_LIST_HEIGHT)
      // set align in stack
      StackAlignRadioList()
        .margin({ top: MARGIN_FONT_SIZE_SPACE.EIGHTH_MARGIN })
    }
    .layoutWeight(1)
    .height(ALL_PERCENT)
    .width(ALL_PERCENT)
  }
}