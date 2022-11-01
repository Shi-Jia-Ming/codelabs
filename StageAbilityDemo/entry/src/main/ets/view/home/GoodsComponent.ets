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

import GoodsItemComponent from './GoodsItemComponent';
import { GoodsList } from '../../common/constants/HomeConstants';
import GoodsData from '../../common/bean/GoodsData';
import { PERCENTAGE_100, PERCENTAGE_50 } from '../../common/constants/Constants';

@Component
export default struct GoodsComponent {
  private goodsList: GoodsData[];
  private startPage: (index: number) => void;

  build() {
    Grid() {
      ForEach(this.goodsList, (item, index) => {
        GridItem() {
          GoodsItemComponent({ config: item })
        }.onClick(() => {
          this.startPage(index);
        })
      })
    }
    .columnsTemplate(GoodsList.GRID_STYLE)
    .columnsGap(GoodsList.SPACE)
    .rowsGap(GoodsList.SPACE)
    .layoutDirection(GoodsList.HORIZONTAL)
    .padding({ left: GoodsList.GRID_PADDING,
      right: GoodsList.GRID_PADDING })
    .width(PERCENTAGE_100)
    .height(PERCENTAGE_50)
  }
}