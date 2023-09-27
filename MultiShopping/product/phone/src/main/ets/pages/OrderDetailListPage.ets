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

import router from '@ohos.router';
import { OrderDetailList } from '@ohos/orderdetail';
import { LocalDataManager, Order, Commodity } from '@ohos/common';

@Entry
@Component
struct OrderDetailListPage {
  @Provide orderList: Order[] = [];
  @Provide commodityList: Commodity[] = [];
  @Provide currentTabIndex: number = 0;
  private localDataManager: LocalDataManager = LocalDataManager.instance();

  aboutToAppear() {
    let params = router.getParams() as Record<string, Object>;
    this.currentTabIndex = params.tabIndex as number || 0;
  }

  onPageShow() {
    this.orderList = this.localDataManager.queryOrderList();
    this.commodityList = this.localDataManager.queryCommodityList();
  }

  build() {
    Column() {
      OrderDetailList()
    }
  }
}