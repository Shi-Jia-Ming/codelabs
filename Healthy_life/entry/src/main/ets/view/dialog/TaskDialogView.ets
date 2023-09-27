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

import { TargetSettingDialog, RemindTimeDialog, FrequencyDialog } from './TaskSettingDialog';
import { BroadCast, BroadCastType } from '../../common/utils/BroadCast';
import Logger from '../../common/utils/Logger';
import { CommonConstants as Const } from '../../common/constants/CommonConstants';

export interface CustomDialogCallback {
  confirmCallback: Function;
  cancelCallback: Function;
}

@Component
export struct TaskDialogView {
  @State isShow: boolean = false;
  @Consume broadCast: BroadCast;

  // target setting dialog
  targetSettingDialog: CustomDialogController = new CustomDialogController({
    builder: TargetSettingDialog(),
    autoCancel: true,
    alignment: DialogAlignment.Bottom,
    offset: { dx: Const.ZERO, dy: Const.MINUS_20 }
  });
  // remind time dialog
  RemindTimeDialogController: CustomDialogController = new CustomDialogController({
    builder: RemindTimeDialog(),
    autoCancel: true,
    alignment: DialogAlignment.Bottom,
    offset: { dx: Const.ZERO, dy: Const.MINUS_20 }
  });
  // frequency dialog
  FrequencyDialogController: CustomDialogController = new CustomDialogController({
    builder: FrequencyDialog(),
    autoCancel: true,
    alignment: DialogAlignment.Bottom,
    offset: { dx: Const.ZERO, dy: Const.MINUS_20 }
  });

  aboutToAppear() {
    Logger.debug('CustomDialogView', 'aboutToAppear');

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
  }

  aboutToDisappear() {
    Logger.debug('CustomDialogView', 'aboutToDisappear');
  }

  build() {
  }
}