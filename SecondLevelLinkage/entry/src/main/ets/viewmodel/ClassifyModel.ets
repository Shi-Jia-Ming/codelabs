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

import CourseModel from './CourseModel';

/**
 * course classity model
 */
export default class ClassifyModel {
  /**
   * classify id
   */
  classifyId: number;
  /**
   * classify name
   */
  classifyName: string;
  /**
   * course list of the classify.
   */
  courseList: Array<CourseModel>;

  constructor(classifyId: number, classifyName: string, courseList: Array<CourseModel>) {
    this.classifyId = classifyId;
    this.classifyName = classifyName;
    this.courseList = courseList;
  }
}