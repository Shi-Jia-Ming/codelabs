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

import { CommonConstants as Const } from '../common/constants/CommonConstants';
import { swiperImage } from '../viewmodel/HomeViewModel';

/**
 * Swiper component.
 *
 * Usage: Directly reference SwiperComponent().
 */
@Component
export default struct SwiperComponent {
  build() {
    Swiper() {
      ForEach(swiperImage, (item: Resource) => {
        Image(item)
          .width(Const.FULL_WIDTH)
          .height($r('app.float.swiper_image_height'))
          .borderRadius($r('app.float.swiper_radius'))
          .backgroundColor(Color.White)
      }, (item: Resource) => JSON.stringify(item))
    }
    .indicatorStyle({ selectedColor: $r('app.color.indicator_select') })
    .autoPlay(true)
    .itemSpace(0)
    .width(Const.FULL_WIDTH)
    .indicator(true)
    .displayCount(1)
    .margin({
      top: $r('app.float.swiper_margin_top'),
      bottom: $r('app.float.swiper_margin_bottom')
    })
  }
}