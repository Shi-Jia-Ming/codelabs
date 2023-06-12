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
import { Commodity } from '../bean/CommodityModel';
import { Product } from '../bean/ProductModel';
import { Order } from '../bean/OrderModel';
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
    return commodityData.map(item => new Commodity({
      id: item.spu_id,
      title: item.name,
      description: item.desc,
      price: item.price,
      images: [item.pic_url],
      promotion: item.promotion,
      detail: [item.detail_pic_url],
      specifications: JSON.parse(item.attr_list as unknown as string).map((i) => ({
        id: i.name,
        title: i.name,
        data: i.value.map(j => ({ key: j, value: j, image: '' }))
      }))
    }));
  }

  /**
   * Query commodity list by id of commodity.
   *
   * @param id id of commodity
   * @returns Commodity
   */
  queryCommodityListById(id: string) {
    const result = commodityData.filter(item => item.spu_id === id)[0];
    return new Commodity({
      id: result.spu_id,
      title: result.name,
      description: result.desc,
      price: result.price,
      images: [result.pic_url],
      detail: [result.detail_pic_url],
      specifications: JSON.parse(result.attr_list as unknown as string).map((i) => ({
        id: i.name,
        title: i.name,
        data: i.value.map(j => ({ key: j, value: j, image: '' }))
      }))
    });
  }

  private initDefaultShopCartData() {
    shopCartData.sort((a, b) => new Date(a.create_time).valueOf() - new Date(b.create_time).valueOf());
    this.shopCartData = shopCartData.map(item => {
      const attrs = JSON.parse(item.spu_attrs || '');
      const specifications = {};
      attrs.forEach((attr) => {
        specifications[attr.name] = attr.value;
      });
      return new Product({
        id: item.sc_id,
        name: item.name,
        img: item.pic_url,
        price: item.price,
        count: item.quantity,
        specifications: specifications,
        selected: !!item.selected,
        description: item.desc,
        commodityId: item.spu_id
      });
    });
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
  insertShopCart(props: {
    id: string,
    commodityId: string,
    count: number,
    specifications: { [key: string]: string }
  }): number {
    const result = commodityData.filter(item => item.spu_id === props.commodityId)[0];
    const newShop: Product = {
      id: getID(),
      name: result.name,
      img: result.pic_url,
      price: result.price,
      count: props.count,
      specifications: props.specifications,
      selected: true,
      description: result.desc,
      commodityId: result.spu_id
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
    ids.forEach((id) => {
      const result = this.shopCartData.filter(item => item.id === id);
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
  updateShopCart(props: {
    id: string,
    count?: number,
    selected?: boolean,
    specifications?: { [key: string]: string }
  }) {
    const result: Product = this.shopCartData.filter(item => item.id === props.id)[0];
    const newShop: Product = { ...result, ...props };
    this.shopCartData.splice(this.shopCartData.indexOf(result), 1, newShop);
  }

  private initDefaultOrderData() {
    orderData.sort((a, b) => new Date(b.create_time).valueOf() - new Date(a.create_time).valueOf());
    this.orderData = orderData.map((item) => {
      const attrs = JSON.parse(item.spu_attrs || '');
      const specifications = {};
      attrs.forEach((attr) => {
        specifications[attr.name] = attr.value;
      });
      return new Order({
        commodityId: +item.spu_id,
        price: item.price,
        count: item.spu_num,
        specifications: specifications,
        image: item.pic_url,
        description: item.desc,
        title: item.name,
        amount: item.amount,
        createTime: item.create_time,
        orderTime: item.order_time,
        payTime: item.pay_time,
        updateTime: item.update_time,
        uid: item.uid,
        orderId: item.order_id,
        status: item.status
      });
    });
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
  insertOrder(props: {
    order: Order,
    status: number,
    createTime?: string
  }) {
    const orderId = props.order.orderId;
    const params = {
      orderId: orderId,
      uid: '1',
      status: props.status,
      createTime: props.createTime?? new Date().toString()
    };
    const newOrder: Order = { ...props.order, ...params };
    this.orderData.splice(0, 0, newOrder);
    return orderId;
  }

  /**
   * Update order data.
   *
   * @param props: update props
   * @returns Order[]
   */
  updateOrder(props: {
    orderId: string,
    status: number,
    amount?: number
  }) {
    const result: Order = this.orderData.filter(item => item.orderId === props.orderId)[0];
    const newOrder: Order = { ...result, ...props };
    this.orderData.splice(this.orderData.indexOf(result), 1, newOrder);
    return this.orderData;
  }
}