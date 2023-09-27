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

import { MineTabsItem, CommonConstants as Const } from '@ohos/common';
import { MineTabsList } from '../viewmodel/MineTabsModel';

@Component
export struct MineTabs {
  private scroller: Scroller = new Scroller();

  build() {
    Scroll(this.scroller) {
      GridRow({
        columns: { xs: Const.GRID_4, sm: Const.GRID_4, md: Const.GRID_8, lg: Const.GRID_12 },
        gutter: { x: $r('app.float.gutter_mine') },
        breakpoints: { value: [Const.BREAKPOINTS_SM, Const.BREAKPOINTS_MD, Const.BREAKPOINTS_LG] }
      }) {
        GridCol({
          span: { xs: Const.GRID_4, sm: Const.GRID_4, md: Const.GRID_8, lg: Const.GRID_8 },
          offset: { lg: Const.OFFSET_2 }
        }) {
          Stack() {
            Column() {
              Text($r('app.string.title_mine'))
                .height($r('app.float.mine_text_height'))
                .fontSize($r('app.float.mine_text_font_size1'))
                .margin({ bottom: $r('app.float.mine_text_margin') })

              List() {
                ForEach(MineTabsList, (item: MineTabsItem) => {
                  ListItem() {
                    Row() {
                      Image(item.icon)
                        .width($r('app.float.mine_image_size1'))
                        .height($r('app.float.mine_image_size1'))
                        .margin({ right: $r('app.float.mine_image_margin') })

                      Row() {
                        Text(item.title)
                          .fontSize($r('app.float.mine_text_font_size2'))
                          .fontWeight(Const.FONT_WEIGHT)

                        Image(item.more)
                          .width($r('app.float.mine_image_size2'))
                          .objectFit(ImageFit.Contain)
                      }
                      .height(Const.FULL_SIZE)
                      .layoutWeight(1)
                      .justifyContent(FlexAlign.SpaceBetween)
                      .borderWidth({
                        bottom: MineTabsList.indexOf(item) !== Const.NUM_4 ? $r('app.float.mine_row_border_width') : 0
                      })
                      .borderColor($r('app.color.background_color'))
                    }
                    .width(Const.FULL_SIZE)
                    .height(Const.FULL_SIZE)
                  }
                  .width(Const.FULL_SIZE)
                  .height($r('app.float.mine_list_height'))
                }, (item: MineTabsItem) => JSON.stringify(item))
              }
              .width(Const.FULL_SIZE)
              .height(Const.FULL_SIZE)
              .layoutWeight(1)
            }
            .width(Const.FULL_SIZE)
            .height(Const.MINE_COLUMN_HEIGHT)
            .borderRadius({
              topLeft: $r('app.float.mine_list_border_radius'),
              topRight: $r('app.float.mine_list_border_radius')
            })
            .backgroundColor(Color.White)
            .position({ y: Const.MINE_IMAGE_Y })
            .padding({
              top: $r('app.float.mine_list_padding1'),
              left: $r('app.float.mine_list_padding2'),
              right: $r('app.float.mine_list_padding2')
            })

            Image($r('app.media.ic_profile_photo'))
              .width($r('app.float.mine_image_size3'))
              .height($r('app.float.mine_image_size3'))
              .objectFit(ImageFit.Contain)
              .markAnchor({ x: $r('app.float.mine_image_anchor'), y: $r('app.float.mine_image_anchor') })
              .position({ x: Const.MINE_IMAGE_X, y: Const.MINE_IMAGE_Y })
          }
          .width(Const.FULL_SIZE)
          .height(Const.FULL_SIZE)
          .backgroundColor($r('app.color.mine_background_color'))
        }
      }
      .height(Const.FULL_SIZE)
      .backgroundColor($r('app.color.mine_background_color'))
    }
    .width(Const.FULL_SIZE)
    .scrollBar(BarState.Off)
    .layoutWeight(1)
  }
}