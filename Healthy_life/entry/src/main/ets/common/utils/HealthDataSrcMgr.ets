/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { BroadCast } from './BroadCast';
import Logger from './Logger';

const APP_KEY_GROUP_DATA_SOURCE_MANAGER = 'app_key_group_data_source_manager';

export class HealthDataSrcMgr {
  private broadCast: BroadCast;

  constructor() {
    Logger.debug('HealthDataSourceManager', 'constructor');
    this.broadCast = new BroadCast();
  }

  public static getInstance(): HealthDataSrcMgr {
    if (!AppStorage.Get<HealthDataSrcMgr>(APP_KEY_GROUP_DATA_SOURCE_MANAGER)) {
      AppStorage.SetOrCreate<HealthDataSrcMgr>(APP_KEY_GROUP_DATA_SOURCE_MANAGER, new HealthDataSrcMgr());
    }
    let healthDataSrcMgr = AppStorage.Get<HealthDataSrcMgr>(APP_KEY_GROUP_DATA_SOURCE_MANAGER);
    return healthDataSrcMgr ? healthDataSrcMgr : new HealthDataSrcMgr();
  }

  public getBroadCast(): BroadCast {
    return this.broadCast;
  }
}