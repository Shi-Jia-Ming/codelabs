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
import { IndexListItem } from '../common/bean/IndexListItem';
import {
  TITLE_FONT_WEIGHT,
  MARGIN_FONT_SIZE_SPACE,
  EIGHT_POINT_TWO_PERCENT,
  COMMON_FONT_WEIGHT,
  INDEX_COMPONENT_WITH_PERCENT,
  SECOND_PAGE,
  ALL_PERCENT
} from '../common/Constants/CommonConstants';
import { getIndexList } from '../viewmodel/IndexData';

/**
 *index page
 */
@Entry
@Component
struct LayoutAlignIndex {
  private indexList : IndexListItem[] = getIndexList();
  build() {
    Column() {
      Text($r("app.string.index_title"))
        .width(ALL_PERCENT)
        .fontSize(MARGIN_FONT_SIZE_SPACE.SEVENTH_MARGIN)
        .fontWeight(TITLE_FONT_WEIGHT)
        .textAlign(TextAlign.Center)
        .fontColor(Color.Black)
        .margin({ top: EIGHT_POINT_TWO_PERCENT })
      List() {
        ForEach(this.indexList, (item) => {
          ListItem() {
            ListItemComp({ item: item }).margin({ top: MARGIN_FONT_SIZE_SPACE.SECOND_MARGIN })
          }
        }, item => JSON.stringify(item))
      }
      .listDirection(Axis.Vertical)
      .margin({ top: MARGIN_FONT_SIZE_SPACE.EIGHTH_MARGIN })
    }
    .backgroundColor($r('app.color.index_backgroundColor'))
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Start)
    .width(ALL_PERCENT)
    .height(ALL_PERCENT)
  }
}

@Component
struct ListItemComp {
  private item: IndexListItem;

  build() {
    Row() {
      Image(this.item['icon'])
        .height(MARGIN_FONT_SIZE_SPACE.SEVENTH_MARGIN)
        .width(MARGIN_FONT_SIZE_SPACE.SEVENTH_MARGIN)
        .margin({
          left: MARGIN_FONT_SIZE_SPACE.SEVENTH_MARGIN,
          top: MARGIN_FONT_SIZE_SPACE.SIXTH_MARGIN,
          bottom: MARGIN_FONT_SIZE_SPACE.SIXTH_MARGIN
        })
      Text(this.item['name'])
        .fontSize(MARGIN_FONT_SIZE_SPACE.FIFTH_MARGIN)
        .fontColor(Color.Black)
        .fontWeight(COMMON_FONT_WEIGHT)
        .textAlign(TextAlign.Center)
        .margin({ left: MARGIN_FONT_SIZE_SPACE.FIFTH_MARGIN })
    }
    .width(INDEX_COMPONENT_WITH_PERCENT)
    .height(EIGHT_POINT_TWO_PERCENT)
    .borderRadius(MARGIN_FONT_SIZE_SPACE.SEVENTH_MARGIN)
    .margin({ left: MARGIN_FONT_SIZE_SPACE.SECOND_MARGIN, right: MARGIN_FONT_SIZE_SPACE.SECOND_MARGIN })
    .backgroundColor($r("app.color.white"))
    .onClick(() => {
      router.pushUrl({
        url: SECOND_PAGE,
        params: {
          containerType: this.item['containerType'],
          componentName: this.item['name'],
          moduleList: this.item['moduleList']
        }
      });
    })
  }
}
