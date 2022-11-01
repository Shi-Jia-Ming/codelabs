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
import Logger from '../utils/Logger';

const TAG = '[PreferencesUtil]';
const PREFERENCES_NAME = 'myPreferences';
const KEY_APP_FONT_SIZE = 'appFontSize';

/**
 * The PreferencesUtil provides preferences of create, save and query.
 */
export class PreferencesUtil {
  createFontPreferences(context) {
    globalThis.getFontPreferences = (() => {
      let preferences: Promise<dataPreferences.Preferences> = dataPreferences.getPreferences(context, PREFERENCES_NAME);
      return preferences;
    });
  }

  saveDefaultFontSize(fontSize: number) {
    globalThis.getFontPreferences().then((preferences) => {
      preferences.has(KEY_APP_FONT_SIZE).then(async (isExist) => {
        Logger.info(TAG, 'preferences has changeFontSize is ' + isExist);
        if (!isExist) {
          await preferences.put(KEY_APP_FONT_SIZE, fontSize);
          preferences.flush();
        }
      }).catch((err) => {
        Logger.error(TAG, 'Has the value failed with err: ' + err);
      });
    }).catch((err) => {
      Logger.error(TAG, 'Get the preferences failed, err: ' + err);
    });
  }

  saveChangeFontSize(fontSize: number) {
    globalThis.getFontPreferences().then(async (preferences) => {
      await preferences.put(KEY_APP_FONT_SIZE, fontSize);
      preferences.flush();
    }).catch((err) => {
      Logger.error(TAG, 'put the preferences failed, err: ' + err);
    });
  }

  async getChangeFontSize() {
    let fontSize: number = 0;
    const preferences = await globalThis.getFontPreferences();
    fontSize = await preferences.get(KEY_APP_FONT_SIZE, fontSize);
    return fontSize;
  }
  
   async deleteChangeFontSize() {
    const preferences: dataPreferences.Preferences = await globalThis.getFontPreferences();
    let deleteValue = preferences.delete(KEY_APP_FONT_SIZE);
    deleteValue.then(() => {
      Logger.info(TAG, 'Succeeded in deleting the key appFontSize.');
    }).catch((err) => {
      Logger.error(TAG, 'Failed to delete the key appFontSize. Cause: ' + err);
    });
  }
}

export default new PreferencesUtil();