/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { Commodity } from '../viewmodel/CommodityModel';
import { EmptyComponent } from './EmptyComponent';
import { StyleConstants } from '../constants/StyleConstants';
import { CommonDataSource } from '../utils/CommonDataSource';

/**
 * Commodity list component.
 */
@Component
export struct CommodityList {
  @Link commodityList: Commodity[];
  @Prop column: number = 0;
  private onClickItem? = (Commodity: Commodity) => {};

  @Builder
  CommodityItem(info: Commodity) {
    Column() {
      Image($rawfile(info.images[0]))
        .width($r('app.float.commodity_item_image_size'))
        .height($r('app.float.commodity_item_image_size'))
        .objectFit(ImageFit.Contain)
        .margin({
          top: $r('app.float.vp_sixteen'),
          bottom: $r('app.float.vp_eight')
        })
      Column() {
        Text($r('app.string.commodity_piece_description', info.title, info.description))
          .fontColor(Color.Black)
          .maxLines(StyleConstants.TWO_TEXT_LINE)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .fontSize($r('app.float.small_font_size'))
          .fontWeight(StyleConstants.FONT_WEIGHT_FOUR)
          .lineHeight($r('app.float.commodity_desc_height'))
        Text($r('app.string.commodity_piece', info.price))
          .fontColor($r('app.color.focus_color'))
          .fontSize($r('app.float.middle_font_size'))
          .margin({
            top: $r('app.float.vp_four'),
            bottom: $r('app.float.vp_eight')
          })
        Text(`${info.promotion}`)
          .fontSize($r('app.float.micro_font_size'))
          .fontColor(Color.White)
          .backgroundColor($r('app.color.focus_color'))
          .borderRadius($r('app.float.vp_four'))
          .height($r('app.float.vp_sixteen'))
          .padding({
            right: $r('app.float.vp_eight'),
            left: $r('app.float.vp_eight')
          })
      }
      .width(StyleConstants.FULL_WIDTH)
      .alignItems(HorizontalAlign.Start)
    }
    .padding($r('app.float.vp_twelve'))
    .height($r('app.float.commodity_item_height'))
    .width(StyleConstants.FULL_WIDTH)
    .backgroundColor(Color.White)
    .borderRadius($r('app.float.vp_eight'))
  }

  build() {
    if (this.commodityList.length > 0) {
      List({ space: StyleConstants.TWELVE_SPACE }) {
        LazyForEach(new CommonDataSource<Commodity>(this.commodityList), (item: Commodity) => {
          ListItem() {
            this.CommodityItem(item)
          }
          .margin({ left: $r('app.float.vp_six'), right: $r('app.float.vp_six') })
          .onClick(() => {
            if (this.onClickItem !== undefined) {
              this.onClickItem(item);
            }
          })
        }, (item: Commodity) => JSON.stringify(item))
      }
      .margin({ left: $r('app.float.commodity_list_margin'), right: $r('app.float.commodity_list_margin') })
      .listDirection(Axis.Vertical)
      .lanes(this.column)
    } else {
      EmptyComponent({ outerHeight: StyleConstants.FIFTY_HEIGHT })
    }
  }
}