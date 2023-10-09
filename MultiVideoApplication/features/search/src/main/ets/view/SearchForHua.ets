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
import { Logger } from '@ohos/commons';
import { SearchConstants } from '../constants/SearchConstants';

@Component
export struct SearchForHua {
  @StorageLink('currentBreakpoint') currentBreakpoint: string = BreakpointConstants.BREAKPOINT_LG;
  @Link searchInput: string;

  build() {
    Column() {
      List() {
        ForEach(SearchConstants.HUA_LIST, (item: string, index: number) => {
          ListItem() {
            Column() {
              Text(item)
                .fontSize($r('app.float.search_hua_list_font'))
                .fontWeight(CommonConstants.FONT_WEIGHT_500)
                .height($r('app.float.search_hua_list_text_height'))

              Divider()
                .color(Color.Black)
                .height($r('app.float.search_hua_divider_height'))
                .opacity(CommonConstants.DIVIDER_OPACITY)
                .width(CommonConstants.FULL_PERCENT)
            }
            .alignItems(HorizontalAlign.Start)
            .margin({ right: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG && index %
              SearchConstants.SEARCH_INDEX[0] === 0 ? $r('app.float.search_hua_column_margin_lg') : 0 })
            .height($r('app.float.search_hua_column_height'))
            .onClick(() => {
              if (index === SearchConstants.SEARCH_INDEX[1]) {
                this.searchInput = item;
              } else {
                Logger.info(`Please click on the third list item`);
              }
            })
          }
        })
      }
      .lanes(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ? SearchConstants.SEARCH_LIST_LANES[1] :
        SearchConstants.SEARCH_LIST_LANES[2])
    }
    .layoutWeight(1)
    .padding({ top: $r('app.float.search_hua_list_padding') })
  }
}