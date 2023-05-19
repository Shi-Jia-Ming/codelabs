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

import GridItem from '../common/bean/GridItem';
import VerifyItem from '../common/bean/VerifyItem';

/**
 * Binds data to components and provides interfaces.
 */
export class WindowViewModel {

  /**
   * Get verify items map.
   *
   * @return {Map<number, VerifyItem>} verifyMap.
   */
  getVerifyMap(): Map<number, VerifyItem> {
    let verifyMap: Map<number, VerifyItem> = new Map();
    verifyMap.set(0, new VerifyItem($r('app.media.ic_verity_character1'), 'XYZK'));
    verifyMap.set(1, new VerifyItem($r('app.media.ic_verity_character2'), 'LHBR'));
    return verifyMap;
  }

  /**
   * Get swiper image data.
   *
   * @return {Array<Resource>} swiperImages.
   */
  getSwiperImages(): Array<Resource> {
    let swiperImages: Resource[] = [
      $r('app.media.ic_swiper1'),
      $r('app.media.ic_swiper2'),
      $r('app.media.ic_swiper3'),
      $r('app.media.ic_swiper4')
    ];
    return swiperImages;
  }

  /**
   * Get data of the first grid.
   *
   * @return {Array<GridItem>} firstGridData.
   */
  getFirstGridData(): Array<GridItem> {
    let firstGridData: GridItem[] = [
      new GridItem($r('app.string.my_love'), $r('app.media.ic_love')),
      new GridItem($r('app.string.history_record'), $r('app.media.ic_record')),
      new GridItem($r('app.string.message'), $r('app.media.ic_message')),
      new GridItem($r('app.string.shopping_cart'), $r('app.media.ic_shopping')),
      new GridItem($r('app.string.my_goal'), $r('app.media.ic_target')),
      new GridItem($r('app.string.group'), $r('app.media.ic_circle')),
      new GridItem($r('app.string.favorites'), $r('app.media.ic_favorite')),
      new GridItem($r('app.string.recycle_bin'), $r('app.media.ic_recycle'))
    ];
    return firstGridData;
  }

  /**
   * Get data of the second grid.
   *
   * @return {Array<GridItem>} secondGridData.
   */
  getSecondGridData(): Array<GridItem> {
    let secondGridData: GridItem[] = [
      new GridItem($r('app.string.home_top'), $r('app.media.ic_top'), $r('app.string.home_text_top')),
      new GridItem($r('app.string.home_new'), $r('app.media.ic_new'), $r('app.string.home_text_new')),
      new GridItem($r('app.string.home_brand'), $r('app.media.ic_brand'), $r('app.string.home_text_brand')),
      new GridItem($r('app.string.home_found'), $r('app.media.ic_found'), $r('app.string.home_text_found')),
      new GridItem($r('app.string.home_top'), $r('app.media.ic_top'), $r('app.string.home_text_top')),
      new GridItem($r('app.string.home_new'), $r('app.media.ic_new'), $r('app.string.home_text_new'))
    ];
    return secondGridData;
  }
}

export default new WindowViewModel();