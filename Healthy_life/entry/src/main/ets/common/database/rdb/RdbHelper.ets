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
import ColumnInfo from '../../../viewmodel/ColumnInfo';

export interface RdbHelper {
  /**
   * Get name of the database.
   *
   * @returns the database name
   */
  getDbName(): string;

  /**
   * Obtains a RDB store.
   *
   * @param context - indicates the context of application or capability.
   * @returns the RDB store.
   */
  getRdb(context: Context): Promise<RdbHelper>;

  /**
   * Execute sql in the database.
   *
   * @param sql - indicates the SQL statement to execute.
   * @returns
   */
  executeSql(sql: string): Promise<void>;

  /**
   * Create table in the database.
   *
   * @param tableName - indicates the target table.
   * @param columns - the columns to alert.
   * @returns
   */
  createTable(tableName: string, columns: Array<ColumnInfo>): Promise<void>;

  /**
   * Delete table in the database based on table name.
   *
   * @param tableName - indicates the target table.
   * @returns
   */
  deleteTable(tableName: string): Promise<void>;

  /**
   * Alert table in the database based on table name.
   *
   * @param tableName - indicates the target table.
   * @param column - the columns to alert.
   * @returns
   */
  addTableColumn(tableName: string, column: ColumnInfo): Promise<void>;

  /**
   * Inserts a row of data or a batch of data into the target table.
   *
   * @param tableName - indicates the target table.
   * @param values - indicates the row of data {@link ValuesBucket} to be inserted into the table.
   * @returns the number of affected rows.
   */
  insert(tableName: string, values: dataRdb.ValuesBucket | Array<dataRdb.ValuesBucket>): Promise<number>;

  /**
   * Updates data in the database based on a specified instance object of RdbPredicates.
   *
   * @param values - indicates the row of data {@link ValuesBucket} to be inserted into the table.
   * @param rdbPredicates - the specified update condition by the instance object of {@link RdbPredicates}.
   * @returns the number of affected rows.
   */
  update(values: dataRdb.ValuesBucket, rdbPredicates: dataRdb.RdbPredicates): Promise<number>;

  /**
   * Queries data in the database based on specified conditions.
   *
   * @param rdbPredicates - the specified query condition by the instance object of {@link RdbPredicates}.
   * @param columns - the columns to query. If the value is empty array, the query applies to all columns.
   * @returns the {@link ResultSet} object if the operation is successful.
   */
  query(rdbPredicates: dataRdb.RdbPredicates, columns?: Array<string>): Promise<dataRdb.ResultSet>;

  /**
   * Queries data in the database based on table name.
   *
   * @param tableName - indicates the target table.
   * @returns the {@link ResultSet} object if the operation is successful.
   */
  queryAll(tableName: string): Promise<dataRdb.ResultSet>;

  /**
   * Queries data in the database based on SQL statement.
   *
   * @param sql - indicates the SQL statement to execute.
   * @param bindArgs - indicates the values of the parameters in the SQL statement. The values are strings.
   * @returns the {@link ResultSet} object if the operation is successful.
   */
  queryBySql(sql: string, bindArgs?: Array<dataRdb.ValueType>): Promise<dataRdb.ResultSet>;

  /**
   * Delete Data in the database based on specified conditions.
   *
   * @param rdbPredicates - the specified delete condition by the instance object of {@link RdbPredicates}.
   * @returns the number of affected rows.
   */
  delete(rdbPredicates: dataRdb.RdbPredicates): Promise<number>;
}