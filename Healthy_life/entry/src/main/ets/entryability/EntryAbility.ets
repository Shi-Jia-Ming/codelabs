/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License,Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import UIAbility from '@ohos.app.ability.UIAbility';
import { CommonConstants as Const } from '../common/constants/CommonConstants';
import {
  columnDayInfoList,
  columnGlobalInfoList,
  columnTaskInfoInfoList,
  columnFormInfoList
} from '../model/RdbColumnModel';
import RdbUtils from '../common/database/rdb/RdbUtils';
import Logger from '../common/utils/Logger';
import FormUtils from '../common/utils/FormUtils';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import { GlobalContext } from '../common/utils/GlobalContext';

export default class EntryAbility extends UIAbility {
  private static TAG: string = 'EntryAbility';

  async onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    GlobalContext.getContext().setObject('want', want);
    GlobalContext.getContext().setObject('launchParam', launchParam);

    RdbUtils.initDb(this.context, Const.RDB_NAME.dbName ? Const.RDB_NAME.dbName : '');
    await RdbUtils.createDb();

    RdbUtils.createTable(Const.DAY_INFO.tableName ? Const.DAY_INFO.tableName : '', columnDayInfoList).then(() => {
      Logger.info(`RdbHelper createTable dayInfo success`);
    }).catch((err: Error) => {
      Logger.error(`RdbHelper dayInfo err : ${JSON.stringify(err)}`);
    });

    RdbUtils.createTable(Const.GLOBAL_INFO.tableName ? Const.GLOBAL_INFO.tableName : '', columnGlobalInfoList).then(() => {
      Logger.info(`RdbHelper createTable globalInfo success`);
    }).catch((err: Error) => {
      Logger.error(`RdbHelper globalInfo err : ${JSON.stringify(err)}`);
    });
    RdbUtils.createTable(Const.TASK_INFO.tableName ? Const.TASK_INFO.tableName : '', columnTaskInfoInfoList).then(() => {
      Logger.info(`RdbHelper createTable taskInfo success`);
    }).catch((err: Error) => {
      Logger.error(`RdbHelper taskInfo err : ${JSON.stringify(err)}`);
    });
    RdbUtils.createTable(Const.FORM_INFO.tableName ? Const.FORM_INFO.tableName : '', columnFormInfoList)
      .catch((err: Error) => {
        Logger.error(`RdbHelper formInfo err : ${JSON.stringify(err)}`);
      });
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    GlobalContext.getContext().setObject('isForeground', true);
    windowStage.loadContent('pages/SplashPage', (err, data) => {
      if (err.code) {
        Logger.error('windowStage', 'Failed to load the content. Cause:' + JSON.stringify(err));
        return;
      }
      Logger.info('windowStage', 'Succeeded in loading the content. Data: ' + JSON.stringify(data));
    });
  }

  onForeground() {
    // Ability has brought to foreground
    GlobalContext.getContext().setObject('isForeground', true);
    GlobalContext.getContext().setObject('taskListChange', false);
  }

  onBackground() {
    // Ability has back to background
    FormUtils.backgroundUpdateCard(GlobalContext.getContext().getObject('taskListChange') as boolean);
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam) {
    // Ability has new want
    GlobalContext.getContext().setObject('abilityWant', want);
    GlobalContext.getContext().setObject('launchParam', launchParam);
  }
};
