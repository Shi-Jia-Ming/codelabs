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

import router from '@ohos.router';
import IndexItem from '../viewmodel/IndexItem';
import IndexViewModel from '../viewmodel/IndexViewModel';
import { StyleConstants } from '../common/constants/StyleConstants';
import { BreakpointConstants } from '../common/constants/BreakpointConstants';
import { HomeConstants } from '../common/constants/HomeConstants';

@Entry
@Component
struct Index {
  @State indexItemList: IndexItem[] = IndexViewModel.getIndexItemList();

  build() {
    GridRow({
      breakpoints: {
        value: BreakpointConstants.BREAKPOINT_VALUE,
        reference: BreakpointsReference.WindowSize
      },
      columns: {
        sm: BreakpointConstants.COLUMN_SM,
        md: BreakpointConstants.COLUMN_MD,
        lg: BreakpointConstants.COLUMN_LG
      },
      gutter: { x: BreakpointConstants.GUTTER_X },
      direction: GridRowDirection.Row
    }) {
      GridCol({
        span: {
          sm: BreakpointConstants.SPAN_SM,
          md: BreakpointConstants.SPAN_MD,
          lg: BreakpointConstants.SPAN_LG
        },
        offset: {
          md: BreakpointConstants.OFFSET_MD,
          lg: BreakpointConstants.OFFSET_LG
        }
      }) {
        Column({ space: HomeConstants.COLUMN_SPACE }) {
          ForEach(this.indexItemList, (item: IndexItem) => {
            Stack() {
              Image(item.icon)
                .width(StyleConstants.FULL_WIDTH)
                .height($r('app.float.item_height'))
                .borderRadius($r('app.float.item_border_radius'))
              Column() {
                Text(item.title)
                  .fontSize($r('app.float.title_font_size'))
                  .fontColor(Color.White)
                Text(item.description)
                  .fontSize($r('app.float.description_font_size'))
                  .opacity(HomeConstants.TEXT_OPACITY)
                  .fontColor(Color.White)
                  .margin({
                    top: $r('app.float.description_margin_top')
                  })
                Blank()
                Column() {
                  Button() {
                    Text(item.button)
                      .fontSize($r('app.float.button_font_size'))
                      .fontColor(Color.White)
                  }
                  .backgroundColor($r('app.color.button_background_color'))
                  .borderRadius($r('app.float.button_border_radius'))
                  .width($r('app.float.button_width'))
                  .height($r('app.float.button_height'))
                  .onClick(() => {
                    router.pushUrl({
                      url: item.url
                    }, router.RouterMode.Single);
                  })
                }
                .alignItems(HorizontalAlign.End)
                .width(StyleConstants.FULL_WIDTH)
              }
              .width(StyleConstants.FULL_WIDTH)
              .height($r('app.float.item_height'))
              .borderRadius($r('app.float.item_border_radius'))
              .padding($r('app.float.item_padding'))
              .alignItems(HorizontalAlign.Start)
              .justifyContent(FlexAlign.SpaceBetween)
            }
          }, (item: IndexItem, index?: number) => index + JSON.stringify(item))
        }
      }
    }
    .padding({
      top: $r('app.float.column_padding_top'),
      left: $r('app.float.column_padding_left'),
      right: $r('app.float.column_padding_right')
    })
  }
}