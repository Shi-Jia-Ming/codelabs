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

import ProductItem from './ProductItem';

/**
 * Water flow data source.
 */
export class WaterFlowDataSource implements IDataSource {
  private dataArray: ProductItem[] = [];
  private listeners: DataChangeListener[] = [];

  /**
   * Set water flow data array.
   *
   * @param {ProductItem[]} productDataArray Displaying water flow Data.
   */
  public setDataArray(productDataArray: ProductItem[]): void {
    this.dataArray = productDataArray;
  }

  /**
   * Get the total number of data records.
   */
  public totalCount(): number {
    return this.dataArray.length;
  }

  /**
   * Get the data corresponding to the index.
   *
   * @param {number} index Data index.
   * @returns Return ProductItem.
   */
  public getData(index: number): ProductItem {
    return this.dataArray[index];
  }

  /**
   * Register a controller that changes data.
   *
   * @param {DataChangeListener} listener Data change listener
   */
  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener);
    }
  }

  /**
   * Register a controller that changes data.
   *
   * @param {DataChangeListener} listener  Data change listener
   */
  unregisterDataChangeListener(listener: DataChangeListener): void {
    let pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      this.listeners.splice(pos, 1);
    }
  }
}