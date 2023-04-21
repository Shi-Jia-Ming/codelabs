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

import router from '@ohos.router';
import Constants from '../common/constants/Constants';
import Logger from '../common/utils/Logger';
import PhotoItem from '../view/PhotoItem';

@Entry
@Component
struct IndexPage {
  swiperController: SwiperController = new SwiperController();
  scroller: Scroller = new Scroller();
  @State currentIndex: number = 0;
  @State angle: number = 0;

  build() {
    Column() {
      Row() {
        Text($r('app.string.EntryAbility_label'))
          .fontSize($r('app.float.title_font_size'))
          .fontWeight(Constants.TITLE_FONT_WEIGHT)
      }
      .height($r('app.float.navi_bar_height'))
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.Start)
      .margin({ top: $r('app.float.grid_padding') })
      .padding({ left: $r('app.float.title_padding') })
      .width(Constants.FULL_PERCENT)

      Swiper(this.swiperController) {
        ForEach(Constants.BANNER_IMG_LIST, (item: Resource) => {
          Row() {
            Image(item)
              .width(Constants.FULL_PERCENT)
              .height(Constants.FULL_PERCENT)
          }
          .width(Constants.FULL_PERCENT)
          .aspectRatio(Constants.BANNER_ASPECT_RATIO)
        }, (item, index) => JSON.stringify(item) + index)
      }
      .autoPlay(true)
      .loop(true)
      .margin($r('app.float.grid_padding'))
      .borderRadius($r('app.float.img_border_radius'))
      .clip(true)
      .duration(Constants.BANNER_ANIMATE_DURATION)
      .indicator(false)

      Grid() {
        ForEach(Constants.IMG_ARR, (photoArr: Array<Resource>) => {
          GridItem() {
            PhotoItem({ photoArr })
          }
          .width(Constants.FULL_PERCENT)
          .aspectRatio(Constants.STACK_IMG_RATIO)
          .onClick(() => {
            router.pushUrl({
              url: Constants.URL_LIST_PAGE,
              params: { photoArr: photoArr }
            }).catch((error) => {
              Logger.error(Constants.TAG_INDEX_PAGE, JSON.stringify(error));
            });
          })
        }, (item, index) => JSON.stringify(item) + index)
      }
      .columnsTemplate(Constants.INDEX_COLUMNS_TEMPLATE)
      .columnsGap($r('app.float.grid_padding'))
      .rowsGap($r('app.float.grid_padding'))
      .padding({ left: $r('app.float.grid_padding'), right: $r('app.float.grid_padding') })
      .width(Constants.FULL_PERCENT)
      .layoutWeight(1)
    }
    .width(Constants.FULL_PERCENT)
    .height(Constants.FULL_PERCENT)
  }
}