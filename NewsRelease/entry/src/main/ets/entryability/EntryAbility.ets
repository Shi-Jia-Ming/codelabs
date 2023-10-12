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
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import Logger from '../common/utils/Logger';
import { GlobalContext } from '../common/bean/GlobalContext';
import Want from '@ohos.app.ability.Want';


export default class EntryAbility extends UIAbility {
  onCreate(want: Want) {
    Logger.info('testTag', '%{public}s', 'Ability onCreate');
    GlobalContext.getContext().setObject('abilityWant', want);
  }

  onDestroy() {
    Logger.info('testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability.
    Logger.info('testTag', '%{public}s', 'Ability onWindowStageCreate');

    this.requestPermissions();
    windowStage.loadContent('pages/MainPage', (err, data) => {
      if (err.code) {
        Logger.error('testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      Logger.info('testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources.
    Logger.info('testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground.
    GlobalContext.getContext().setObject('isBackRouter', false);
    Logger.info('testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground() {
    // Ability has back to background.
    Logger.info('testTag', '%{public}s', 'Ability onBackground');
  }

  private requestPermissions() {
    let atManager = abilityAccessCtrl.createAtManager();
    atManager.requestPermissionsFromUser(this.context, ['ohos.permission.READ_MEDIA'])
      .then((data) => {
        Logger.info('testTag', '%{public}s', `request permission data result: ${data}`);
      })
      .catch((err: Error) => {
        Logger.error('testTag', '%{public}s', `fail to request permission error:${err}`)
      });
  }
}
