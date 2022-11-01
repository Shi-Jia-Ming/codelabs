/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

export const initTabBarData = [
  $r('app.string.mobile_phone'),
  $r('app.string.clothes'),
  $r('app.string.wear'),
  $r('app.string.home_furnishing')
]

export interface GoodsListItemType {
  goodsImg: Resource;
  goodsName: Resource;
  advertising_language: Resource;
  evaluate: Resource;
  price: Resource;
}

export const goodsInitialList: GoodsListItemType[] = [
  {
    goodsImg: $r('app.media.goodsImg'),
    goodsName: $r('app.string.goodsName'),
    advertising_language: $r('app.string.advertising_language'),
    evaluate: $r('app.string.evaluate'),
    price: $r('app.string.price_199')
  },
  {
    goodsImg: $r('app.media.goodsImg_2'),
    goodsName: $r('app.string.another_goodsName'),
    advertising_language: $r('app.string.advertising_language'),
    evaluate: $r('app.string.evaluate'),
    price: $r('app.string.price_265')
  },
  {
    goodsImg: $r('app.media.goodsImg_3'),
    goodsName: $r('app.string.goodsName'),
    advertising_language: $r('app.string.advertising_language'),
    evaluate: $r('app.string.evaluate'),
    price: $r('app.string.price_810')
  },
  {
    goodsImg: $r('app.media.goodsImg_4'),
    goodsName: $r('app.string.another_goodsName'),
    advertising_language: $r('app.string.advertising_language'),
    evaluate: $r('app.string.evaluate'),
    price: $r('app.string.price_999')
  },
]
