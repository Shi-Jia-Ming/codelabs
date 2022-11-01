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

import { AnimationWidgets } from '../view/AnimationWidgets';
import { CountController } from '../view/CountController';
import Common from '../common/constants/Const';
import { AxisModel } from '../viewmodel/AxisModel';
import {IconsModel} from '../viewmodel/IconsModel';

@Entry
@Component
struct Index {
  @State quantity: number = Common.IMAGES_MIN;
  @State axis: AxisModel = new AxisModel(Common.OFFSET_RADIUS, this.quantity);
  @State iconModel: IconsModel = new IconsModel(this.quantity);

  build() {
    Column() {
      AnimationWidgets({
        quantity: $quantity,
        axis: this.axis,
        iconModel: this.iconModel
      })

      CountController({
        quantity: $quantity
      })
    }
    .width(Common.DEFAULT_FULL_WIDTH)
    .height(Common.DEFAULT_FULL_HEIGHT)
    .backgroundColor($r('app.color.bgColor'))
  }
}