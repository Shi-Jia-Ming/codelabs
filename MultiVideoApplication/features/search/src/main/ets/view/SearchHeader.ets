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

import { CommonConstants } from '@ohos/commons';
import { SearchConstants } from '../constants/SearchConstants';

@Component
export struct SearchHeader {
  @Link isSearching: boolean;
  @Link searchInput: string;

  build() {
    Row() {
      Image($r('app.media.ic_public_back'))
        .height($r('app.float.search_header_back_img_size'))
        .width($r('app.float.search_header_back_img_size'))
        .margin({ right: $r('app.float.search_header_back_img_margin') })
        .onClick(() => {
          this.isSearching = false;
          this.searchInput = '';
        })

      Stack({ alignContent: Alignment.Start }) {
        // Search box.
        TextInput({ placeholder: SearchConstants.SEARCH_PLACEHOLDER, text: this.searchInput })
          .placeholderFont({
            size: $r('app.float.search_header_text_font'),
            weight: FontWeight.Normal
          })
          .height($r('app.float.search_header_text_height'))
          .fontSize($r('app.float.search_header_text_font'))
          .padding({
            left: $r('app.float.search_header_text_left'),
            right: $r('app.float.search_header_text_right')
          })
          .width(CommonConstants.FULL_PERCENT)
          .enableKeyboardOnFocus(false)
          .onChange((value: string) => {
            this.searchInput = value;
          })

        // Search image.
        Image($r("app.media.ic_public_search"))
          .width($r('app.float.search_header_search_img_size'))
          .height($r('app.float.search_header_search_img_size'))
          .margin({ left: $r('app.float.search_header_search_img_margin') })
      }
      .alignSelf(ItemAlign.Center)
      .layoutWeight(1)
    }
    .height($r('app.float.search_header_row_height'))
    .width(CommonConstants.FULL_PERCENT)
  }
}