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
import { ProductSpecification } from './ProductModel';

export enum OrderType {
  PAYMENT = 'payment',
  SHIP = 'ship',
  RECEIPT = 'receipt',
  EVALUATION = 'evaluation',
  SALE = 'sale'
}

export enum OrderOperationStatus {
  UN_PAY = 0,
  DELIVERED = 1,
  RECEIPT = 2,
  CONSIGNMENT = 3,
  ALLStatus = 4
}

@Observed
export class Order {
  uid?: string = '';
  orderId: string = '';
  image: string = '';
  title: string = '';
  description: string = '';
  payTime?: string = '';
  orderTime?: string = '';
  createTime?: string = '';
  updateTime?: string = '';
  price: number = 0;
  count: number = 0;
  amount?: number = 0;
  status?: number = 0;
  commodityId: number = 0;
  specifications: ProductSpecification[] = [];
}

export class DateFormatting {
  y: string = '';
  m: string = '';
  d: string = '';
  H: string = '';
  M: string = '';
  S: string = '';
}


export class InsertOrderProps {
  order: Order | undefined = undefined;
  status: number = 0;
  createTime?: string = '';
}

export class updateOrderProps {
  orderId: string = '';
  status: number = 0;
  amount?: number;
}

export class OrderStatus {
  order?: Order;
  status?: number;
}