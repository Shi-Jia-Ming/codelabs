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

export class ZonesConstants {
  static readonly ITEM_WIDTH: number = 86;
  static readonly SHOW_COUNT: number = 5;
  static readonly HALF_COUNT: number = Math.floor(ZonesConstants.SHOW_COUNT / 2);
  static readonly OPACITY_COEFFICIENTS: number = 0.1;
  static readonly OFFSET_COEFFICIENTS: number = 10;
  static readonly MAX_OFFSET_Y: number = 100;
  static readonly MAX_MOVE_OFFSET: number = 60;
}