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

import webview from '@ohos.web.webview';
import { Logger } from '@ohos/common';
import { ChallengeConstants } from '../constants/ChallengeConstants';

const TAG = '[ChallengeDetailPage]';

@Entry
@Component
struct ChallengeDetailPage {
  url = 'https://developer.huawei.com/consumer/cn/hdc/hdc2023/codelabs/index.html';
  @State webViewController: webview.WebviewController = new webview.WebviewController();

  onBackPress(): boolean {
    if (this.webViewController.accessBackward()) {
      this.webViewController.backward();
      return true;
    }
    return false;
  }

  build() {
    Column() {
      Web({ controller: this.webViewController, src: this.url })
        .darkMode(WebDarkMode.Auto)
        .domStorageAccess(true)
        .zoomAccess(true)
        .fileAccess(true)
        .mixedMode(MixedMode.All)
        .cacheMode(CacheMode.None)
        .javaScriptAccess(true)
        .onProgressChange((event) => {
          Logger.info(TAG, 'newProgress:' + event?.newProgress);
        })
        .onPageBegin(() => {
          Logger.info(TAG, 'start loading');
        })
        .onPageEnd(() => {
          Logger.info(TAG, 'loading completed');

        })
        .width(ChallengeConstants.FULL_PERCENT)
        .height(ChallengeConstants.FULL_PERCENT)
    }
    .padding({ top: AppStorage.get<number>('statusBarHeight') })
    .width(ChallengeConstants.FULL_PERCENT)
    .height(ChallengeConstants.FULL_PERCENT)
  }
}