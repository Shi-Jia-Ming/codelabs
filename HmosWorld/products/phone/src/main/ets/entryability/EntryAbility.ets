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

import UIAbility from '@ohos.app.ability.UIAbility';
import webview from '@ohos.web.webview';
import window from '@ohos.window';
import buffer from '@ohos.buffer';
import { initialize } from '@hw-agconnect/hmcore';
import { Logger } from '@ohos/common';
import { requestFullScreen } from '../utils/WindowUtil';
import { AppConstants } from '../constants/AppConstants';

const TAG = '[EntryAbility]';

export default class EntryAbility extends UIAbility {
  onCreate() {
    Logger.info(TAG, 'Ability onCreate');
    webview.WebviewController.initializeWebEngine();
  }

  async initAgc() {
    const context = this.context;
    const value = await context.resourceManager.getRawFileContent("agconnect-services.json");
    let json: string = buffer.from(value).toString("utf8");
    initialize(this.context, JSON.parse(json));
  }

  onDestroy() {
    Logger.info(TAG, 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    Logger.info(TAG, 'Ability onWindowStageCreate');
    this.initAgc();
    AppStorage.setOrCreate<number>('statusBarHeight', AppConstants.DEFAULT_STATUS_HEIGHT);
    requestFullScreen(windowStage, this.context);
    windowStage.loadContent('pages/SplashPage');
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    Logger.info(TAG, 'Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    Logger.info(TAG, 'Ability onForeground');
  }

  onBackground() {
    // Ability has back to background
    Logger.info(TAG, 'Ability onBackground');
  }
}
