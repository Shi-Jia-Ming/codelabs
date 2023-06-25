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

import common from '@ohos.app.ability.common';
import router from '@ohos.router';
import HealthText from './HealthTextComponent';
import AddBtn from '../view/home/AddBtnComponent';
import { TaskCard } from '../view/home//TaskCardComponent';
import HomeTopView from '../view/home/HomeTopComponent';
import { CustomDialogView, CustomDialogCallback } from '../view/dialog/CustomDialogView';
import TaskInfo from '../common/bean/TaskInfo';
import GlobalInfoApi from '../common/database/tables/GlobalInfoApi';
import { HomeStore } from '../viewmodel/HomeViewModel';
import { ITaskItem, TaskMapById } from '../model/TaskInitList';
import { HealthDataSrcMgr } from '../common/utils/HealthDataSrcMgr';
import { BroadCast, BroadCastType } from '../common/utils/BroadCast';
import * as commonConst from '../common/constants/CommonConstants';

const WHITE_COLOR_0X = 255;

@Styles function allSize() {
  .width(commonConst.THOUSANDTH_1000)
  .height(commonConst.THOUSANDTH_1000)
}

@Extend(Text) function titleTextStyle() {
  .fontSize($r('app.float.default_16'))
  .fontWeight(commonConst.FONT_WEIGHT_500)
  .width(commonConst.THOUSANDTH_1000)
  .fontFamily($r('app.string.HarmonyHeiTi_Medium'))
  .fontColor($r(`app.element.color.titleColor`))
  .padding({
    top: commonConst.THOUSANDTH_15,
    bottom: commonConst.THOUSANDTH_15,
    left: commonConst.THOUSANDTH_33
  })
}

@Component
export default struct HomeIndex {
  @Provide broadCast: BroadCast = HealthDataSrcMgr.getInstance().getBroadCast();
  @State naviAlpha: number = 0;
  @Link homeStore: HomeStore;
  @Link editedTaskInfo: ITaskItem;
  @Link @Watch('taskChange') editedTaskID: string;
  private scroller: Scroller = new Scroller();
  private yOffset: number = 0;

  taskChange() {
    this.homeStore.updateTaskInfoList(this.editedTaskInfo);
  }

  taskItemAction(item: TaskInfo, isClick: boolean) {
    if (!this.homeStore.checkCurrentDay()) {
      return;
    }
    if (isClick) {
      // click to clock
      let callback: CustomDialogCallback = { confirmCallback: this.onConfirm.bind(this), cancelCallback: null };
      this.broadCast.emit(BroadCastType.SHOW_TASK_DETAIL_DIALOG, [item, callback]);
    } else {
      // edit task
      const editTask: ITaskItem = {
        ...TaskMapById[item.taskID],
        targetValue: item?.targetValue,
        isAlarm: item.isAlarm,
        startTime: item.startTime,
        frequency: item.frequency,
        isOpen: item.isOpen,
      };
      router.pushUrl({ url: 'pages/TaskEditPage', params: { params: JSON.stringify(editTask) } });
    }
  }

  //confirm clockL
  onConfirm(task) {
    this.homeStore.taskClock(task).then((res) => {
      if (res.showAchievement) {
        this.broadCast.emit(BroadCastType.SHOW_ACHIEVEMENT_DIALOG, [res.achievementLevel]);
      }
    })
  }

  // change navigator alpha when scrolling the Scroll component
  onScrollAction() {
    this.yOffset = this.scroller.currentOffset().yOffset;
    if (this.yOffset > commonConst.DEFAULT_56) {
      this.naviAlpha = 1;
    } else {
      this.naviAlpha = this.yOffset / commonConst.DEFAULT_56;
    }
  }

  editTaskAction() {
    if (this.homeStore.checkCurrentDay()) {
      router.pushUrl({ url: 'pages/TaskListPage' });
    }
  }

  build() {
    Stack() {
      Scroll(this.scroller) {
        Column() {
          HomeTopView({ homeStore: $homeStore })
          Text($r('app.string.task_list')).titleTextStyle()
          if (this.homeStore.getTaskListOfDay().length > 0) {
            Column({ space: commonConst.DEFAULT_8 }) {
              ForEach(this.homeStore.getTaskListOfDay(), (item: TaskInfo) => {
                TaskCard({
                  taskInfoStr: JSON.stringify(item),
                  clickAction: (isClick) => this.taskItemAction(item, isClick)
                })
                  .margin({ bottom: commonConst.DEFAULT_12 })
                  .height($r('app.float.default_64'))
              }, item => JSON.stringify(item))
            }
            .onAppear(() => {
              this.scroller.scrollTo({ xOffset: 0, yOffset: this.yOffset });
            })
            .padding({
              top: commonConst.THOUSANDTH_15,
              left: commonConst.THOUSANDTH_33,
              right: commonConst.THOUSANDTH_33
            })
            .width(commonConst.THOUSANDTH_1000)
          } else {
            Column({ space: commonConst.DEFAULT_8 }) {
              Image($r('app.media.ic_no_data'))
                .width($r('app.float.default_132'))
                .height($r('app.float.default_100'));
              HealthText({ title: '', titleResource: $r('app.string.no_task'), fontSize: $r('app.float.default_14') })
                .opacity(commonConst.OPACITY_4)
            }
            .margin({ top: commonConst.DEFAULT_48 })
          }
        }
      }
      .scrollBar(BarState.Off)
      .allSize()
      .onScroll(this.onScrollAction.bind(this))
      .align(Alignment.TopStart)

      AddBtn({ clickAction: this.editTaskAction.bind(this) })
      Row() {
        Text($r('app.string.EntryAbility_label'))
          .titleTextStyle()
          .fontSize($r('app.float.default_24'))
          .padding({ left: commonConst.THOUSANDTH_66 })
      }
      .width(commonConst.THOUSANDTH_1000)
      .height(commonConst.DEFAULT_56)
      .position({ x: 0, y: 0 })
      .backgroundColor(`rgba(${WHITE_COLOR_0X},${WHITE_COLOR_0X},${WHITE_COLOR_0X},${this.naviAlpha})`)

      CustomDialogView()
    }
    .allSize()
    .backgroundColor($r('app.color.primaryBgColor'))
  }
}

