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

import hilog from '@ohos.hilog';
import UIAbility from '@ohos.app.ability.UIAbility';
import Window from '@ohos.window';

const TAG: string = 'EntryAbility';
const ENTRY_ABILITY_DOMAIN = 0x00001;

export default class EntryAbility extends UIAbility {
  onCreate(want, launchParam) {
    hilog.isLoggable(ENTRY_ABILITY_DOMAIN, TAG, hilog.LogLevel.INFO);
    hilog.info(ENTRY_ABILITY_DOMAIN, TAG, '%{public}s', 'Ability onCreate');
    hilog.info(ENTRY_ABILITY_DOMAIN, TAG, '%{public}s', 'want param:' + JSON.stringify(want) ?? '');
    hilog.info(ENTRY_ABILITY_DOMAIN, TAG, '%{public}s', 'launchParam:' + JSON.stringify(launchParam) ?? '');
  }

  onDestroy() {
    hilog.isLoggable(ENTRY_ABILITY_DOMAIN, TAG, hilog.LogLevel.INFO);
    hilog.info(ENTRY_ABILITY_DOMAIN, TAG, '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: Window.WindowStage) {
    // Main window is created, set main page for this ability
    hilog.isLoggable(ENTRY_ABILITY_DOMAIN, TAG, hilog.LogLevel.INFO);
    hilog.info(ENTRY_ABILITY_DOMAIN, TAG, '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/NavPage', (err, data) => {
      if (err.code) {
        hilog.isLoggable(ENTRY_ABILITY_DOMAIN, TAG, hilog.LogLevel.ERROR);
        hilog.error(ENTRY_ABILITY_DOMAIN, TAG, 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.isLoggable(ENTRY_ABILITY_DOMAIN, TAG, hilog.LogLevel.INFO);
      hilog.info(ENTRY_ABILITY_DOMAIN, TAG, 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.isLoggable(ENTRY_ABILITY_DOMAIN, TAG, hilog.LogLevel.INFO);
    hilog.info(ENTRY_ABILITY_DOMAIN, TAG, '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    hilog.isLoggable(ENTRY_ABILITY_DOMAIN, TAG, hilog.LogLevel.INFO);
    hilog.info(ENTRY_ABILITY_DOMAIN, TAG, '%{public}s', 'Ability onForeground');
  }

  onBackground() {
    // Ability has back to background
    hilog.isLoggable(ENTRY_ABILITY_DOMAIN, TAG, hilog.LogLevel.INFO);
    hilog.info(ENTRY_ABILITY_DOMAIN, TAG, '%{public}s', 'Ability onBackground');
  }
}
