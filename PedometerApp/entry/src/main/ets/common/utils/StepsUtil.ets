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

import common from '@ohos.app.ability.common';
import data_preferences from '@ohos.data.preferences';
import { CommonConstants } from '../constants/CommonConstants';
import { GlobalContext } from './GlobalContext';
import Logger from './Logger';

const TAG: string = 'StepsUtil';
const PREFERENCES_NAME = 'myPreferences';

/**
 * Steps util function.
 */
export class StepsUtil {
  createStepsPreferences(context: common.UIAbilityContext) {
    let preferences: Promise<data_preferences.Preferences> = data_preferences.getPreferences(context, PREFERENCES_NAME);
    GlobalContext.getContext().setObject('getStepsPreferences', preferences)
  }

  /**
   * Get the progress value.
   *
   * @param {number} setSteps
   * @param {number} currentSteps
   * @return {number} progressValue
   */
  getProgressValue(setSteps: number, currentSteps: number): number {
    let progressValue: number = 0;
    if (setSteps > 0 && currentSteps > 0) {
      progressValue = Math.round((currentSteps / setSteps) * CommonConstants.ONE_HUNDRED);
    }
    return progressValue;
  }

  /**
   * Put preferences value.
   *
   * @param {string} key
   * @param {string} value
   */
  putStorageValue(key: string, value: string) {
    GlobalContext.getContext().getObject('getStepsPreferences')?.then((preferences: data_preferences.Preferences) => {
      preferences.put(key, value).then(() => {
        Logger.info(TAG, 'Storage put succeeded, key:' + key);
      }).catch((err: Error) => {
        Logger.error(TAG, 'Failed to put the value of startup with err: ' + JSON.stringify(err));
      })
    }).catch((err: Error) => {
      Logger.error(TAG, 'Failed to get the storage with err:' + JSON.stringify(err));
    })
  }

  /**
   * Get preferences value.
   *
   * @param {number} setSteps
   * @param {Function} callback
   */
  async getStorageValue(key: string): Promise<string> {
    let ret: data_preferences.ValueType = '';
    const preferences: data_preferences.Preferences | undefined = await GlobalContext.getContext().getObject('getStepsPreferences');
    if(preferences) {
      ret = await preferences?.get(key, ret);
    }
    return String(ret);
  }

  /**
   * Clean steps data.
   */
  CleanStepsData(): void {
    this.putStorageValue(CommonConstants.OLD_STEPS, '');
    this.putStorageValue(CommonConstants.IS_START, CommonConstants.FALSE);
    this.putStorageValue(CommonConstants.START_POSITION, '');
    this.putStorageValue(CommonConstants.PROGRESS_VALUE_TAG, CommonConstants.INITIALIZATION_VALUE);
  }

  /**
   * Check str is empty.
   *
   * @param {string} str
   * @return {boolean} true
   */
  checkStrIsEmpty(str: string): boolean {
    return str?.trim().length === 0;
  }
}

let stepsUtil = new StepsUtil();

export default stepsUtil as StepsUtil;