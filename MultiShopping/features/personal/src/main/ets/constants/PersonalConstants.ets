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

export class PersonalConstants{
  /**
   * Index of pending payment tab.
   */
  static readonly PENDING_PAYMENT_INDEX: number = 1;

  /**
   * Index of waiting shipping tab.
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
  * Size of badge.
  */
  static readonly BADGE_SIZE: number = 16;

  /**
   * Live list item image aspect ration of sm.
   */
  static readonly ASPECT_RATIO_SM: number = 1.09;

  /**
   * Live list item image aspect ration of md.
   */
  static readonly ASPECT_RATIO_MD: number = 1.51;

  /**
   * Live list item image aspect ration of lg.
   */
  static readonly ASPECT_RATIO_LG: number = 1.63;

  /**
   * OrderDetailListPage url.
   */
  static readonly ORDER_LIST_PAGE_URL: string = 'pages/OrderDetailListPage';
}