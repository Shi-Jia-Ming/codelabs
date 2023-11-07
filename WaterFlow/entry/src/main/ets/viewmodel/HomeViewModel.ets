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

import { IProductItem } from './ProductItem';

/**
 * Home page classify title data.
 */
const classifyTitle: Resource[] = [
  $r('app.string.title_bar_homepage'),
  $r('app.string.title_bar_phone'),
  $r('app.string.title_bar_computer'),
  $r('app.string.title_bar_foods'),
  $r('app.string.title_bar_men_wear'),
  $r('app.string.title_bar_fresh'),
  $r('app.string.title_bar_furniture_kitchenware')
];

/**
 * Home page swiper image data.
 */
const swiperImage: Resource[] = [
  $r('app.media.ic_home_appliances_special'),
  $r('app.media.ic_coupons'),
  $r('app.media.ic_internal_purchase_price')
];


/**
 * Home page water flow item init data.
 */
const waterFlowData: IProductItem[] = [
  {
    image_url: $r('app.media.ic_holder_50e'),
    name: 'XXX50E',
    discount: '',
    price: '¥4088',
    promotion: '',
    bonus_points: ''
  },
  {
    image_url: $r('app.media.ic_holder_xs2'),
    name: 'XXXPadMate Xs 2 \n8GB+256GB （雅黑）',
    discount: '',
    price: '¥9999',
    promotion: '限时',
    bonus_points: ''
  },
  {
    image_url: $r('app.media.ic_holder_computer'),
    name: 'XX设备  新品优惠！新品优惠！机不可失！失不再来！快来购买！快来购买！',
    discount: '限时省200',
    price: '¥10099',
    promotion: '商品',
    bonus_points: ''
  },
  {
    image_url: $r('app.media.ic_holder_mouse'),
    name: '送给亲人  快速购买！',
    discount: '限时省200',
    price: '¥199',
    promotion: '',
    bonus_points: ''
  },
  {
    image_url: $r('app.media.ic_holder_pad'),
    name: 'XXXPad Pro',
    discount: '',
    price: '¥3499',
    promotion: '',
    bonus_points: ''
  },
  {
    image_url: $r('app.media.ic_holder_mate50'),
    name: 'XXXMate 50 8GB+256GB',
    discount: '',
    price: '¥5499',
    promotion: '',
    bonus_points: ''
  },
  {
    image_url: $r('app.media.ic_holder_60pro'),
    name: 'XXX60 Pro 新品上市！\n你值得拥有！\n限时折扣！\n速速购买！',
    discount: '限时省200',
    price: '¥1299',
    promotion: '限时',
    bonus_points: ''
  },
  {
    image_url: $r('app.media.ic_holder_50e'),
    name: 'XXX50E',
    discount: '',
    price: '¥4088',
    promotion: '',
    bonus_points: ''
  },
  {
    image_url: $r('app.media.ic_holder_xs2'),
    name: 'XXXPadMate Xs 2 \n8GB+256GB （雅黑）',
    discount: '限时省200',
    price: '¥9999',
    promotion: '限时',
    bonus_points: ''
  },
  {
    image_url: $r('app.media.ic_holder_computer'),
    name: 'XX设备  新品优惠！新品优惠！',
    discount: '限时省200',
    price: '¥10099',
    promotion: '商品',
    bonus_points: ''
  },
  {
    image_url: $r('app.media.ic_holder_mouse'),
    name: '送给亲人  快速购买！',
    discount: '限时省200',
    price: '¥199',
    promotion: '限时',
    bonus_points: '赠送积分'
  },
  {
    image_url: $r('app.media.ic_holder_pad'),
    name: 'XXXPad Pro\n限时折扣！\n速速购买！\n机不可失！失不再来！',
    discount: '限时省200',
    price: '¥3499',
    promotion: '',
    bonus_points: '赠送积分'
  },
  {
    image_url: $r('app.media.ic_holder_mate50'),
    name: 'XXXMate 50 \n8GB+256GB',
    discount: '',
    price: '¥5499',
    promotion: '',
    bonus_points: ''
  },
  {
    image_url: $r('app.media.ic_holder_60pro'),
    name: 'XXX60 Pro',
    discount: '限时省200',
    price: '¥1299',
    promotion: '限时',
    bonus_points: '',
  }
];

export { classifyTitle, swiperImage, waterFlowData };