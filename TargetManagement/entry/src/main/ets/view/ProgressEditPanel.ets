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

@Component
export default struct ProgressEditPanel {
  @Link sliderMode: number;
  @Prop slidingProgress: number = 0;
  onCancel?: () => void;
  onClickOK?: (progress: number) => void;

  build() {
    Column() {
      Row() {
        Slider({
          value: this.slidingProgress,
          min: CommonConstants.SLIDER_MIN_VALUE,
          max: CommonConstants.SLIDER_MAX_VALUE,
          style: SliderStyle.InSet,
          step: CommonConstants.SLIDER_STEP
        })
          .width(CommonConstants.SLIDER_INNER_WIDTH)
          .onChange((value: number, mode: SliderChangeMode) => {
            this.slidingProgress = Math.floor(value);
            this.sliderMode = mode;
          })
        Text(`${this.slidingProgress}%`)
          .fontSize($r('app.float.progress_font'))
          .fontWeight(CommonConstants.FONT_WEIGHT)
          .fontColor($r('app.color.dialog_progress'))
          .textAlign(TextAlign.Center)
          .margin({ left: $r('app.float.slider_margin_left') })
      }
      .width(CommonConstants.SLIDER_WIDTH)
      .height(CommonConstants.SLIDER_HEIGHT)

      Row() {
        CustomButton({
          buttonText: $r('app.string.cancel_button')
        })
          .onClick(() => {
            if (this.onCancel !== undefined) {
              this.onCancel();
            }
          })
        CustomButton({
          buttonText: $r('app.string.confirm_button')
        })
          .onClick(() => {
            if (this.onClickOK !== undefined) {
              this.onClickOK(this.slidingProgress);
            }
          })
      }
      .margin({ top: CommonConstants.SLIDER_BUTTON_MARGIN })
      .width(CommonConstants.DIALOG_OPERATION_WIDTH)
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .height($r('app.float.edit_panel_height'))
    .width(CommonConstants.FULL_WIDTH)
    .justifyContent(FlexAlign.End)
  }
}

@Component
struct CustomButton {
  @State buttonColor: Resource = $r('app.color.start_window_background');
  buttonText?: Resource;

  build() {
    Text(this.buttonText)
      .dialogButtonStyle()
      .backgroundColor(this.buttonColor)
      .borderRadius(CommonConstants.LIST_RADIUS)
      .textAlign(TextAlign.Center)
      .onTouch((event?: TouchEvent) => {
        if (event !== undefined && event.type === TouchType.Down) {
          this.buttonColor = $r('app.color.custom_button_color');
        }
        if (event !== undefined && event.type === TouchType.Up) {
          this.buttonColor = $r('app.color.start_window_background');
        }
      })
  }
}

/**
 * Custom button style.
 */
@Extend(Text) function dialogButtonStyle() {
  .fontSize($r('app.float.button_font'))
  .height($r('app.float.dialog_btn_height'))
  .width($r('app.float.dialog_btn_width'))
  .fontColor($r('app.color.main_blue'))
}