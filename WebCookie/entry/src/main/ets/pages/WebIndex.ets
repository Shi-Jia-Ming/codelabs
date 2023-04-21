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
import { CommonConstants, CookieOperation } from '../common/constants/CommonConstant';
import { LinkButton } from '../view/LinkButton'
import { showDialog } from '../common/utils/DialogUtil';

/**
 * Home page.
 */
@Entry
@Component
struct WebIndex {
  controller: web_webview.WebviewController = new web_webview.WebviewController();

  build() {
    Column() {
      Text($r('app.string.navigator_name'))
        .fontSize(CommonConstants.NAVIGATOR_SIZE)
        .fontWeight(CommonConstants.FONT_WEIGHT_DEEPER)
        .fontColor($r('app.color.navigator_black'))
        .width(CommonConstants.FULL_WIDTH)
        .margin({
          top: CommonConstants.APP_TITLE_MARGIN_TOP,
          left: CommonConstants.APP_TITLE_MARGIN_LEFT
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
        src: CommonConstants.USER_CENTER_URL,
        controller: this.controller
      })
        .height(CommonConstants.WEB_HEIGHT)
        .width(CommonConstants.WEB_WIDTH)
        .margin({ bottom: CommonConstants.WEB_MARGIN_BOTTOM })
        .onErrorReceive(() => {
          let message = $r('app.string.load_error');
          showDialog(message);
        })

      Row() {
        LinkButton({ buttonType: CookieOperation.GET_COOKIE, isNeedDivider: true })
        LinkButton({ buttonType: CookieOperation.SET_COOKIE, isNeedDivider: true })
        LinkButton({ buttonType: CookieOperation.DELETE_COOKIE, isNeedDivider: true })
        LinkButton({ buttonType: CookieOperation.VERIFY_COOKIE, isNeedDivider: false })
      }
      .width(CommonConstants.WEB_WIDTH)
    }
    .backgroundColor($r('app.color.page_background_grey'))
    .width(CommonConstants.FULL_WIDTH)
    .height(CommonConstants.FULL_HEIGHT)
  }
}