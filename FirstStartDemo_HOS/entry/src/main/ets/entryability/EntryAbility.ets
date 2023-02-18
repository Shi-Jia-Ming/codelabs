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

import UIAbility from '@ohos.app.ability.UIAbility';
import Logger from '../common/utils/Logger';
import CommonConstants from '../common/constants/CommonConstants';

/**
 * Lift cycle management of Ability.
 */
export default class EntryAbility extends UIAbility {
  onCreate(want) {
    globalThis.abilityWant = want;
  }

  onWindowStageCreate(windowStage) {
    Logger.info(CommonConstants.ENTRY_ABILITY_TAG, 'onWindowStageCreate');
    windowStage.loadContent('pages/LauncherPage', (err, data) => {
      if (err.code) {
        Logger.error(CommonConstants.ENTRY_ABILITY_TAG, 'Failed to load the content. Cause:' + JSON.stringify(err));
        return;
      }
      Logger.info(CommonConstants.ENTRY_ABILITY_TAG, 'Succeeded in loading the content. Data: ' + JSON.stringify(data));
    });
  }
};
