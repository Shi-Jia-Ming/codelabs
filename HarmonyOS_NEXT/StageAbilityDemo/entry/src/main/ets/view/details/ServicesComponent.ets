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

import ServiceItemComponent from './ServiceItemComponent';
import ServicesViewModel from '../../viewmodel/ServicesViewModel';
import GoodsServiceData from '../../viewmodel/GoodsServiceData';
import { PERCENTAGE_100 } from '../../common/constants/Constants';
import { GoodsService } from '../../common/constants/DetailsConstants';

let viewModel: ServicesViewModel = new ServicesViewModel();
let goodsServiceList: GoodsServiceData[];

@Component
export default struct ServicesComponent {
  aboutToAppear() {
    goodsServiceList = viewModel.loadGoodsService();
  }

  build() {
    List({ space: GoodsService.SPACE }) {
      ForEach(goodsServiceList, (item: GoodsServiceData) => {
        ListItem() {
          ServiceItemComponent({
            serviceName: item?.name,
            description: item?.description,
            isShowActionMore: item?.name != null
          })
        }
      }, (item: GoodsServiceData) => JSON.stringify(item))

    }
    .width(PERCENTAGE_100)
    .height(GoodsService.LIST_HEIGHT)
    .backgroundColor(Color.White)
    .edgeEffect(EdgeEffect.None)
  }
}