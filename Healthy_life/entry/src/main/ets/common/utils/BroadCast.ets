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

import Logger from './Logger';

const FILE_TAG = 'BroadCast';

export class BroadCast {
  private callBackArray = {};

  public on(event, callback) {
    Logger.info(FILE_TAG, 'register broadcast with type '+ event);
    (this.callBackArray[event] || (this.callBackArray[event] = [])).push(callback);
  }

  public off(event, callback) {
    if (event == null) {
      Logger.info(FILE_TAG, 'cancel all broadcast');
      this.callBackArray = {};
    }
    Logger.info(FILE_TAG, 'cancel broadcast with type '+ event);
    const cbs = this.callBackArray[event];
    if (!cbs) {
      return;
    }
    if (callback == null) {
      this.callBackArray[event] = null;
    }

    cbs.splice(cbs.indexOf(callback), 1);
  }

  public emit(event, args?: any[]) {
    if (!this.callBackArray[event]) {
      Logger.info(FILE_TAG, 'emit broadcast failed for no callback');
      return;
    }
    Logger.info(FILE_TAG, 'emit broadcast with type '+ event);
    let cbs = [...this.callBackArray[event]];
    if (cbs) {
      let len = cbs.length;
      for (let i = 0; i < len; i++) {
        try {
          cbs[i].apply(this, args);
        } catch (error) {
          new Error(error);
        }
      }
    }
  }
}

export enum BroadCastType {
  SHOW_ACHIEVEMENT_DIALOG = 'showAchievementDialog',
  SHOW_TASK_DETAIL_DIALOG = 'showTaskDetailDialog',
  SHOW_TARGET_SETTING_DIALOG = 'showTargetSettingDialog',
  SHOW_REMIND_TIME_DIALOG = 'showRemindTimeDialog',
  SHOW_FREQUENCY_DIALOG = 'showFrequencyDialog'
}