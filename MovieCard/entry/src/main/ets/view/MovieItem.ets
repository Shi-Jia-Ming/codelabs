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
import Logger from '../common/utils/Logger';
import CommonConstants from '../common/constants/CommonConstants';
import StyleConstants from '../common/constants/StyleConstants';
import MovieData from '../viewmodel/MovieData';
import StarsWidget from './StarsWidget';
import CommonUtils from '../common/utils/CommonUtils';

@Component
export default struct MovieItem {
  private movieItem: MovieData = new MovieData();
  private sort: number = 0;
  private isShowSort: boolean = true;
  private sortImage: Resource = $r('app.media.ic_first');
  private title: string = '冰山姐妹';
  private describe: string = '讲述冰上女运动员之间团结友爱，互帮互助的故事';
  private movieImage: Resource = $r('app.media.ic_movie_one');
  private stars: Resource[] = [];
  private rating: string = '9';

  aboutToAppear() {
    if (CommonUtils.isEmpty(this.movieItem)) {
      Logger.error(CommonConstants.TAG_MOVIE_ITEM, 'movieItem is null');
      return;
    }
    this.sort = this.movieItem.sort;
    this.isShowSort = this.movieItem.isShowSort;
    this.sortImage = this.movieItem.sortImage;
    this.title = this.movieItem.title;
    this.describe = this.movieItem.describe;
    this.movieImage = this.movieItem.movieImage;
    this.stars = this.movieItem.stars;
    this.rating = this.movieItem.rating;
  }

  build() {
    Row() {
      Stack({ alignContent: Alignment.TopStart }) {
        Image(this.movieImage)
          .objectFit(ImageFit.Cover)
          .borderRadius($r('app.float.movie_image_radius'))
          .width($r('app.float.movie_image_width'))
          .height($r('app.float.movie_image_height'))
        if (this.isShowSort) {
          Image(this.sortImage)
            .width($r('app.float.sort_image_size'))
            .height($r('app.float.sort_image_size'))
        }
      }
      .margin({ left: $r('app.float.movie_image_left') })

      Column() {
        Text(this.title)
          .fontSize($r('app.float.movie_text_size'))
          .fontWeight(FontWeight.Bolder)
          .fontColor($r('app.color.common_font_color'))
          .alignSelf(ItemAlign.Start)
        StarsWidget({
          rating: this.rating,
          stars: this.stars
        })
        Text(this.describe)
          .fontSize($r('app.float.describe_text_size'))
          .fontColor($r('app.color.common_font_color'))
          .fontWeight(FontWeight.Normal)
          .opacity($r('app.float.common_opacity'))
          .alignSelf(ItemAlign.Start)
      }
      .layoutWeight(StyleConstants.WEIGHT_ONE)
      .margin({
        left: $r('app.float.contents_layout_left'),
        right: $r('app.float.contents_layout_right')
      })

      Text($r('app.string.want_to_see'))
        .fontWeight(FontWeight.Bolder)
        .fontSize($r("app.float.see_button_size"))
        .textAlign(TextAlign.Center)
        .fontColor(Color.White)
        .borderRadius($r("app.float.see_button_radius"))
        .backgroundColor($r("app.color.see_button_background"))
        .margin({ right: $r('app.float.see_button_right') })
        .width($r("app.float.see_button_width"))
        .height($r("app.float.see_button_height"))
        .onClick(() => {
          router.pushUrl({
            url: CommonConstants.SEE_BUTTON_PUSH,
            params: {
              index: this.sort
            }
          }).catch((error: Error) => {
            Logger.error(CommonConstants.TAG_MOVIE_ITEM, 'push error ' + JSON.stringify(error));
          });
        })
    }
    .borderRadius($r('app.float.item_radius'))
    .backgroundColor(Color.White)
    .margin({
      left: $r('app.float.item_left'),
      right: $r('app.float.item_right')
    })
    .width(StyleConstants.ITEM_WIDTH)
    .height($r('app.float.item_height'))
  }
}