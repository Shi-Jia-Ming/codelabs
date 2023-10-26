/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License,Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import FileManagerIndex from './FileManagerIndex';
import CommonConstants from '../common/constants/CommonConstants';
import DimensionUtil from '../common/utils/DimensionUtil';
import CardModel from '../viewmodel/CardModel';

/**
 * Navigation path on the home page.
 */
@Entry
@Component
struct TabIndex {
  @State currentPage: number = CommonConstants.INDEX_DEFAULT_SELECT;

  @Builder TabBuilder(item: CardModel, index: number | undefined) {
    Column() {
      Image(this.currentPage === index ? item.selectedIcon : item.defaultIcon)
        .width(DimensionUtil.getVp($r('app.float.index_tab_icon_size')))
        .height(DimensionUtil.getVp($r('app.float.index_tab_icon_size')))
        .objectFit(ImageFit.Contain)
      Text(item.content)
        .fontColor(this.currentPage === index ? $r('app.color.index_tab_font_color') : Color.Black)
        .fontSize(DimensionUtil.getFp($r('app.float.index_tab_font_size')))
        .margin({ top: DimensionUtil.getVp($r('app.float.index_tab_vertical_margin')) })
        .opacity(this.currentPage === index
          ? $r('app.float.index_tab_font_selected_opacity')
          : $r('app.float.index_tab_font_default_opacity'))
    }
    .justifyContent(FlexAlign.Center)
    .width(CommonConstants.FULL_LENGTH)
    .height(CommonConstants.FULL_LENGTH)
  }

  build() {
    Tabs({ barPosition: BarPosition.End, index: this.currentPage }) {
      ForEach(CommonConstants.INDEX_TAB, (item: CardModel, index: number | undefined) => {
        TabContent() {
          if (index === CommonConstants.INDEX_DEFAULT_SELECT) {
            FileManagerIndex()
          }
        }
        .tabBar(this.TabBuilder(item, index))
      }, (item: CardModel) => JSON.stringify(item))
    }
    .width(CommonConstants.FULL_LENGTH)
    .height(CommonConstants.FULL_LENGTH)
    .barMode(BarMode.Fixed)
    .onChange((index: number) => {
      this.currentPage = index;
    })
  }
}