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
import {
  USER_ABOUT_URL,
  NAVIGATOR_SIZE,
  TITLE_SIZE,
  PAGE_INDEX,
  FULL_WIDTH,
  FULL_HEIGHT,
  BACK_WIDTH,
  BACK_HEIGHT,
  WEB_WIDTH,
  WEB_HEIGHT,
  PAGE_TITLE_HEIGHT,
  PAGE_TITLE_WIDTH,
  NAVIGATOR_MARGIN_TOP,
  NAVIGATOR_MARGIN_LEFT,
  FONT_WEIGHT_DEEPER
} from '../common/constants/CommonConstant';

/**
 * Page use to verify login free
 */
@Entry
@Component
struct Verify {
  fileAccess: boolean = true;
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  isRedirect: boolean;

  onPageShow(): void {
    this.isRedirect = false;
  }

  build() {
    Column() {
      Navigator({ target: PAGE_INDEX, type: NavigationType.Back }) {
        Row() {
          Image($r('app.media.ic_back'))
            .width(BACK_WIDTH)
            .height(BACK_HEIGHT)
            .objectFit(ImageFit.Contain)

          Text($r('app.string.navigator_name'))
            .fontSize(NAVIGATOR_SIZE)
            .fontWeight(FONT_WEIGHT_DEEPER)
            .fontColor($r('app.color.navigator_black'))
        }
        .width(FULL_WIDTH)
      }
      .width(FULL_WIDTH)
      .margin({ top: NAVIGATOR_MARGIN_TOP, left: NAVIGATOR_MARGIN_LEFT })

      Text($r('app.string.title_name'))
        .fontSize(TITLE_SIZE)
        .fontWeight(FONT_WEIGHT_DEEPER)
        .fontColor($r('app.color.title_black'))
        .width(PAGE_TITLE_WIDTH)
        .height(PAGE_TITLE_HEIGHT)
        .margin({ top: $r('app.float.page_title_margin_top'), bottom: $r('app.float.page_title_margin_bottom') })

      Web({
        src: USER_ABOUT_URL,
        controller: this.controller
      })
        .height(WEB_HEIGHT)
        .width(WEB_WIDTH)
        .fileAccess(this.fileAccess)
        .javaScriptAccess(true)
        .onPageEnd(() => {
          try {
            let originCookie = web_webview.WebCookieManager.getCookie(USER_ABOUT_URL);
            if (originCookie === '' || this.isRedirect) {
              return;
            }
            this.isRedirect = true;
            showDialog(originCookie);
          } catch (error) {
            showDialog(`ErrorCode: ${error.code},  Message: ${error.message}`);
          }
        })
    }
    .backgroundColor($r('app.color.page_background_grey'))
    .width(FULL_WIDTH)
    .height(FULL_HEIGHT)
  }
}