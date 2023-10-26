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

import formBindingData from '@ohos.app.form.formBindingData';
import formProvider from '@ohos.app.form.formProvider';
import RdbUtils from '../database/rdb/RdbUtils';
import FormInfoApi from '../dataBase/tables/FormInfoApi';
import DayInfoApi from '../dataBase/tables/DayInfoApi';
import TaskInfoApi from '../dataBase/tables/TaskInfoApi';
import AgencyCardInfo from '../../viewmodel/AgencyCardInfo';
import FormInfo from '../../viewmodel/FormInfo';
import Logger from '../utils/Logger';
import ProgressCardInfo from '../../viewmodel/ProgressCardInfo';
import TaskInfo, { taskType } from '../../viewmodel/TaskInfo';
import { columnDayInfoList, columnTaskInfoInfoList, columnFormInfoList } from '../../model/RdbColumnModel';
import {
  CommonConstants as Const,
  Unit,
  TaskType
} from '../constants/CommonConstants';
import DayInfo from '../../viewmodel/DayInfo';
import { GlobalContext } from './GlobalContext';

class FormUtils {
  /**
   * Insert form data
   *
   * @param {Context} context Indicates the context of application or capability.
   * @param {FormInfo} formInfo Insert the form information to be saved.
   */
  public insertFormData(context: Context, formInfo: FormInfo): void {
    RdbUtils.initDb(context, Const.RDB_NAME.dbName ? Const.RDB_NAME.dbName : '');
    let isCreatePromise = RdbUtils.isCreateTable(Const.FORM_INFO.tableName ?
      Const.FORM_INFO.tableName : '', columnFormInfoList);
    isCreatePromise.then((result: boolean) => {
      if (!result) {
        Logger.error(Const.TAG, 'insertFormData form table create error');
        return;
      }
      FormInfoApi.insertData(formInfo, (isDone: number) => {
        if (isDone) {
          Logger.info(Const.TAG, 'insert formInfo success: ' + JSON.stringify(isDone));
          this.queryForms();
        }
      });
    });
  }

  /**
   * Update card operation
   *
   * @param {Context} context Indicates the context of application or capability.
   */
  public updateCards(context: Context): void {
    RdbUtils.initDb(context, Const.RDB_NAME.dbName ? Const.RDB_NAME.dbName : '');
    let isCreatePromise = RdbUtils.isCreateTable(Const.FORM_INFO.tableName ?
      Const.FORM_INFO.tableName : '', columnFormInfoList);
    isCreatePromise.then((result: boolean) => {
      if (!result) {
        Logger.error(Const.TAG, 'updateCards form table create error');
        return;
      }
      this.queryForms();
    });
  }

  /**
   * Delete form data
   *
   * @param {Context} context Indicates the context of application or capability.
   * @param {string} formId delete form id
   */
  public deleteFormData(context: Context, formId: string): void {
    RdbUtils.initDb(context, Const.RDB_NAME.dbName ? Const.RDB_NAME.dbName : '');
    let isCreatePromise = RdbUtils.isCreateTable(Const.FORM_INFO.tableName ?
      Const.FORM_INFO.tableName : '', columnFormInfoList);
    isCreatePromise.then((result: boolean) => {
      if (!result) {
        Logger.error(Const.TAG, 'deleteFormData form table create error');
        return;
      }
      FormInfoApi.deleteFormData(formId);
    });
  }

  /**
   * Update form operation
   */
  public queryForms(): void {
    FormInfoApi.queryFormData((resultSet: Array<FormInfo>) => {
      resultSet.forEach((item: FormInfo) => {
        this.updateRectangleCards(item);
      });
    });
  }

  /**
   * Background update all card
   */
  public backgroundUpdateCard(taskListChange: boolean): void {
    if (taskListChange) {
      GlobalContext.getContext().setObject('taskListChange', false);
      let timeId = setTimeout(() => {
        this.queryForms();
        clearInterval(timeId);
      }, Const.TIMES_100);
    }
  }

  private updateRectangleCards(formInfo: FormInfo): void {
    if ((formInfo.formName === Const.WIDGET_NAME_AGENCY) &&
      (formInfo.formDimension === Const.DEFAULT_DIMENSION_2X4)) {
      let createPromise = RdbUtils.isCreateTable(Const.TASK_INFO.tableName ?
        Const.TASK_INFO.tableName : '', columnTaskInfoInfoList);
      createPromise.then((result: boolean) => {
        if (!result) {
          Logger.error(Const.TAG, 'taskInfo table create error');
          return;
        }
        this.dateQueryTaskInfo(formInfo, new Date().toDateString());
      }).catch((err: Error) => {
        Logger.error(Const.TAG, `taskInfo err : ${JSON.stringify(err)}`);
      });
    }
    if ((formInfo.formName === Const.WIDGET_NAME_PROGRESS) &&
      (formInfo.formDimension === Const.DEFAULT_DIMENSION_2X2)) {
      let createPromise = RdbUtils.isCreateTable(Const.DAY_INFO.tableName ?
        Const.DAY_INFO.tableName : '', columnDayInfoList);
      createPromise.then((result: boolean) => {
        if (!result) {
          Logger.error(Const.TAG, 'dayInfo create table error');
          return;
        }
        this.dateQueryDayInfo(formInfo, new Date().toDateString());
      }).catch((err: Error) => {
        Logger.error(Const.TAG, `dayInfo err : ${JSON.stringify(err)}`);
      });
    }
  }

