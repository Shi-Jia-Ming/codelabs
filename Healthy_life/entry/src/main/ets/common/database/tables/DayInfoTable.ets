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
import Rdb from '../Rdb';
import DayInfo from '../../bean/DayInfo';
import { DAY_INFO } from '../../constants/CommonConstants';
import { Logger } from '../../../common/utils/log/Logger';


export class DayInfoTable {
    private dayInfoTable = new Rdb(DAY_INFO.tableName, DAY_INFO.sqlCreate, DAY_INFO.columns);

    constructor(callback = () => {}) {
        this.dayInfoTable.getRdbStore(callback);
    }

    /* Init */
    getRdbStore(callback = () => {}) {
        this.dayInfoTable.getRdbStore(callback);
    }

    /**
     * insert dayInfo
     *
     * @param dayInfo
     * @param callback
     */
    insertData(dayInfo: DayInfo, callback) {
        const valueBucket = generateBucket(dayInfo);
        this.dayInfoTable.insertData(valueBucket, callback);
        Logger.info('DayInfoTable', 'Insert dayInfo finished.');
    }

    /**
     * update dayInfo
     *
     * @param dayInfo
     * @param callback
     */
    updateData(dayInfo: DayInfo, callback) {
        const valueBucket = generateBucket(dayInfo);
        let predicates = new data_rdb.RdbPredicates(DAY_INFO.tableName);
        predicates.equalTo('date', dayInfo.date);
        this.dayInfoTable.updateData(predicates, valueBucket, callback);
        Logger.info('DayInfoTable', 'Update dayInfo finished.');
    }

    /**
     * query dayInfo
     *
     * @param date
     * @param callback
     */
    query(date: string, callback) {
        let predicates = new data_rdb.RdbPredicates(DAY_INFO.tableName);
        predicates.equalTo('date', date);
        this.dayInfoTable.query(predicates, function(resultSet) {
            let count = resultSet.rowCount;
            if (count === 0) {
                Logger.info('DayInfoTable','query no results.');
                callback([]);
            } else {
                let result = new DayInfo('', 0, 0);
                resultSet.goToFirstRow();
                result.date = resultSet.getString(resultSet.getColumnIndex('date'));
                result.targetTaskNum = resultSet.getDouble(resultSet.getColumnIndex('targetTaskNum'));
                result.finTaskNum = resultSet.getDouble(resultSet.getColumnIndex('finTaskNum'));
                callback(result);
            }
            return;
        });
    }

    /**
     * query dayInfo list
     *
     * @param date
     * @param callback
     */
    queryList(dates: string[], callback) {
        let predicates = new data_rdb.RdbPredicates(DAY_INFO.tableName);
        predicates.in('date', dates);
        this.dayInfoTable.query(predicates, function(resultSet) {
            let count = resultSet.rowCount;
            if (count === 0) {
                Logger.info('DayInfoTable','query no results.');
                callback([]);
            } else {
                resultSet.goToFirstRow();
                let result = [];
                for (let i = 0; i < count; i++) {
                    let tmp = new DayInfo('', 0, 0);
                    tmp.date = resultSet.getString(resultSet.getColumnIndex('date'));
                    tmp.targetTaskNum = resultSet.getDouble(resultSet.getColumnIndex('targetTaskNum'));
                    tmp.finTaskNum = resultSet.getDouble(resultSet.getColumnIndex('finTaskNum'));
                    result[i] = tmp;
                    resultSet.goToNextRow();
                }
                callback(result);
            }
            return;
        });
    }
}

function generateBucket(dayInfo: DayInfo) {
    let obj = {};
    DAY_INFO.columns.forEach((item) => {
        obj[item] = dayInfo[item];
    });
    return obj;
}

export const DayInfoTableApi = new DayInfoTable();