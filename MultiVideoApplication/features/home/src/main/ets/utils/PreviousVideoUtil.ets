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

import { BreakpointConstants } from '@ohos/commons';
import { HomeConstants } from '../constants/HomeConstants';

export class PreviousVideoUtil {
  static getImgAspectRatio(currentBreakpoint: string, index: number): number {
    if (currentBreakpoint === BreakpointConstants.BREAKPOINT_SM) {
      switch (index) {
        case 2:
          return HomeConstants.PREVIOUS_TWO_RATIOS[0];
        case 3:
          return HomeConstants.PREVIOUS_TWO_RATIOS[1];
        default:
          return HomeConstants.PREVIOUS_TWO_RATIOS[2];
      }
    } else if (currentBreakpoint === BreakpointConstants.BREAKPOINT_MD) {
      switch (index) {
        case 2:
          return HomeConstants.PREVIOUS_TWO_RATIOS[3];
        case 3:
          return HomeConstants.PREVIOUS_TWO_RATIOS[2];
        case 4:
          return HomeConstants.PREVIOUS_TWO_RATIOS[4];
        case 5:
          return HomeConstants.PREVIOUS_TWO_RATIOS[5];
        default:
          return HomeConstants.PREVIOUS_TWO_RATIOS[6];
      }
    } else {
      switch (index) {
        case 2:
          return HomeConstants.PREVIOUS_TWO_RATIOS[3];
        case 3:
          return HomeConstants.PREVIOUS_TWO_RATIOS[2];
        case 4:
          return HomeConstants.PREVIOUS_TWO_RATIOS[4];
        default:
          return HomeConstants.PREVIOUS_TWO_RATIOS[6];
      }
    }
  }
}