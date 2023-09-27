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
import StyleConstants from '../common/constants/StyleConstants';
import CommonUtils from '../common/utils/CommonUtils';
import MovieDataBean from '../common/bean/MovieDataBean';
import StarsWidget from './StarsWidget';
import Logger from '../common/utils/Logger';

@Component
export default struct MovieDetailsTitle {
  private movieDetail: MovieDataBean = new MovieDataBean();
  private movieImage: Resource = $r('app.media.ic_movie_one');
  private title: string = '';
  private rating: string = '';
  private stars: Resource[] = [];
  private describe: string = '';

  aboutToAppear() {
    if (CommonUtils.isEmpty(this.movieDetail)) {
      Logger.error(CommonConstants.TAG_DETAILS_COMPONENT, 'movieDetail is null');
      return;
    }
    this.movieImage = this.movieDetail.movieImage;
    this.title = this.movieDetail.title;
    this.rating = this.movieDetail.rating;
    this.stars = this.movieDetail.stars;
    this.describe = this.movieDetail.describe;
  }

  build() {
    Row() {
      Image(this.movieImage)
        .objectFit(ImageFit.Cover)
        .borderRadius($r('app.float.title_image_radius'))
        .width($r('app.float.title_image_width'))
        .height($r('app.float.title_image_height'))
      Column() {
        Text(this.title)
          .fontSize($r('app.float.title_size'))
          .fontWeight(FontWeight.Bolder)
          .fontColor($r('app.color.common_font_color'))
          .alignSelf(ItemAlign.Start)
        StarsWidget({
          rating: this.rating,
          stars: this.stars
        })
        Text(this.describe)
          .fontSize($r('app.float.describe_size'))
          .fontColor($r('app.color.common_font_color'))
          .fontWeight(FontWeight.Normal)
          .opacity($r('app.float.common_opacity'))
          .alignSelf(ItemAlign.Start)
          .margin({ bottom: $r("app.float.describe_bottom") })
        Text($r('app.string.want_to_see'))
          .fontWeight(FontWeight.Bolder)
          .fontSize($r("app.float.see_button_size"))
          .textAlign(TextAlign.Center)
          .fontColor(Color.White)
          .borderRadius($r("app.float.see_button_radius"))
          .alignSelf(ItemAlign.Start)
          .backgroundColor($r("app.color.see_button_background"))
          .width($r("app.float.see_button_width"))
          .height($r("app.float.see_button_height"))
      }
      .layoutWeight(StyleConstants.WEIGHT_ONE)
      .margin({ left: $r('app.float.see_button_left') })
    }
    .alignSelf(ItemAlign.Start)
  }
}