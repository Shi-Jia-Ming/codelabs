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

import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import UIAbility from '@ohos.app.ability.UIAbility';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import CommonConstants from '../common/constants/CommonConstants';
import Logger from '../common/utils/Logger';
import { GlobalContext } from '../common/utils/GlobalContext';

/**
 * Lift cycle management of Ability.
 */
export default class EntryDetailsAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    Logger.info(CommonConstants.TAG_DETAILS, 'want =' + JSON.stringify(want));
    Logger.info(CommonConstants.TAG_DETAILS, 'launchParam =' + JSON.stringify(launchParam));
    let params = want?.parameters?.params as string;
    Logger.info(CommonConstants.TAG_DETAILS, 'params ' + params);
    let parseParams = JSON.parse(params) as Record<string, number>;
    Logger.info(CommonConstants.TAG_DETAILS, 'parseParams ' + parseParams);
    let index: number = parseParams?.index as number;
    GlobalContext.getContext().setObject('position', index);
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability.
    windowStage.loadContent('pages/MovieDetailsPage', (err, data) => {
      if (err.code) {
        Logger.error(CommonConstants.TAG_DETAILS, 'Failed to load ' + JSON.stringify(err));
        return;
      }
      Logger.info(CommonConstants.TAG_DETAILS, 'Succeeded loading ' + JSON.stringify(data));
    });
  }
}
