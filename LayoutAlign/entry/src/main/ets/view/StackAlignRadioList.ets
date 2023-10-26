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

import { MARGIN_FONT_SIZE_SPACE, ATTRIBUTE_OPACITY, ATTRIBUTE, ALL_PERCENT } from '../common/Constants/CommonConstants';
import { getStackModuleList } from '../viewmodel/AttributeModuleData';
import { ContainerModuleItem } from '../viewmodel/ContainerModuleItem';

/**
 *Set  Alignment in Stack
 */
@Component
export struct StackAlignRadioList {
  private stackModuleList: ContainerModuleItem[] = getStackModuleList();
  private groupName: string = this.stackModuleList[0].groupName;
  private moduleName: Resource = this.stackModuleList[0].moduleName;
  private radioList: Array<string> = this.stackModuleList[0].attributeList;

  build() {
    Column({ space: MARGIN_FONT_SIZE_SPACE.FIRST_MARGIN }) {
      Row() {
        Text(this.moduleName)
          .fontSize(MARGIN_FONT_SIZE_SPACE.FOURTH_MARGIN)
      }
      .margin({ left: MARGIN_FONT_SIZE_SPACE.SECOND_MARGIN })

      Flex({
        direction: FlexDirection.Row,
        justifyContent: FlexAlign.Start,
        wrap: FlexWrap.Wrap
      }) {
        ForEach(this.radioList, (item: string, index: number | undefined) => {
          StackAlignRadioListItem({ textName: item, groupName: this.groupName, isChecked: index === 0 ? true : false })
            .margin({ right: MARGIN_FONT_SIZE_SPACE.COMMON_MARGIN })
        }, (item: string) => JSON.stringify(item))
      }
      .width(ALL_PERCENT)
      .height(ALL_PERCENT)
    }
    .width(ALL_PERCENT)
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Start)
  }
}

@Component
export struct StackAlignRadioListItem {
  private textName: string = '';
  private groupName: string = '';
  private isChecked: boolean = false;
  @Consume currentStackAlignContent: Alignment;
  @Consume message: string;

  build() {
    Row() {
      Radio({ value: this.textName, group: this.groupName })
        .checked(this.isChecked)
        .height((MARGIN_FONT_SIZE_SPACE.SECOND_MARGIN))
        .width((MARGIN_FONT_SIZE_SPACE.SECOND_MARGIN))
        .onClick(() => {
          switch (this.textName) {
            case ATTRIBUTE.TOP_START:
              this.currentStackAlignContent = Alignment.TopStart;
              this.message = ATTRIBUTE.TOP_START;
              break;
            case ATTRIBUTE.TOP_END:
              this.currentStackAlignContent = Alignment.TopEnd;
              this.message = ATTRIBUTE.TOP_END;
              break;
            case ATTRIBUTE.CENTER:
              this.currentStackAlignContent = Alignment.Center;
              this.message = ATTRIBUTE.CENTER;
              break;
            case ATTRIBUTE.BOTTOM_START:
              this.currentStackAlignContent = Alignment.BottomStart;
              this.message = ATTRIBUTE.BOTTOM_START;
              break;
            default:
              this.currentStackAlignContent = Alignment.BottomEnd;
              this.message = ATTRIBUTE.BOTTOM_END;
              break;
          }
        })
      Text(this.textName)
        .fontSize(MARGIN_FONT_SIZE_SPACE.THIRD_MARGIN)
        .opacity(ATTRIBUTE_OPACITY)
    }
  }
}