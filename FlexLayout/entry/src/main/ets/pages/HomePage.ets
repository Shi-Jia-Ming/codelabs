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

import StyleConstants from '../common/constants/StyleConstants';
import SearchInput from '../view/SearchInput';
import ClearSearch from '../view/ClearSearch';
import FlexLayout from '../view/FlexLayout';
import SearchViewModel from '../viewmodel/SearchViewModel';

@Entry
@Component
struct HomePage {
  @State searchArr: Array<string> = SearchViewModel.getSearchArrData();

  build() {
    Column() {
      // Customized component of the search text box.
      SearchInput({ searchArr: $searchArr})
      // Clear Search Records Custom Component.
      ClearSearch({ searchArr: $searchArr })
      // Flexible Layout Customization Component.
      FlexLayout({ searchArr: $searchArr })
    }
    .height(StyleConstants.FULL_PERCENT)
    .width(StyleConstants.FULL_PERCENT)
    .alignItems(HorizontalAlign.Center)
    .backgroundColor($r('app.color.index_background'))
  }
}