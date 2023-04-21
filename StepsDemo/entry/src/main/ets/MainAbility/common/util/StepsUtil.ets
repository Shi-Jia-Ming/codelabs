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

import dataStorage from '@ohos.data.storage';
import featureAbility from '@ohos.ability.featureAbility';
import { CommonConstants } from '../constants/CommonConstants';
import Logger from './Logger';

const TAG: string = 'StepsUtil';

/**
 * Steps util function.
 */
export class StepsUtil {
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
    let context = featureAbility.getContext();
    context.getFilesDir().then((filePath) => {
      let dataPromise = dataStorage.getStorage(filePath + CommonConstants.FILE_NAME);
      dataPromise.then((storage) => {
        let getPromise = storage.put(key, value);
        getPromise.then(() => {
          Logger.info(TAG, 'Storage put succeeded, key:' + key);
        }).catch((err) => {
          Logger.error(TAG, 'Failed to put the value of startup with err: ' + JSON.stringify(err));
        })
      }).catch((err) => {
        Logger.error(TAG, 'Failed to get the storage with err:' + JSON.stringify(err));
      })
    });
  }

  /**
   * Get preferences value.
   *
   * @param {number} setSteps
   * @param {Function} callback
   */
  getStorageValue(key: string, callback: Function) {
    let context = featureAbility.getContext();
    context.getFilesDir().then((filePath) => {
      let dataPromise = dataStorage.getStorage(filePath + CommonConstants.FILE_NAME);
      dataPromise.then((storage) => {
        let getPromise = storage.get(key, '');
        getPromise.then((value: string) => {
          callback(value);
        }).catch((err) => {
          Logger.error(TAG, 'Failed to get the value of startup with err: ' + JSON.stringify(err));
        })
      }).catch((err) => {
        Logger.error(TAG, 'Failed to get the storage.err:' + JSON.stringify(err));
      })
    });
  }

  /**
   * Clean steps data.
   */
  CleanStepsData() {
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
  checkStrIsEmpty(str: string) {
    return str?.trim().length === 0;
  }

  /**
   * Start Service.
   */
  startService() {
    featureAbility.getContext().getBundleName((err, data) => {
      if (err) {
        Logger.error(TAG, 'getBundleName error: ' + JSON.stringify(err))
        return;
      }
      let StartAbilityParameter = {
        want: {
          bundleName: data,
          abilityName: data + CommonConstants.SERVICE_NAME
        }
      }
      featureAbility.startAbility(StartAbilityParameter);
    });
  }
}

let stepsUtil = new StepsUtil();

export default stepsUtil as StepsUtil;