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
import { RDB_NAME, DAY_INFO, GLOBAL_INFO, TASK_INFO } from '../common/constants/CommonConstants';
import { columnDayInfos, columnGlobalInfos, columnTaskInfoInfos } from '../model/RdbColumnModel';
import RdbUtils from '../common/database/rdb/RdbUtils';


export default class MainAbility extends UIAbility {
  private static TAG: string = 'MainAbility';

  async onCreate(want, launchParam) {
    console.debug(MainAbility.TAG, 'onCreate');
    globalThis.abilityWant = want;

    RdbUtils.initDb(this.context, RDB_NAME.dbname);
    await RdbUtils.createDb();

    RdbUtils.createTable(DAY_INFO.tableName, columnDayInfos).then(() => {
      console.log(`RdbHelper createTable dayInfo success`);
    }).catch(err => {
      console.log(`RdbHelper dayInfo err : ${JSON.stringify(err)}`);
    });

    RdbUtils.createTable(GLOBAL_INFO.tableName, columnGlobalInfos).then(() => {
      console.log(`RdbHelper createTable globalInfo success`);
    }).catch(err => {
      console.log(`RdbHelper globalInfo err : ${JSON.stringify(err)}`);
    });
    RdbUtils.createTable(TASK_INFO.tableName, columnTaskInfoInfos).then(() => {
      console.log(`RdbHelper createTable taskInfo  success`);
    }).catch(err => {
      console.log(`RdbHelper taskInfo err : ${JSON.stringify(err)}`);
    });
  }

  onDestroy() {
    console.debug(MainAbility.TAG, 'onDestroy');
  }

  onWindowStageCreate(windowStage) {
    // Main window is created, set main page for this ability
    console.debug(MainAbility.TAG, 'onWindowStageCreate');
    windowStage.loadContent("pages/SplashPage", (err, data) => {
      if (err.code) {
        console.error('windowStage', 'Failed to load the content. Cause:' + JSON.stringify(err));
        return;
      }
      console.info('windowStage', 'Succeeded in loading the content. Data: ' + JSON.stringify(data));
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    console.debug(MainAbility.TAG, 'onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    globalThis.isForeground = true;
    console.debug(MainAbility.TAG, 'onForeground');
  }

  onBackground() {
    // Ability has back to background
    console.debug(MainAbility.TAG, 'onBackground');
  }

  onNewWant(want, launchParam) {
    // Ability has new want
    console.debug(MainAbility.TAG, `onNewWant ${JSON.stringify(want)}`);
    globalThis.abilityWant = want;
  }
};
