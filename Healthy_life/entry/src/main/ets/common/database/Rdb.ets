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
import { STORE_CONFIG } from '../constants/CommonConstants';
import Logger from '../../common/utils/Logger';

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

    /* Init */
    getRdbStore(callback) {
        if (!callback || typeof callback == 'undefined' || callback == undefined) {
            Logger.error('Rdb', 'getRdbStore() has no callback!');
            return;
        }
        if (this.rdbStore != null) {
            Logger.info('Rdb', 'The rdbStore exists.');
            callback();
            return;
        }
        let context = getContext(this);
        data_rdb.getRdbStore(context, STORE_CONFIG, 1, (err, rdb) => {
            if (err) {
                Logger.error('Rdb', 'gerRdbStore() failed, err: ' + err);
                return;
            }
            this.rdbStore = rdb;
            this.rdbStore.executeSql(this.sqlCreateTable);
            Logger.info('Rdb', 'getRdbStore() finished.');
            callback();
        });
    }

    /**
     * insert data
     *
     * @param data
     * @param callback
     */
    insertData(data, callback) {
        if (!callback || typeof callback == 'undefined' || callback == undefined) {
            Logger.error('Rdb', 'insertData() has no callback!');
            return;
        }
        let resFlag: boolean = false;
        const valueBucket = data;
        this.rdbStore.insert(this.tableName, valueBucket, function (err, ret) {
            if (err) {
                Logger.error('Rdb', 'insertData() failed, err: ' + err);
                callback(resFlag);
                return;
            }
            Logger.info('Rdb', 'insertData() finished: ' + ret);
            callback(!resFlag);
        });
    }

    /**
     * delete data
     *
     * @param predicates
     * @param callback
     */
    deleteData(predicates, callback) {
        if (!callback || typeof callback == 'undefined' || callback == undefined) {
            Logger.error('Rdb', 'deleteData() has no callback!');
            return;
        }
        let resFlag: boolean = false;
        this.rdbStore.delete(predicates, function (err, ret) {
            if (err) {
                Logger.error('Rdb', 'deleteData() failed, err: ' + err);
                callback(resFlag);
                return;
            }
            Logger.info('Rdb', 'deleteData() finished: ' + ret);
            callback(!resFlag);
        });
    }

    /**
     * update data
     *
     * @param predicates
     * @param data
     * @param callback
     */
    updateData(predicates, data, callback) {
        if (!callback || typeof callback == 'undefined' || callback == undefined) {
            Logger.error('Rdb', 'updateDate() has no callback!');
            return;
        }
        let resFlag: boolean = false;
        const valueBucket = data;
        this.rdbStore.update(valueBucket, predicates, function (err, ret) {
            if (err) {
                Logger.error('Rdb', 'updateData() failed, err: ' + err);
                callback(resFlag);
                return;
            }
            Logger.info('Rdb', 'updateData() finished: ' + ret);
            callback(!resFlag);
        });
    }

    /**
     * query data
     *
     * @param predicates
     * @param callback
     */
    query(predicates, callback){
        if (!callback || typeof callback == 'undefined' || callback == undefined) {
            Logger.error('Rdb', 'query() has no callback!');
            return;
        }
        this.rdbStore.query(predicates, this.columns, function (err, resultSet) {
            if (err) {
                Logger.error('Rdb', 'query() failed, err: ' + err);
                return;
            }
            Logger.info('Rdb', 'query() finished.');
            callback(resultSet);
            resultSet.close();
        });
    }
}