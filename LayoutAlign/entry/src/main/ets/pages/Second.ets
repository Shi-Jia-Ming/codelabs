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

import router from '@ohos.router';
import { FlexShowList } from '../view/FlexShowList';
import { ColumnShowList } from '../view/ColumnShowList';
import { RowShowList } from '../view/RowShowList';
import { StackComponent } from '../view/StackComponent';
import {
  MARGIN_FONT_SIZE_SPACE,
  COMMON_FONT_WEIGHT,
  LIST,
  ATTRIBUTE,
  CONTAINER_TYPE,
  ALL_PERCENT
} from '../common/Constants/CommonConstants';
import { ContainerModuleItem } from '../common/bean/ContainerModuleItem';

/**
 *second page
 */
@Entry
@Component
struct Second {
  private moduleList: ContainerModuleItem[] = [];
  private componentName: string = '';
  @Provide containerType: number = 0;
  @Provide currentFlexDirection: FlexDirection = FlexDirection.Column;
  @Provide currentFlexJustifyContent: FlexAlign = FlexAlign.Start;
  @Provide currentFlexAlignItems: ItemAlign = ItemAlign.Start;
  @Provide currentFlexWrap: FlexWrap = FlexWrap.NoWrap;
  @Provide currentFlexAlignContent: FlexAlign = FlexAlign.Start;
  @Provide currentColumnJustifyContent: FlexAlign = FlexAlign.Start;
  @Provide currentColumnAlignItems: HorizontalAlign = HorizontalAlign.Start;
  @Provide currentRowJustifyContent: FlexAlign = FlexAlign.Start;
  @Provide currentRowAlignItems: VerticalAlign = VerticalAlign.Top;
  @Provide currentStackAlignContent: Alignment = Alignment.TopStart;
  @Provide message: string = ATTRIBUTE.TOP_START;
  @Provide list: number[] = LIST;

  aboutToAppear() {
    let params = router.getParams() as Record<string, Object>;
    this.moduleList = params.moduleList as ContainerModuleItem[];
    this.componentName = params.componentName as string;
    this.containerType = params.containerType as number;
  }

  build() {
    Row() {
      Column({ space: MARGIN_FONT_SIZE_SPACE.SIXTH_MARGIN }) {
        Column() {
          BackComp({ componentName: this.componentName })
          if (this.containerType === CONTAINER_TYPE.FLEX) {
            FlexShowList()
          } else if (this.containerType === CONTAINER_TYPE.COLUMN) {
            ColumnShowList()
          } else if (this.containerType === CONTAINER_TYPE.ROW) {
            RowShowList()
          } else {
            StackComponent()
          }
        }
        .width(ALL_PERCENT)
        .height(ALL_PERCENT)
      }
      .width(ALL_PERCENT)
    }
    .height(ALL_PERCENT)
  }
}

@Component
struct BackComp {
  private backIconResource: Resource = $r('app.media.icon_back');
  private componentName: string = '';

  build() {
    Row() {
      Image(this.backIconResource)
        .width(MARGIN_FONT_SIZE_SPACE.SEVENTH_MARGIN)
        .height(MARGIN_FONT_SIZE_SPACE.SEVENTH_MARGIN)
        .onClick(() => {
          router.back();
        })
      Text(this.componentName)
        .fontColor(Color.Black)
        .fontSize(MARGIN_FONT_SIZE_SPACE.SEVENTH_MARGIN)
        .fontWeight(COMMON_FONT_WEIGHT)
        .margin({ left: MARGIN_FONT_SIZE_SPACE.SECOND_MARGIN })
    }
    .width(ALL_PERCENT)
    .margin({ left: MARGIN_FONT_SIZE_SPACE.SECOND_MARGIN, top: MARGIN_FONT_SIZE_SPACE.SEVENTH_MARGIN })
    .justifyContent(FlexAlign.Start)
  }
}