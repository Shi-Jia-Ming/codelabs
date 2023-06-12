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
import { PayOrder } from '@ohos/orderdetail';
import { LocalDataManager, Order } from '@ohos/common';
import { PageConstants } from '../constants/PageConstants';

@Entry
@Component
struct PayOrderPage {
  @Provide('orderList') data: Order[] = [];
  @State totalPrice: number = 0;
  private localDataManager: LocalDataManager = LocalDataManager.instance();

  aboutToAppear() {
    const order = router.getParams()[PageConstants.ORDER_KEY];
    const orderIds = router.getParams()[PageConstants.ORDER_IDS_KEY];
    if (order) {
      this.data = [order];
    }
    if (orderIds) {
      const orders = this.localDataManager.queryOrderList();
      this.data = orders.filter(order => orderIds.includes(order.orderId));
    }
    this.totalPrice = this.data.reduce((sum, i) => {
      return sum + i.price * i.count;
    }, 0)
  }

  build() {
    Column() {
      PayOrder({
        totalPrice: $totalPrice
      })
    }
  }
}