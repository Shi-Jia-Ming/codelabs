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

import mainViewModel from '../viewmodel/MainViewModel';
import CommonConstants from '../common/constants/CommonConstants';
import StyleConstants from '../common/constants/StyleConstants';
import CommonUtils from '../common/utils/CommonUtils';
import ItemData from '../viewmodel/ItemData';

@Component
export default struct HomePage {
  @StorageProp('currentDeviceSize') currentDeviceSize: string = CommonConstants.SM;

  build() {
    Scroll() {
      Column() {
        Text($r('app.string.main_page'))
          .fontWeight(FontWeight.Medium)
          .fontSize($r('app.float.common_text_size'))
          .margin({
            left: this.currentDeviceSize === CommonConstants.LG ?
              $r('app.float.common_margin_larger') : $r('app.float.common_margin'),
            top: $r('app.float.common_margin')
          })
          .alignSelf(ItemAlign.Start)
        // Swiper component
        SwiperView()
        // Center grid component
        CenterGridView()
        // List image component
        ListImageView()
      }
      .width(StyleConstants.FULL_PARENT)
      .backgroundColor($r('app.color.background'))
    }
    .scrollBar(BarState.Off)
  }
}

@Preview
@Component
struct SwiperView {
  @StorageProp('currentDeviceSize') currentDeviceSize: string = CommonConstants.SM;

  build() {
    Column() {
      Swiper() {
        ForEach(mainViewModel.getSwiperImages(), (item: Resource) => {
          Image(item)
            .borderRadius($r('app.float.swiper_radius'))
        }, (item: Resource) => JSON.stringify(item))
      }
      .displayCount(CommonConstants.SWIPER_CACHE_COUNT)
      .autoPlay(true)
      .width(StyleConstants.COMMON_WIDTH)
      .itemSpace(this.currentDeviceSize === CommonConstants.SM ?
        0 : StyleConstants.ITEM_SPACE)
      .margin($r('app.float.common_margin'))
      .displayCount(this.currentDeviceSize === CommonConstants.SM ?
        StyleConstants.SWIPER_COUNT_ONE :
        (this.currentDeviceSize === CommonConstants.MD ?
        StyleConstants.SWIPER_COUNT_TWO : StyleConstants.SWIPER_COUNT_THREE))
    }
  }
}

@Preview
@Component
struct CenterGridView {
  build() {
    Column() {
      Grid() {
        ForEach(mainViewModel.getCenterGridData(), (item: ItemData) => {
          GridItem() {
            GridItemView({ item: item })
          }
        }, (item: ItemData) => JSON.stringify(item))
      }
      .columnsTemplate(StyleConstants.GRID_COLUMNS)
      .rowsTemplate(StyleConstants.GRID_ROWS)
      .columnsGap($r('app.float.grid_column_gap'))
      .rowsGap($r('app.float.grid_row_gap'))
      .height(StyleConstants.HOME_GRID_HEIGHT)
      .backgroundColor(Color.White)
      .borderRadius($r('app.float.home_grid_radius'))
      .padding({
        top: $r('app.float.home_grid_padding'),
        bottom: $r('app.float.home_grid_padding')
      })
      .width(StyleConstants.COMMON_WIDTH)
      .margin($r('app.float.common_margin'))
    }
  }
}

@Preview
@Component
struct ListImageView {
  @StorageProp('currentDeviceSize') currentDeviceSize: string = CommonConstants.SM;

  build() {
    Column() {
      Text($r('app.string.home_list'))
        .fontSize($r('app.float.normal_text_size'))
        .fontWeight(FontWeight.Medium)
        .alignSelf(ItemAlign.Start)
        .margin({
          left: $r('app.float.common_margin'),
          top: $r('app.float.common_margin')
        })

      List({ space: StyleConstants.IMAGE_LIST_SPACE }) {
        ForEach(mainViewModel.getListImageData(), (secondItem: ItemData) => {
          ListItem() {
            ImageItemView({ secondItem: secondItem })
          }
          .margin({ right: $r('app.float.list_margin') })
          .borderRadius($r('app.float.image_list_radius'))
          .onClick(() => {
            if (!secondItem?.clickPrompt) {
              return;
            }
            CommonUtils.showToastContent(secondItem.clickPrompt);
          })
        }, (secondItem: ItemData) => JSON.stringify(secondItem.id))
      }
      .width(StyleConstants.COMMON_WIDTH)
      .margin($r('app.float.common_margin'))
      .lanes(this.currentDeviceSize === CommonConstants.SM ?
        StyleConstants.LIST_COLUMN_TWO :
        (this.currentDeviceSize === CommonConstants.MD ?
        StyleConstants.LIST_COLUMN_THREE : StyleConstants.LIST_COLUMN_FOUR))
    }
  }
}

@Component
struct GridItemView {
  private item?: ItemData;
  private gridItemImg?: Resource;
  private gridItemTitle?: Resource;
  private gridItemPrompt?: Resource;

  aboutToAppear() {
    if (this.item !== undefined) {
      this.gridItemImg = this.item.img;
      this.gridItemTitle = this.item.title;
      this.gridItemPrompt = this.item.clickPrompt;
    }
  }

  build() {
    Column() {
      if(this.gridItemImg) {
        Image(this.gridItemImg)
          .width($r('app.float.home_cell_size'))
          .height($r('app.float.home_cell_size'))
      }
      if (this.gridItemTitle) {
        Text(this.gridItemTitle)
          .fontSize($r('app.float.little_text_size'))
          .margin({ top: $r('app.float.home_cell_margin') })
      }
    }
    .onClick(() => {
      if(!this.gridItemPrompt) {
        return;
      }
      CommonUtils.showToastContent(this.gridItemPrompt);
    })
  }
}

@Component
struct ImageItemView {
  private secondItem?: ItemData;
  private listItemImage?: Resource;
  private listItemTitle?: Resource;
  private listItemOthers?: Resource;

  aboutToAppear() {
    if (this.secondItem !== undefined) {
      this.listItemImage = this.secondItem.img;
      this.listItemTitle = this.secondItem.title;
      this.listItemOthers = this.secondItem.others;
    }
  }

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      if (this.listItemImage) {
        Image(this.listItemImage)
          .objectFit(ImageFit.Cover)
          .aspectRatio(StyleConstants.GRID_ASPECT_RATIO)
      }
      Column() {
        Text(this.listItemTitle)
          .fontSize($r('app.float.normal_text_size'))
          .fontWeight(FontWeight.Medium)
          .alignSelf(ItemAlign.Start)
        Text(this.listItemOthers)
          .margin({ top: $r('app.float.home_list_margin') })
          .fontSize($r('app.float.little_text_size'))
          .fontColor($r('app.color.home_grid_fontColor'))
      }
      .margin({
        left: $r('app.float.item_text_margin'),
        top: $r('app.float.item_text_margin')
      })
    }
  }
}