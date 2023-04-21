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

import { SWIPER_VIDEOS } from '../viewmodel/VideoData';
import { STRING_PERCENT, MARGIN_FONT_SIZE, SECOND_PAGE } from '../common/constants/CommonConstants';

/**
 * Picture carousel component
 */
@Component
export struct SwiperVideo {

  build() {
    Column() {
      Swiper() {
        ForEach(SWIPER_VIDEOS, item => {
          SwiperItem({ imageSrc: item.image, source: $rawfile('videoTest.mp4') })
        }, item => JSON.stringify(item))
      }
      .autoPlay(true)
    }
    .height(STRING_PERCENT.INDEX_SWIPER_HEIGHT_PERCENT)
    .width(STRING_PERCENT.INDEX_COMPONENT_WITH_PERCENT)
    .backgroundColor($r('app.color.white'))
    .margin({ 
	    left: STRING_PERCENT.INDEX_SWIPER_LEFT_RIGHT_MARGIN,
      right: STRING_PERCENT.INDEX_SWIPER_LEFT_RIGHT_MARGIN,
      top: MARGIN_FONT_SIZE.FOURTH_MARGIN
	})
  }
}

@Component
struct SwiperItem {
  private imageSrc: Resource;
  private source: Resource;

  build() {
    Navigator({ target: SECOND_PAGE, type: NavigationType.Push }) {
      Image(this.imageSrc)
        .borderRadius(MARGIN_FONT_SIZE.FIRST_MARGIN)
    }
    .params({ source: this.source })
  }
}

