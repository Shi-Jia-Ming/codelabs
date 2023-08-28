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
import router from '@ohos.router';
import { showDialog } from '../common/utils/DialogUtil';
import { CommonConstants, CookieOperation } from '../common/constants/CommonConstant';
import Logger from '../common/utils/Logger';

/**
 * Link component.
 */
@Component
export struct LinkButton {
  buttonType: string;
  isNeedDivider: boolean;

  build() {
    Row() {
      Text(this.buttonType)
        .fontColor($r('app.color.link_blue'))
        .fontSize(CommonConstants.BUTTON_SIZE)
        .textAlign(TextAlign.Center)
        .fontWeight(FontWeight.Normal)
        .onClick(() => {
          this.operationMethod();
        })

      if (this.isNeedDivider) {
        Divider()
          .vertical(true)
          .margin(CommonConstants.DIVIDER_MARGIN)
          .height(CommonConstants.DIVIDER_HEIGHT)
      }
    }
  }

  operationMethod(): void {
    switch (this.buttonType) {
      case CookieOperation.GET_COOKIE:
        try {
          let originCookie = web_webview.WebCookieManager.getCookie(CommonConstants.USER_CENTER_URL);
          showDialog(originCookie);
        } catch (error) {
          showDialog(`ErrorCode: ${error.code},  Message: ${error.message}`);
        }
        break;
      case CookieOperation.SET_COOKIE:
        try {
          web_webview.WebCookieManager.setCookie(CommonConstants.USER_ABOUT_URL, 'info=测试cookie写入');
          showDialog($r('app.string.write_success'));
        } catch (error) {
          showDialog(`ErrorCode: ${error.code},  Message: ${error.message}`);
        }
        break;
      case CookieOperation.DELETE_COOKIE:
        web_webview.WebCookieManager.deleteEntireCookie();
        let deleteMessage = $r('app.string.delete_success');
        showDialog(deleteMessage);
        break;
      case CookieOperation.VERIFY_COOKIE:
        router.pushUrl({
          url: CommonConstants.PAGE_VERIFY
        }).catch((err: Error) => {
            Logger.error(`[LinkButton] push url fail: ${err}`);
        });
        break;
      default:
        break;
    }
  }
}