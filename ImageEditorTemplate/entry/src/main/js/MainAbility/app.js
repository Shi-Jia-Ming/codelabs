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

import featureAbility from '@ohos.ability.featureAbility';
import Logger from './common/utils/logger';

export default {
  onCreate() {
    this.reqPermissions();
    Logger.info('Application onCreate');
  },
  onDestroy() {
    Logger.info('Application onDestroy');
  },

  /**
   * Request Permissions
   */
  reqPermissions() {
    const permissions = [
      'ohos.permission.READ_MEDIA',
      'ohos.permission.WRITE_MEDIA',
      'ohos.permission.MEDIA_LOCATION'
    ];
    let context = featureAbility.getContext();
    context.requestPermissionsFromUser(permissions, 1).then((data) => {
      Logger.info(`RequestPermissions success ${JSON.stringify(data)}`)
    }).catch(err => {
      Logger.error(`RequestPermissions failed ${JSON.stringify(err)}`);
    });
  }
}