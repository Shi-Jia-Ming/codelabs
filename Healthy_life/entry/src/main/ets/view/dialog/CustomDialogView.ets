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

import { AchievementDialog } from './AchievementDialog';
import { TaskDetailDialog } from './TaskDetailDialog';
import { TargetSettingDialog, RemindTimeDialog, FrequencyDialog } from './TaskSettingDialog';
import { BroadCast, BroadCastType } from '../../common/utils/BroadCast';
import { TaskItem } from '../../model/TaskInitList';
import TaskInfo from '../../common/bean/TaskInfo';
import { Logger } from '../../common/utils/log/Logger';
import { ZERO, MINUS_20 } from '../../common/constants/CommonConstants';

export interface CustomDialogCallback {
  confirmCallback: Function;
  cancelCallback: Function;
}

@Component
export struct CustomDialogView {
  @State isShow: boolean = false;
  @Provide achievementLevel: number = 0;
  @Consume broadCast: BroadCast;
  @Provide currentTask: TaskInfo = TaskItem;
  @Provide dialogCallBack: CustomDialogCallback = { confirmCallback: null, cancelCallback: null };

  // achievement dialog
  achievementDialog = new CustomDialogController({
    builder: AchievementDialog(),
    autoCancel: true,
    customStyle: true
  });
  // target setting dialog
  targetSettingDialog = new CustomDialogController({
    builder: TargetSettingDialog(),
    autoCancel: true,
    alignment: DialogAlignment.Bottom,
    offset: { dx: ZERO, dy: MINUS_20 }
  });
  // remind time dialog
  RemindTimeDialogController: CustomDialogController = new CustomDialogController({
    builder: RemindTimeDialog(),
    autoCancel: true,
    alignment: DialogAlignment.Bottom,
    offset: { dx: ZERO, dy: MINUS_20 }
  });
  // frequency dialog
  FrequencyDialogController: CustomDialogController = new CustomDialogController({
    builder: FrequencyDialog(),
    autoCancel: true,
    alignment: DialogAlignment.Bottom,
    offset: { dx: ZERO, dy: MINUS_20 }
  });
  // task clock dialog
  taskDialog = new CustomDialogController({
    builder: TaskDetailDialog(),
    autoCancel: true,
    customStyle: true
  });

  aboutToAppear() {
    Logger.debug('CustomDialogView', 'aboutToAppear');
    // achievement dialog
    this.broadCast.on(BroadCastType.SHOW_ACHIEVEMENT_DIALOG, (achievementLevel: number) => {
      Logger.debug('CustomDialogView', 'SHOW_ACHIEVEMENT_DIALOG');
      this.achievementLevel = achievementLevel;
      this.achievementDialog.open();
    })

    // target setting dialog
    this.broadCast.on(BroadCastType.SHOW_TARGET_SETTING_DIALOG, () => {
      this.targetSettingDialog.open();
    })
    // remind time dialog
    this.broadCast.on(BroadCastType.SHOW_REMIND_TIME_DIALOG, () => {
      this.RemindTimeDialogController.open();
    })
    // frequency dialog
    this.broadCast.on(BroadCastType.SHOW_FREQUENCY_DIALOG, () => {
      this.FrequencyDialogController.open();
    })
    // task clock dialog
    this.broadCast.on(BroadCastType.SHOW_TASK_DETAIL_DIALOG,
      (currentTask: TaskInfo, dialogCallBack: CustomDialogCallback) => {
        Logger.debug('CustomDialogView', 'SHOW_TASK_DETAIL_DIALOG');
        this.currentTask = currentTask;
        this.dialogCallBack = dialogCallBack;
        this.taskDialog.open();
      })
  }

  aboutToDisappear() {
    Logger.debug('CustomDialogView', 'aboutToDisappear');
  }

  build() {
  }
}