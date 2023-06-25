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
import { RDB_NAME, DAY_INFO, GLOBAL_INFO, TASK_INFO, FORM_INFO } from '../common/constants/CommonConstants';
import {
  columnDayInfoList,
  columnGlobalInfoList,
  columnTaskInfoInfoList,
  columnFormInfoList
} from '../model/RdbColumnModel';
import RdbUtils from '../common/database/rdb/RdbUtils';
import Logger from '../common/utils/Logger';
import FormUtils from '../common/utils/FormUtils';

export default class EntryAbility extends UIAbility {
  private static TAG: string = 'EntryAbility';

  async onCreate(want, launchParam) {
    Logger.debug(EntryAbility.TAG, 'onCreate');
    globalThis.abilityWant = want;
    globalThis.launchParam = launchParam;

    RdbUtils.initDb(this.context, RDB_NAME.dbName);
    await RdbUtils.createDb();

    RdbUtils.createTable(DAY_INFO.tableName, columnDayInfoList).then(() => {
      Logger.info(`RdbHelper createTable dayInfo success`);
    }).catch(err => {
      Logger.info(`RdbHelper dayInfo err : ${JSON.stringify(err)}`);
    });

    RdbUtils.createTable(GLOBAL_INFO.tableName, columnGlobalInfoList).then(() => {
      Logger.info(`RdbHelper createTable globalInfo success`);
    }).catch(err => {
      Logger.info(`RdbHelper globalInfo err : ${JSON.stringify(err)}`);
    });
    RdbUtils.createTable(TASK_INFO.tableName, columnTaskInfoInfoList).then(() => {
      Logger.info(`RdbHelper createTable taskInfo success`);
    }).catch(err => {
      Logger.info(`RdbHelper taskInfo err : ${JSON.stringify(err)}`);
    });
    RdbUtils.createTable(FORM_INFO.tableName, columnFormInfoList).then(() => {
      Logger.info(`RdbHelper createTable formInfo success`);
    }).catch(err => {
      Logger.info(`RdbHelper formInfo err : ${JSON.stringify(err)}`);
    });
  }

  onDestroy() {
    Logger.debug(EntryAbility.TAG, 'onDestroy');
  }

  onWindowStageCreate(windowStage) {
    // Main window is created, set main page for this ability
    Logger.debug(EntryAbility.TAG, 'onWindowStageCreate');
    globalThis.isForeground = true;
    windowStage.loadContent('pages/SplashPage', (err, data) => {
      if (err.code) {
        Logger.error('windowStage', 'Failed to load the content. Cause:' + JSON.stringify(err));
        return;
      }
      Logger.info('windowStage', 'Succeeded in loading the content. Data: ' + JSON.stringify(data));
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    Logger.debug(EntryAbility.TAG, 'onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    globalThis.isForeground = true;
    globalThis.taskListChange = false;
    Logger.debug(EntryAbility.TAG, 'onForeground');
  }

  onBackground() {
    // Ability has back to background
    FormUtils.backgroundUpdateCard(globalThis.taskListChange);
    Logger.debug(EntryAbility.TAG, 'onBackground');
  }

  onNewWant(want, launchParam) {
    // Ability has new want
    Logger.debug(EntryAbility.TAG, `onNewWant ${JSON.stringify(want)}`);
    globalThis.abilityWant = want;
    globalThis.launchParam = launchParam;
  }
};
