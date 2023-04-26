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

import DataModel from '../viewmodel/DataModel';

/**
 * Delete the selected item and exit the editing mode.
 */
export function deleteSelected() {
  DataModel.deleteData(this.selectArray);
  this.targetData = DataModel.getData();
  this.overAllProgressChanged = !this.overAllProgressChanged;
  this.isEditMode = false;
}

/**
 * Select or deselect all.
 *
 * @param selectStatus true: Select all. Otherwise, deselect all.
 */
export function selectAllOrCancel(selectStatus: boolean) {
  let newSelectArray = [];
  this.targetData.forEach(() => {
    newSelectArray.push(selectStatus);
  });
  this.selectArray = newSelectArray;
}

/**
 * Whether to select all.
 */
export function isSelectAll(): boolean {
  if (this.selectArray.length === 0) {
    return false;
  }
  let deSelectCount = this.selectArray.filter(selected => selected === false).length;
  if (deSelectCount === 0) {
    this.selectAll = true;
    return true;
  }
  this.selectAll = false;
  return false;
}

/**
 * Check whether there are selected rows.
 */
export function isSelectRows(): boolean {
  return this.selectArray.filter((selected) => selected === true).length !== 0;
}