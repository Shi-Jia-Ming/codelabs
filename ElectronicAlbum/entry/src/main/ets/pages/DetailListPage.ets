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

import display from '@ohos.display';
import router from '@ohos.router';
import Constants from '../common/constants/Constants';

enum scrollTypeEnum {
  STOP = 'onScrollStop',
  SCROLL = 'onScroll'
};

@Entry
@Component
struct DetailListPage {
  private smallScroller: Scroller = new Scroller();
  private bigScroller: Scroller = new Scroller();
  @State deviceWidth: number = Constants.DEFAULT_WIDTH;
  @State smallImgWidth: number = (this.deviceWidth - Constants.LIST_ITEM_SPACE * (Constants.SHOW_COUNT - 1)) /
  Constants.SHOW_COUNT;
  @State imageWidth: number = this.deviceWidth + this.smallImgWidth;
  private photoArr: Array<Resource | string> = router.getParams()[`${Constants.PARAM_PHOTO_ARR_KEY}`];
  private smallPhotoArr: Array<Resource | string> = [
    ...Constants.CACHE_IMG_LIST,
    ...router.getParams()[`${Constants.PARAM_PHOTO_ARR_KEY}`],
    ...Constants.CACHE_IMG_LIST
  ];
  @StorageLink('selectedIndex') selectedIndex: number = 0;

  @Builder SmallImgItemBuilder(img: Resource, index: number) {
    if (index > (Constants.CACHE_IMG_SIZE - 1) && index < (this.smallPhotoArr.length - Constants.CACHE_IMG_SIZE)) {
      Image(img)
        .onClick(() => this.smallImgClickAction(index))
    }
  }

  aboutToAppear() {
    let displayClass: display.Display = display.getDefaultDisplaySync();
    let width = displayClass?.width / displayClass.densityPixels ?? Constants.DEFAULT_WIDTH;
    this.deviceWidth = width;
    this.smallImgWidth = (width - Constants.LIST_ITEM_SPACE * (Constants.SHOW_COUNT - 1)) / Constants.SHOW_COUNT;
    this.imageWidth = this.deviceWidth + this.smallImgWidth;
  }

  onPageShow() {
    this.smallScroller.scrollToIndex(this.selectedIndex);
    this.bigScroller.scrollToIndex(this.selectedIndex);
  }

  goDetailPage(): void {
    router.pushUrl({
      url: Constants.URL_DETAIL_PAGE,
      params: { photoArr: this.photoArr }
    });
  }

  smallImgClickAction(index: number): void {
    this.selectedIndex = index - Constants.CACHE_IMG_SIZE;
    this.smallScroller.scrollToIndex(this.selectedIndex);
    this.bigScroller.scrollToIndex(this.selectedIndex);
  }

  smallScrollAction(type: scrollTypeEnum): void {
    this.selectedIndex = Math.round((this.smallScroller.currentOffset().xOffset +
    this.smallImgWidth / Constants.DOUBLE_NUMBER) / (this.smallImgWidth + Constants.LIST_ITEM_SPACE));
    if (type === scrollTypeEnum.SCROLL) {
      this.bigScroller.scrollTo({ xOffset: this.selectedIndex * this.imageWidth, yOffset: 0 });
    } else {
      this.smallScroller.scrollTo({ xOffset: this.selectedIndex * this.smallImgWidth, yOffset: 0 });
    }
  }

  bigScrollAction(type: scrollTypeEnum): void {
    let smallWidth = this.smallImgWidth + Constants.LIST_ITEM_SPACE;
    this.selectedIndex = Math.round((this.bigScroller.currentOffset().xOffset +
    smallWidth / Constants.DOUBLE_NUMBER) / this.imageWidth);
    if (type === scrollTypeEnum.SCROLL) {
      this.smallScroller.scrollTo({ xOffset: this.selectedIndex * smallWidth, yOffset: 0 });
    } else {
      this.bigScroller.scrollTo({ xOffset: this.selectedIndex * this.imageWidth, yOffset: 0 });
    }
  }

  build() {
    Navigation() {
      Stack({ alignContent: Alignment.Bottom }) {
        List({ scroller: this.bigScroller, initialIndex: this.selectedIndex }) {
          ForEach(this.photoArr, (img: Resource, index: number) => {
            ListItem() {
              Image(img)
                .height(Constants.FULL_PERCENT)
                .width(Constants.FULL_PERCENT)
                .objectFit(ImageFit.Contain)
                .gesture(PinchGesture({ fingers: Constants.DOUBLE_NUMBER })
                  .onActionStart(() => this.goDetailPage()))
                .onClick(() => this.goDetailPage())
            }
            .padding({
              left: this.smallImgWidth / Constants.DOUBLE_NUMBER,
              right: this.smallImgWidth / Constants.DOUBLE_NUMBER
            })
            .width(this.imageWidth)
          }, item => JSON.stringify(item))
        }
        .onScroll((scrollOffset, scrollState) => {
          if (scrollState === ScrollState.Fling) {
            this.bigScrollAction(scrollTypeEnum.SCROLL);
          }
        })
        .onScrollStop(() => this.bigScrollAction(scrollTypeEnum.STOP))
        .width(Constants.FULL_PERCENT)
        .height(Constants.FULL_PERCENT)
        .padding({ bottom: this.smallImgWidth * Constants.DOUBLE_NUMBER })
        .listDirection(Axis.Horizontal)

        List({
          scroller: this.smallScroller,
          space: Constants.LIST_ITEM_SPACE,
          initialIndex: this.selectedIndex
        }) {
          ForEach(this.smallPhotoArr, (img: Resource, index: number) => {
            ListItem() {
              this.SmallImgItemBuilder(img, index)
            }
            .width(this.smallImgWidth)
            .aspectRatio(1)
          }, item => JSON.stringify(item))
        }
        .listDirection(Axis.Horizontal)
        .onScroll((scrollOffset, scrollState) => {
          if (scrollState === ScrollState.Fling) {
            this.smallScrollAction(scrollTypeEnum.SCROLL);
          }
        })
        .onScrollStop(() => this.smallScrollAction(scrollTypeEnum.STOP))
        .margin({ top: $r('app.float.detail_list_margin'), bottom: $r('app.float.detail_list_margin') })
        .height(this.smallImgWidth)
        .width(Constants.FULL_PERCENT)
      }
      .width(this.imageWidth)
      .height(Constants.FULL_PERCENT)
    }
    .title(Constants.PAGE_TITLE)
    .hideBackButton(false)
    .titleMode(NavigationTitleMode.Mini)
  }
}