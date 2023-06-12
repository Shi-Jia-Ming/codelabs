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

import libHello from 'libhello.so';
import CommonContants from '../../common/CommonContants';

@Entry
@Component
struct NativeTemplate {
  @State result: string = '0';
  @State numX: number = 0.0;
  @State numY: number = 0.0;
  private textInputControllerX: TextInputController = new TextInputController();
  private textInputControllerY: TextInputController = new TextInputController();

  build() {
    Column() {
      Row() {
        Text($r('app.string.title'))
          .fontSize($r('app.float.tittle_font_size'))
          .fontWeight(CommonContants.FONT_WEIGHT)
          .height($r('app.float.title_text_height'))
          .align(Alignment.Center)
          .maxLines(CommonContants.MAX_LINES)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      .height($r('app.float.title_height'))
      .width(CommonContants.FULL_PARENT)
      .padding({
        left: $r('app.float.text_padding_left'),
        right: $r('app.float.text_padding_left'),
        top: $r('app.float.text_padding_top')
      })
      Row() {
        Text($r('app.string.message'))
          .fontSize($r('app.float.message_font_size'))
          .fontWeight(CommonContants.FONT_WEIGHT)
          .height($r('app.float.message_text_height'))
          .align(Alignment.Center)
          .maxLines(CommonContants.MAX_LINES)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
        Image($r('app.media.ic_formula'))
          .height($r('app.float.message_formula_height'))
      }
      .height($r('app.float.message_height'))
      .width(CommonContants.FULL_PARENT)
      .padding({ left: $r('app.float.text_padding_left'), right: $r('app.float.text_padding_left') })
      .justifyContent(FlexAlign.Start)
      .alignItems(VerticalAlign.Bottom)
      Column() {
        Row() {
          Text($r('app.string.result_tip'))
            .height($r('app.float.tips_result_message_height'))
            .fontColor($r('app.color.tips_result_color'))
            .fontSize($r('app.float.tips_result_font_size'))
        }
        .height($r('app.float.tips_result_height'))
        .justifyContent(FlexAlign.End)
        .alignItems(VerticalAlign.Bottom)
        .width(CommonContants.FULL_PARENT)
        .padding({
          bottom: $r('app.float.tips_result_padding_bottom'),
          right: $r('app.float.tips_result_padding_right')
        })
        Row() {
          Text(this.result)
            .textAlign(TextAlign.End)
            .fontColor(Color.Black)
            .fontSize($r('app.float.result_font_size'))
            .width(CommonContants.FULL_PARENT)
            .height(CommonContants.FULL_PARENT)
            .textOverflow({ overflow: TextOverflow.Clip })
        }
        .height($r('app.float.result_height'))
        .padding({ right: $r('app.float.result_padding_right') })
        .width(CommonContants.FULL_PARENT)
        .justifyContent(FlexAlign.End)
        Row() {
          Text($r('app.string.input_x_value'))
            .fontColor(Color.Black)
            .fontSize($r('app.float.num_tips_font_size'))
            .height($r('app.float.tips_num_text_height'))
          TextInput({ controller: this.textInputControllerX })
            .type(InputType.Number)
            .height(CommonContants.FULL_PARENT)
            .margin({ left: $r('app.float.text_input_margin_left') })
            .layoutWeight(CommonContants.TEXTINPUT_LAYOUT_WEIGHT)
            .onChange(value => {
              this.numX = parseFloat(value);
            })
        }
        .height($r('app.float.tips_num_height'))
        .margin({ top: $r('app.float.first_tips_num_margin_top') })
        .padding({ left: $r('app.float.text_input_padding'), right: $r('app.float.text_input_padding') })
        .width(CommonContants.FULL_PARENT)
        .justifyContent(FlexAlign.Start)
        Row() {
          Text($r('app.string.input_y_value'))
            .fontColor(Color.Black)
            .fontSize($r('app.float.num_tips_font_size'))
            .height($r('app.float.tips_num_text_height'))
          TextInput({ controller: this.textInputControllerY })
            .type(InputType.Number)
            .height(CommonContants.FULL_PARENT)
            .margin({ left: $r('app.float.text_input_margin_left') })
            .layoutWeight(CommonContants.TEXTINPUT_LAYOUT_WEIGHT)
            .onChange(value => {
              this.numY = parseFloat(value);
            })
        }
        .height($r('app.float.tips_num_height'))
        .margin({ top: $r('app.float.second_tips_num_margin_top') })
        .padding({ left: $r('app.float.text_input_padding'), right: $r('app.float.text_input_padding') })
        .width(CommonContants.FULL_PARENT)
        .justifyContent(FlexAlign.Start)
      }
      .margin($r('app.float.function_area_margin'))
      .borderRadius($r('app.float.function_area_border_radius'))
      .height($r('app.float.function_area_height'))
      .backgroundColor(Color.White)
      Row() {
        Button($r('app.string.submit_button'))
          .fontSize($r('app.float.submit_button_font_size'))
          .fontWeight(CommonContants.FONT_WEIGHT)
          .height(CommonContants.FULL_PARENT)
          .width($r('app.float.button_width'))
          .onClick(() => {
            let resultTemp = libHello.myHypot(this.numX, this.numY);
            if (resultTemp > CommonContants.MAX_RESULT) {
              this.result = resultTemp.toExponential(CommonContants.EXPONENTIAL_COUNT);
            } else {
              this.result = resultTemp.toFixed(CommonContants.FIXED_COUNT);
            }
          })
      }
      .height($r('app.float.button_height'))
      .width(CommonContants.FULL_PARENT)
      .justifyContent(FlexAlign.Center)
      .margin({ top: $r('app.float.button_margin_top') })
    }
    .width(CommonContants.FULL_PARENT)
    .height(CommonContants.FULL_PARENT)
    .backgroundColor($r('app.color.background_color'))
  }
}