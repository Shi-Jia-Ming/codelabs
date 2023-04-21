/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

/**
 * Task item entity class.
 */
export default class TaskItemBean {
  /**
   * Progress value of task item.
   */
  taskName: string;

  /**
   * Update time of task item.
   */
  updateDate: string;

  /**
   * progress value of task item.
   */
  progressValue: number;


  /**
   * Construction method.
   *
   * @param progressValue progress value.
   * @param updateDate update time.
   */
  constructor(taskName: string, progressValue: number, updateDate: string) {
    this.taskName = taskName;
    this.progressValue = progressValue;
    this.updateDate = updateDate;
  }
}