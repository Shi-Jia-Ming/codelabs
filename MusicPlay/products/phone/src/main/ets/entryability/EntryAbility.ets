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
import CardControlUtil from '../util/CardControlUtil';
import { MediaService, Logger } from '@ohos/mediaCommon';

const MSG_SEND_FORM_METHOD: string = 'CallSendMsgForm';

function sendMsgCallbackForm(data) {
  if (data === null) {
    Logger.error('sendMsgCallback data is null');
  }
  let msgObj = JSON.parse(data.readString());
  CardControlUtil.controlByMessage(msgObj.message, msgObj.musicIndex);
  return null;
}

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    Logger.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    AppStorage.SetOrCreate('context', this.context);
    MediaService.getInstance();
    try {
      this.callee.on(MSG_SEND_FORM_METHOD, sendMsgCallbackForm);
      Logger.info('this.callee.on(MSG_SEND_FORM_METHOD, sendMsgCallbackForm)');
    } catch (error) {
      Logger.error(`${MSG_SEND_FORM_METHOD} register failed with error ${JSON.stringify(error)}`);
    }
  }

  onDestroy() {
    Logger.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
    MediaService.getInstance().release();
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    Logger.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/MainPage', (err, data) => {
      if (err.code) {
        Logger.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      Logger.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    Logger.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
    MediaService.getInstance().updateOnDestroy();
  }

  onForeground() {
    // Ability has brought to foreground
    Logger.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground() {
    // Ability has back to background
    Logger.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
