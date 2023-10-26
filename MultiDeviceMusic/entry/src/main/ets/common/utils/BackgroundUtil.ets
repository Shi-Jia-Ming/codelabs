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

import wantAgent from '@ohos.app.ability.wantAgent';
import backgroundTaskManager from '@ohos.resourceschedule.backgroundTaskManager';
import common from '@ohos.app.ability.common';
import { Logger } from './Logger';

export class BackgroundUtil {

  /**
   * Start background task.
   *
   * @param context
   */
  public static startContinuousTask(context?: common.UIAbilityContext): void {
    if (!context) {
      Logger.error('this avPlayer: ', `context undefined`);
      return
    }
    let wantAgentInfo: wantAgent.WantAgentInfo = {
      wants: [
        {
          bundleName: context.abilityInfo.bundleName,
          abilityName: context.abilityInfo.name
        }
      ],
      operationType: wantAgent.OperationType.START_ABILITY,
      requestCode: 0,
      wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
    };

    wantAgent.getWantAgent(wantAgentInfo).then((wantAgentObj: Object) => {
      try {
        backgroundTaskManager.startBackgroundRunning(context,
          backgroundTaskManager.BackgroundMode.AUDIO_PLAYBACK, wantAgentObj).then(() => {
          Logger.info('this avPlayer: ', 'startBackgroundRunning succeeded');
        }).catch((error: Error) => {
          Logger.error('this avPlayer: ', `startBackgroundRunning failed Cause: ${JSON.stringify(error)}`);
        });
      } catch (error) {
        Logger.error('this avPlayer: ', `startBackgroundRunning failed. Error cause : ${JSON.stringify(error)}`);
      }
    });
  }

  /**
   * Stop background task.
   *
   * @param context
   */
  public static stopContinuousTask(context: common.UIAbilityContext): void {
    try {
      backgroundTaskManager.stopBackgroundRunning(context).then(() => {
        Logger.info('this avPlayer: ', 'stopBackgroundRunning succeeded');
      }).catch((error: Error) => {
        Logger.error('this avPlayer: ', `stopBackgroundRunning failed Cause: ${JSON.stringify(error)}`);
      });
    } catch (error) {
      Logger.error('this avPlayer: ', `stopBackgroundRunning failed. Error cause : ${JSON.stringify(error)}`);
    }
  }
}