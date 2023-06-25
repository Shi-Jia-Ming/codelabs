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

import { DEFAULT_100 } from '../common/constants/CommonConstants';
import { isReachNewAchievement, ACHIEVEMENT_LEVEL_KEY } from '../model/AchieveModel';
import { TaskMapById, ITaskItem, ACHIEVEMENT_LEVEL_LIST } from '../model/TaskInitList';
import TaskInfo from '../common/bean/TaskInfo';
import DayInfo from '../common/bean/DayInfo';
import { dateToStr, weekDateFormat } from '../common/utils/Utils';
import { WeekDateModel, initializeOnStartUp, getPreviousWeek, WEEK_DAY_NUM } from '../model/WeekCalendarModel';
import DatabaseApi from '../model/DatabaseModel';
import TaskInfoTableApi from '../common/database/tables/TaskInfoApi';
import DayInfoApi from '../common/database/tables/DayInfoApi';
import GlobalInfoApi from '../common/database/tables/GlobalInfoApi';
import Logger from '../common/utils/Logger';

@Observed
export class HomeStore {
  public currentDate: Date;
  public dateArr: Array<WeekDateModel> = []; // data source list
  public selectedDay: number; // selected day of on week
  public showDate: number;
  public dateTitle: string;
  public selectedDayInfo: WeekDateModel; // task info on selected day

  constructor(currentDate: Date) {
    this.currentDate = currentDate;
    this.showDate = currentDate.getTime();
    this.dateTitle = weekDateFormat(currentDate.getTime());
    this.selectedDay = (new Date().getDay() + WEEK_DAY_NUM - 1) % WEEK_DAY_NUM;
  }

  public initData() {
    let [initArr, dateArr] = initializeOnStartUp(this.currentDate);
    this.dateArr = initArr;
    Logger.info('this.currentDate', this.currentDate.toDateString());
    Logger.info('initWeekData dateArr', JSON.stringify(dateArr))
    // get data form db
    DatabaseApi.query(dateToStr(new Date()), (taskList, dayInfo) => {
      Logger.info('Current Day Task Info: ', JSON.stringify(taskList));
      DayInfoApi.queryList(dateArr, (res: DayInfo[]) => {
        let tempList = res.concat(dayInfo);
        Logger.info('initDayInfoList: ', JSON.stringify(res));
        for (let i = 0; i < this.dateArr.length; i++) {
          let tempDayInfo = tempList.find((item) => item.date == this.dateArr[i].dateStr) || {
            date: this.dateArr[i].dateStr,
            finTaskNum: 0,
            targetTaskNum: 0
          };
          initArr[i].dayInfo = tempDayInfo;
          if (this.dateArr[i].dateStr == dateToStr(new Date(this.showDate))) {
            // get tasks of showDate
            initArr[i].taskList = taskList;
          }
        }
        this.dateArr = initArr;
        setTimeout(() => {
          this.setSelectedShowDate(this.showDate);
        }, 0)
      })
    })
  }

  public getPreWeekData(date: Date, callback: Function) {
    let [initArr, dateArr] = getPreviousWeek(date);
    // get data form db
    DayInfoApi.queryList(dateArr, (res: DayInfo[]) => {
      Logger.info('getPreWeekData->DayInfoList: ', JSON.stringify(res));
      if (res.length > 0) {
        for (let i = 0; i < initArr.length; i++) {
          let dayInfo = res.find((item) => item.date == initArr[i].dateStr) || null;
          initArr[i].dayInfo = dayInfo;
        }
      }
      this.dateArr = initArr.concat(...this.dateArr);
      callback();
    })
  }

  // check is current day
  public checkCurrentDay(): boolean {
    return dateToStr(new Date()) === this.selectedDayInfo?.dateStr;
  }

  public updateSelectedDayInfo(selectedDayInfo: WeekDateModel) {
    Logger.debug('updateSelectedDayInfo', JSON.stringify(selectedDayInfo));
    if (selectedDayInfo.taskList?.length === 0) {
      // get data form db
      TaskInfoTableApi.query(selectedDayInfo.dateStr, true, (res) => {
        Logger.info('Selected TaskInfoList: ', JSON.stringify(res));
        selectedDayInfo.taskList = res;
        this.dateArr = this.dateArr.map((item: WeekDateModel) =>
          item.dateStr == selectedDayInfo.dateStr ? { ...item, taskList: res } : item);
        this.selectedDayInfo = { ...selectedDayInfo };
      });
    } else {
      this.selectedDayInfo = { ...selectedDayInfo };
    }
    Logger.info("selectedDayTaskInfo: ", JSON.stringify(selectedDayInfo.taskList));
  }

