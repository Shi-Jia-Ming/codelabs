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

import { CommonConstants } from '../common/constants/CommonConstants';

@CustomDialog
export default struct InputDialog {
  @Consume stepGoal: string;
  controller: CustomDialogController;
  cancel: () => void;
  confirm: () => void;

  build() {
    Column() {
      Text($r('app.string.steps'))
        .width(CommonConstants.FULL_WIDTH)
        .height($r('app.float.input_text_height'))
        .fontSize($r('app.float.input_text_font_size'))
        .fontColor($r('app.color.step_text_font'))
        .fontWeight(CommonConstants.BIG_FONT_WEIGHT)
        .textAlign(TextAlign.Start)
        .margin({
          top: $r('app.float.input_margin_top'),
          bottom: $r('app.float.input_margin_bottom'),
          left: $r('app.float.input_margin_left')
        })

      TextInput({ placeholder: this.stepGoal === '' ? $r('app.string.placeholder') : this.stepGoal })
        .width(CommonConstants.FULL_WIDTH)
        .height($r('app.float.text_input_height'))
        .type(InputType.Number)
        .fontSize($r('app.float.input_font_size'))
        .alignSelf(ItemAlign.Start)
        .backgroundColor(Color.White)
        .margin({
          top: $r('app.float.text_margin_top'),
          bottom: $r('app.float.text_margin_bottom')
        })
        .onChange((value: string) => {
          this.stepGoal = value;
        })

      Divider()
        .width(CommonConstants.DIVIDER_WIDTH)
        .height($r('app.float.divider_height'))
        .vertical(false)
        .color($r('app.color.divider'))
        .strokeWidth(CommonConstants.DIVIDER_STROKE_WIDTH)

      Row() {
        Text($r('app.string.cancel'))
          .width($r('app.float.text_width'))
          .height($r('app.float.text_height'))
          .fontColor($r('app.color.input_text_font'))
          .fontWeight(CommonConstants.BIG_FONT_WEIGHT)
          .fontSize($r('app.float.text_font_size'))
          .textAlign(TextAlign.Center)
          .margin({ right: $r('app.float.text_margin_right') })
          .onClick(() => {
            this.controller.close();
            this.cancel();
          })

        Divider()
          .height($r('app.float.divider_height'))
          .vertical(true)
          .color($r('app.color.divider'))
          .strokeWidth(CommonConstants.DIVIDER_STROKE_WIDTH)

        Text($r('app.string.confirm'))
          .width($r('app.float.text_width'))
          .height($r('app.float.text_height'))
          .fontColor($r('app.color.input_text_font'))
          .fontWeight(CommonConstants.BIG_FONT_WEIGHT)
          .fontSize($r('app.float.text_font_size'))
          .textAlign(TextAlign.Center)
          .margin({ left: $r('app.float.text_margin_left') })
          .fontColor($r('app.color.input_text_font'))
          .onClick(() => {
            this.controller.close();
            this.confirm();
          })
      }
      .margin({
        top: $r('app.float.row_margin_top'),
        bottom: $r('app.float.row_margin_bottom'),
        left: $r('app.float.row_margin_left')
      })
    }
    .width(CommonConstants.DIALOG_WIDTH)
    .borderRadius($r('app.float.dialog_border_radius'))
    .backgroundColor(Color.White)
  }
}