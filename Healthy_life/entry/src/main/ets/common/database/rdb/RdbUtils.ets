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

import dataRdb from '@ohos.data.relationalStore';
import common from '@ohos.app.ability.common';
import ColumnInfo from '../../bean/ColumnInfo';
import { RdbHelper } from './RdbHelper';
import { RdbHelperImp } from './RdbHelperImp';
import Logger from '../../utils/Logger';

let dbContext: common.UIAbilityContext;
let mDatabaseName: string = '';

export class RdbUtils {
  private rdbHelpers = new Map<string, RdbHelper>();

  initDb(context: common.UIAbilityContext, databaseName: string) {
    dbContext = context;
    mDatabaseName = databaseName;
  }

  createDb(): Promise<RdbHelper> {
    return new Promise<RdbHelper>((success, error) => {
      let dbName = mDatabaseName;
      if (!dbContext || !dbName || dbName.length === 0) {
        error("init err");
        return;
      }
      let dbHelper = this.rdbHelpers.get(dbName);
      if (!dbHelper) {
        Logger.info(`initRdb  RdbUtils success`);
        let rdbHelper: RdbHelper = new RdbHelperImp(dbName);
        rdbHelper.getRdb(dbContext).then(data => {
          this.rdbHelpers.set(dbName, data);
          success(data);
        }).catch(err => {
          error(err);
        })
      } else {
        success(dbHelper);
      }
    })
  }

  deleteDb(context: any, dbName: string): Promise<void> {
    this.rdbHelpers.delete(dbName);
    return dataRdb.deleteRdbStore(context, dbName);
  }

  createTable(tableName: string, columns: Array<ColumnInfo>): Promise<void> {
    return this.createDb().then(dbHelper => {
      return dbHelper.createTable(tableName, columns);
    })
  }

  deleteTable(tableName: string): Promise<void> {
    return this.createDb().then(dbHelper => {
      return dbHelper.deleteTable(tableName);
    })
  }

  executeSql(sql: string): Promise<void> {
    return this.createDb().then(dbHelper => {
      return dbHelper.executeSql(sql);
    })
  }

  addTableColumn(tableName: string, column: ColumnInfo): Promise<void> {
    return this.createDb().then(dbHelper => {
      return dbHelper.addTableColumn(tableName, column);
    })
  }

  insert(tableName: string, values: dataRdb.ValuesBucket | Array<dataRdb.ValuesBucket>): Promise<number> {
    return this.createDb().then(dbHelper => {
      return dbHelper.insert(tableName, values);
    })
  }

  update(values: dataRdb.ValuesBucket, rdbPredicates: dataRdb.RdbPredicates): Promise<number> {
    return this.createDb().then(dbHelper => {
      return dbHelper.update(values, rdbPredicates);
    })
  }

  query(rdbPredicates: dataRdb.RdbPredicates, columns?: Array<string>): Promise<dataRdb.ResultSet> {
    return this.createDb().then(dbHelper => {
      return dbHelper.query(rdbPredicates, columns);
    })
  }

  queryAll(tableName: string): Promise<dataRdb.ResultSet> {
    return this.createDb().then(dbHelper => {
      return dbHelper.queryAll(tableName);
    })
  }

  queryBySql(sql: string, bindArgs?: Array<dataRdb.ValueType>): Promise<dataRdb.ResultSet> {
    return this.createDb().then(dbHelper => {
      return dbHelper.queryBySql(sql, bindArgs);
    })
  }

  del(rdbPredicates: dataRdb.RdbPredicates): Promise<number> {
    return this.createDb().then(dbHelper => {
      return dbHelper.delete(rdbPredicates);
    })
  }
}

let rdbUtils = new RdbUtils();

export default rdbUtils as RdbUtils;