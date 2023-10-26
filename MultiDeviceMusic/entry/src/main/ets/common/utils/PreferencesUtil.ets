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

import dataPreferences from '@ohos.data.preferences';
import { Logger } from './Logger';

const TAG = 'PreferencesUtil';
const MY_STORE = 'myStore';
const FORM_ID = 'formIds';

export class PreferencesUtil {
  private static preferencesUtil: PreferencesUtil;

  public static getInstance(): PreferencesUtil {
    if (!PreferencesUtil.preferencesUtil) {
      PreferencesUtil.preferencesUtil = new PreferencesUtil();
    }
    return PreferencesUtil.preferencesUtil;
  }

  getPreferences(context: Context): Promise<dataPreferences.Preferences> {
    return new Promise((resolve: Function, reject: Function) => {
      dataPreferences.getPreferences(context, MY_STORE, (err, pref: dataPreferences.Preferences) => {
        if (err) {
          Logger.error(TAG, `Failed to get preferences. Code:${err.code},message:${err.message}`);
          reject(err);
          return;
        }
        resolve(pref);
      })
    })
  }

  preferencesFlush(preferences: dataPreferences.Preferences) {
    preferences.flush((err) => {
      if (err) {
        Logger.error(TAG, `Failed to flush. Code:${err.code}, message:${err.message}`);
      }
    })
  }

  preferencesPut(preferences: dataPreferences.Preferences, formIds: Array<string>): Promise<boolean> {
    return new Promise((resolve: Function, reject: Function) => {
      try {
        preferences.put(FORM_ID, formIds, (err) => {
          if (err) {
            reject(err);
            Logger.error(TAG, `Failed to put data. Code:${err.code}, message:${err.message}`);
            return;
          }
          Logger.info(TAG, `preferencesPut succeed,formIds:` + JSON.stringify(formIds));
          resolve(true);
        })
      } catch (err) {
        Logger.error(TAG, `Failed to put data. Error cause : ${JSON.stringify(err)}`);
      }
    });
  }

  async preferencesHas(preferences: dataPreferences.Preferences): Promise<boolean> {
    return new Promise((resolve: Function, reject: Function) => {
      preferences.has(FORM_ID, (err, value) => {
        if (err) {
          reject(err);
          Logger.error(TAG, `WANG to check the key 'formIds'. Code:${err.code}, message:${err.message}`);
          return;
        }
        resolve(value);
      });
    })
  }

  removePreferencesFromCache(context: Context): void {
    dataPreferences.removePreferencesFromCache(context, MY_STORE);
  }

  async getFormIds(context: Context): Promise<Array<string>> {
    try {
      let preferences = await this.getPreferences(context);
      return new Promise((resolve, reject) => {
        if (preferences === null) {
          Logger.error(TAG, `preferences is null`);
          return;
        }
        preferences.get(FORM_ID, ['']).then((value: number | string | boolean | Array<number> | Array<string> | Array<boolean>) => {
          resolve(value as Array<string>)
        }).catch((error: Error) => reject(error))
      })
    } catch (err) {
      Logger.error(TAG, `WANG Failed to get value of 'formIds'. Error cause : ${JSON.stringify(err)}`);
    }
    return new Promise((resolve: Function, reject: Function) => {});
  }

  async addFormId(context: Context, formId: string) {
    try {
      let preferences = await this.getPreferences(context);
      if (preferences === null) {
        Logger.error(TAG, `preferences is null`);
        return;
      }

      if (await this.preferencesHas(preferences)) {
        let formIds = await this.getFormIds(context);
        if (formIds.indexOf(formId) === -1) {
          formIds.push(formId);
          if (!await this.preferencesPut(preferences, formIds)) {
            return;
          }
          this.preferencesFlush(preferences);
        }
      } else {
        if (!await this.preferencesPut(preferences, [formId])) {
          return;
        }
        this.preferencesFlush(preferences);
      }
    } catch (err) {
      Logger.error(TAG, `Failed to check the key 'formIds'. Error cause : ${JSON.stringify(err)}`);
    }
  }

  async removeFormId(context: Context, formId: string) {
    try {
      let preferences = await this.getPreferences(context);
      if (preferences === null) {
        Logger.error(TAG, `preferences is null`);
        return;
      }
      if (await this.preferencesHas(preferences)) {
        let formIds = await this.getFormIds(context);
        let index = formIds.indexOf(formId);
        if (index !== -1) {
          formIds.splice(index, 1);
        }
        if (!await this.preferencesPut(preferences, formIds)) {
          return;
        }
        this.preferencesFlush(preferences);
      }
    } catch (err) {
      Logger.error(TAG, `WANG Failed to get preferences. Error cause : ${JSON.stringify(err)}`);
    }
  }
}