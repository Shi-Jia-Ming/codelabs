/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License,Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import data_preferences from '@ohos.data.preferences';
import { CommonConstants } from '../../common/constants/CommonConstants';
import PreferencesListener from './PreferencesListener';

/**
 * Based on lightweight databases preferences handler.
 */
export default class PreferencesHandler {
  static instance: PreferencesHandler = new PreferencesHandler();
  private preferences: data_preferences.Preferences | null = null;
  private defaultValue = '';
  private listeners: PreferencesListener[];

  private constructor() {
    this.listeners = new Array();
  }

  /**
   * Configure PreferencesHandler.
   *
   * @param context Context
   */
  public async configure(context: Context) {
    this.preferences = await data_preferences.getPreferences(context, CommonConstants.PREFERENCE_ID);
    this.preferences.on('change', (data: Record<string, Object>) => {
      for (let preferencesListener of this.listeners) {
        preferencesListener.onDataChanged(data.key as string);
      }
    });
  }

  /**
   * Set data in PreferencesHandler.
   *
   * @param key string
   * @param value any
   */
  public async set(key: string, value: string) {
    if (this.preferences != null) {
      await this.preferences.put(key, value);
      await this.preferences.flush();
    }
  }

  /**
   * Get data in PreferencesHandler.
   *
   * @param key string
   * @param defValue any
   * @return data about key
   */
  public async get(key: string) {
    let data: string = '';
    if (this.preferences != null) {
      data = await this.preferences.get(key, this.defaultValue) as string;
    }
    return data;
  }

  /**
   * Clear data in PreferencesHandler.
   */
  public clear() {
    if (this.preferences != null) {
      this.preferences.clear();
    }
  }

  /**
   * Add preferences listener in PreferencesHandler.
   *
   * @param listener PreferencesListener
   */
  public addPreferencesListener(listener: PreferencesListener) {
    this.listeners.push(listener);
  }
}