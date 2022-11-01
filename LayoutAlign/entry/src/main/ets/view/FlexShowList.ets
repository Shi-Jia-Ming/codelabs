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

import { CommonItem } from './CommonComponent';
import { MARGIN_FONT_SIZE_SPACE, SHOW_LIST_HEIGHT_PERCENT,ALL_PERCENT } from '../common/Constants/CommonConstants';
import { FlexAxisAlignRadioList } from './FlexAxisAlignRadioList';
import { FlexMainAlignRadioList } from './FlexMainAlignRadioList';
import { FlexMainDirectionRadioList } from './FlexMainDirectionRadioList';

/**
 *Show List in Flex
 */
@Component
export struct FlexShowList {
  @Consume list: number[];
  @Consume currentFlexDirection: FlexDirection;
  @Consume currentFlexJustifyContent: FlexAlign;
  @Consume currentFlexAlignItems: ItemAlign;
  @Consume currentFlexWrap: FlexWrap;
  @Consume currentFlexAlignContent: FlexAlign;

  build() {
    Column() {
      // Flex中元素对齐方式布局
      Flex({
        alignItems: this.currentFlexAlignItems,
        direction: this.currentFlexDirection,
        justifyContent: this.currentFlexJustifyContent,
        wrap: this.currentFlexWrap,
        alignContent: this.currentFlexAlignContent
      }) {
        ForEach(this.list, (item) => {
          CommonItem({ item: item })
        }, item => item.toString())
      }
      .padding(MARGIN_FONT_SIZE_SPACE.COMMON_PADDING)
      .width(ALL_PERCENT)
      .height(SHOW_LIST_HEIGHT_PERCENT.FLEX_SHOW_LIST_HEIGHT)
      .backgroundColor($r("app.color.show_list_backgroundColor"))
      .margin({ top: MARGIN_FONT_SIZE_SPACE.FIRST_MARGIN })

      // set main direction
      FlexMainDirectionRadioList().margin({ top: MARGIN_FONT_SIZE_SPACE.EIGHTH_MARGIN })
      // set main align
      FlexMainAlignRadioList().margin({ top: MARGIN_FONT_SIZE_SPACE.EIGHTH_MARGIN })
      // set axis align
      FlexAxisAlignRadioList().margin({ top: MARGIN_FONT_SIZE_SPACE.EIGHTH_MARGIN })
    }
    .layoutWeight(1)
    .height(ALL_PERCENT)
    .width(ALL_PERCENT)

  }
}










