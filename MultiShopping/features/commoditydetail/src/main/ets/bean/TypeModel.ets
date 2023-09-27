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

export class ButtonType {
  text?: string | Resource;
  color?: string | Resource;
  onClick = (event?: ClickEvent) => {};
}

export enum FinishType {
  JOIN_SHOPPING_CART,
  BUY_NOW,
  CONFIRM,
  CANCEL
}
export class ColorChange {
  颜色: string = '';
  版本: string = '';
  网络制式: string = '';
  类型: string = '';
}

export class OrderCount {
  payment: number = 0;
  ship: number = 0;
  receipt: number = 0;
  evaluation: number = 0;
  sale: number = 0;
}