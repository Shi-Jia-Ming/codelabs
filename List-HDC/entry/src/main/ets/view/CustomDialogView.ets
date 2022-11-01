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
import { BroadCast, BroadCastType } from '../common/utils/BroadCast';
import { ZERO, MINUS_20 } from '../common/constants/CommonConstant';

// 弹窗
@Component
export struct CustomDialogView {
  @State isShow: boolean = false;
  @Provide achievementLevel: number = 3;
  @Consume broadCast: BroadCast;

  //目标设置
  targetSettingDialog = new CustomDialogController({
    builder: TargetSettingDialog(),
    autoCancel: true,
    alignment: DialogAlignment.Bottom,
    offset: { dx: ZERO, dy: MINUS_20 }
  });
  // 提醒时间
  RemindTimeDialogController: CustomDialogController = new CustomDialogController({
    builder: RemindTimeDialog(),
    autoCancel: true,
    alignment: DialogAlignment.Bottom,
    offset: { dx: ZERO, dy: MINUS_20 }
  });
  //频率弹窗
  FrequencyDialogController: CustomDialogController = new CustomDialogController({
    builder: FrequencyDialog(),
    autoCancel: true,
    alignment: DialogAlignment.Bottom,
    offset: { dx: ZERO, dy: MINUS_20 }
  });

  aboutToAppear() {
    let self = this;

    //目标设置
    this.broadCast.on(
      BroadCastType.SHOW_TARGET_SETTING_DIALOG,
      function () {
        self.targetSettingDialog.open();
      })

    // 提醒时间弹窗
    this.broadCast.on(
      BroadCastType.SHOW_REMIND_TIME_DIALOG,
      function () {
        self.RemindTimeDialogController.open();
      })

    // 频率弹窗
    this.broadCast.on(
      BroadCastType.SHOW_FREQUENCY_DIALOG,
      function () {
        self.FrequencyDialogController.open();
      })
  }

  build() {
  }
}