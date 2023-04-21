import dataRdb from '@ohos.data.relationalStore';
import ColumnInfo from '../../bean/ColumnInfo';

export interface RdbHelper {

  getDbName(): string

  getRdb(context?: any): Promise<RdbHelper>

  executeSql(sql: string): Promise<void>

  createTable(tableName: string, columns: Array<ColumnInfo>): Promise<void>

  deleteTable(tableName: string): Promise<void>

  addTableColumn(tableName: string, column: ColumnInfo): Promise<void>

  insert(tableName: string, values: dataRdb.ValuesBucket | Array<dataRdb.ValuesBucket>): Promise<number>

  update(values: dataRdb.ValuesBucket, rdbPredicates: dataRdb.RdbPredicates): Promise<number>

  query(rdbPredicates: dataRdb.RdbPredicates, columns?: Array<string>): Promise<dataRdb.ResultSet>

  queryAll(tableName: string): Promise<dataRdb.ResultSet>

  queryBySql(sql: string, bindArgs?: Array<dataRdb.ValueType>): Promise<any>

  delete(rdbPredicates: dataRdb.RdbPredicates): Promise<number>

}