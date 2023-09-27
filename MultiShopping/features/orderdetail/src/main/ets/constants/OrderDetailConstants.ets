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

export class OrderDetailConstants{
  /**
   * Index of all tab.
   */
  static readonly ALL_INDEX: number = 0;

  /**
   * Index of pending payment tab.
   */
  static readonly PENDING_PAYMENT_INDEX: number = 1;

  /**
   * Index of waiting shipment tab.
   */
  static readonly WAITING_SHIPMENT_INDEX: number = 2;

  /**
   * Index of waiting received tab.
   */
  static readonly WAITING_RECEIVED_INDEX: number = 3;

  /**
   * Index of waiting evaluate tab.
   */
  static readonly WAITING_EVALUATE_INDEX: number = 4;

  /**
   * String value of success.
   */
  static readonly SUCCESS: string = '成功';

  /**
   * String value of pay.
   */
  static readonly ORDER_PAY: string = '支付';

  /**
   * String value of confirm.
   */
  static readonly ORDER_CONFIRM: string = '确认';

  /**
   * String value of price.
   */
  static readonly FEE_PRICE: string = '0.00';

  /**
   * String format of date.
   */
  static readonly DATE_FORMAT: string = 'yyyy/mm/dd HH:MM:SS';

  /**
   * CommodityDetailPage url.
   */
  static readonly COMMODITY_DETAIL_PAGE_URL: string = 'pages/CommodityDetailPage';

  /**
   * PayOrderPage url.
   */
  static readonly PAY_ORDER_PAGE_URL: string = 'pages/PayOrderPage';

  /**
   * Order status.
   */
  static readonly STATUS_ENUM = ['待支付', '卖家已发货', '已完成'];

  /**
   * Describe of order status.
   */
  static readonly STATUS_DESC_ENUM = ['您提交了订单，请等待系统确认', '您的订单已发货，请耐心等待', '您的订单已完成，感谢支持~'];

  /**
   * Payment string enum.
   */
  static readonly PAYMENT_ENUM = ['支付', '确认收货'];
}