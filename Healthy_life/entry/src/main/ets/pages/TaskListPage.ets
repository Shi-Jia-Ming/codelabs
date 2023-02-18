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

import { ITaskItem } from '../model/TaskInitList';
import TaskList from '../view/task/TaskListComponent';
import { THOUSANDTH_1000, ADD_TASK_TITLE } from '../common/constants/CommonConstants';
import { getAllTask, taskIndexDataInit, taskOriginData } from '../viewmodel/TaskViewModel';

@Entry
@Component
@Preview
struct TaskIndex {
  @Provide taskList: ITaskItem[] = taskOriginData;

  onPageShow() {
    getAllTask().then(res => {
      let deepCopyData = JSON.stringify(this.taskList);
      deepCopyData = JSON.parse(deepCopyData);
      this.taskList = taskIndexDataInit(deepCopyData, res);
    })
  }

  build() {
    Row() {
      Navigation() {
        Column() {
          TaskList()
        }
        .width(THOUSANDTH_1000)
        .justifyContent(FlexAlign.Center)
      }
      .size({ width: THOUSANDTH_1000, height: THOUSANDTH_1000 })
      .title(ADD_TASK_TITLE)
      .titleMode(NavigationTitleMode.Mini)
    }
    .backgroundColor($r('app.color.primaryBgColor'))
    .height(THOUSANDTH_1000)
  }
}