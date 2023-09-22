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
import { PictureItem } from '../../common/bean/PictureItem';
import { PictureType } from '../../common/constants/PictureConstants';
import { initializePictures, startPlay, stopPlay } from '../../viewmodel/PictureViewModel';
import { CommonConstants } from '../../common/constants/CommonConstant';

/**
 * text style.
 *
 * @param fontSize Font size.
 * @param fontWeight Font weight.
 */
@Extend(Text)
function textStyle(fontSize: number, fontWeight: number) {
  .fontSize(fontSize)
  .fontColor($r('app.color.start_window_background'))
  .fontWeight(fontWeight)
}

/**
 * Carousel banner.
 */
@Component
export struct Banner {
  // Change the index value through a scheduled task to perform a round robin.
  @State index: number = 0;
  private imageArray: Array<PictureItem> = [];
  private swiperController: SwiperController = new SwiperController();

  aboutToAppear() {
    // Data Initialization.
    this.imageArray = initializePictures(PictureType.BANNER);
    // Turn on scheduled task.
    startPlay(this.swiperController);
  }

  aboutToDisappear() {
    stopPlay();
  }

  build() {
    Swiper(this.swiperController) {
      ForEach(this.imageArray, (item: PictureItem) => {
        Stack({ alignContent: Alignment.TopStart }) {
          Image(item.image)
            .objectFit(ImageFit.Fill)
            .height(CommonConstants.FULL_HEIGHT)
            .width(CommonConstants.FULL_WIDTH)
            .borderRadius(CommonConstants.BORDER_RADIUS)
            .align(Alignment.Center)
            .onClick(() => {
              router.pushUrl({ url: CommonConstants.PLAY_PAGE });
            })

          Column() {
            Text($r('app.string.movie_classic'))
              .textStyle(CommonConstants.FONT_SIZE_DESCRIPTION, CommonConstants.FONT_WEIGHT_LIGHT)
              .opacity($r('app.float.opacity_deep'))
              .margin({ bottom: CommonConstants.BOTTOM_TEXT })
            Text(item.name)
              .textStyle(CommonConstants.FONT_SIZE_TITLE, CommonConstants.FONT_WEIGHT_BOLD)
          }
          .alignItems(HorizontalAlign.Start)
          .height(CommonConstants.HEIGHT_CAROUSEL_TITLE)
          .margin({ top: CommonConstants.TOP_ADS, left: CommonConstants.ADS_LEFT })
        }
        .height(CommonConstants.FULL_HEIGHT)
        .width(CommonConstants.FULL_WIDTH)
      }, (item: PictureItem) => JSON.stringify(item))
    }
    .width(CommonConstants.PAGE_WIDTH)
    .height(CommonConstants.HEIGHT_BANNER)
    .index(this.index)
    .indicatorStyle({ selectedColor: $r('app.color.start_window_background') })
    .indicator(true)
    .duration(CommonConstants.DURATION_ADS)
  }
}