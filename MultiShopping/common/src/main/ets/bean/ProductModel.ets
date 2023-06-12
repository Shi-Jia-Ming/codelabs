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

@Observed
export class Product {
  id: string = '';
  name: string = '';
  img: string = '';
  commodityId: string = '';
  description: string = '';
  price: number = 0;
  count: number = 0;
  selected: boolean = false;
  specifications: { [key: string]: string } = {};

  constructor(props?: Product) {
    if(!props) {
      return;
    }
    this.id = props.id;
    this.name = props.name;
    this.img = props.img;
    this.commodityId = props.commodityId;
    this.description = props.description;
    this.price = props.price;
    this.count = props.count;
    this.selected = props.selected;
    this.specifications = props.specifications;
  }
}
