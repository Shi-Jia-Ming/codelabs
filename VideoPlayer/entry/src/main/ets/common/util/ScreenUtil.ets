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

import Window from '@ohos.window';
import Logger from '../util/Logger';
import { GlobalContext } from './GlobalContext';

class ScreenUtil {
  setScreenSize(): void {
    Window.getLastWindow(getContext(this))
      .then((windowClass: Window.Window) => {
        let screenWidth = px2fp(windowClass.getWindowProperties().windowRect.width);
        let screenHeight = px2fp(windowClass.getWindowProperties().windowRect.height);
        GlobalContext.getContext().setObject('screenWidth', screenWidth);
        GlobalContext.getContext().setObject('screenHeight', screenHeight);
        GlobalContext.getContext().setObject('windowClass', windowClass);
      })
      .catch((error: Error) => {
        Logger.error('[ScreenUtil] Failed to obtain the window size. Cause: ' + JSON.stringify(error));
      })
  }
}

export default new ScreenUtil();
