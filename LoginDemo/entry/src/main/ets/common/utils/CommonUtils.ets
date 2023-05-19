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

import router from '@ohos.router';
import libCheckNapi from 'libentry.so';
import promptAction from '@ohos.promptAction';
import CommonConstants from '../constants/CommonConstants';
import Logger from './Logger';

/**
 * Common operation tools.
 */
export class CommonUtils {
  /**
   * ArkTS login account and password.
   *
   * @param {string} account account
   * @param {string} password password
   */
  public loginArkTS(account: string, password: string): void {
    let check: Resource | string = this.loginCheckArkTS(account, password);
    if (CommonConstants.LOGIN_TEXT !== check) {
      Logger.error(CommonConstants.TAG_COMMON_UTILS, 'login account or password is empty');
      this.showToastContent(check);
      return;
    }
    this.routerPage(CommonConstants.MAIN_PAGE_URL);
  }

  /**
   * Native login account and password.
   *
   * @param {string} account account
   * @param {string} password password
   */
  public loginNative(account: string, password: string): void {
    let check: string = this.loginCheckNative(account, password);
    if (CommonConstants.LOGIN_TEXT !== check) {
      Logger.error(CommonConstants.TAG_COMMON_UTILS, 'login account or password is empty');
      this.showToastContent(check);
      return;
    }
    this.routerPage(CommonConstants.MAIN_PAGE_URL);
  }

  /**
   * CHeck account and password is it empty.
   *
   * @param {string} account account
   * @param {string} password password
   * @return {Resource|string} return check result
   */
   private loginCheckArkTS(account: string, password: string): Resource | string {
    let check: string = '';
    if (account === '') {
      return $r('app.string.please_input_account');
    } else if (password === '') {
      return $r('app.string.please_input_password');
    } else {
      check = CommonConstants.LOGIN_TEXT;
    }
    return check;
  }

  /**
   * Native login account and password.
   *
   * @param {string} account account
   * @param {string} password password
   * @return {string} return  check result
   */
  private loginCheckNative(account: string, password: string): string {
    let check: string = libCheckNapi.nativeCheck(account, password);
    return check;
  }

  /**
   * Router page
   *
   * @param {string} url page url
   */
  public routerPage(url: string): void {
    router.replaceUrl({
      url: url
    }).catch((error) => {
      Logger.error(CommonConstants.TAG_COMMON_UTILS, 'replace url error ' + JSON.stringify(error));
    });
  }

  /**
   * Show toast content.
   *
   * @param {Resource | string} content content to show
   */
  public showToastContent(content: Resource | string): void {
    promptAction.showToast({
      message: content,
      duration: CommonConstants.TOAST_DURATION
    });
  }
}

export default new CommonUtils();