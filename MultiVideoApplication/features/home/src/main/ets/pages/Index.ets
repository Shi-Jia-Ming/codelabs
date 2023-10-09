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
import { Home } from '../view/Home';

@Entry
@Component
struct Index {
  @StorageLink('currentBreakpoint') currentBreakpoint: string = BreakpointConstants.BREAKPOINT_LG;
  @StorageLink('videoGridColumn') videoGridColumn: string = CommonConstants.VIDEO_GRID_COLUMNS[0];

  build() {
    GridRow({
      columns: {
        sm: BreakpointConstants.GRID_ROW_COLUMNS[2],
        md: BreakpointConstants.GRID_ROW_COLUMNS[0],
        lg: BreakpointConstants.GRID_ROW_COLUMNS[0]
      }
    }) {
      GridCol({ span: {
        sm: BreakpointConstants.GRID_COLUMN_SPANS[5],
        md: BreakpointConstants.GRID_COLUMN_SPANS[0],
        lg: BreakpointConstants.GRID_COLUMN_SPANS[0]
      } }) {
        Home()
      }
      .height(CommonConstants.FULL_PERCENT)
      .width(CommonConstants.FULL_PERCENT)
    }
    .onBreakpointChange((breakPoints) => {
      this.currentBreakpoint = breakPoints;

      switch (breakPoints) {
        case BreakpointConstants.BREAKPOINT_SM:
          this.videoGridColumn = CommonConstants.VIDEO_GRID_COLUMNS[0];
          break;
        case BreakpointConstants.BREAKPOINT_MD:
          this.videoGridColumn = CommonConstants.VIDEO_GRID_COLUMNS[1];
          break;
        case BreakpointConstants.BREAKPOINT_LG:
          this.videoGridColumn = CommonConstants.VIDEO_GRID_COLUMNS[2];
          break;
        default:
          break;
      }
    })
  }
}