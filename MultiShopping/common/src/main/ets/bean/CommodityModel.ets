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

export class KV {
  key: string = '';
  value: string = '';
  image?: string = ''
}

export class Specification {
  id: string = '';
  title: string = '';
  data: KV[] = [];
}

export class Commodity {
  category_id?: string = '';
  id: string = '';
  title: string = '';
  promotion?: string = '';
  description: string = '';
  images: string[] = [];
  detail?: string[] = [];
  price: number = 0;
  specifications?: Specification[] = [];
}

export class Opt {
  yy: string = '';
  mm: string = '';
  dd: string = '';
  HH: string = '';
  MM: string = '';
  SS: string = '';
}

export class InsertOrderParams {
  orderId: string = '';
  uid: string = '';
  status: number = 0;
  createTime: string = '';
}
