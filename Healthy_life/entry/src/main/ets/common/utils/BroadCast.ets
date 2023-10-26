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
import { CustomDialogCallback } from '../../view/dialog/CustomDialogView';
import BroadCastCallBackInfo from '../../viewmodel/BroadCastCallBackInfo';
import TaskInfo from '../../viewmodel/TaskInfo';

import Logger from './Logger';

const FILE_TAG = 'BroadCast';

const callBackArrayTemp = new BroadCastCallBackInfo();

export class BroadCast {
  private callBackArray: BroadCastCallBackInfo = callBackArrayTemp;

  public on(event: string, callback: Function) {
    Logger.info(FILE_TAG, 'register broadcast with type '+ event);
    switch (event) {
      case BroadCastType.SHOW_ACHIEVEMENT_DIALOG:
        this.callBackArray.showAchievementDialog = callback;
        break;
      case BroadCastType.SHOW_TASK_DETAIL_DIALOG:
        this.callBackArray.showTaskDetailDialog = callback;
        break;
      case BroadCastType.SHOW_TARGET_SETTING_DIALOG:
        this.callBackArray.showTargetSettingDialog = callback;
        break;
      case BroadCastType.SHOW_REMIND_TIME_DIALOG:
        this.callBackArray.showRemindTimeDialog = callback;
        break;
      case BroadCastType.SHOW_FREQUENCY_DIALOG:
        this.callBackArray.showFrequencyDialog = callback;
        break;
      default:
        break;
    }
  }

  public off(event: string, callback: Function) {
    if (event === null) {
      Logger.info(FILE_TAG, 'cancel all broadcast');
      this.callBackArray = callBackArrayTemp;
    }
    Logger.info(FILE_TAG, 'cancel broadcast with type '+ event);
    const cbs = this.callBackArray;
    if (!cbs) {
      return;
    }
    if (callback === null) {
      switch (event) {
        case BroadCastType.SHOW_ACHIEVEMENT_DIALOG:
          this.callBackArray.showAchievementDialog = () => {};
          break;
        case BroadCastType.SHOW_TASK_DETAIL_DIALOG:
          this.callBackArray.showTaskDetailDialog = () => {};
          break;
        case BroadCastType.SHOW_TARGET_SETTING_DIALOG:
          this.callBackArray.showTargetSettingDialog = () => {};
          break;
        case BroadCastType.SHOW_REMIND_TIME_DIALOG:
          this.callBackArray.showRemindTimeDialog = () => {};
          break;
        case BroadCastType.SHOW_FREQUENCY_DIALOG:
          this.callBackArray.showFrequencyDialog = () => {};
          break;
        default:
          break;
      }
    }
  }

  public emit(event: string, args?: (number | number[] | (TaskInfo | CustomDialogCallback)[])) {
    if (!this.callBackArray) {
      Logger.info(FILE_TAG, 'emit broadcast failed for no callback');
      return;
    }
    Logger.info(FILE_TAG, 'emit broadcast with type '+ event);
    let cbs: Array<Function> = [];
    switch (event) {
      case BroadCastType.SHOW_ACHIEVEMENT_DIALOG:
        cbs = [this.callBackArray.showAchievementDialog];
        break;
      case BroadCastType.SHOW_TASK_DETAIL_DIALOG:
        cbs = [this.callBackArray.showTaskDetailDialog];
        break;
      case BroadCastType.SHOW_TARGET_SETTING_DIALOG:
        cbs = [this.callBackArray.showTargetSettingDialog];
        break;
      case BroadCastType.SHOW_REMIND_TIME_DIALOG:
        cbs = [this.callBackArray.showRemindTimeDialog];
        break;
      case BroadCastType.SHOW_FREQUENCY_DIALOG:
        cbs = [this.callBackArray.showFrequencyDialog];
        break;
      default:
        break;
    }
    if (cbs) {
      let len = cbs.length;
      for (let i = 0; i < len; i++) {
        try {
          if (args instanceof Array) {
            cbs[i](args[0], args[1]);
          } else {
            cbs[i](args);
          }
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