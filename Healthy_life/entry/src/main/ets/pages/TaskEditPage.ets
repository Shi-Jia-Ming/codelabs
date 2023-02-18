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

import TaskDetail from '../view/task/TaskDetailComponent';
import { THOUSANDTH_1000, EDIT_TASK_TITLE } from '../common/constants/CommonConstants';

@Entry
@Component
struct TaskEdit {
  build() {
    Row() {
      Navigation() {
        Column() {
          TaskDetail()
        }
        .width(THOUSANDTH_1000)
        .height(THOUSANDTH_1000)
      }
      .size({ width: THOUSANDTH_1000, height: THOUSANDTH_1000 })
      .title(EDIT_TASK_TITLE)
      .titleMode(NavigationTitleMode.Mini)
    }
    .height(THOUSANDTH_1000)
    .backgroundColor($r('app.color.primaryBgColor'))
  }
}