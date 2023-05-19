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

import display from '@ohos.display';
import CommonConstants from '../common/constants/CommonConstants';
import Logger from '../common/utils/Logger';
import window from '@ohos.window';

/**
 * Window controller model.
 */
export default class WindowModel {
  private windowStage: window.WindowStage;
  private subWindowClass: window.Window;

  /**
   * Get singleton.
   *
   * @return {WindowModel} globalThis.WindowModel
   */
  static getInstance(): WindowModel {
    if (globalThis.WindowModel === undefined) {
      globalThis.WindowModel = new WindowModel();
    }
    return globalThis.WindowModel;
  }

  /**
   * Set windowStage.
   *
   * @param windowStage The object of WindowStage.
   */
  setWindowStage(windowStage: window.WindowStage) {
    this.windowStage = windowStage;
    
  }

  /**
   * Create sub window.
   */
  createSubWindow() {
    this.windowStage.createSubWindow(CommonConstants.SUB_WINDOW_NAME, (err, data: window.Window) => {
      if (err.code) {
        Logger.error(`Failed to create the window. Code:${err.code}, message:${err.message}`);
        return;
      }
      // Obtains a child window instance.
      this.subWindowClass = data;
      // Obtains the screen width and height.
      let screenWidth = display.getDefaultDisplaySync().width;
      let screenHeight = display.getDefaultDisplaySync().height;
      // Calculate the sub-window width and height based on the sub-window aspect ratio.
      let windowWidth = screenWidth * CommonConstants.SUB_WINDOW_WIDTH_RATIO;
      let windowHeight = windowWidth / CommonConstants.SUB_WINDOW_ASPECT_RATIO;
      // Calculate the start coordinate of the sub-window.
      let moveX = (screenWidth - windowWidth) / 2;
      let moveY = screenHeight - windowHeight;
      this.subWindowClass.moveWindowTo(moveX, moveY, (err) => {
        if (err.code) {
          Logger.error(`Failed to move the window. Code:${err.code}, message:${err.message}`);
          return;
        }
      });
      this.subWindowClass.resize(windowWidth, windowHeight, (err) => {
        if (err.code) {
          Logger.error(`Failed to change the window size. Code:${err.code}, message:${err.message}`);
          return;
        }
      });
      this.subWindowClass.setUIContent(CommonConstants.VERIFY_PAGE_URL, (err) => {
        if (err.code) {
          Logger.error(`Failed to load the content. Code:${err.code}, message:${err.message}`);
          return;
        }
        this.subWindowClass.setWindowBackgroundColor('#00000000');
        this.subWindowClass.showWindow((err) => {
          if (err.code) {
            Logger.error(`Failed to show the window. Code:${err.code}, essage:${err.message}`);
            return;
          }
        });
      });
    });
  }

  /**
   * Set the main window immersive.
   */
  setMainWindowImmersive() {
    this.windowStage.getMainWindow((err, windowClass: window.Window) => {
      if (err.code) {
        Logger.error(`Failed to obtain the main window. Code:${err.code}, message:${err.message}`);
        return;
      }
      windowClass.setWindowLayoutFullScreen(true, (err) => {
        if (err.code) {
          Logger.error(`Failed to set full-screen mode. Code:${err.code}, message:${err.message}`);
          return;
        }
      });
      windowClass.setWindowSystemBarEnable([], (err) => {
        if (err.code) {
          Logger.error(`Failed to set the system bar to be invisible. Code:${err.code}, message:${err.message}`);
          return;
        }
      });
    });
  }

  /**
   * Destroy sub window.
   */
  destroySubWindow() {
    this.subWindowClass.destroyWindow((err) => {
      if (err.code) {
        Logger.error(`Failed to destroy the window. Code:${err.code}, message:${err.message}`);
        return;
      }
    });
  }
}
