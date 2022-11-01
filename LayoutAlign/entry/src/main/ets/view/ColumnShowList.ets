
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
import { MARGIN_FONT_SIZE_SPACE, LIST, SHOW_LIST_HEIGHT_PERCENT,ALL_PERCENT } from '../common/Constants/CommonConstants';
import { ColumnAxisAlignRadioList } from './ColumnAxisAlignRadioList';
import { ColumnMainAlignRadioList } from './ColumnMainAlignRadioList';

/**
 *Show List in Column
 */
@Component
export struct ColumnShowList {
  @Consume currentColumnJustifyContent: FlexAlign;
  @Consume currentColumnAlignItems: HorizontalAlign;

  build() {
    Column() {
      // Column中元素对齐方式布局
      Column() {
        ForEach(LIST, (item) => {
          CommonItem({ item: item })
        }, item => item)
      }
      .alignItems(this.currentColumnAlignItems)
      .justifyContent(this.currentColumnJustifyContent)
      .padding(MARGIN_FONT_SIZE_SPACE.COMMON_PADDING)
      .width(ALL_PERCENT)
      .height(SHOW_LIST_HEIGHT_PERCENT.COLUMN_ROW_SHOW_LIST_HEIGHT)
      .backgroundColor($r("app.color.show_list_backgroundColor"))
      .margin({ top: MARGIN_FONT_SIZE_SPACE.FIRST_MARGIN })
      // set main align
      ColumnMainAlignRadioList().margin({top:MARGIN_FONT_SIZE_SPACE.EIGHTH_MARGIN})
      // set axis align
      ColumnAxisAlignRadioList().margin({top:MARGIN_FONT_SIZE_SPACE.EIGHTH_MARGIN})
    }
    .layoutWeight(1)
    .height(ALL_PERCENT)
    .width(ALL_PERCENT)

  }
}



