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

import { TopBar } from '../view/common/TopBar';
import { PageAll } from '../view/tabcontent/PageAll';
import { CommonConstants } from '../common/constants/CommonConstant';
import { PageLive } from '../view/tabcontent/PageLive';
import { PageGame } from '../view/tabcontent/PageGame';
import { PageEntertainment } from '../view/tabcontent/PageEntertainment';
import { PageTV } from '../view/tabcontent/PageTV';
import { PageMovie } from '../view/tabcontent/PageMovie';

/**
 * Application home page.
 */
@Entry
@Component
struct SwiperIndex {
  // Double binding of index values to achieve linkage effect.
  @State index: number = 0;

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start }) {
      TopBar({ index: $index })
      Swiper() {
        PageAll()
        PageMovie()
        PageTV()
        PageEntertainment()
        PageLive()
        PageGame()
      }
      .index(this.index)
      .indicator(false)
      .loop(false)
      .duration(CommonConstants.DURATION_PAGE)
      .onChange((index: number) => {
        this.index = index;
      })
    }
    .backgroundColor($r('app.color.start_window_background'))
  }
}