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
import tableHelper from './TableHelper';
import { RdbHelper } from './RdbHelper';
import ColumnInfo from '../../../viewmodel/ColumnInfo';
import Logger from '../../utils/Logger';

export class RdbHelperImp implements RdbHelper {
  private mDatabaseName: string;
  private rdbStore: dataRdb.RdbStore = {} as dataRdb.RdbStore;
  private storeConfig: dataRdb.StoreConfig = {  name: '', securityLevel: dataRdb.SecurityLevel.S1 } as dataRdb.StoreConfig;

  constructor(databaseName: string) {
    this.mDatabaseName = databaseName;
  }

  getDbName(): string {
    return this.mDatabaseName;
  }

  getRdb(context: Context): Promise<RdbHelper> {
    this.storeConfig = {
      name: this.mDatabaseName, securityLevel: dataRdb.SecurityLevel.S1
    };
    return new Promise<RdbHelper>((success, error) => {
      dataRdb.getRdbStore(context, this.storeConfig).then(dbStore => {
        this.rdbStore = dbStore;
        success(this);
      }).catch((err: Error) => {
        Logger.error(`initRdb err : ${JSON.stringify(err)}`);
        error(err);
      })
    })
  }

  executeSql(sql: string): Promise<void> {
    Logger.info(`executeSql sql : ${sql}`);
    return this.rdbStore.executeSql(sql);
  }

  createTable(tableName: string, columns: Array<ColumnInfo>): Promise<void> {
    Logger.info(`createTable tableName : ${tableName}, columns : ${JSON.stringify(columns)}`);
    let createTableSql = tableHelper.createTableSql(tableName, columns);
    return this.executeSql(createTableSql);
  }

  deleteTable(tableName: string): Promise<void> {
    Logger.info(`deleteTable tableName : ${tableName}`);
    let deleteTableSql = tableHelper.deleteTableSql(tableName);
    return this.executeSql(deleteTableSql);
  }

  addTableColumn(tableName: string, column: ColumnInfo): Promise<void> {
    Logger.info(`addTableColumn tableName : ${tableName}, column : ${JSON.stringify(column)}`);
    let addTableColumnSql = tableHelper.addTableColumnSql(tableName, column);
    return this.executeSql(addTableColumnSql);
  }

  insert(tableName: string, values: dataRdb.ValuesBucket | Array<dataRdb.ValuesBucket>): Promise<number> {
    return new Promise<number>((success, error) => {
      Logger.info(`insert tableName : ${tableName}, values : ${JSON.stringify(values)}`);
      if (!values) {
        Logger.info(`insert failed, values is undefined`);
        error(0);
        return;
      }
      if (values instanceof Array) {
        Logger.info(`insert values isArray = ${values.length}`);
        this.rdbStore.beginTransaction();
        this.saveArray(tableName, values).then(data => {
          Logger.info(`insert success, data : ${JSON.stringify(data)}`);
          success(data);
          this.rdbStore.commit();
        }).catch((err: Error) => {
          Logger.error(`insert failed, err : ${err}`);
          error(err);
          this.rdbStore.commit();
        })
      } else {
        this.rdbStore.insert(tableName, values).then(data => {
          Logger.info(`insert success id : ${data}`);
          success(data);
          this.rdbStore.commit();
        }).catch((err: Error) => {
          Logger.error(`insert failed, err : ${JSON.stringify(err)}`);
          error(err);
          this.rdbStore.commit();
        })
      }
    })
  }

  private saveArray(tableName: string, values: Array<dataRdb.ValuesBucket>): Promise<number> {
    return new Promise<number>((success, error) => {
      if (!values || values.length === 0) {
        error(0);
        return;
      }
      let index = 0
      let callback = (data: number, err: Error) => {
        if (err) {
          Logger.info(`saveArray failed, err : ${err}`);
          error(err);
          return;
        }
        if (data) {
          if (index < values.length - 1) {
            this.saveData(tableName, values, ++index, callback);
          } else {
            success(data);
          }
        }
      }
      this.saveData(tableName, values, index, callback);
    })
  }

  private saveData(tableName: string, values: Array<dataRdb.ValuesBucket>, index: number, callback: Function): void   {
    Logger.info(`saveData tableName : ${tableName}, index : ${JSON.stringify(index)}`);
    this.rdbStore.insert(tableName, values[index]).then((data: number) => {
      Logger.info(`saveData success id : ${data}`);
      callback(data);
    }).catch((err: Error) => {
      Logger.error(`saveData failed, err : ${err}`);
      callback(err);
    })
  }

  update(values: dataRdb.ValuesBucket, rdbPredicates: dataRdb.RdbPredicates): Promise<number> {
    return this.rdbStore.update(values, rdbPredicates);
  }

  query(rdbPredicates: dataRdb.RdbPredicates, columns?: Array<string>): Promise<dataRdb.ResultSet> {
    Logger.info(`query rdbPredicates : ${JSON.stringify(rdbPredicates)}`);
    return this.rdbStore.query(rdbPredicates, columns);
  }

  queryAll(tableName: string): Promise<dataRdb.ResultSet> {
    Logger.info(`queryAllSize tableName : ${tableName}`);
    return this.rdbStore.querySql(`select * from ${tableName}`);
  }

  queryBySql(sql: string, bindArgs?: Array<dataRdb.ValueType>): Promise<dataRdb.ResultSet> {
    Logger.info(`queryBySql sql : ${sql}`);
    return this.rdbStore.querySql(sql, bindArgs);
  }

  delete(rdbPredicates: dataRdb.RdbPredicates): Promise<number> {
    Logger.info(`delete rdbPredicates : ${JSON.stringify(rdbPredicates)}`);
    return this.rdbStore.delete(rdbPredicates);
  }
}
