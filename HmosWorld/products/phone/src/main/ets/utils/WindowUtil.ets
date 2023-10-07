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

import { BusinessError } from '@ohos.base';
import window from '@ohos.window';
import { Logger } from '@ohos/common';

const TAG = '[WindowUtil]';

export function requestFullScreen(windowStage: window.WindowStage, context: Context): void {
  windowStage.getMainWindow((err: BusinessError, data: window.Window) => {
    if (err.code) {
      Logger.error(TAG, 'Failed to obtain the main window. Cause: ' + JSON.stringify(err));
      return;
    }
    let windowClass: window.Window = data;
    Logger.info(TAG, 'Succeeded in obtaining the main window. Data: ' + JSON.stringify(data));

    // Realize the immersive effect
    let isLayoutFullScreen = true;
    try {
      let type = window.AvoidAreaType.TYPE_SYSTEM;
      // Get status bar height.
      let area: window.AvoidArea = windowClass.getWindowAvoidArea(type);
      getDeviceSize(context, area);
      let promise: Promise<void> = windowClass.setWindowLayoutFullScreen(isLayoutFullScreen);
      promise.then(() => {
        Logger.info(TAG, 'Succeeded in setting the window layout to full-screen mode.');
      }).catch((err: BusinessError) => {
        Logger.error(TAG, 'Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(err));
      });
    } catch {
      Logger.error(TAG, 'Failed to set the window layout to full-screen mode. ');
    }
  });
}

function getDeviceSize(context: Context, area: window.AvoidArea): void {
  // Get device height.
  window.getLastWindow(context).then((data: window.Window) => {
    let properties = data.getWindowProperties();
    if (area.topRect.height>0) {
      AppStorage.setOrCreate<number>('statusBarHeight', px2vp(area.topRect.height));
    }
    AppStorage.setOrCreate<number>('deviceHeight', px2vp(properties.windowRect.height));
    AppStorage.setOrCreate<number>('deviceWidth', px2vp(properties.windowRect.width));
  });
}