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

import data_rdb from '@ohos.data.rdb';
import context from '@ohos.application.context';
import CommonConstants from '../constants/CommonConstants';
import { Logger } from '../utils/Logger';

type Context = context.Context;

export default class Rdb {
  private rdbStore: any = null;
  private tableName: string;
  private sqlCreateTable: string;
  private columns: Array<string>;

  constructor(tableName: string, sqlCreateTable: string, columns: Array<string>) {
    this.tableName = tableName;
    this.sqlCreateTable = sqlCreateTable;
    this.columns = columns;
  }

  getRdbStore(callback) {
    if (!callback || typeof callback == 'undefined' || callback == undefined) {
      Logger.verbose(`${CommonConstants.RDB_TAG}`, 'getRdbStore() has no callback!');
      return;
    }
    if (this.rdbStore != null) {
      Logger.verbose(`${CommonConstants.RDB_TAG}`, 'The rdbStore exists.');
      callback();
      return
    }
    var context: Context = getContext(this) as Context;
    data_rdb.getRdbStore(context, CommonConstants.STORE_CONFIG, 1, (err, rdb) => {
      if (err) {
        Logger.error(`${CommonConstants.RDB_TAG}`, 'gerRdbStore() failed, err: ' + err);
        return;
      }
      this.rdbStore = rdb;
      this.rdbStore.executeSql(this.sqlCreateTable);
      Logger.verbose(`${CommonConstants.RDB_TAG}`, 'getRdbStore() finished.');
      callback();
    });
  }

  insertData(data, callback) {
    if (!callback || typeof callback == 'undefined' || callback == undefined) {
      Logger.verbose(`${CommonConstants.RDB_TAG}`, 'insertData() has no callback!');
      return;
    }
    let resFlag: boolean = false;
    const valueBucket = data;
    this.rdbStore.insert(this.tableName, valueBucket, function (err, ret) {
      if (err) {
        Logger.error(`${CommonConstants.RDB_TAG}`, 'insertData() failed, err: ' + err);
        callback(resFlag);
        return;
      }
      Logger.verbose(`${CommonConstants.RDB_TAG}`, 'insertData() finished: ' + ret);
      callback(ret);
    });
  }

  deleteData(predicates, callback) {
    if (!callback || typeof callback == 'undefined' || callback == undefined) {
      Logger.verbose(`${CommonConstants.RDB_TAG}`, 'deleteData() has no callback!');
      return;
    }
    let resFlag: boolean = false;
    this.rdbStore.delete(predicates, function (err, ret) {
      if (err) {
        Logger.error(`${CommonConstants.RDB_TAG}`, 'deleteData() failed, err: ' + err);
        callback(resFlag);
        return;
      }
      Logger.verbose(`${CommonConstants.RDB_TAG}`, 'deleteData() finished: ' + ret);
      callback(!resFlag);
    });
  }

  updateData(predicates, data, callback) {
    if (!callback || typeof callback == 'undefined' || callback == undefined) {
      Logger.verbose(`${CommonConstants.RDB_TAG}`, 'updateDate() has no callback!');
      return;
    }
    let resFlag: boolean = false;
    const valueBucket = data;
    this.rdbStore.update(valueBucket, predicates, function (err, ret) {
      if (err) {
        Logger.error(`${CommonConstants.RDB_TAG}`, 'updateData() failed, err: ' + err);
        callback(resFlag);
        return;
      }
      Logger.verbose(`${CommonConstants.RDB_TAG}`, 'updateData() finished: ' + ret);
      callback(!resFlag);
    });
  }

  query(predicates, callback) {
    if (!callback || typeof callback == 'undefined' || callback == undefined) {
      Logger.verbose(`${CommonConstants.RDB_TAG}`, 'query() has no callback!');
      return;
    }
    this.rdbStore.query(predicates, this.columns, function (err, resultSet) {
      if (err) {
        Logger.error(`${CommonConstants.RDB_TAG}`, 'query() failed, err: ' + err);
        return;
      }
      Logger.verbose(`${CommonConstants.RDB_TAG}`, 'query() finished.');
      callback(resultSet);
      resultSet.close();
    });
  }
}