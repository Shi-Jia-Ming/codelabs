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

import BannerData from '../../common/bean/BannerData';
import { Banner } from '../../common/constants/HomeConstants';
import { PERCENTAGE_100, PERCENTAGE_20 } from '../../common/constants/Constants';

@Component
export default struct BannerComponent {
  bannerList: BannerData[];

  build() {
    Column({ space: Banner.SPACE }) {
      Swiper() {
        ForEach(this.bannerList, (item) => {
          Image(item.imgSrc)
            .width(PERCENTAGE_100)
            .objectFit(ImageFit.Contain)
        })
      }
      .cachedCount(Banner.CACHE_COUNT)
      .index(Banner.POSITION)
      .autoPlay(true)
      .interval(Banner.TIME)
      .indicator(true)
      .loop(true)
      .duration(Banner.DURATION)
      .vertical(false)
      .itemSpace(Banner.ITEM_SPACE)
      .indicatorStyle({
        size: Banner.INDICATOR_SIZE,
        color: $r('app.color.background'),
        selectedColor: $r('app.color.homepage_indicator_selected')
      })
      .curve(Curve.Linear)
    }
    .width(Banner.WIDTH)
    .height(PERCENTAGE_20)
  }
}