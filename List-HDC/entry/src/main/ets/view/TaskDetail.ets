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

import router from '@ohos.router';
import prompt from '@system.prompt';
import { TaskListItem } from '../model/TaskInitList';
import * as commonConst from '../common/constants/CommonConstant';
import {
  TaskChooseItem,
  TargetSetItem,
  OpenRemindItem,
  RemindTimeItem,
  FrequencyItem
} from './TaskEditListItem';
import { taskType } from '../model/TaskInfo';
import { BroadCast, BroadCastType } from '../common/utils/BroadCast';
import { EventSourceManager } from '../model/EventSourceManager';
import { CustomDialogView } from './CustomDialogView';

@Styles function listItemStyle () {
  .backgroundColor($r('app.color.white'))
  .height(commonConst.THOUSANDTH_80)
  .borderRadius(commonConst.DEFAULT_10)
  .padding({ left: commonConst.DEFAULT_12, right: commonConst.DEFAULT_12 })
}

@Component
export default struct TaskDetail {
  @Provide broadCast: BroadCast = EventSourceManager.getInstance().getBroadCast();
  @Provide settingParams: TaskListItem = this.parseRouterParams();
  @Provide frequency: string = commonConst.EVERYDAY;

  parseRouterParams() {
    const routerParams: TaskListItem = JSON.parse(router.getParams()['params']);
    return routerParams;
  }

  finishTaskEdit() {
    prompt.showToast({
      message: commonConst.SETTING_FINISHED_MESSAGE
    })
  }

  aboutToAppear() {
    this.broadCast.off(null, null);
  }

  build() {
    Row() {
      Column() {
        List({ space: commonConst.LIST_ITEM_SPACE }) {
          ListItem() {
            TaskChooseItem()
          }
          .listItemStyle()

          ListItem() {
            TargetSetItem()
          }
          .listItemStyle()
          .enabled(
            this.settingParams?.isOpen
            && this.settingParams?.taskID !== taskType.smile
            && this.settingParams?.taskID !== taskType.brushTeeth
          )
          .onClick(() => {
            this.broadCast.emit(
              BroadCastType.SHOW_TARGET_SETTING_DIALOG);
          })

          ListItem() {
            OpenRemindItem()
          }
          .listItemStyle()
          .enabled(this.settingParams?.isOpen)

          ListItem() {
            RemindTimeItem()
          }
          .listItemStyle()
          .enabled(this.settingParams?.isOpen && this.settingParams?.isAlarm)
          .onClick(() => {
            this.broadCast.emit(
              BroadCastType.SHOW_REMIND_TIME_DIALOG
            );
          })

          ListItem() {
            FrequencyItem()
          }
          .listItemStyle()
          .enabled(this.settingParams?.isOpen)
          .onClick(() => {
            this.broadCast.emit(
              BroadCastType.SHOW_FREQUENCY_DIALOG,
            );
          })

        }
        .width(commonConst.THOUSANDTH_940)
        .margin({ bottom: commonConst.THOUSANDTH_400 })

        Button() {
          Text($r('app.string.complete')).fontSize(commonConst.DEFAULT_20).fontColor($r('app.color.blueColor'))
        }
        .width(commonConst.THOUSANDTH_800)
        .height(commonConst.DEFAULT_48)
        .backgroundColor($r('app.color.borderColor'))
        .onClick(() => {
          this.finishTaskEdit();
        })

        CustomDialogView()
      }
      .width(commonConst.THOUSANDTH_1000)
    }
  }
}




