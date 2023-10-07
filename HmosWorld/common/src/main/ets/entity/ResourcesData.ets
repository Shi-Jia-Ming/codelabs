/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { LearningResource } from './LearningResource';

export interface ResourcesData {
  /**
   *  current page number
   */
  currentPage: number;

  /**
   *  Number of resource data on each page
   */
  pageSize: number;

  /**
   *  Total page number
   */
  pageCount: number;

  /**
   *  Total resource data number
   */
  total: number;

  /**
   *  Is there a next page
   */
  hasNext: boolean;

  /**
   *  Resource List
   */
  resourceList: LearningResource[];
}