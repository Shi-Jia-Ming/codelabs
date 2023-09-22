/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import promptAction from '@ohos.promptAction';
import Logger from '../common/utils/Logger';
import CommonConstants from '../common/constants/CommonConstants';
import Fruit from '../common/bean/Fruit';

let context = getContext(this);
let preference: dataPreferences.Preferences;
let preferenceTemp: dataPreferences.Preferences;

/**
 * Preference model.
 *
 * @param fruitData Fruit data.
 */
class PreferenceModel {
  private fruitData: Fruit = new Fruit();

  /**
   * Read the specified Preferences persistence file and load the data into the Preferences instance.
   */
  async getPreferencesFromStorage() {
    try {
      preference = await dataPreferences.getPreferences(context, CommonConstants.PREFERENCES_NAME);
    } catch (err) {
      Logger.error(CommonConstants.TAG, `Failed to get preferences, Cause: ${err}`);
    }
  }

  /**
   * Deletes the specified Preferences persistence file from memory and removes the Preferences instance.
   */
  async deletePreferences() {
    try {
      await dataPreferences.deletePreferences(context, CommonConstants.PREFERENCES_NAME);
    } catch(err) {
      Logger.error(CommonConstants.TAG, `Failed to delete preferences, Cause: ${err}`);
    };
    preference = preferenceTemp;
    this.showToastMessage($r('app.string.delete_success_msg'));
  }

  /**
   * Save the data to the Preferences.
   *
   * @param fruit Fruit data.
   */
  async putPreference(fruit: Fruit) {
    if (!preference) {
      await this.getPreferencesFromStorage();
    }
    // The fruit name and fruit quantity data entered by the user are saved to the cached Preference instance.
    try {
      await preference.put(CommonConstants.KEY_NAME, JSON.stringify(fruit));
    } catch (err) {
      Logger.error(CommonConstants.TAG, `Failed to put value, Cause: ${err}`);
    }
    // Store the Preference instance in the preference persistence file
    await preference.flush();
  }

  /**
   * Get preference data.
   */
  async getPreference() {
    let fruit = '';
    if (!preference) {
      await this.getPreferencesFromStorage();
    }
    try {
      fruit = (await preference.get(CommonConstants.KEY_NAME, '')).toString();
    } catch (err) {
      Logger.error(CommonConstants.TAG, `Failed to get value, Cause: ${err}`);
    }
    // If the data is empty, a message is displayed indicating that data needs to be written.
    if (fruit === '') {
      this.showToastMessage($r('app.string.data_is_null_msg'));
      return;
    }
    this.showToastMessage($r('app.string.read_success_msg'));
    return JSON.parse(fruit);
  }

  /**
   * Process the data obtained from the database.
   */
  async getFruitData() {
    this.fruitData = await this.getPreference();
    return this.fruitData;
  }

  /**
   * Verifies that the data entered is not empty.
   *
   * @param fruit Fruit data.
   */
  checkFruitData(fruit: Fruit) {
    if (fruit.fruitName === '' || fruit.fruitNum === '') {
      this.showToastMessage($r('app.string.fruit_input_null_msg'));
      return true;
    }
    return false;
  }

  /**
   * write data.
   *
   * @param fruit  Fruit data.
   */
  writeData(fruit: Fruit) {
    // Check whether the data is null.
    let isDataNull = this.checkFruitData(fruit);
    if (isDataNull) {
      return;
    }
    // The data is inserted into the preferences database if it is not empty.
    this.putPreference(fruit);
    this.showToastMessage($r('app.string.write_success_msg'));
  }

  /**
   * Popup window prompt message.
   *
   * @param message Prompt message.
   */
  showToastMessage(message: Resource) {
    promptAction.showToast({
      message: message,
      duration: CommonConstants.DURATION
    });
  };
}

export default new PreferenceModel();