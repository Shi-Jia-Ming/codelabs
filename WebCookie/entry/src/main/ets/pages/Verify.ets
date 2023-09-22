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

import web_webview from '@ohos.web.webview';
import { showDialog } from '../common/utils/DialogUtil';
import { CommonConstants } from '../common/constants/CommonConstant';

/**
 * Page use to verify login free.
 */
@Entry
@Component
struct Verify {
  fileAccess: boolean = true;
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  isRedirect: boolean = false;

  onPageShow(): void {
    this.isRedirect = false;
  }

  build() {
    Column() {
      Navigator({ target: CommonConstants.PAGE_INDEX, type: NavigationType.Back }) {
        Row() {
          Image($r('app.media.ic_back'))
            .width(CommonConstants.BACK_WIDTH)
            .height(CommonConstants.BACK_HEIGHT)
            .objectFit(ImageFit.Contain)

          Text($r('app.string.navigator_name'))
            .fontSize(CommonConstants.NAVIGATOR_SIZE)
            .fontWeight(CommonConstants.FONT_WEIGHT_DEEPER)
            .fontColor($r('app.color.navigator_black'))
        }
        .width(CommonConstants.FULL_WIDTH)
      }
      .width(CommonConstants.FULL_WIDTH)
      .margin({
        top: CommonConstants.NAVIGATOR_MARGIN_TOP,
        left: CommonConstants.NAVIGATOR_MARGIN_LEFT
      })

      Text($r('app.string.title_name'))
        .fontSize(CommonConstants.TITLE_SIZE)
        .fontWeight(CommonConstants.FONT_WEIGHT_DEEPER)
        .fontColor($r('app.color.title_black'))
        .width(CommonConstants.PAGE_TITLE_WIDTH)
        .height(CommonConstants.PAGE_TITLE_HEIGHT)
        .margin({
          top: $r('app.float.page_title_margin_top'),
          bottom: $r('app.float.page_title_margin_bottom')
        })

      Web({
        src: CommonConstants.USER_ABOUT_URL,
        controller: this.controller
      })
        .height(CommonConstants.WEB_HEIGHT)
        .width(CommonConstants.WEB_WIDTH)
        .fileAccess(this.fileAccess)
        .javaScriptAccess(true)
        .onPageEnd(() => {
          try {
            let originCookie = web_webview.WebCookieManager.getCookie(CommonConstants.USER_ABOUT_URL);
            if (originCookie === '' || this.isRedirect) {
              return;
            }
            this.isRedirect = true;
            showDialog(originCookie);
          } catch (error) {
            showDialog('Failed to load the web page.'+JSON.stringify(error));
          }
        })
    }
    .backgroundColor($r('app.color.page_background_grey'))
    .width(CommonConstants.FULL_WIDTH)
    .height(CommonConstants.FULL_HEIGHT)
  }
}