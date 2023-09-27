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
import common from '@ohos.app.ability.common';
import notificationManager from '@ohos.notificationManager';
import Logger from '../common/utils/Logger';
import { ITaskItem } from '../model/TaskInitList';
import { CommonConstants as Const } from '../common/constants/CommonConstants';
import { NavList, TabId } from '../model/NavItemModel';
import HomeIndex from '../view/HomeComponent';
import { AchievementIndex } from '../view/AchievementComponent';
import { MineIndex } from './MinePage';
import { HomeStore } from '../viewmodel/HomeViewModel';
import GlobalInfoApi from '../common/database/tables/GlobalInfoApi';
import GlobalInfo from '../common/bean/GlobalInfo';
import { GlobalContext } from '../common/utils/GlobalContext';

@Styles function allSize() {
  .width(Const.THOUSANDTH_1000)
  .height(Const.THOUSANDTH_1000)
}

@Entry
@Component
struct Index {
  @State currentPage: number = 0;
  @State editedTaskInfo: ITaskItem = router.getParams() ? (router.getParams() as Record<string, Object>).editTask as ITaskItem : {} as ITaskItem;
  @State editedTaskID: string = '0';
  @State homeStore: HomeStore = new HomeStore(new Date());
  private tabController: TabsController = new TabsController();

  aboutToAppear() {
    notificationManager.requestEnableNotification().then(() => {
      Logger.info('onPageShow', `requestEnableNotification success`);
    }).catch((err: Error) => {
      Logger.error('onPageShow', `requestEnableNotification failed, message is ${err.message}`);
    });
  }

  onPageShow() {
    Logger.info('onPageShow', JSON.stringify(router.getParams()));
    let params = (router.getParams() ? router.getParams() : {}) as Record<string, Object>;
    let result = params.editTask ? params.editTask as string : '{}';
    this.editedTaskInfo = JSON.parse(result);
    this.editedTaskID = JSON.stringify(this.editedTaskInfo);
    if ((GlobalContext.getContext().getObject('isForeground') as boolean)) {
      GlobalContext.getContext().setObject('isForeground', false);
      if (this.homeStore.currentDate.getDate() !== (new Date()).getDate()) {
        GlobalContext.getContext().setObject('taskListChange', true);
        this.homeStore = new HomeStore(new Date());
      }
      this.checkCurrentTime();
    }
  }

  checkCurrentTime() {
    GlobalInfoApi.query((result: GlobalInfo) => {
      let predate = new Date(result.lastDate);
      let date = new Date();
      if (result && date.getTime() < predate.getTime()) {
        AlertDialog.show(
          {
            title: $r('app.string.alert'),
            message: $r('app.string.alert_message'),
            autoCancel: false,
            alignment: DialogAlignment.Bottom,
            offset: { dx: 0, dy: -20 },
            gridCount: 3,
            confirm: {
              value: $r('app.string.alert_button'),
              action: () => {
                (getContext(this) as common.UIAbilityContext).terminateSelf();
                console.info('Button-clicking callback');
              }
            },
            cancel: () => {
              console.info('Closed callbacks');
            }
          });
      } else {
        this.homeStore.initData();
      }
    });
  }

  @Builder TabBuilder(index: number) {
    Column() {
      Image(index === this.currentPage ? NavList[index].icon_selected : NavList[index].icon)
        .width($r('app.float.default_24'))
        .height($r('app.float.default_24'))
        .objectFit(ImageFit.Contain);
      Text(NavList[index].text)
        .fontSize($r('app.float.default_10'))
        .fontWeight(Const.FONT_WEIGHT_500)
        .fontColor(this.currentPage === index ? $r('app.color.blueColor') : $r('app.color.tabTitleColor'))
        .margin({ top: $r('app.float.default_4') })
    }.justifyContent(FlexAlign.Center).allSize()
  }

  build() {
    Tabs({ barPosition: BarPosition.End, controller: this.tabController }) {
      TabContent() {
        HomeIndex({ homeStore: $homeStore, editedTaskInfo: $editedTaskInfo, editedTaskID: $editedTaskID })
          .borderWidth({ bottom: 1 })
          .borderColor($r('app.color.primaryBgColor'))
      }
      .tabBar(this.TabBuilder(TabId.HOME))
      .align(Alignment.Start)

      TabContent() {
        AchievementIndex()
      }
      .tabBar(this.TabBuilder(TabId.ACHIEVEMENT))

      TabContent() {
        MineIndex()
          .borderWidth({ bottom: 1 })
          .borderColor($r('app.color.primaryBgColor'))
      }
      .tabBar(this.TabBuilder(TabId.MINE))
    }
    .scrollable(false)
    .allSize()
    .barWidth(Const.THOUSANDTH_940)
    .barMode(BarMode.Fixed)
    .vertical(false)
    .onChange((index) => {
      this.currentPage = index;
    })
  }
}