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

import { OrderType } from '@ohos/common';

@Observed
export class IconButtonModel {
  icon: Resource;
  text: Resource;
  key?: OrderType;
  count?: number;

  constructor(icon: Resource, text: Resource, key?: OrderType, count?: number) {
    this.icon = icon;
    this.text = text;
    this.key = key;
    this.count = count;
  }
}

export class OrderCount {
  payment: number = 0;
  ship: number = 0;
  receipt: number = 0;
  evaluation: number = 0;
  sale: number = 0;
}