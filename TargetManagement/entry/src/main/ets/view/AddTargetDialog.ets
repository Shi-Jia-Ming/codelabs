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

import { CommonConstants } from '../common/constant/CommonConstant';

@CustomDialog
export default struct AddTargetDialog {
  @State subtaskName: string = '';
  private controller?: CustomDialogController;
  onClickOk?: (value: string) => void;

  build() {
    Column() {
      Text($r('app.string.add_task_dialog'))
        .width(CommonConstants.FULL_WIDTH)
        .fontSize($r('app.float.secondary_title'))
        .fontWeight(CommonConstants.FONT_WEIGHT)
        .fontColor($r('app.color.title_black_color'))
        .textAlign(TextAlign.Start)
      TextInput({ placeholder: $r('app.string.input_target_name')})
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: $r('app.float.list_font')})
        .caretColor(Color.Blue)
        .backgroundColor($r('app.color.input_background'))
        .width(CommonConstants.FULL_WIDTH)
        .height(CommonConstants.DIALOG_INPUT_HEIGHT)
        .margin({ top: CommonConstants.DIALOG_INPUT_MARGIN })
        .fontSize($r('app.float.list_font'))
        .fontColor($r('app.color.title_black_color'))
        .onChange((value: string) => {
          this.subtaskName = value;
        })
      Blank()
      Row() {
        Button($r('app.string.cancel_button'))
          .dialogButtonStyle()
          .onClick(() => {
            this.controller?.close();
          })
        Divider()
          .vertical(true)
        Button($r('app.string.confirm_button'))
          .dialogButtonStyle()
          .onClick(() => {
            if (this.onClickOk !== undefined) {
              this.onClickOk(this.subtaskName);
            }
          })
      }
      .width(CommonConstants.DIALOG_OPERATION_WIDTH)
      .height(CommonConstants.DIALOG_OPERATION_HEIGHT)
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .padding($r('app.float.dialog_padding'))
    .height($r('app.float.dialog_height'))
    .width(CommonConstants.DIALOG_WIDTH)
    .borderRadius(CommonConstants.DIALOG_BORDER_RADIUS)
    .backgroundColor(Color.White)
  }
}

/**
 * Custom button style.
 */
@Extend(Button) function dialogButtonStyle() {
  .fontSize($r('app.float.button_font'))
  .height($r('app.float.dialog_btn_height'))
  .width($r('app.float.dialog_btn_width'))
  .backgroundColor(Color.White)
  .fontColor($r('app.color.main_blue'))
}