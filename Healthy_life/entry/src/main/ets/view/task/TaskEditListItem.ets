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

import { ITaskItem } from '../../model/TaskInitList';
import { CommonConstants as Const } from '../../common/constants/CommonConstants';
import { taskType } from '../../viewmodel/TaskInfo';

@Extend(Text) function targetSetCommon() {
  .fontSize(Const.DEFAULT_16)
  .flexGrow(1)
  .margin({ right: Const.DEFAULT_8 })
  .align(Alignment.End)
}

@Extend(Text) function targetSettingStyle(isOpen: boolean, taskID: number) {
  .fontColor(isOpen && taskID !== taskType.smile && taskID !== taskType.brushTeeth ?
  $r('app.color.titleColor') :
  $r('app.color.disabledColor'))
}

@Extend(Text) function remindTimeStyle(isOpen: boolean, isAlarm: boolean) {
  .fontColor(isOpen && isAlarm ? $r('app.color.titleColor') : $r('app.color.disabledColor'))
}

@Extend(Text) function frequencyStyle(isOpen: boolean, isAlarm: boolean) {
  .fontSize(Const.DEFAULT_12)
  .flexGrow(1)
  .margin({ right: Const.DEFAULT_8 })
  .textAlign(TextAlign.End)
  .fontColor(isOpen && isAlarm ? $r('app.color.titleColor') : $r('app.color.disabledColor'))
}


@Component
export struct TaskChooseItem {
  @Consume settingParams: ITaskItem;

  build() {
    Row() {
      Text(this.settingParams.taskName).fontSize(Const.DEFAULT_20).fontWeight(FontWeight.Medium)
      Toggle({ type: ToggleType.Switch, isOn: this.settingParams.isOpen })
        .width(Const.DEFAULT_56)
        .height(Const.DEFAULT_32)
        .selectedColor($r('app.color.blueColor'))
        .onChange((isOn) => {
          this.settingParams.isOpen = isOn;
        })
    }
    .width(Const.THOUSANDTH_1000)
    .justifyContent(FlexAlign.SpaceBetween)
  }
}

@Component
export struct TargetSetItem {
  @Consume settingParams: ITaskItem;

  build() {
    Row() {
      Text($r('app.string.target_setting'))
        .fontSize(Const.DEFAULT_20)
        .fontWeight(FontWeight.Medium)

      Blank()
        .layoutWeight(1)
      if (this.settingParams?.unit === '') {
        Text(`${this.settingParams?.targetValue}`)
          .targetSetCommon()
          .targetSettingStyle(this.settingParams?.isOpen, this.settingParams?.taskID)
      } else {
        Text(`${this.settingParams?.targetValue} ${this.settingParams?.unit} ${Const.PER_DAY}`)
          .targetSetCommon()
          .targetSettingStyle(this.settingParams?.isOpen, this.settingParams?.taskID)
      }
      Image($r('app.media.ic_right_grey')).width(Const.DEFAULT_8).height(Const.DEFAULT_16);
    }
    .width(Const.THOUSANDTH_1000)
    .justifyContent(FlexAlign.SpaceBetween)
  }
}

@Component
export struct OpenRemindItem {
  @Consume settingParams: ITaskItem;

  build() {
    Row() {
      Text($r('app.string.open_reminder'))
        .fontSize(Const.DEFAULT_20)
        .fontWeight(FontWeight.Medium)

      Toggle({ type: ToggleType.Switch, isOn: this.settingParams?.isAlarm })
        .width(Const.DEFAULT_56)
        .height(Const.DEFAULT_32)
        .selectedColor($r('app.color.blueColor'))
        .onChange((isOn) => {
          this.settingParams.isAlarm = isOn;
        })
    }
    .width(Const.THOUSANDTH_1000)
    .justifyContent(FlexAlign.SpaceBetween)
  }
}

@Component
export struct RemindTimeItem {
  @Consume settingParams: ITaskItem;

  build() {
    Row() {
      Text($r('app.string.remind_time')).fontSize(Const.DEFAULT_20).fontWeight(FontWeight.Medium)
      Blank()
        .layoutWeight(1)
      Text(this.settingParams?.startTime)
        .targetSetCommon()
        .remindTimeStyle(this.settingParams?.isOpen, this.settingParams?.isAlarm)
      Image($r('app.media.ic_right_grey')).width(Const.DEFAULT_8).height(Const.DEFAULT_16)
    }
    .width(Const.THOUSANDTH_1000)
    .justifyContent(FlexAlign.SpaceBetween)
  }
}

@Component
export struct FrequencyItem {
  @Consume settingParams: ITaskItem;
  @Consume frequency: string;

  build() {
    Row() {
      Text($r('app.string.frequency')).fontSize(Const.DEFAULT_20).fontWeight(FontWeight.Medium)
      Text(this.frequency)
        .targetSetCommon()
        .frequencyStyle(this.settingParams?.isOpen, this.settingParams?.isAlarm)
      Image($r('app.media.ic_right_grey')).width(Const.DEFAULT_8).height(Const.DEFAULT_16)
    }
    .width(Const.THOUSANDTH_1000)
    .justifyContent(FlexAlign.SpaceBetween)
  }
}