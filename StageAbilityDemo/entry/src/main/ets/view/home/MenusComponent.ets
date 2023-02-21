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

import { AppFontSize } from '../../common/constants/Constants';
import MenuData from '../../common/bean/MenuData';
import { Menus } from '../../common/constants/HomeConstants';

@Component
export default struct MenusComponent {
  menus: MenuData[];

  build() {
    Row() {
      ForEach(this.menus, (item) => {
        Column() {
          Text(item?.menuName)
            .fontColor(item?.fontColor)
            .fontSize(AppFontSize.MIDDLE)
            .fontWeight(item?.fontWeight)
          Text(item?.menuContent)
            .fontColor(item?.fontColor)
            .fontSize(AppFontSize.SMALL)
            .fontWeight(item?.fontWeight)
        }
        .width(Menus.LAYOUT_WEIGHT)
        .padding({ top: Menus.ITEM_PADDING_VERTICAL,
          bottom: Menus.ITEM_PADDING_VERTICAL })
      }, item => JSON.stringify(item))
    }
    .justifyContent(FlexAlign.Center)
    .padding({ top: Menus.CONTAINER_PADDING_VERTICAL,
      bottom: Menus.CONTAINER_PADDING_VERTICAL })
  }
}