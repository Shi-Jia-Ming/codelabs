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

import { CommonConstants as Const } from '../common/constants/CommonConstants';
import DayInfo from '../viewmodel/DayInfo';
import GlobalInfo from '../viewmodel/GlobalInfo';
import TaskInfo from '../viewmodel/TaskInfo';
import DayInfoApi from '../common/database/tables/DayInfoApi';
import GlobalInfoApi from '../common/database/tables/GlobalInfoApi';
import TaskInfoApi from '../common/database/tables/TaskInfoApi';
import Logger from '../common/utils/Logger';

export class DatabaseModel {
  /**
   * Init when open the app
   *
   * @param date
   * @param callback
   */
  query(date: string, callback: Function) {
    let result: TaskInfo[] = [];
    let self = this;
    GlobalInfoApi.query((globalResult: GlobalInfo) => {
      if (!globalResult.firstDate) { // if global information is not found, it is written
        let globalInfo: GlobalInfo = new GlobalInfo(date, date, 0, '');
        GlobalInfoApi.insertData(globalInfo, (isDone: number) => {
          if (isDone) {
            Logger.info('AppStart', 'Insert globalInfo success: ' + JSON.stringify(globalInfo));
          }
        });
        self.insertGlobalTask();
        let dayInfo: DayInfo = new DayInfo(date, 0, 0);
        DayInfoApi.insertData(dayInfo, (isDone: number) => {
          if (isDone) {
            Logger.info('AppStart', 'Insert dayInfo success: ' + JSON.stringify(dayInfo));
          }
        })
        self.insertTask(date);
        callback(result, dayInfo);
      } else { // if global information is found, the task information for the day is queried
        let newGlobalInfo = globalResult;
        let preDate = globalResult.lastDate;
        newGlobalInfo.lastDate = date;
        GlobalInfoApi.updateData(newGlobalInfo, (isDone: number) => {
          if (isDone) {
            Logger.info('AppStart', 'update globalInfo success: ' + JSON.stringify(newGlobalInfo));
          }
        });
        self.queryPreInfo(date, preDate, result, callback);
      }
    });
  }

  insertGlobalTask() {
    for (let i = 0; i < Const.TASK_NUM; i++) {
      let tmp = new TaskInfo(0, Const.GLOBAL_KEY, i + 1, '', false, '08: 00', '00: 00', '1,2,3,4,5,6,7', false, '');
      TaskInfoApi.insertData(tmp, (isDone: number) => {
        if (isDone) {
          Logger.info('AppStart', 'Insert taskGlobalInfo success: ' + JSON.stringify(tmp));
        }
      });
    }
  }

  insertTask(date: string) {
    for (let i = 0; i < Const.TASK_NUM; i++) {
      let tmp = new TaskInfo(0, date, i + 1, '', false, '08: 00', '00: 00', '1,2,3,4,5,6,7', false, '');
      TaskInfoApi.insertData(tmp, (isDone: number) => {
        if (isDone) {
          Logger.info('AppStart', 'Insert taskInfo success: ' + JSON.stringify(tmp));
        }
      });
    }
  }

  queryPreInfo(date: string, preDate: string, result: TaskInfo[], callback: Function) {
    TaskInfoApi.query(date, false, async (taskResult: TaskInfo[]) => { // query the task information for the day
      let dayInfo: DayInfo = new DayInfo(date, 0, 0);
      if (taskResult.length === 0) { // if task information for the day is not found, the global task information is queried
        let curDate = new Date(preDate);
        curDate.setDate(curDate.getDate() + 1);
        Logger.info('AppStart', 'insert data begin: ' + curDate.toDateString())
        let finDate = new Date(date);
        finDate.setDate(finDate.getDate() + 1);
        Logger.info('AppStart', 'insert data end: ' + finDate.toDateString())
        TaskInfoApi.query(Const.GLOBAL_KEY, false, async (globalTaskResult: TaskInfo[]) => {
          result = globalTaskResult;
          dayInfo.targetTaskNum = this.calTaskNum(result);
          this.insertPreInfo(curDate, finDate, result, dayInfo);
          let finResult: TaskInfo[] = [];
          for (let i = 0; i < 6; i++) {
            if (result[i].isOpen === true) {
              finResult.push(result[i]);
            }
          }
          callback(finResult, dayInfo);
        })
      } else {
        let dayInfoList: DayInfo = this.calFinishNum(taskResult, result);
        dayInfo.targetTaskNum = dayInfoList.targetTaskNum;
        dayInfo.finTaskNum = dayInfoList.finTaskNum;
        callback(result, dayInfo);
      }
    });
  }

  calTaskNum(result: TaskInfo[]) {
    let taskNum = 0;
    for (let i = 0; i < Const.TASK_NUM; i++) {
      if (result[i]?.isOpen) {
        taskNum += 1;
      }
    }
    return taskNum;
  }

  insertPreInfo(curDate: Date, finDate: Date, result: TaskInfo[], dayInfo: DayInfo) {
    while (curDate.toDateString() !== finDate.toDateString()) {
      dayInfo.date = curDate.toDateString();
      DayInfoApi.insertData(dayInfo, (isDone: number) => {
        if (isDone) {
          Logger.info('AppStart', 'insert dayInfo success: ' + JSON.stringify(dayInfo));
        }
      })
      for (let i = 0; i < Const.TASK_NUM; i++) {
        let tmp = new TaskInfo(0, '', 0, '', false, '', '', '', false, '');
        tmp = result[i];
        tmp.date = curDate.toDateString();
        TaskInfoApi.insertData(tmp, (isDone: number) => {
          if (isDone) {
            Logger.info('AppStart', 'insert taskInfo success: ' + JSON.stringify(tmp));
          }
        })
      }
      curDate.setDate(curDate.getDate() + 1);
    }
  }

  calFinishNum(taskResult: TaskInfo[], result: TaskInfo[]) {
    let taskNum = 0;
    let finishNum = 0;
    for (let i = 0; i < Const.TASK_NUM; i++) {
      if (taskResult[i].isOpen) {
        result.push(taskResult[i]);
        taskNum += 1;
        if (taskResult[i].isDone) {
          finishNum += 1;
        }
      }
    }
    return new DayInfo('', taskNum, finishNum);
  }
}

let DatabaseModelApi = new DatabaseModel();

export default DatabaseModelApi as DatabaseModel;