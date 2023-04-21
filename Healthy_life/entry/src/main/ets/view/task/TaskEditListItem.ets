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
import {
  DEFAULT_8,
  DEFAULT_12,
  DEFAULT_20,
  DEFAULT_16,
  DEFAULT_32,
  DEFAULT_56,
  THOUSANDTH_1000,
  PER_DAY
} from '../../common/constants/CommonConstants';
import { taskType } from '../../common/bean/TaskInfo';

@Extend(Text) function targetSetCommon() {
  .fontSize(DEFAULT_16)
  .flexGrow(1)
  .margin({ right: DEFAULT_8 })
  .align(Alignment.End)
}

@Extend(Text) function targetSettingStyle(isOpen, taskID) {
  .fontColor(isOpen && taskID !== taskType.smile && taskID !== taskType.brushTeeth ?
  $r('app.color.titleColor') :
  $r('app.color.disabledColor'))
}

@Extend(Text) function remindTimeStyle(isOpen, isAlarm) {
  .fontColor(isOpen && isAlarm ? $r('app.color.titleColor') : $r('app.color.disabledColor'))
}

@Extend(Text) function frequencyStyle(isOpen) {
  .fontSize(DEFAULT_12)
  .flexGrow(1)
  .margin({ right: DEFAULT_8 })
  .textAlign(TextAlign.End)
  .fontColor(isOpen ? $r('app.color.titleColor') : $r('app.color.disabledColor'))
}


@Component
export struct TaskChooseItem {
  @Consume settingParams: ITaskItem;

  build() {
    Row() {
      Text(this.settingParams.taskName).fontSize(DEFAULT_20).fontWeight(FontWeight.Medium)
      Toggle({ type: ToggleType.Switch, isOn: this.settingParams.isOpen })
        .width(DEFAULT_56)
        .height(DEFAULT_32)
        .selectedColor($r('app.color.blueColor'))
        .onChange((isOn) => {
          this.settingParams.isOpen = isOn;
        })
    }
    .width(THOUSANDTH_1000)
    .justifyContent(FlexAlign.SpaceBetween)
  }
}

@Component
export struct TargetSetItem {
  @Consume settingParams: ITaskItem;

  build() {
    Row() {
      Text($r('app.string.target_setting'))
        .fontSize(DEFAULT_20)
        .fontWeight(FontWeight.Medium)

      Blank()
        .layoutWeight(1)
      if (this.settingParams?.unit === '') {
        Text(`${this.settingParams?.targetValue}`)
          .targetSetCommon()
          .targetSettingStyle(this.settingParams?.isOpen, this.settingParams?.taskID)
      } else {
        Text(`${this.settingParams?.targetValue} ${this.settingParams?.unit} ${PER_DAY}`)
          .targetSetCommon()
          .targetSettingStyle(this.settingParams?.isOpen, this.settingParams?.taskID)
      }
      Image($r('app.media.ic_right_grey')).width(DEFAULT_8).height(DEFAULT_16);
    }
    .width(THOUSANDTH_1000)
    .justifyContent(FlexAlign.SpaceBetween)
  }
}

@Component
export struct OpenRemindItem {
  @Consume settingParams: ITaskItem;

  build() {
    Row() {
      Text($r('app.string.open_reminder'))
        .fontSize(DEFAULT_20)
        .fontWeight(FontWeight.Medium)

      Toggle({ type: ToggleType.Switch, isOn: this.settingParams?.isAlarm })
        .width(DEFAULT_56)
        .height(DEFAULT_32)
        .selectedColor($r('app.color.blueColor'))
        .onChange((isOn) => {
          this.settingParams.isAlarm = isOn;
        })
    }
    .width(THOUSANDTH_1000)
    .justifyContent(FlexAlign.SpaceBetween)
  }
}

@Component
export struct RemindTimeItem {
  @Consume settingParams: ITaskItem;

  build() {
    Row() {
      Text($r('app.string.remind_time')).fontSize(DEFAULT_20).fontWeight(FontWeight.Medium)
      Blank()
        .layoutWeight(1)
      Text(this.settingParams?.startTime)
        .targetSetCommon()
        .remindTimeStyle(this.settingParams?.isOpen, this.settingParams?.isAlarm)
      Image($r('app.media.ic_right_grey')).width(DEFAULT_8).height(DEFAULT_16)
    }
    .width(THOUSANDTH_1000)
    .justifyContent(FlexAlign.SpaceBetween)
  }
}

@Component
export struct FrequencyItem {
  @Consume settingParams: ITaskItem;
  @Consume frequency: string;

  build() {
    Row() {
      Text($r('app.string.frequency')).fontSize(DEFAULT_20).fontWeight(FontWeight.Medium)
      Text(this.frequency)
        .targetSetCommon()
        .frequencyStyle(this.settingParams?.isOpen)
      Image($r('app.media.ic_right_grey')).width(DEFAULT_8).height(DEFAULT_16)
    }
    .width(THOUSANDTH_1000)
    .justifyContent(FlexAlign.SpaceBetween)
  }
}