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

import { ATTRIBUTE, GROUP } from '../common/Constants/CommonConstants';
import { ContainerModuleItem } from '../common/bean/ContainerModuleItem';

/**
 *Get  Module List Data in Flex
 */
export function getFlexModuleList(): Array<ContainerModuleItem> {
  let flexModuleArray: Array<ContainerModuleItem> = []
  FLEX_MODULE.forEach((item: ContainerModuleItem) => {
    flexModuleArray.push(item);
  })
  return flexModuleArray;
}

/**
 *Get  Module List Data in Column
 */
export function getColumnModuleList(): Array<ContainerModuleItem> {
  let columnModuleArray: Array<ContainerModuleItem> = []
  COLUMN_MODULE.forEach((item: ContainerModuleItem) => {
    columnModuleArray.push(item);
  })
  return columnModuleArray;
}

/**
 *Get  Module List Data in Row
 */
export function getRowModuleList(): Array<ContainerModuleItem> {
  let rowModuleArray: Array<ContainerModuleItem> = []
  ROW_MODULE.forEach((item: ContainerModuleItem) => {
    rowModuleArray.push(item);
  })
  return rowModuleArray;
}

/**
 *Get  Module List Data in Stack
 */
export function getStackModuleList(): Array<ContainerModuleItem> {
  let stackModuleArray: Array<ContainerModuleItem> = []
  STACK_MODULE.forEach((item:ContainerModuleItem) => {
    stackModuleArray.push(item);
  })
  return stackModuleArray;
}

export const FLEX_MODULE: ContainerModuleItem[] = [
  {
    groupName: GROUP.MAIN_DIRECTION,
    moduleName: $r('app.string.main_direction'),
    attributeList: [ATTRIBUTE.COLUMN, ATTRIBUTE.ROW, ATTRIBUTE.COLUMN_REVERSE]
  },
  {
    groupName: GROUP.MAIN_ALIGN,
    moduleName: $r("app.string.main_align"),
    attributeList: [ATTRIBUTE.START, ATTRIBUTE.CENTER, ATTRIBUTE.END]
  },
  {
    groupName: GROUP.AXI_ALIGN,
    moduleName: $r("app.string.axi_align"),
    attributeList: [ATTRIBUTE.START, ATTRIBUTE.CENTER, ATTRIBUTE.END]
  }
];

export const COLUMN_MODULE: ContainerModuleItem[] = [
  {
    groupName: GROUP.MAIN_ALIGN,
    moduleName: $r("app.string.main_align"),
    attributeList: [ATTRIBUTE.START, ATTRIBUTE.CENTER, ATTRIBUTE.END]
  },
  {
    groupName: GROUP.AXI_ALIGN,
    moduleName: $r("app.string.axi_align"),
    attributeList: [ATTRIBUTE.START, ATTRIBUTE.CENTER, ATTRIBUTE.END]
  }
];

export const ROW_MODULE: ContainerModuleItem[] = [
  {
    groupName: GROUP.MAIN_ALIGN,
    moduleName: $r("app.string.main_align"),
    attributeList: [ATTRIBUTE.START, ATTRIBUTE.CENTER, ATTRIBUTE.END]
  },
  {
    groupName: GROUP.AXI_ALIGN,
    moduleName: $r("app.string.axi_align"),
    attributeList: [ATTRIBUTE.TOP, ATTRIBUTE.CENTER, ATTRIBUTE.BOTTOM]
  }
];

export const STACK_MODULE: ContainerModuleItem[] = [
  {
    groupName: GROUP.ALIGN_TYPE,
    moduleName: $r('app.string.align_type'),
    attributeList: [ATTRIBUTE.TOP_START, ATTRIBUTE.BOTTOM_START, ATTRIBUTE.TOP_END, ATTRIBUTE.BOTTOM_END, ATTRIBUTE.CENTER]
  },
];
