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

import { FindTabsItem } from '@ohos/common';

export const FindTabsList: Array<FindTabsItem> = [
  {
    img: $r('app.media.ic_find_1'),
    title: $r('app.string.find_item1_title'),
    category: $r('app.string.find_item1_category'),
    barrage: $r('app.string.find_item1_barrage'),
    visits: $r('app.string.find_item1_visits'),
    intro: $r('app.string.find_item1_intro')
  },
  {
    img: $r('app.media.ic_find_2'),
    title: $r('app.string.find_item2_title'),
    category: $r('app.string.find_item2_category'),
    barrage: $r('app.string.find_item2_barrage'),
    visits: $r('app.string.find_item2_visits'),
    intro: $r('app.string.find_item2_intro')
  },
  {
    img: $r('app.media.ic_find_3'),
    title: $r('app.string.find_item3_title'),
    category: $r('app.string.find_item3_category'),
    barrage: $r('app.string.find_item3_barrage'),
    visits: $r('app.string.find_item3_visits'),
    intro: $r('app.string.find_item3_intro')
  },
  {
    img: $r('app.media.ic_find_4'),
    title: $r('app.string.find_item4_title'),
    category: $r('app.string.find_item4_category'),
    barrage: $r('app.string.find_item4_barrage'),
    visits: $r('app.string.find_item4_visits'),
    intro: $r('app.string.find_item4_intro')
  },
  {
    img: $r('app.media.ic_find_5'),
    title: $r('app.string.find_item5_title'),
    category: $r('app.string.find_item5_category'),
    barrage: $r('app.string.find_item5_barrage'),
    visits: $r('app.string.find_item5_visits'),
    intro: $r('app.string.find_item5_intro')
  },
  {
    img: $r('app.media.ic_find_6'),
    title: $r('app.string.find_item6_title'),
    category: $r('app.string.find_item6_category'),
    barrage: $r('app.string.find_item6_barrage'),
    visits: $r('app.string.find_item6_visits'),
    intro: $r('app.string.find_item6_intro')
  }
]

export class FindDataSource implements IDataSource {
  private dataArray: FindTabsItem[] = [];
  private listeners: DataChangeListener[] = [];

  constructor(element: FindTabsItem[]) {
    for (let index = 0; index < element.length; index++) {
      this.dataArray.push(element[index]);
    }
  }

  public totalCount(): number {
    return this.dataArray.length;
  }

  public getData(index: number): FindTabsItem {
    return this.dataArray[index];
  }

  public addData(index: number, data: FindTabsItem): void {
    this.dataArray.splice(index, 0, data);
    this.notifyDataAdd(index);
  }

  public pushData(data: FindTabsItem): void {
    this.dataArray.push(data);
    this.notifyDataAdd(this.dataArray.length - 1);
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener);
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      this.listeners.splice(pos, 1);
    }
  }

  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    })
  }

  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    })
  }

  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    })
  }

  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    })
  }

  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
    })
  }
}