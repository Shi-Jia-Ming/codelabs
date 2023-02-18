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
import {
  USER_CENTER_URL,
  NAVIGATOR_SIZE,
  TITLE_SIZE,
  FULL_HEIGHT,
  FULL_WIDTH,
  WEB_HEIGHT,
  WEB_WIDTH,
  PAGE_TITLE_HEIGHT,
  PAGE_TITLE_WIDTH,
  FONT_WEIGHT_DEEPER,
  APP_TITLE_MARGIN_TOP,
  APP_TITLE_MARGIN_LEFT,
  WEB_MARGIN_BOTTOM,
  CookieOperation
} from '../common/constants/CommonConstant';
import { LinkButton } from '../view/LinkButton'
import { showDialog } from '../common/utils/DialogUtil';

/**
 * Home page
 */
@Entry
@Component
struct WebIndex {
  controller: web_webview.WebviewController = new web_webview.WebviewController();

  build() {
    Column() {
      Text($r('app.string.navigator_name'))
        .fontSize(NAVIGATOR_SIZE)
        .fontWeight(FONT_WEIGHT_DEEPER)
        .fontColor($r('app.color.navigator_black'))
        .width(FULL_WIDTH)
        .margin({ top: APP_TITLE_MARGIN_TOP, left: APP_TITLE_MARGIN_LEFT })

      Text($r('app.string.title_name'))
        .fontSize(TITLE_SIZE)
        .fontWeight(FONT_WEIGHT_DEEPER)
        .fontColor($r('app.color.title_black'))
        .width(PAGE_TITLE_WIDTH)
        .height(PAGE_TITLE_HEIGHT)
        .margin({ top: $r('app.float.page_title_margin_top'), bottom: $r('app.float.page_title_margin_bottom') })

      Web({
        src: USER_CENTER_URL,
        controller: this.controller
      })
        .height(WEB_HEIGHT)
        .width(WEB_WIDTH)
        .margin({ bottom: WEB_MARGIN_BOTTOM })
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
      .width(WEB_WIDTH)
    }
    .backgroundColor($r('app.color.page_background_grey'))
    .width(FULL_WIDTH)
    .height(FULL_HEIGHT)
  }
}