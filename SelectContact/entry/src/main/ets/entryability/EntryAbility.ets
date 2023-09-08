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
import window from '@ohos.window';
import Logger from '../common/utils/Logger';

export default class EntryAbility extends UIAbility {
  onCreate() {
    globalThis.abilityContext = this.context;
    Logger.info('EntryAbility', 'Ability onCreate');
  }

  onDestroy() {
    Logger.info('EntryAbility', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    Logger.info('EntryAbility', 'Ability onWindowStageCreate');
    windowStage.getMainWindow((_err, windowClass) => {
      windowClass.setWindowLayoutFullScreen(false, (err) => {
        if (err.code) {
          Logger.error('EntryAbility', 'Failed to set the window layout to no-full-screen mode. Cause:' + JSON.stringify(err));
          return;
        }
        Logger.info('EntryAbility', 'Succeeded in setting the window layout to no-full-screen mode.')
      });
    })

    windowStage.loadContent('pages/SelectContact', (err, data) => {
      if (err.code) {
        Logger.error('EntryAbility', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      Logger.info('EntryAbility', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    Logger.info('EntryAbility', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    Logger.info('EntryAbility', 'Ability onForeground');
  }

  onBackground() {
    // Ability has back to background
    Logger.info('EntryAbility', '  onBackground');
  }
}