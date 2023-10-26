/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import relationalStore from '@ohos.data.relationalStore';
import { AccountTable } from '../../viewmodel/ConstantsInterface';

export default class CommonConstants {
  /**
   * Rdb database config.
   */
  static readonly STORE_CONFIG: relationalStore.StoreConfig = {
    name: 'database.db',
    securityLevel: relationalStore.SecurityLevel.S1
  };
  /**
   * Account table config.
   */
  static readonly ACCOUNT_TABLE: AccountTable = {
    tableName: 'accountTable',
    sqlCreate: 'CREATE TABLE IF NOT EXISTS accountTable(id INTEGER PRIMARY KEY AUTOINCREMENT, accountType INTEGER, ' +
      'typeText TEXT, amount INTEGER)',
    columns: ['id', 'accountType', 'typeText', 'amount']
  };
  /**
   * Search text of Search component.
   */
  static readonly SEARCH_TEXT = '搜索';
  /**
   * toast text of prompt component.
   */
  static readonly TOAST_TEXT_1 = '账目类型不能为空';
  static readonly TOAST_TEXT_2 = '账目金额不为正整数';
  /**
   * Component size.
   */
  static readonly FULL_WIDTH = '100%';
  static readonly FULL_HEIGHT = '100%';
  static readonly DIALOG_HEIGHT = '55%';
  static readonly TABS_HEIGHT = '45%';
  static readonly MINIMUM_SIZE = 0;
  static readonly FULL_SIZE = 1;
  static readonly PROMPT_BOTTOM = '70vp';
  /**
   * Component location.
   */
  static readonly EDIT_POSITION_X = '80%';
  static readonly EDIT_POSITION_Y = '90%';
  static readonly DELETE_POSITION_X = '50%';
  static readonly DELETE_POSITION_Y = '90%';
  /**
   * Log tag.
   */
  static readonly RDB_TAG = '[Debug.Rdb]';
  static readonly TABLE_TAG = '[Debug.AccountTable]';
  static readonly INDEX_TAG = '[Debug.Index]';
}