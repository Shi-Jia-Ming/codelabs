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

import { commodityData, shopCartData, orderData } from '../viewmodel/ShopData';
import { Product, ShopProps, UpdateShopProps } from '../viewmodel/ProductModel';
import { InsertOrderProps, Order, updateOrderProps } from '../viewmodel/OrderModel';
import { getID } from './Utils';

/**
 * The tool of local data manager.
 */
export class LocalDataManager {
  private static localDataManager: LocalDataManager;
  private shopCartData: Product[] = [];
  private orderData: Order[] = [];

  private constructor() {
    this.initDefaultShopCartData();
    this.initDefaultOrderData();
  }

  static instance() {
    if (!LocalDataManager.localDataManager) {
      LocalDataManager.localDataManager = new LocalDataManager();
    }
    return LocalDataManager.localDataManager;
  }

  /**
   * Query commodity list.
   *
   * @returns Commodity[]
   */
  queryCommodityList() {
    return commodityData;
  }

  /**
   * Query commodity list by id of commodity.
   *
   * @param id id of commodity
   * @returns Commodity
   */
  queryCommodityListById(id: string) {
    const result = commodityData.filter(item => item.id === id)[0];
    return result;
  }

  private initDefaultShopCartData() {
    this.shopCartData = shopCartData.sort((a, b) =>
      new Date(a.create_time !== undefined ? a.create_time : 0).valueOf() -
      new Date(b.create_time !== undefined ? b.create_time : 0).valueOf());
    return this.shopCartData;
  }

  /**
   * Query shop cart data.
   *
   * @returns Product[]
   */
  queryShopCart() {
    return this.shopCartData;
  }

  /**
   * Insert data to shopCartData.
   *
   * @param props value of Product.
   * @returns
   */
  insertShopCart(props: ShopProps): number {
    const result = commodityData.filter((item) => item.id === props.commodityId)[0];
    const newShop: Product = {
      id: getID(),
      name: result.title,
      img: result.images,
      price: result.price,
      count: props.count,
      specifications: props.specifications,
      selected: true,
      description: result.description,
      commodityId: result.id
    };
    this.shopCartData.splice(0, 0, newShop);
    return this.shopCartData.length;
  }

  /**
   * Delete data from shopCartData by ids.
   *
   * @param ids deleted id
   * @returns Product[]
   */
  deleteShopCart(ids: string[]) {
    ids.forEach((id: string) => {
      const result = this.shopCartData.filter((item: Product) => item.id === id);
      if (result.length > 0) {
        this.shopCartData.splice(this.shopCartData.indexOf(result[0]), 1);
      }
    });
    return this.shopCartData;
  }

  /**
   * Update shopCart data.
   *
   * @param props: update prop.
   */
  updateShopCart(props: UpdateShopProps) {
    const result: Product = this.shopCartData.filter((item: Product) => item.id === props.id)[0];
    const newShop: Product = {
      id: props.id,
      name: result.name,
      img: result.img,
      commodityId: result.commodityId,
      description: result.description,
      price: result.price,
      count: props.count !== undefined ? props.count : result.count,
      selected: props.selected !== undefined ? props.selected : result.selected,
      specifications: props.specifications !== undefined ? props.specifications : result.specifications,
      update_time: result.update_time,
      create_time: result.create_time,
      uid: result.uid
    }
    this.shopCartData.splice(this.shopCartData.indexOf(result), 1, newShop);
  }

  private initDefaultOrderData() {
    this.orderData = orderData.sort((a, b) =>
      new Date(b.createTime !== undefined ? b.createTime : 0).valueOf() -
      new Date(a.createTime !== undefined ? a.createTime : 0).valueOf());
    return this.orderData;
  }

  /**
   * Query order list data.
   *
   * @returns Order[]
   */
  queryOrderList() {
    return this.orderData;
  }

  /**
   * Insert order to orderData.
   *
   * @param props: insert props
   * @returns orderId
   */
  insertOrder(props: InsertOrderProps): string | undefined {
    if (props.order !== undefined) {
      const orderId = props.order.orderId;
      const newOrder: Order = props.order;
      newOrder.orderId = (orderId !== undefined ? orderId : '');
      newOrder.uid = '1';
      newOrder.status = props.status;
      newOrder.createTime = props.createTime ?? new Date().toString();

      this.orderData.splice(0, 0, newOrder);
      return orderId;
    }
    return undefined;
  }

  /**
   * Update order data.
   *
   * @param props: update props
   * @returns Order[]
   */
  updateOrder(props: updateOrderProps) {
    const result: Order = this.orderData.filter(item => item.orderId === props.orderId)[0];
    const newOrder: Order = {
      orderId: props.orderId,
      commodityId: result.commodityId,
      price: result.price,
      count: result.count,
      specifications: result.specifications,
      image: result.image,
      description: result.description,
      title: result.title,
      uid: result.uid,
      status: props.status,
      createTime: result.createTime
    }
    this.orderData.splice(this.orderData.indexOf(result), 1, newOrder);
    return this.orderData;
  }
}