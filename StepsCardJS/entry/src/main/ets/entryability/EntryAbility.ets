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
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';
import DataRdb from '@ohos.data.relationalStore';
import window from '@ohos.window';
import Logger from '../common/utils/Logger';
import CommonConstants from '../common/constants/CommonConstants';
import DatabaseUtils from '../common/utils/DatabaseUtils';
import { GlobalContext } from '../common/utils/GlobalContext';

/**
 * Lift cycle management of Ability.
 */
export default class EntryAbility extends UIAbility {
  onCreate(want: Want, param: AbilityConstant.LaunchParam): void {
    GlobalContext.getContext().setObject('abilityWant', want);
    GlobalContext.getContext().setObject('abilityParam', param);
    DatabaseUtils.createRdbStore(this.context).then((rdbStore: Object | undefined) => {
      DatabaseUtils.addSimulationData(rdbStore as DataRdb.RdbStore);
    }).catch((error: Error) => {
      Logger.error(CommonConstants.ENTRY_ABILITY_TAG, 'onCreate rdb error ' + JSON.stringify(error));
    });
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    Logger.info(CommonConstants.ENTRY_ABILITY_TAG, 'onWindowStageCreate');
    windowStage.loadContent('pages/MainPage', (err, data) => {
      if (err.code) {
        Logger.error(CommonConstants.ENTRY_ABILITY_TAG, 'Failed to load the content. Cause:' + JSON.stringify(err));
        return;
      }
      Logger.info(CommonConstants.ENTRY_ABILITY_TAG, 'Succeeded in loading the content. Data: ' + JSON.stringify(data));
    });
  }
};