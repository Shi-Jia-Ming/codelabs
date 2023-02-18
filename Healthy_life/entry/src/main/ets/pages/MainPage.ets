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
import { Logger } from '../common/utils/log/Logger';
import { ITaskItem } from '../model/TaskInitList';
import * as commonConst from '../common/constants/CommonConstants'
import { NavList, TabId } from '../model/NavItemModel';
import HomeIndex from '../view/HomeComponent';
import { AchievementIndex } from '../view/AchievementComponent';
import { MineIndex } from './MinePage';

@Styles function allSize () {
  .width(commonConst.THOUSANDTH_1000)
  .height(commonConst.THOUSANDTH_1000)
}

@Entry
@Component
struct Index {
  @State currentPage: number = 0;
  @State editedTaskInfo: ITaskItem = JSON.parse(router.getParams() ? router.getParams()['editTask'] : '{}');
  @State editedTaskID: string = '0';
  private tabController: TabsController = new TabsController();

  onPageShow() {
    Logger.info('onPageShow', JSON.stringify(router.getParams()));
    this.editedTaskInfo = JSON.parse(router.getParams() ? router.getParams()['editTask'] : '{}');
    this.editedTaskID = `${this.editedTaskInfo.taskID}_${this.editedTaskInfo.isOpen}` + new Date().getTime();
  }

  @Builder TabBuilder(index: number) {
    Column() {
      Image(index == this.currentPage ? NavList[index].icon_selected : NavList[index].icon)
        .width($r('app.float.default_24'))
        .height($r('app.float.default_24'))
        .objectFit(ImageFit.Contain);
      Text(NavList[index].text)
        .fontSize($r('app.float.default_10'))
        .fontWeight(commonConst.FONT_WEIGHT_500)
        .fontColor(this.currentPage === index ? $r('app.color.blueColor') : $r('app.color.tabTitleColor'))
        .margin({ top: $r('app.float.default_4') })
    }.justifyContent(FlexAlign.Center).allSize()
  }

  build() {
    Tabs({ barPosition: BarPosition.End, controller: this.tabController }) {
      TabContent() {
        HomeIndex({ editedTaskInfo: $editedTaskInfo, editedTaskID: $editedTaskID })
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
    .barWidth(commonConst.THOUSANDTH_940)
    .barMode(BarMode.Fixed)
    .vertical(false)
    .onChange((index) => {
      this.currentPage = index;
    })
  }
}