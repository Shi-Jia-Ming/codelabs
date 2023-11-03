/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

/**
 * GoodsData is used to initialize the GoodsComponent.
 */
export default class GoodsData {
  goodsName: Resource = $r('app.string.goods_list_item_1');
  price: string = '1999';
  originalPrice: string = '2999';
  discounts: Resource = $r('app.string.goods_list_item_1_save');
  label: Resource = $r('app.string.goods_list_activity_new');
  goodsImg: Resource =  $rawfile('index/good1.png');
  goodsDescription: Resource = $r('app.string.goods_list_item_1_desc');
}