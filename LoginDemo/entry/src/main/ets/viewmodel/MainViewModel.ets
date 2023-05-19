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

import ItemData from '../common/bean/ItemData';
import {
  SWIPER_IMAGES,
  CENTER_GRID_DATA,
  LIST_IMAGE_DATA,
  MINE_LIST_DATA
} from '../common/data/SourceData';

/**
 * Binds data to components and provides interfaces.
 */
export class MainViewModel {

  /**
   * Get swiper image data.
   *
   * @return {Array<Resource>} swiperImages.
   */
  public getSwiperImages(): Array<Resource> {
    let swiperImages: Array<Resource> = [];
    SWIPER_IMAGES.forEach((swiperImage: Resource) => {
      swiperImages.push(swiperImage);
    });
    return swiperImages;
  }

  /**
   * Get data of the Center grid.
   *
   * @return {Array<PageResource>} firstGridData.
   */
  public getCenterGridData(): Array<ItemData> {
    let firstGridData: Array<ItemData> = [];
    CENTER_GRID_DATA.forEach((itemData: ItemData) => {
      let data: ItemData = {
        title: itemData.title,
        img: itemData.img,
        clickPrompt: itemData.clickPrompt
      };
      firstGridData.push(data);
    });
    return firstGridData;
  }


  /**
   * Get data of the list.
   *
   * @return {Array<PageResource>} secondGridData.
   */
  public getListImageData(): Array<ItemData> {
    let secondGridData: Array<ItemData> = [];
    LIST_IMAGE_DATA.forEach((itemData: ItemData, index: number) => {
      let data: ItemData = {
        id: index,
        title: itemData.title,
        img: itemData.img,
        others: itemData.others,
        clickPrompt: itemData.clickPrompt
      };
      secondGridData.push(data);
    });
    return secondGridData;
  }


  /**
   * Get data of the mine page list.
   *
   * @return {Array<PageResource>} settingListData.
   */
  public getMineListData(): Array<ItemData> {
    let settingListData: Array<ItemData> = [];
    MINE_LIST_DATA.forEach((itemData: ItemData) => {
      let data: ItemData = {
        title: itemData.title,
        img: itemData.img,
        others: itemData.others,
        clickPrompt: itemData.clickPrompt
      };
      settingListData.push(data);
    });
    return settingListData;
  }
}

export default new MainViewModel();