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

import { FindTabsItem, CommonConstants as Const } from '@ohos/common';
import { FindTabsList, FindDataSource } from '../viewmodel/FindTabsModel';

@Component
export struct FindTabs {
  private scroller: Scroller = new Scroller();

  build() {
    Scroll(this.scroller) {
      GridRow({
        columns: { xs: Const.GRID_4, sm: Const.GRID_4, md: Const.GRID_8, lg: Const.GRID_12 },
        gutter: { x: $r('app.float.gutter_find') },
        breakpoints: { value: [Const.BREAKPOINTS_SM, Const.BREAKPOINTS_MD, Const.BREAKPOINTS_LG] }
      }) {
        GridCol({ span: { xs: Const.GRID_4, sm: Const.GRID_4, md: Const.GRID_8, lg: Const.GRID_12 } }) {
          Row() {
            Text($r('app.string.title_find'))
              .fontSize($r('app.float.title_font_size'))
              .fontWeight(Const.FONT_WEIGHT)
              .width(Const.FULL_SIZE)
              .margin({
                top: $r('app.float.find_margin5'),
                bottom: $r('app.float.find_margin5'),
                left: $r('app.float.find_margin6')
              })
          }
        }
        .height($r('app.float.title_height'))

        LazyForEach(new FindDataSource(FindTabsList), (item: FindTabsItem) => {
          GridCol({
            span: { xs: Const.GRID_4, sm: Const.GRID_4, md: Const.GRID_6, lg: Const.GRID_8 },
            offset: {
              md: FindTabsList.indexOf(item) === Const.OFFSET_0 ? Const.OFFSET_1 : Const.OFFSET_2,
              lg: FindTabsList.indexOf(item) === Const.OFFSET_0 ? Const.OFFSET_2 : Const.OFFSET_4
            }
          }) {
            Row() {
              Image(item.img)
                .width($r('app.float.find_image_size'))
                .objectFit(ImageFit.Contain)

              Column() {
                Text(item.title)
                  .fontSize($r('app.float.find_title_size'))
                  .fontWeight(Const.FONT_WEIGHT)
                  .margin({ bottom: $r('app.float.find_title_margin') })

                Row() {
                  Column() {
                    Text(item.category)
                      .fontSize($r('app.float.find_category_size'))
                      .fontColor($r('app.color.find_text_font_color'))
                  }
                  .borderRadius($r('app.float.find_radius'))
                  .padding({
                    top: $r('app.float.find_margin1'),
                    bottom: $r('app.float.find_margin1'),
                    left: $r('app.float.find_margin2'),
                    right: $r('app.float.find_margin2')
                  })
                  .margin({ right: $r('app.float.find_margin3') })
                  .backgroundColor($r('app.color.find_text_background_color'))

                  Column() {
                    Text(item.barrage)
                      .fontSize($r('app.float.find_category_size'))
                      .fontColor($r('app.color.find_text_font_color'))
                  }
                  .borderRadius($r('app.float.find_radius'))
                  .padding({
                    top: $r('app.float.find_margin1'),
                    bottom: $r('app.float.find_margin1'),
                    left: $r('app.float.find_margin2'),
                    right: $r('app.float.find_margin2')
                  })
                  .backgroundColor($r('app.color.find_text_background_color'))
                }
                .margin({ bottom: $r('app.float.find_margin4') })

                Text(item.intro)
                  .fontSize($r('app.float.find_intro_size'))
                  .fontWeight(Const.FONT_WEIGHT)
                  .opacity(Const.OPACITY)

              }
              .width($r('app.float.find_column_width'))
              .margin({ left: $r('app.float.find_margin5') })
              .alignItems(HorizontalAlign.Start)

              Blank()

              Row() {
                Text(item.visits)
                  .fontSize($r('app.float.find_title_size'))
                  .fontWeight(Const.FONT_WEIGHT)
                  .width($r('app.float.find_text_width'))
                  .margin({ right: $r('app.float.find_margin3') })

                Image($r('app.media.ic_visits'))
                  .width($r('app.float.find_row_height'))
                  .height($r('app.float.find_row_height'))
              }
              .width($r('app.float.find_row_width'))
            }
            .width(Const.FULL_SIZE)
            .margin({ bottom: $r('app.float.find_margin5') })
          }
        }, (item: FindTabsItem) => JSON.stringify(item))
      }
    }
    .width(Const.FULL_SIZE)
    .height(Const.FULL_SIZE)
    .align(Alignment.TopStart)
    .scrollBar(BarState.Off)
  }
}
