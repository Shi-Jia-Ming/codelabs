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
import window from '@ohos.window';
import CommonConstants from '../common/constants/CommonConstants';
import Logger from '../common/utils/Logger';
import { GlobalContext } from '../common/utils/GlobalContext';

/**
 * Window controller model.
 */
export default class WindowModel {
  private windowStage?: window.WindowStage;
  private subWindowClass?: window.Window;

  /**
   * Get singleton.
   *
   * @return {WindowModel} WindowModel
   */
  static getInstance(): WindowModel {
    let instance: WindowModel = GlobalContext.getContext().getObject('windowModel') as WindowModel;
    if (instance === undefined) {
      instance = new WindowModel();
      GlobalContext.getContext().setObject('windowModel', instance)
    }
    return instance;
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
    if (this.windowStage === undefined) {
      Logger.error('Failed to create the subWindow.');
      return;
    }
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
        if (this.subWindowClass === undefined) {
          Logger.error('subWindowClass is undefined.');
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
    if (this.windowStage === undefined) {
      Logger.error('windowStage is undefined.');
      return;
    }
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
    if (this.subWindowClass === undefined) {
      Logger.error('subWindowClass is undefined.');
      return;
    }
    this.subWindowClass.destroyWindow((err) => {
      if (err.code) {
        Logger.error(`Failed to destroy the window. Code:${err.code}, message:${err.message}`);
        return;
      }
    });
  }
}