  public updateTaskInfoList(editedTaskInfo: ITaskItem) {
    if (editedTaskInfo?.taskID) {
      // edited task
      const {taskID, targetValue, isAlarm, frequency, startTime, endTime, isOpen } = editedTaskInfo;
      let task: TaskInfo = {
        isOpen,
        id: 0,
        date: dateToStr(new Date()),
        isDone: true,
        taskID,
        targetValue,
        isAlarm,
        frequency,
        startTime,
        endTime,
        finValue: targetValue
      }
      this.dateArr = this.dateArr.map((item: WeekDateModel) => {
        if (task.date == item.dateStr) {
          Logger.info('item', JSON.stringify(item));
          let taskList: TaskInfo[] = item.taskList;
          const dayInfo: DayInfo = item.dayInfo;
          if (editedTaskInfo.isOpen) {
            // add task
            taskList = taskList.filter((taskItem) => taskItem.taskID != taskID)
              .concat(task)
              .sort((a, b) => a.taskID - b.taskID);
            let count: number = 0;
            taskList.forEach((taskItem: TaskInfo) => {
              if (taskItem.isDone) {
                count++;
              }
            });
            if (count > dayInfo.finTaskNum) {
              dayInfo.finTaskNum = count;
            }
          } else {
            // delete task
            let taskIndex = taskList.findIndex((taskItem) => taskItem.taskID == taskID);
            Logger.info('taskList[taskIndex]', JSON.stringify(taskList[taskIndex]));
            if (taskList[taskIndex]?.isDone) {
              dayInfo.finTaskNum -= 1;
            }
            taskList = taskList.filter((taskItem) => taskItem.taskID != taskID);
          }
          dayInfo.targetTaskNum = taskList.length;
          if (dayInfo.finTaskNum > dayInfo.targetTaskNum) {
            dayInfo.finTaskNum = dayInfo.targetTaskNum;
          }
          DayInfoApi.updateData(dayInfo, () => {
          });
          Logger.debug("tempDayInfo", JSON.stringify(dayInfo));
          let currentDayInfo = { ...item, taskList, dayInfo };
          if (this.checkCurrentDay()) {
            this.selectedDayInfo = currentDayInfo;
          }
          return currentDayInfo;
        }
        return item;
      }).slice(0);
    }
  }

  public setSelectedShowDate(showDateTime: number) {
    if (showDateTime > new Date().getTime()) {
      return;
    }
    this.showDate = showDateTime;
    this.dateTitle = weekDateFormat(this.showDate);
    let selectedInfo = this.dateArr.find((item: WeekDateModel) => item.dateStr == dateToStr(new Date(showDateTime)));
    if (selectedInfo) {
      this.updateSelectedDayInfo({ ...selectedInfo });
    }
    Logger.info('dateTitle', this.dateTitle);
  }

  public getDonePercent(): string {
    let dayInfo = this.selectedDayInfo?.dayInfo;
    Logger.debug("dayInfo", JSON.stringify(dayInfo));
    if (dayInfo && (dayInfo?.finTaskNum || 0) > 0) {
      if (dayInfo.finTaskNum > dayInfo.targetTaskNum) {
        return `${DEFAULT_100}`;
      }
      return `${Math.ceil(dayInfo.finTaskNum / dayInfo.targetTaskNum * DEFAULT_100)}`;
    }
    return '0';
  }

  public getTaskListOfDay(): TaskInfo[] {
    Logger.info('getTaskListOfDay', JSON.stringify(this.selectedDayInfo));
    if (this.selectedDayInfo && this.selectedDayInfo.taskList.length > 0) {
      return this.selectedDayInfo.taskList;
    }
    return [];
  }

