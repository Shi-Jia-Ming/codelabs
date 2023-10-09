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

import { BreakpointConstants, CommonConstants } from '@ohos/commons';
import { SearchConstants } from '../constants/SearchConstants';
import { SearchVideoImg, SearchVideoImgModel } from '../viewmodel/SearchVideoImgViewModel';
import { SearchContent } from './SearchContent';
import { SearchForHua } from './SearchForHua';
import { SearchHeader } from './SearchHeader';
import { SearchResult } from './SearchResult';

@Component
export struct SearchView {
  @StorageLink('currentBreakpoint') currentBreakpoint: string = BreakpointConstants.BREAKPOINT_LG;
  @State currentIndex: number = 0;
  @State searchVideoList: SearchVideoImg[] = [];
  @State searchInput: string = '';
  @Link isSearching: boolean;
  @Link currentTopIndex: number;

  build() {
    GridRow({
      columns: {
        sm: BreakpointConstants.GRID_ROW_COLUMNS[2],
        md: BreakpointConstants.GRID_ROW_COLUMNS[0],
        lg: BreakpointConstants.GRID_ROW_COLUMNS[0]
      }
    }) {
      GridCol({
        span: {
          sm: BreakpointConstants.GRID_COLUMN_SPANS[5],
          md: BreakpointConstants.GRID_COLUMN_SPANS[0],
          lg: BreakpointConstants.GRID_COLUMN_SPANS[0]
        }
      }) {
        Column() {
          SearchHeader({ isSearching: $isSearching, searchInput: $searchInput })
          SearchContent({ searchVideoList: $searchVideoList })
            .layoutWeight(1)
            .visibility(this.searchInput === SearchConstants.SEARCH_INPUT_LIST[0] || this.searchInput ===
              SearchConstants.SEARCH_INPUT_LIST[1] ? Visibility.None : Visibility.Visible)
          SearchForHua({ searchInput: $searchInput })
            .layoutWeight(1)
            .visibility(this.searchInput === SearchConstants.SEARCH_INPUT_LIST[0] ? Visibility.Visible :
              Visibility.None)
          SearchResult()
            .layoutWeight(1)
            .visibility(this.searchInput === SearchConstants.SEARCH_INPUT_LIST[1] ? Visibility.Visible :
              Visibility.None)
        }
        .height(CommonConstants.FULL_PERCENT)
        .width(CommonConstants.FULL_PERCENT)
        .padding({
          left: $r('app.float.search_view_grid_col_padding'),
          right: $r('app.float.search_view_grid_col_padding')
        })
      }
    }
    .padding({ left: (this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG) && (this.currentTopIndex === 2) ?
      $r('app.float.search_view_grid_row_padding') : 0 })
    .onBreakpointChange((breakPoints) => {
      this.searchVideoList = new SearchVideoImgModel().getTrendSearchList(breakPoints);
    })
  }
}
