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

import { AppFontSize, AppFontWeight } from '../../common/constants/Constants';
import { SearchBar } from '../../common/constants/HomeConstants';

@Component
export default struct SearchComponent {
  build() {
    Row() {
      Row() {
        Image($rawfile('index/search.png'))
          .width(SearchBar.IMAGE_SIZE)
          .height(SearchBar.IMAGE_SIZE)
      }

      TextInput({ placeholder: $r('app.string.homepage_search_hot_word') })
        .placeholderColor($r('app.color.index_search_hot_word'))
        .placeholderFont({ size: AppFontSize.SMALL, weight: AppFontWeight.BOLD, })
        .width(SearchBar.WEIGHT)
        .margin({ right: SearchBar.TEXT_INPUT_MARGIN_RIGHT })
        .backgroundColor($r('app.color.background'))
        .fontSize(AppFontSize.SMALL)
        .fontWeight(FontWeight.Bold)
        .fontStyle(FontStyle.Normal)
    }
    .padding({ left: SearchBar.CONTAINER_PADDING_LEFT })
    .borderRadius(SearchBar.BORDER_RADIUS)
    .backgroundColor($r('app.color.background'))
    .width(SearchBar.WEIGHT)
    .height(SearchBar.BAR_HEIGHT)
  }
}