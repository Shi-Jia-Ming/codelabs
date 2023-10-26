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
import { IconButtonModel } from '../viewmodel/IconButtonModel';
import { PersonalConstants } from '../constants/PersonalConstants';

@Component
export struct IconButton {
  @ObjectLink props: IconButtonModel;
  click?: (key: OrderType) => void = () => {};

  build() {
    Column() {
      if (this.props.count) {
        Badge({
          value: `${this.props.count}`,
          style: { color: Color.White, badgeSize: PersonalConstants.BADGE_SIZE, badgeColor: Color.Red }
        }) {
          Image(this.props.icon)
            .width($r('app.float.icon_size'))
            .height($r('app.float.icon_size'))
        }
        .width($r('app.float.icon_size'))
        .height($r('app.float.icon_size'))
      } else {
        Image(this.props.icon)
          .width($r('app.float.icon_size'))
          .height($r('app.float.icon_size'))
      }
      Text(this.props.text)
        .fontSize($r('app.float.vp_twelve'))
        .fontColor(Color.Black)
        .margin({ top: $r('app.float.vp_twelve') })
    }
    .height($r('app.float.vp_fifty_six'))
    .onClick(() => {
      if (this.click !== undefined && this.props.key !== undefined) {
        this.click(this.props.key);
      }
    })
  }
}