  public async taskClock(taskInfo: TaskInfo) {
    let taskItem = await this.updateTask(taskInfo);
    let dateStr = this.selectedDayInfo?.dateStr;
    if (!taskItem) {
      return Promise.resolve({
        achievementLevel: 0,
        showAchievement: false
      });
    }

    this.selectedDayInfo.taskList = this.selectedDayInfo.taskList.map((item) => {
      return item.taskID == taskItem?.taskID ? taskItem : item;
    });
    let achievementLevel;
    if (taskItem.isDone) {
      let dayInfo = await this.updateDayInfo();
      if (dayInfo && dayInfo?.finTaskNum === dayInfo?.targetTaskNum) {
        achievementLevel = await this.updateAchievement(this.selectedDayInfo.dayInfo);
      }
    }
    this.dateArr = this.dateArr.map((item: WeekDateModel) => dateStr == item.dateStr ? this.selectedDayInfo : item);
    Logger.info('achievementLevel', `${achievementLevel}`);
    return Promise.resolve({
      achievementLevel: achievementLevel,
      showAchievement: ACHIEVEMENT_LEVEL_LIST.includes(achievementLevel)
    });
  }

  updateTask(task: TaskInfo): Promise<TaskInfo> {
    return new Promise((resolve, reject) => {
      let {taskID, targetValue, finValue} = task;
      let updateTask = Object.assign({}, task);
      let step = TaskMapById[taskID].step;
      let hasExceed = updateTask.isDone;
      if (step === 0) {
        updateTask.isDone = true;
        updateTask.finValue = targetValue;
      } else {
        let value = Number(finValue) + step;
        updateTask.isDone = updateTask.isDone || value >= Number(targetValue);
        updateTask.finValue = updateTask.isDone ? targetValue : `${value}`;
      }
      TaskInfoTableApi.updateDataByDate(updateTask, (res) => {
        if (!res || hasExceed) {
          Logger.error('taskClock-updateTask', JSON.stringify(res));
          reject(res);
        }
        resolve(updateTask);
      })
    })
  }

  updateDayInfo(): Promise<DayInfo> {
    let dayInfo: DayInfo = this.selectedDayInfo.dayInfo;
    dayInfo.finTaskNum += 1;
    dayInfo.targetTaskNum = this.selectedDayInfo.taskList.length;
    return new Promise((resolve, reject) => {
      DayInfoApi.updateData(dayInfo, (res) => {
        if (!res) {
          Logger.error('taskClock-updateDayInfo', JSON.stringify(res));
          reject(res);
        }
        Logger.info('taskClock-updateDayInfo', JSON.stringify(dayInfo));
        // 同步界面数据
        this.selectedDayInfo = { ...this.selectedDayInfo, dayInfo };
        resolve(dayInfo);
      });
    });
  }

  updateAchievement(dayInfo: DayInfo): Promise<number> {
    Logger.debug('taskClock-updateAchievement', JSON.stringify(dayInfo));
    return new Promise((resolve, reject) => {
      let preDay = new Date();
      preDay.setDate(preDay.getDate() - 1);
      preDay = new Date(preDay);
      let preDayStr = dateToStr(preDay);
      Logger.info('taskClock-updateAchievement-1', `${preDayStr}`);
      DayInfoApi.query(preDayStr, (res) => {
        Logger.info('taskClock-updateAchievement-2', JSON.stringify(res));
        let isReset = res?.length === 0 || res?.targetTaskNum > res?.finTaskNum;
        GlobalInfoApi.query((res) => {
          Logger.info('taskClock-globalInfoApi', JSON.stringify(res));
          let achievementInfo = res;
            isReset ? (achievementInfo.checkInDays = 1) : (achievementInfo.checkInDays += 1);
          let isNewAchieve = isReachNewAchievement(achievementInfo);
          if (isNewAchieve) {
            AppStorage.SetOrCreate(ACHIEVEMENT_LEVEL_KEY, achievementInfo.checkInDays);
            achievementInfo.achievements = achievementInfo.achievements + ',' + achievementInfo.checkInDays;
          }
          GlobalInfoApi.updateData(achievementInfo, (res) => {
            if (!res) {
              Logger.error('taskClock-updateAchievement', JSON.stringify(res));
              reject(res);
            }
            Logger.debug('taskClock-updateAchievement', JSON.stringify(achievementInfo));
              isNewAchieve ? resolve(achievementInfo.checkInDays) : resolve(0);
          });
        });
      })
    });
  }
}