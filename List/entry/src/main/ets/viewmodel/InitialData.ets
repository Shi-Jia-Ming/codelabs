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

export class GoodsListItemType {
  goodsImg: Resource;
  goodsName: Resource;
  advertisingLanguage: Resource;
  evaluate: Resource;
  price: Resource;

  constructor(goodsImg: Resource, goodsName: Resource, price: Resource) {
    this.goodsImg = goodsImg;
    this.goodsName = goodsName;
    this.advertisingLanguage = $r('app.string.advertising_language');
    this.evaluate = $r('app.string.evaluate');
    this.price = price;
  }
}

export const goodsInitialList: GoodsListItemType[] = [
  new GoodsListItemType($r('app.media.goodsImg'), $r('app.string.goodsName'), $r('app.string.price_199')),
  new GoodsListItemType($r('app.media.goodsImg_2'), $r('app.string.another_goodsName'), $r('app.string.price_199')),
  new GoodsListItemType($r('app.media.goodsImg_3'), $r('app.string.goodsName'), $r('app.string.price_199')),
  new GoodsListItemType($r('app.media.goodsImg_4'), $r('app.string.another_goodsName'), $r('app.string.price_199'))
]
