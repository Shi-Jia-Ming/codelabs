/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

export interface IProductBean {
  /**
   * Product image url.
   */
  image_url: Resource;

  /**
   * Product name.
   */
  name: string;

  /**
   * Product discount.
   */
  discount: string;

  /**
   * Product price.
   */
  price: string;

  /**
   * Product promotion.
   */
  promotion: string;

  /**
   * Product bonus points.
   */
  bonus_points: string;
}

/**
 * Water flow item bean.
 */
export default class ProductBean implements IProductBean {
  image_url: Resource;
  name: string;
  discount: string;
  price: string;
  promotion: string;
  bonus_points: string;

  constructor(props: ProductBean) {
    this.image_url = props.image_url;
    this.name = props.name;
    this.discount = props.discount;
    this.price = props.price;
    this.promotion = props.promotion;
    this.bonus_points = props.bonus_points;
  }
}