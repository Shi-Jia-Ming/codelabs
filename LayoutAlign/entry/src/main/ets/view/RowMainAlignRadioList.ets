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

import { MARGIN_FONT_SIZE_SPACE, ATTRIBUTE_OPACITY, ATTRIBUTE,ALL_PERCENT } from '../common/Constants/CommonConstants';
import {getRowModuleList} from '../viewmodel/AttributeModuleData';
import {ContainerModuleItem} from '../common/bean/ContainerModuleItem';

/**
 *Set Main Alignment in Row
 */
@Component
export struct RowMainAlignRadioList {
  private rowModuleList :ContainerModuleItem[] =  getRowModuleList();
  private groupName: string = this.rowModuleList[0]['groupName'];
  private moduleName: Resource =  this.rowModuleList[0]['moduleName'];
  private radioList: Array<string> =this.rowModuleList[0]['attributeList'];

  build() {
    Column({ space: MARGIN_FONT_SIZE_SPACE.FIRST_MARGIN }) {
      Row() {
        Text(this.moduleName)
          .fontSize(MARGIN_FONT_SIZE_SPACE.FOURTH_MARGIN)

      }
      .margin({ left: MARGIN_FONT_SIZE_SPACE.SECOND_MARGIN })

      Flex({
        direction: FlexDirection.Row,
        justifyContent: FlexAlign.SpaceBetween,
        wrap: FlexWrap.NoWrap
      }) {
        ForEach(this.radioList, (item, index) => {
          MainAlignRadioItem({ textName: item, groupName: this.groupName, isChecked: index === 0 ? true : false })
            .margin({ right: MARGIN_FONT_SIZE_SPACE.COMMON_MARGIN })
        })
      }
      .width(ALL_PERCENT)
      .height(MARGIN_FONT_SIZE_SPACE.SEVENTH_MARGIN)
    }
    .width(ALL_PERCENT)
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Start)
  }
}

@Component
struct MainAlignRadioItem {
  private textName: string;
  private groupName: string;
  private isChecked: boolean;
  @Consume currentRowJustifyContent: FlexAlign;

  build() {
    Row() {
      Radio({ value: this.textName, group: this.groupName })
        .checked(this.isChecked)
        .height((MARGIN_FONT_SIZE_SPACE.SECOND_MARGIN))
        .width((MARGIN_FONT_SIZE_SPACE.SECOND_MARGIN))
        .onChange(() => {
          switch (this.textName) {
            case ATTRIBUTE.START:
              this.currentRowJustifyContent = FlexAlign.Start;
              break;
            case ATTRIBUTE.CENTER:
              this.currentRowJustifyContent = FlexAlign.Center;
              break;
            default:
              this.currentRowJustifyContent = FlexAlign.End;
              break;
          }
        })
      Text(this.textName).fontSize(MARGIN_FONT_SIZE_SPACE.THIRD_MARGIN).opacity(ATTRIBUTE_OPACITY)
    }
  }
}