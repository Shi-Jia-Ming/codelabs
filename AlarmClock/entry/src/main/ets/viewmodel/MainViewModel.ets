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

import { MainConstant } from '../common/constants/MainConstant';
import ReminderService from '../model/ReminderService';
import {CommonConstants, WeekDays } from '../common/constants/CommonConstants';
import AlarmItem from './AlarmItem';
import DataTypeUtils from '../common/utils/DataTypeUtils';
import { GlobalContext } from '../common/utils/GlobalContext';
import PreferencesHandler from '../model/database/PreferencesHandler';
import PreferencesListener from '../model/database/PreferencesListener';

/**
 * Declare class of main view model.
 */
export default class MainViewModel {
  static instant: MainViewModel =new MainViewModel();
  private reminderService: ReminderService;
  private alarms: Array<AlarmItem>;

  private constructor() {
    this.alarms = new Array();
    this.reminderService = new ReminderService();
    this.reminderService.openNotificationPermission();
  }

  /**
   * Querying alarm task database tables.
   *
   * @param callback (alarms: Array<AlarmItem>) => void
   */
  private queryDatabaseAlarms(callback: (alarms: Array<AlarmItem>) => void) {
    let preference = GlobalContext.getContext().getObject('preference') as PreferencesHandler;
    preference.get(CommonConstants.ALARM_KEY).then((data: string) => {
      if (!DataTypeUtils.isNull(data)) {
        this.alarms = JSON.parse(data);
        callback(this.alarms);
      }
    })
  }

  /**
   * Refresh alarm task.
   *
   * @param callback (alarms: Array<AlarmItem>) => void
   */
  public queryAlarmsTasker(callback: (alarms: Array<AlarmItem>) => void) {
    let that = this;
    that.queryDatabaseAlarms(callback);
    let preference = GlobalContext.getContext().getObject('preference') as PreferencesHandler;
    preference.addPreferencesListener({
      onDataChanged() {
        that.queryDatabaseAlarms(callback);
      }
    } as PreferencesListener)
  }

  /**
   * Padding zeros for insufficient digits
   *
   * @param val number
   * @return content string
   */
  public fillZero(val: number): string {
    return (val > MainConstant.DEFAULT_SINGLE_DIGIT_MAX
      ? val.toString()
      : (MainConstant.DEFAULT_ZEROING + val));
  }

  /**
   * Get noon content in MainViewModel.
   *
   * @param hour number
   * @return content string
   */
  public getNoonContent(hour: number): string {
    return (hour < CommonConstants.DEFAULT_TOTAL_HOUR
      ? MainConstant.DEFAULT_STRING_MORNING
      : MainConstant.DEFAULT_STRING_AFTERNOON);
  }

  /**
   * Get task time content in MainViewModel.
   *
   * @param hour number
   * @param minute number
   * @return content string
   */
  public getTaskTimeContent(hour: number, minute: number): string {
    return (this.fillZero(hour > CommonConstants.DEFAULT_TOTAL_HOUR ? hour - CommonConstants.DEFAULT_TOTAL_HOUR : hour)
      + MainConstant.DEFAULT_STRING_COLON
      + this.fillZero(minute));
  }

  /**
   * Get description content in MainViewModel.
   *
   * @param alarmItem AlarmItem
   * @return content string
   */
  public getDescContent(alarmItem: AlarmItem): string {
    return (alarmItem.name + CommonConstants.DEFAULT_STRING_COMMA
      + (alarmItem.isRepeat
        ? this.getAlarmRepeatDayContent(alarmItem.repeatDays)
        : CommonConstants.DEFAULT_STRING_NO_REPEAT));
  }

  /**
   * Obtains the number of repetition days of an alarm task.
   *
   * @param repeatDays Array<number>
   * @return content string
   */
  public getAlarmRepeatDayContent(repeatDays: Array<number>): string {
    let content = MainConstant.DEFAULT_STRING_NULL;
    for (let i = 0; i < repeatDays.length; i++) {
      let repeatDay = repeatDays[i];
      let repeatContent: string = CommonConstants.DEFAULT_STRING_MONDAY;
      switch (repeatDay) {
        case WeekDays.DEFAULT_NUMBER_MONDAY:
          repeatContent = CommonConstants.DEFAULT_STRING_MONDAY;
          break;
        case WeekDays.DEFAULT_NUMBER_TUESDAY:
          repeatContent = CommonConstants.DEFAULT_STRING_TUESDAY;
          break;
        case WeekDays.DEFAULT_NUMBER_WEDNESDAY:
          repeatContent = CommonConstants.DEFAULT_STRING_WEDNESDAY;
          break;
        case WeekDays.DEFAULT_NUMBER_THURSDAY:
          repeatContent = CommonConstants.DEFAULT_STRING_THURSDAY;
          break;
        case WeekDays.DEFAULT_NUMBER_FRIDAY:
          repeatContent = CommonConstants.DEFAULT_STRING_FRIDAY;
          break;
        case WeekDays.DEFAULT_NUMBER_SATURDAY:
          repeatContent = CommonConstants.DEFAULT_STRING_SATURDAY;
          break;
        case WeekDays.DEFAULT_NUMBER_SUNDAY:
          repeatContent = CommonConstants.DEFAULT_STRING_SUNDAY;
          break;
        default:
          break;
      }
      content += (repeatContent + CommonConstants.DEFAULT_STRING_SPACE);
    }
    return content;
  }

  /**
   * Enabling/Disabling alarms.
   *
   * @param id number
   * @return isOpen boolean
   */
  public openAlarm(id: number, isOpen: boolean) {
    for (let i = 0; i < this.alarms.length; i++) {
      if (this.alarms[i].id === id) {
        this.alarms[i].isOpen = isOpen;
        if (isOpen) {
          this.reminderService.addReminder(this.alarms[i]);
        } else {
          this.reminderService.deleteReminder(this.alarms[i].id);
        }
        let preference = GlobalContext.getContext().getObject('preference') as PreferencesHandler;
        preference.set(CommonConstants.ALARM_KEY, JSON.stringify(this.alarms));
        break;
      }
    }
  }
}