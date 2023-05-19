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

import CommonConstants from '../common/constants/CommonConstants';
import ItemData from '../common/bean/GridItem';
import WindowViewModel from '../viewmodel/WindowViewModel';

/**
 * Home page after login.
 */
@Entry
@Component
struct HomePage {
  private swiperController: SwiperController = new SwiperController();

  @Builder NavigationTitle() {
    Text($r('app.string.home_title'))
      .fontWeight(FontWeight.Medium)
      .fontSize($r('app.float.page_title_text_size'))
      .margin({ top: $r('app.float.home_tab_titles_margin') })
      .padding({ left: $r('app.float.home_tab_titles_padding') })
  }

  build() {
    Navigation() {
      Scroll() {
        Column({ space: CommonConstants.COMMON_SPACE }) {
          Swiper(this.swiperController) {
            ForEach(WindowViewModel.getSwiperImages(), (img: Resource, index: number) => {
              Image(img).borderRadius($r('app.float.home_swiper_border_radius'))
            }, (img, index) => index + JSON.stringify(img.id))
          }
          .margin({
            top: $r('app.float.home_swiper_margin')
          })
          .autoPlay(true)

          Grid() {
            ForEach(WindowViewModel.getFirstGridData(), (firstItem: ItemData, index: number) => {
              GridItem() {
                Column() {
                  Image(firstItem.image)
                    .width($r('app.float.home_home_cell_size'))
                    .height($r('app.float.home_home_cell_size'))
                  Text(firstItem.title)
                    .fontSize($r('app.float.little_text_size'))
                    .margin({ top: $r('app.float.home_home_cell_margin') })
                }
              }
            }, (firstItem, index) => index + JSON.stringify(firstItem))
          }
          .columnsTemplate(CommonConstants.GRID_FOUR_COLUMNS)
          .rowsTemplate(CommonConstants.GRID_TWO_ROWS)
          .columnsGap($r('app.float.home_grid_columns_gap'))
          .rowsGap($r('app.float.home_grid_row_gap'))
          .padding({
            top: $r('app.float.home_grid_padding'),
            bottom: $r('app.float.home_grid_padding')
          })
          .height($r('app.float.home_grid_height'))
          .backgroundColor(Color.White)
          .borderRadius($r('app.float.background_border_radius'))

          Text($r('app.string.home_list'))
            .fontSize($r('app.float.normal_text_size'))
            .fontWeight(FontWeight.Medium)
            .width(CommonConstants.FULL_PARENT)
            .margin({ top: $r('app.float.home_text_margin') })

          Grid() {
            ForEach(WindowViewModel.getSecondGridData(), (secondItem: ItemData, index: number) => {
              GridItem() {
                Column() {
                  Text(secondItem.title)
                    .fontSize($r('app.float.normal_text_size'))
                    .fontWeight(FontWeight.Medium)
                  Text(secondItem.others)
                    .margin({ top: $r('app.float.background_text_margin') })
                    .fontSize($r('app.float.little_text_size'))
                    .fontColor($r('app.color.home_grid_font_color'))
                }
                .alignItems(HorizontalAlign.Start)
              }
              .padding({
                top: $r('app.float.home_list_padding'),
                left: $r('app.float.home_list_padding')
              })
              .borderRadius($r('app.float.home_background_border_radius'))
              .align(Alignment.TopStart)
              .backgroundImage(secondItem.image)
              .backgroundImageSize(ImageSize.Cover)
              .width(CommonConstants.FULL_PARENT)
              .height(CommonConstants.FULL_PARENT)
            }, (secondItem, index) => index + JSON.stringify(secondItem))
          }
          .width(CommonConstants.FULL_PARENT)
          .height($r('app.float.home_second_grid_height'))
          .columnsTemplate(CommonConstants.GRID_TWO_COLUMNS)
          .rowsTemplate(CommonConstants.GRID_THREE_ROWS)
          .columnsGap($r('app.float.home_grid_columns_gap'))
          .rowsGap($r('app.float.home_grid_row_gap'))
          .margin({ bottom: $r('app.float.home_button_bottom') })
        }
      }
      .scrollBar(BarState.Off)
      .margin({
        left: $r('app.float.home_padding'),
        right: $r('app.float.home_padding')
      })
    }
    .title(this.NavigationTitle())
    .titleMode(NavigationTitleMode.Mini)
    .hideBackButton(true)
    .backgroundColor($r('app.color.background'))
  }
}
