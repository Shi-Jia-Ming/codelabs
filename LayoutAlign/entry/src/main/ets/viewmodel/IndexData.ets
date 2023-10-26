/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { CONTAINER, CONTAINER_TYPE } from '../common/Constants/CommonConstants';
import { FLEX_MODULE, COLUMN_MODULE, ROW_MODULE, STACK_MODULE } from '../viewmodel/AttributeModuleData';
import { IndexListItem } from './IndexListItem'

/**
 * get Index page dataList
 */
export function getIndexList(): Array<IndexListItem> {
  let indexModuleArray: Array<IndexListItem> = []
  INDEX_LIST.forEach((item: IndexListItem) => {
    indexModuleArray.push(item);
  })
  return indexModuleArray;
}

export const INDEX_LIST: IndexListItem[] = [
  {
    name: CONTAINER.FLEX,
    icon: $r('app.media.ic_flex'),
    containerType: CONTAINER_TYPE.FLEX,
    moduleList: FLEX_MODULE
  },
  {
    name: CONTAINER.COLUMN,
    icon: $r('app.media.ic_column'),
    containerType: CONTAINER_TYPE.COLUMN,
    moduleList: COLUMN_MODULE
  },
  {
    name: CONTAINER.ROW,
    icon: $r('app.media.ic_row'),
    containerType: CONTAINER_TYPE.ROW,
    moduleList: ROW_MODULE
  },
  {
    name: CONTAINER.STACK,
    icon: $r('app.media.ic_stack'),
    containerType: CONTAINER_TYPE.STACK,
    moduleList: STACK_MODULE
  },
];