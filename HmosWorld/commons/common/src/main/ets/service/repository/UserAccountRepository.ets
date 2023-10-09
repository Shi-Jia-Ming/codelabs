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

import { FuncNetwork } from '../datasource/network/agc/FuncNetwork';
import { UserAccount } from '../../entity/UserAccount';
import { PreferenceDataSource } from '../datasource/datastore/PreferenceDataSource';
import { UserData } from '../../entity/UserData';

export class UserAccountRepository {
  private userStore: PreferenceDataSource = new PreferenceDataSource();
  private loginService: FuncNetwork = new FuncNetwork();

  async login(username: string, password: string): Promise<UserAccount | null> {
    // The results returned during login are stored in the Preference database
    return this.loginService.login(username, password).then((data?: UserAccount | null) => {
      if (data?.username === username) {
        this.userStore.addUserAccount(data);
        return data;
      }
      return null;
    });
  }

  /**
   * Save data to Preference
   * @param userAccount
   */
  saveUserData(userAccount: UserAccount): void {
    this.userStore.addUserAccount(userAccount);
  }

  /**
   * Obtain the logged-in user account from Preference to avoid login
   * @returns UserData
   */
  getUserAccount(): Promise<UserAccount | null> {
    return this.userStore.getUserAccount();
  }

  /**
   * Obtain user-related resource data from the network
   * @returns UserData
   */
  getUserData(): Promise<UserData> {
    return this.loginService.getUserData();
  }
}