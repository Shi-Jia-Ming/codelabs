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
import { PREFERENCE_ID } from '../../common/constants/CommonConstants';
import PreferencesListener from './PreferencesListener';

/**
 * Based on lightweight databases preferences handler.
 */
export default class PreferencesHandler {
  private static instance: PreferencesHandler;
  private preferences;
  private defaultValue = '';
  private listeners: PreferencesListener[];

  private constructor() {
    this.listeners = new Array();
  }

  /**
   * Get PreferencesHandler instance.
   *
   * @return instance
   */
  public static getInstance() {
    if (this.instance == null) {
      this.instance = new PreferencesHandler();
    }
    return this.instance;
  }

  /**
   * Configure PreferencesHandler.
   *
   * @param context Context
   */
  public async configure(context) {
    this.preferences = await data_preferences.getPreferences(context, PREFERENCE_ID);
    this.preferences.on('change', (key) => {
      for (let preferencesListener of this.listeners) {
        preferencesListener.onDataChanged(key);
      }
    });
  }

  /**
   * Set data in PreferencesHandler.
   *
   * @param key string
   * @param value any
   */
  public async set(key: string, value) {
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
  public async get(key: string, defValue?) {
    let data;
    if (this.preferences != null) {
      data = await this.preferences.get(key, defValue == null ? this.defaultValue : defValue);
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
   * Get all data in PreferencesHandler.
   *
   * @return data
   */
  public async getAll() {
    let data;
    if (this.preferences != null) {
      data = await this.preferences.getAll();
    }
    return data;
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