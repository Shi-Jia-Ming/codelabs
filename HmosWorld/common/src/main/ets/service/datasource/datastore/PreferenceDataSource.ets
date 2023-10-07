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
import common from '@ohos.app.ability.common';
import { UserAccount } from '../../../entity/UserAccount';
import ErrorCode from '../../../constants/ErrorCodeConstants';

const PREFERENCES_NAME: string = 'EnableAppStore';
const LOGIN_USER: string = 'user';

interface RejectError {
  code: number;
  message: string;
}

export class PreferenceDataSource {
  private userDataStore?: dataPreferences.Preferences;
  private isInitFinished: boolean = false;
  private context = getContext(this) as common.UIAbilityContext;

  constructor() {
    this.initDataStore(PREFERENCES_NAME);
  }

  async initDataStore(storeName: string) {
    dataPreferences.getPreferences(this.context, storeName).then((data: dataPreferences.Preferences) => {
      this.userDataStore = data;
      this.isInitFinished = true;
    })
  }

  async addUserAccount(userAccount: UserAccount): Promise<void> {
    if (this.isInitFinished) {
      this.userDataStore?.put(LOGIN_USER, JSON.stringify(userAccount)).then(() => {
        this.saveUserData();
      })
    } else {
      return new Promise((resolve: (value: void | PromiseLike<void>) => void,
                          reject: (reason?: RejectError) => void) => {
        reject({ code: ErrorCode.ERROR_PREFERENCE_NOT_INITIALIZED, message: 'Preference is not initialized.' });
      })
    }
  }

  async getUserAccount(): Promise<UserAccount | null> {
    if (this.isInitFinished && this.userDataStore) {
      return this.userDataStore.get(LOGIN_USER, '').then((res: dataPreferences.ValueType) => {
        let userAccount: UserAccount | null = null;
        if (res) {
          userAccount = JSON.parse(res as string);
        }
        return userAccount;
      });
    } else {
      return new Promise((resolve: (value: (UserAccount | null) | PromiseLike<UserAccount | null>) => void) => {
        resolve(null);
      })
    }
  }

  async deleteUserData(): Promise<void> {
    if (this.isInitFinished) {
      this.userDataStore?.delete(LOGIN_USER).then(() => {
        this.saveUserData();
      });
    } else {
      return new Promise((resolve: (value: void | PromiseLike<void>) => void,
                          reject: (reason?: RejectError) => void) => {
        reject({ code: ErrorCode.ERROR_PREFERENCE_NOT_INITIALIZED, message: 'Preference is not initialized.' });
      })
    }
  }

  saveUserData() {
    this.userDataStore?.flush();
  }
}