  private dateQueryTaskInfo(formInfo: FormInfo, dateKey: string): void {
    TaskInfoApi.query(dateKey, true, (data: TaskInfo[]) => {
      if (data.length === 0) {
        // Query task data based on the global field.
        this.globalQueryTaskInfo(formInfo, Const.GLOBAL_KEY);
      } else {
        this.processTaskData(formInfo, data);
      }
    });
  }

  private dateQueryDayInfo(formInfo: FormInfo, dateKey: string): void {
    DayInfoApi.query(dateKey, (data: DayInfo) => {
      if (data.date === '') {
        // Query day data based on the global field.
        this.globalQueryDayInfo(formInfo, Const.GLOBAL_KEY);
      } else {
        this.processDayData(formInfo, data);
      }
    });
  }

  private globalQueryTaskInfo(formInfo: FormInfo, dateKey: string): void {
    TaskInfoApi.query(dateKey, true, (data: TaskInfo[]) => {
      this.processTaskData(formInfo, data);
    });
  }

  private globalQueryDayInfo(formInfo: FormInfo, dateKey: string): void {
    DayInfoApi.query(dateKey, (data: DayInfo) => {
      this.processDayData(formInfo, data);
    });
  }

  private processTaskData(formInfo: FormInfo, data: TaskInfo[]): void {
    let taskList: AgencyCardInfo[] = this.fetchResult(data);
    let obj: ProgressCardInfo = {};
    obj.taskList = taskList;
    obj.showWidget = taskList.length === 0 ? false : true;
    let formData = formBindingData.createFormBindingData(obj);
    formProvider.updateForm(formInfo.formId, formData).catch((err: Error) => {
      Logger.error(Const.TAG, `processTaskData updateForm, err: ${JSON.stringify(err)}`);
    });
  }

  private processDayData(formInfo: FormInfo, data: DayInfo): void {
    let finTaskNum: number = 0;
    let targetTaskNum: number = 0;
    let percent: string = '0';
    if (data && data.date !== '') {
      finTaskNum = data.finTaskNum > data.targetTaskNum ? data.targetTaskNum : data.finTaskNum;
      targetTaskNum = data.targetTaskNum;
      percent = targetTaskNum === 0 ? '0' : Math.ceil(finTaskNum / targetTaskNum * Const.DEFAULT_100).toFixed();
    }
    let obj: ProgressCardInfo = new ProgressCardInfo();
    obj.numerator = finTaskNum;
    obj.denominator = targetTaskNum;
    obj.percent = percent;
    let formData = formBindingData.createFormBindingData(obj);
    formProvider.updateForm(formInfo.formId, formData).catch((err: Error) => {
      Logger.error(Const.TAG, `processDayData updateForm, err: ${JSON.stringify(err)}`);
    });
  }

  private getTemp(temp: AgencyCardInfo, taskType: string, unit: string,
                  dateType: boolean, isDone: boolean): AgencyCardInfo {
    let agencyCardInfo: AgencyCardInfo = new AgencyCardInfo();
    agencyCardInfo.targetValue = temp.targetValue;
    agencyCardInfo.finValue = temp.finValue;
    agencyCardInfo.finValueIsNull = temp.finValueIsNull;
    agencyCardInfo.taskType = taskType;
    agencyCardInfo.unit = unit;
    agencyCardInfo.dateType = dateType;
    agencyCardInfo.isDone = isDone;
    return agencyCardInfo;
  }

  private fetchResult(data: TaskInfo[]): Array<AgencyCardInfo> {
    let taskList: Array<AgencyCardInfo> = new Array<AgencyCardInfo>();
    data.forEach((item: TaskInfo) => {
      let temp: AgencyCardInfo = {
        targetValue: item.targetValue,
        finValue: item.isDone ? item.targetValue : item.finValue,
        finValueIsNull: item.isDone ? false : (item.finValue === '' ? true : false),
      };
      switch (item.taskID) {
        case taskType.getup:
          temp = this.getTemp(temp, TaskType.Getup, Unit.Empty, true, item.isDone);
          break;
        case taskType.drinkWater:
          temp = this.getTemp(temp, TaskType.Drink, Unit.Liter, false, item.isDone);
          break;
        case taskType.eatApple:
          temp = this.getTemp(temp, TaskType.Apple, Unit.Pcs, false, item.isDone);
          break;
        case taskType.smile:
          temp = this.getTemp(temp, TaskType.Smile, Unit.Times, false, item.isDone);
          break;
        case taskType.brushTeeth:
          temp = this.getTemp(temp, TaskType.Clean, Unit.Times, false, item.isDone);
          break;
        case taskType.sleepEarly:
          temp = this.getTemp(temp, TaskType.Sleep, Unit.Empty, true, item.isDone);
          break;
        default:
          break;
      }
      taskList.push(temp);
    });
    Logger.info(Const.TAG, 'fetchResult taskList ' + JSON.stringify(taskList));
    return taskList;
  }
}

export default new FormUtils();