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
import { WebConstant, MainConstant, WEB_ALERT_DIALOG_TEXT_VALUE } from '../common/Constant';

@Entry
@Component
struct WebPage {
  webController: WebController = new WebController();
  @State params: object = router.getParams();

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      Image($r('app.media.background'))
        .height(MainConstant.IMAGE_HEIGHT)
      Row() {
        Column() {
          Row() {
            Image($rawfile('img/ic_public_back.png'))
              .width(WebConstant.IMAGE_WIDTH)
              .height(WebConstant.IMAGE_HEIGHT)
              .margin({ left: WebConstant.IMAGE_MARGIN_LEFT })
              .onClick(() => {
                router.back()
              })
            Text($r('app.string.prompts'))
              .fontSize(WebConstant.TOP_TEXT_FONT_SIZE)
              .width(WebConstant.TOP_TEXT_WIDTH)
              .height(WebConstant.TOP_TEXT_HEIGHT)
              .fontColor($r('app.color.black'))
              .margin({ left: WebConstant.TOP_TEXT_MARGIN_LEFT })

          }.height(WebConstant.TOP_ROW_HEIGHT)

          // web组件加载本地H5
          Web({ src: this.params['path'], controller: this.webController })
            .zoomAccess(false)
            .width(WebConstant.WIDTH)
            .aspectRatio(1)
            .margin({ left: WebConstant.MARGIN_LEFT, right: WebConstant.MARGIN_RIGHT, top: WebConstant.MARGIN_TOP })
            .onConfirm((event) => {
              AlertDialog.show({
                message: `${WEB_ALERT_DIALOG_TEXT_VALUE}` + `${event.message}`,
                confirm: {
                  value: $r('app.string.web_alert_dialog_button_value'),
                  action: () => {
                    event.result.handleConfirm();
                  }
                },
                cancel: () => {
                  event.result.handleCancel();
                }
              });
              return true;
            })

          Column() {
            Text($r('app.string.textValue'))
              .fontSize(WebConstant.TEXT_VALUE_FONT_SIZE)
              .textAlign(TextAlign.Center)
              .fontColor($r('app.color.text_value_font_color'))
              .width(WebConstant.TEXT_VALUE_WIDTH)
              .height(WebConstant.TEXT_VALUE_HEIGHT)
              .fontWeight(WebConstant.TEXT_VALUE_FONT_WEIGHT)
              .margin({ top: WebConstant.TEXT_VALUE_MARGIN_TOP })
            Text(this.params['tips'])
              .fontSize(WebConstant.TIP_TEXT_VALUE_FONT_SIZE)
              .textAlign(TextAlign.Center)
              .fontColor($r('app.color.text_value_font_color'))
              .width(WebConstant.TIP_TEXT_VALUE_WIDTH)
              .height(WebConstant.TIP_TEXT_VALUE_HEIGHT)
              .opacity(WebConstant.TIP_TEXT_VALUE_OPACITY)
              .margin({ top: WebConstant.TIP_TEXT_VALUE_MARGIN_TOP })
          }

          Button($r('app.string.btnValue'))
            .fontSize(WebConstant.BUTTON_FONT_SIZE)
            .fontColor($r('app.color.start_window_background'))
            .margin({ top: WebConstant.BUTTON_MARGIN_TOP })
            .width(WebConstant.BUTTON_WIDTH)
            .height(WebConstant.BUTTON_HEIGHT)
            .backgroundColor($r('app.color.blue'))
            .borderRadius(WebConstant.BUTTON_BORDER_RADIUS)
            .onClick(() => {
              this.webController.runJavaScript({ script: 'startDraw()' });
            })
        }
        .width(WebConstant.FULL_WIDTH)
        .height(WebConstant.FULL_HEIGHT)
      }
    }
    .backgroundColor($r('app.color.navy_blue'))
  }
}