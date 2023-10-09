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

import window from '@ohos.window';
import { CommonConstants } from '../constants/CommonConstants';
import Logger from './Logger';

@Observed
export class WindowUtil {
  private windowStage?: window.WindowStage;
  private mainWindowClass?: window.Window;
  private isShowingSubWindow: boolean = false;

  static getInstance(): WindowUtil | undefined {
    if (!AppStorage.get<WindowUtil>(CommonConstants.WINDOW_UTIL)) {
      AppStorage.setOrCreate(CommonConstants.WINDOW_UTIL, new WindowUtil());
    } else {
      Logger.info(`AppStorage does not have windowUtil`);
    }
    return AppStorage.get<WindowUtil>(CommonConstants.WINDOW_UTIL);
  }

  setWindowStage(windowStage: window.WindowStage): void {
    this.windowStage = windowStage;
  }

  getIsShowingSubWindow(): boolean {
    return this.isShowingSubWindow;
  }

  setMainWindowPortrait(): void {
    if (this.windowStage === undefined) {
      Logger.error(`WindowStage is undefined`);
      return;
    }
    // Obtain the main window of the application.
    this.windowStage.getMainWindow((err, windowClass: window.Window) => {
      this.mainWindowClass = windowClass;
      if (err.code) {
        Logger.error(`Failed to obtain the main window. Code:${err.code}, message:${err.message}`);
        return;
      }
      // Set portrait display.
      this.mainWindowClass.setPreferredOrientation(window.Orientation.PORTRAIT);
    });
  }

  setFullScreenBack(): void {
    if (this.mainWindowClass === undefined) {
      Logger.error(`MainWindowClass is undefined`);
      return;
    }
    this.mainWindowClass.setPreferredOrientation(window.Orientation.PORTRAIT);
    this.mainWindowClass.setWindowSystemBarEnable(['status', 'navigation']);
    // Set full-screen display.
    this.mainWindowClass.setFullScreen(false);
  }

  setMainWindowLandscape(): void {
    if (this.mainWindowClass === undefined) {
      Logger.error(`MainWindowClass is undefined`);
      return;
    }
    // Setting landscape display.
    this.mainWindowClass.setPreferredOrientation(window.Orientation.LANDSCAPE_INVERTED);
    this.mainWindowClass.setPreferredOrientation(window.Orientation.AUTO_ROTATION_LANDSCAPE);
    // Set the status bar and navigation bar to be invisible in full-screen mode.
    this.mainWindowClass.setWindowSystemBarEnable([]);
    // Set full-screen display.
    this.mainWindowClass.setWindowLayoutFullScreen(true, (err) => {
      if (err.code) {
        Logger.error('Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(err));
        return;
      }
      Logger.info('Succeeded in setting the window layout to full-screen mode.');
    });
  }

  getMainWindow(): window.Window | undefined {
    return this.mainWindowClass;
  }
}