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
import TaskInfo from '../../bean/TaskInfo';
import { TASK_INFO } from '../../constants/CommonConstants';
import { Logger } from '../../../common/utils/log/Logger';


export class TaskInfoTable {
    private taskInfoTable = new Rdb(TASK_INFO.tableName, TASK_INFO.sqlCreate, TASK_INFO.columns);

    constructor(callback = () => {}) {
        this.taskInfoTable.getRdbStore(callback);
    }

    /* Init */
    getRdbStore(callback = () => {}) {
        this.taskInfoTable.getRdbStore(callback);
    }

    /**
     * insert taskInfo
     *
     * @param taskInfo
     * @param callback
     */
    insertData(taskInfo: TaskInfo, callback) {
        const valueBucket = generateBucket(taskInfo);
        this.taskInfoTable.insertData(valueBucket, callback);
        Logger.info('TaskInfoTable', `Insert taskInfo {${taskInfo.date}:${taskInfo.taskID}} finished.`);
    }

    /**
     * delete taskInfo
     *
     * @param taskInfo
     * @param callback
     */
    deleteDataByID(taskInfo: TaskInfo, callback) {
        let predicates = new data_rdb.RdbPredicates(TASK_INFO.tableName);
        predicates.equalTo('date', taskInfo.date).and().equalTo('taskID', taskInfo.taskID);
        this.taskInfoTable.deleteData(predicates, callback);
        Logger.info('TaskInfoTable', `Delete taskInfo {${taskInfo.date}:${taskInfo.taskID}} finished.`)
    }

    /**
     * update taskInfo
     *
     * @param taskInfo
     * @param callback
     */
    updateDataByDate(taskInfo: TaskInfo, callback) {
        const valueBucket = generateBucket(taskInfo);
        let predicates = new data_rdb.RdbPredicates(TASK_INFO.tableName);
        predicates.equalTo('date', taskInfo.date).and().equalTo('taskID', taskInfo.taskID);
        this.taskInfoTable.updateData(predicates, valueBucket, callback);
        Logger.info('TaskInfoTable', `Update data {${taskInfo.date}:${taskInfo.taskID}} finished.`);
    }

    /**
     * query taskInfo
     *
     * @param date
     * @param callback
     */
    query(date: string, isOpen: boolean = true, callback) {
        let predicates = new data_rdb.RdbPredicates(TASK_INFO.tableName);
        predicates.equalTo('date', date);
        if (isOpen) {
            predicates.equalTo('isOpen', true);
        }
        predicates.orderByAsc('taskID');
        this.taskInfoTable.query(predicates, function(resultSet) {
            let count = resultSet.rowCount;
            // 添加数据库返回错误的逻辑判断
            if (count === 0 || typeof count === 'string') {
                Logger.info('TaskInfoTable',`${date} query no results!`);
                callback([]);
            } else {
                resultSet.goToFirstRow();
                const result = [];
                for (let i = 0; i < count; i++) {
                    let tmp = new TaskInfo(0,'', 0, '', false, '', '', '', false, '');
                    tmp.isOpen = resultSet.getDouble(resultSet.getColumnIndex('isOpen')) ? true : false;
                    tmp.id = resultSet.getDouble(resultSet.getColumnIndex('id'));
                    tmp.date = resultSet.getString(resultSet.getColumnIndex('date'));
                    tmp.taskID = resultSet.getDouble(resultSet.getColumnIndex('taskID'));
                    tmp.targetValue = resultSet.getString(resultSet.getColumnIndex('targetValue'));
                    tmp.isAlarm = resultSet.getDouble(resultSet.getColumnIndex('isAlarm')) ? true : false;
                    tmp.startTime = resultSet.getString(resultSet.getColumnIndex('startTime'));
                    tmp.endTime = resultSet.getString(resultSet.getColumnIndex('endTime'));
                    tmp.frequency = resultSet.getString(resultSet.getColumnIndex('frequency'));
                    tmp.isDone = resultSet.getDouble(resultSet.getColumnIndex('isDone')) ? true : false;
                    tmp.finValue = resultSet.getString(resultSet.getColumnIndex('finValue'));
                    result[i] = tmp;
                    resultSet.goToNextRow();
                }
                callback(result);
            }
            return;
        });
    }
}

function generateBucket(taskInfo: TaskInfo) {
    let obj = {};
    TASK_INFO.columns.forEach((item) => {
        if (item != 'id') {
            obj[item] = taskInfo[item];
        }
    });
    return obj;
}

export const TaskInfoTableApi = new TaskInfoTable();