import ColumnInfo from '../../bean/ColumnInfo';
import Logger from '../../utils/Logger';

class TableHelper {
  createTableSql(tableName: string, columns: Array<ColumnInfo>): string {
    Logger.info(`TableHelper createTableSql : ${JSON.stringify(columns)}`);
    let sql = `create table if not exists ${tableName}(`
    for (let column of columns) {
      sql = sql.concat(`${column.name} ${column.type}`)
      sql = sql.concat(`${column.length && column.length > 0 ? `(${column.length})` : ''}`)
      sql = sql.concat(`${column.primary ? ' primary key' : ''}`)
      sql = sql.concat(`${column.autoincrement ? ' autoincrement' : ''}`)
      sql = sql.concat(`${column.nullable ? '' : ' not null'}`)
      sql = sql.concat(', ')
    }
    sql = `${sql.substring(0, sql.length - 2)})`;
    Logger.info(`TableHelper createTableSql : ` + sql);
    return sql;
  }

  addTableColumnSql(tableName: string, column: ColumnInfo): string {
    Logger.info(`TableHelper updateTableSql : ${JSON.stringify(column)}`)
    let sql = `alter table ${tableName} add `;
    sql = sql.concat(`${column.name} ${column.type}`);
    sql = sql.concat(`${column.length && column.length > 0 ? `(${column.length})` : ''}`);
    Logger.info(`TableHelper updateTableSql : ` + sql);
    return sql;
  }

  deleteTableSql(tableName: string): string {
    Logger.info(`TableHelper deleteTableSql : ${JSON.stringify(tableName)}`);
    return `drop table if exists ${tableName}`;
  }
}

const tableHelper = new TableHelper();

export default tableHelper