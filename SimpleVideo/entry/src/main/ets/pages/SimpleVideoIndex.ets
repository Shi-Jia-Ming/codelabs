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


import { VideoModule } from '../view/IndexModule';
import { SwiperVideo } from '../view/IndexSwiper';
import { LIST, MARGIN_FONT_SIZE, ALL_PERCENT } from '../common/constants/CommonConstants';

/**
 * The start index of the application
 */
@Entry
@Component
struct SimpleVideoIndex {
  build() {
    Column({ space: MARGIN_FONT_SIZE.FOURTH_MARGIN }) {
      SwiperVideo()
      List() {
        ForEach(LIST, (item: string) => {
          ListItem() {
            VideoModule({ moduleName: item })
              .margin({ top: MARGIN_FONT_SIZE.FIRST_MARGIN })
          }
        }, (item: string) => JSON.stringify(item))
      }
      .listDirection(Axis.Vertical)
      .margin({ top: MARGIN_FONT_SIZE.THIRD_MARGIN })
    }
    .width(ALL_PERCENT)
    .height(ALL_PERCENT)
    .backgroundColor($r("app.color.index_backgroundColor"))
  }
}