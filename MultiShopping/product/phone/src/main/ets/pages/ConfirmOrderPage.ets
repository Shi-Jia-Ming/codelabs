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
import { ConfirmOrder } from '@ohos/orderdetail';
import { Order, Logger } from '@ohos/common';
import { PageConstants } from '../constants/PageConstants';

@Entry
@Component
struct ConfirmPageOrder {
  @Provide('amount') amount: number = 0;
  @Provide('orderList') orderList: Order[] = [];

  onPageShow() {
    const orderList = router.getParams()[PageConstants.ORDER_LIST_KEY];
    this.orderList = orderList.map(item => new Order({
      orderId: item.id,
      commodityId: item.commodityId,
      price: item.price,
      count: item.count,
      specifications: item.specifications,
      image: item.images[0],
      description: item.description,
      title: item.title
    }));
    Logger.info('onPageShow orderList length: ' + this.orderList.length)
    this.amount = this.orderList.reduce((s: number, item: Order) => s + item.price * item.count, 0);
  }

  build() {
    Column() {
      ConfirmOrder()
    }
  }
}