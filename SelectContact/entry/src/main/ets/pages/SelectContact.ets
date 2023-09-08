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

import WebView from '@ohos.web.webview';
import display from '@ohos.display';
import promptAction from '@ohos.promptAction';
import JSBridge from '../common/utils/JsBridge';
import { CommonConstants } from '../common/constant/CommonConstant';
import Logger from '../common/utils/Logger';

@Entry
@Component
struct SelectContact {
  @StorageLink('isClick') isClick: boolean = false;
  @StorageLink('tel') phoneNumber: string = '';
  @StorageLink('proportion') proportion: number = 0;
  @State chargeTip: Resource = $r('app.string.recharge_button');
  webController: WebView.WebviewController = new WebView.WebviewController();
  private jsBridge: JSBridge = new JSBridge(this.webController);

  aboutToAppear() {
    display.getAllDisplays((err, displayClass: display.Display[]) => {
      if (err.code) {
        Logger.error('SelectContact Page', 'Failed to obtain all the display objects. Code: ' + JSON.stringify(err));
        return;
      }
      this.proportion = displayClass[0].densityDPI / CommonConstants.COMMON_VALUE;
      Logger.info('Succeeded in obtaining all the display objects. Data: ' + JSON.stringify(displayClass));
    });
  }

  build() {
    Column() {
      Row() {
        Text($r('app.string.navigation_title'))
          .fontSize($r('app.float.font_size_large'))
          .fontWeight(FontWeight.Medium)
      }
      .height($r('app.float.navigation_height'))
      .width(CommonConstants.FULL_SIZE)
      .alignItems(VerticalAlign.Center)
      .padding({ left: $r('app.float.padding_left_normal') })

      Web({
        src: $rawfile('MainPage.html'),
        controller: this.webController
      })
        .javaScriptAccess(true)
        .javaScriptProxy(this.jsBridge.javaScriptProxy)
        .height($r('app.float.web_height'))
        .onPageBegin(() => {
          this.jsBridge.initJsBridge();
        })

      Blank()

      Button(this.chargeTip)
        .width(CommonConstants.FULL_SIZE)
        .height($r('app.float.button_height'))
        .margin({ bottom: $r('app.float.button_margin_bottom') })
        .enabled(this.isClick)
        .onClick(() => {
          promptAction.showToast({
            message: this.phoneNumber === '' ? $r('app.string.phone_check') : $r('app.string.recharge_success')
          });
        })
    }
    .width(CommonConstants.FULL_SIZE)
    .height(CommonConstants.FULL_SIZE)
    .backgroundColor($r('app.color.page_color'))
    .padding({
      left: $r('app.float.margin_left_normal'),
      right: $r('app.float.margin_right_normal')
    })
  }
}