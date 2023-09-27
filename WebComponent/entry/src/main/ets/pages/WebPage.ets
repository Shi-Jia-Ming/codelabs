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

import router from '@ohos.router';
import webview from '@ohos.web.webview';
import prompt from '@ohos.promptAction';
import { CommonConstant as Const } from '../common/Constant';

@Entry
@Component
struct WebPage {
  webController: webview.WebviewController = new webview.WebviewController();
  @State params: object = router.getParams();
  @State progressVal: number = 0;
  @State isLoading: boolean = true;
  @State intervalLoading: number = -1;

  aboutToAppear() {
    this.intervalLoading = setInterval(() => {
      this.progressVal = this.progressVal >= Const.WebConstant_PROGRESS_MAX ?
      Const.WebConstant_PROGRESS_MIN : (this.progressVal + Const.WebConstant_PROGRESS_STEP);
    }, Const.WebConstant_MILLI_SECONDS);
  }

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      Image($r('app.media.background'))
        .width(Const.MainConstant_FULL_HEIGHT)
        .height(Const.MainConstant_IMAGE_HEIGHT)
      Row() {
        Column() {
          Row() {
            Image($rawfile('img/ic_public_back.png'))
              .width(Const.WebConstant_IMAGE_WIDTH)
              .height(Const.WebConstant_IMAGE_HEIGHT)
              .margin({ left: Const.WebConstant_IMAGE_MARGIN_LEFT })
              .onClick(() => {
                router.back()
              })
            Text($r('app.string.prompts'))
              .fontSize(Const.WebConstant_TOP_TEXT_FONT_SIZE)
              .width(Const.WebConstant_TOP_TEXT_WIDTH)
              .height(Const.WebConstant_TOP_TEXT_HEIGHT)
              .fontColor($r('app.color.black'))
              .margin({ left: Const.WebConstant_TOP_TEXT_MARGIN_LEFT })

          }.height(Const.WebConstant_TOP_ROW_HEIGHT)

          // Web component loading H5.
          Web({ src: this.params['path'], controller: this.webController })
            .zoomAccess(false)
            .width(Const.WebConstant_WIDTH)
            .aspectRatio(1)
            .margin({ left: Const.WebConstant_MARGIN_LEFT, right: Const.WebConstant_MARGIN_RIGHT,
              top: Const.WebConstant_MARGIN_TOP })
            .onConfirm((event) => {
              AlertDialog.show({
                message: Const.WEB_ALERT_DIALOG_TEXT_VALUE + event?.message,
                confirm: {
                  value: $r('app.string.web_alert_dialog_button_value'),
                  action: () => {
                    event?.result.handleConfirm();
                  }
                },
                cancel: () => {
                  event?.result.handleCancel();
                }
              });
              return true;
            })
            .onErrorReceive((event) => {
              if (event?.error.getErrorInfo() === 'ERR_INTERNET_DISCONNECTED') {
                prompt.showToast({
                  message: $r('app.string.internet_err'),
                  duration: Const.WebConstant_DURATION
                })
              }
              if (event?.error.getErrorInfo() === 'ERR_CONNECTION_TIMED_OUT') {
                prompt.showToast({
                  message: $r('app.string.internet_err'),
                  duration: Const.WebConstant_DURATION
                })
              }
            })
            .onProgressChange((event) => {
              if (event?.newProgress === Const.WebConstant_PROGRESS_MAX) {
                this.isLoading = false;
                clearInterval(this.intervalLoading);
                this.intervalLoading = -1;
              }
            })

          Column() {
            Text($r('app.string.textValue'))
              .fontSize(Const.WebConstant_TEXT_VALUE_FONT_SIZE)
              .textAlign(TextAlign.Center)
              .fontColor($r('app.color.text_value_font_color'))
              .height(Const.WebConstant_TEXT_VALUE_HEIGHT)
              .fontWeight(Const.WebConstant_TEXT_VALUE_FONT_WEIGHT)
              .margin({ top: Const.WebConstant_TEXT_VALUE_MARGIN_TOP })
            Text(this.params['tips'])
              .fontSize(Const.WebConstant_TIP_TEXT_VALUE_FONT_SIZE)
              .textAlign(TextAlign.Center)
              .fontColor($r('app.color.text_value_font_color'))
              .width(Const.WebConstant_TIP_TEXT_VALUE_WIDTH)
              .height(Const.WebConstant_TIP_TEXT_VALUE_HEIGHT)
              .opacity(Const.WebConstant_TIP_TEXT_VALUE_OPACITY)
              .margin({ top: Const.WebConstant_TIP_TEXT_VALUE_MARGIN_TOP })
          }

          Button($r('app.string.btnValue'))
            .fontSize(Const.WebConstant_BUTTON_FONT_SIZE)
            .fontColor($r('app.color.start_window_background'))
            .margin({ top: Const.WebConstant_BUTTON_MARGIN_TOP })
            .width(Const.WebConstant_BUTTON_WIDTH)
            .height(Const.WebConstant_BUTTON_HEIGHT)
            .backgroundColor($r('app.color.blue'))
            .borderRadius(Const.WebConstant_BUTTON_BORDER_RADIUS)
            .onClick(() => {
              this.webController.runJavaScript('startDraw()');
            })
        }
        .width(Const.WebConstant_FULL_WIDTH)
        .height(Const.WebConstant_FULL_HEIGHT)
      }

      if (this.isLoading) {
        Progress({
          value: Const.WebConstant_PROGRESS_MIN,
          total: Const.WebConstant_PROGRESS_MAX,
          type: ProgressType.ScaleRing
        })
          .color(Color.Grey)
          .value(this.progressVal)
          .width(Const.WebConstant_PROGRESS_WIDTH)
          .style({
            strokeWidth: Const.WebConstant_PROGRESS_STROKE_WIDTH,
            scaleCount: Const.WebConstant_PROGRESS_SCALE_COUNT,
            scaleWidth: Const.WebConstant_PROGRESS_SCALE_WIDTH
          })
          .zIndex(1)
          .position({
            x: Const.WebConstant_PROGRESS_POSITION_X,
            y: Const.WebConstant_PROGRESS_POSITION_Y
          })
      }
    }
    .backgroundColor($r('app.color.navy_blue'))
  }
}