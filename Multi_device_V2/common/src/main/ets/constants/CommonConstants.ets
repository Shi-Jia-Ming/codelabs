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

/**
 * Constants for components.
 */
export class CommonConstants {
  /**
   * Numeric constant: 1.
   */
  static readonly NUM_1: number = 1;

  /**
   * Numeric constant: 2.
   */
  static readonly NUM_2: number = 2;

  /**
   * Numeric constant: 3.
   */
  static readonly NUM_3: number = 3;

  /**
   * Numeric constant: 4.
   */
  static readonly NUM_4: number = 4;

  /**
   * Current component width: 4 grids.
   */
  static readonly GRID_4: number = 4;

  /**
   * Current component width: 6 grids.
   */
  static readonly GRID_6: number = 6;

  /**
   * Current component width: 8 grids.
   */
  static readonly GRID_8: number = 8;

  /**
   * Current component width: 12 grids.
   */
  static readonly GRID_12: number = 12;

  /**
   * Current component offset 0 grid.
   */
  static readonly OFFSET_0: number = 0;

  /**
   * Current component offset 1 grid.
   */
  static readonly OFFSET_1: number = 1;

  /**
   * Current component offset 2 grid.
   */
  static readonly OFFSET_2: number = 2;

  /**
   * Current component offset 4 grid.
   */
  static readonly OFFSET_4: number = 4;

  /**
   * Breakpoints that represent small device types.
   */
  static readonly SM: string = 'sm';

  /**
   * Breakpoints that represent middle device types.
   */
  static readonly MD: string = 'md';

  /**
   * Breakpoints that represent large device types.
   */
  static readonly LG: string = 'lg';

  /**
   * Dividing line of the small device width.
   */
  static readonly BREAKPOINTS_SM: string = '320vp';

  /**
   * Dividing line of the middle device width.
   */
  static readonly BREAKPOINTS_MD: string = '520vp';

  /**
   * Dividing line of the large device width.
   */
  static readonly BREAKPOINTS_LG: string = '840vp';

  /**
   * Range of the small device width.
   */
  static readonly BREAKPOINTS_SCOPE_1: string = '(320vp<=width<520vp)';

  /**
   * Range of the middle device width.
   */
  static readonly BREAKPOINTS_SCOPE_2: string = '(520vp<=width<840vp)';

  /**
   * Range of the large device width.
   */
  static readonly BREAKPOINTS_SCOPE_3: string = '(840vp<=width)';

  /**
   * Constant for search text
   */
  static readonly SEARCH_TEXT: string = '搜索...';

  /**
   * Constant for font weight
   */
  static readonly FONT_WEIGHT: number = 500;

  /**
   * Constant for item space
   */
  static readonly ITEM_SPACE: number  = 12;

  /**
   * Constant for opacity
   */
  static readonly OPACITY: number  = 0.6;

  /**
   * Component size percentage: 100%.
   */
  static readonly FULL_SIZE: string = '100%';

  /**
   * Bottom image size percentage: 40%.
   */
  static readonly BOTTOM_IMAGE_SIZE: string = '40%';

  /**
   * Bottom tab width percentage: 25%.
   */
  static readonly BOTTOM_TAB_WIDTH: string = '25%';

  /**
   * Bottom tab height percentage: 10%.
   */
  static readonly BOTTOM_TAB_HEIGHT: string = '10%';

  /**
   * Sidebar width percentage: 10%.
   */
  static readonly SIDEBAR_WIDTH: string = '10%';

  /**
   * Sidebar max width percentage: 15%.
   */
  static readonly SIDEBAR_WIDTH_MAX: string = '15%';

  /**
   * Sidebar min width percentage: 8%.
   */
  static readonly SIDEBAR_WIDTH_MIN: string = '8%';

  /**
   * Row width percentage: 25%.
   */
  static readonly ROW_WIDTH: string = '25%';

  /**
   * Left image size percentage: 30%.
   */
  static readonly LEFT_IMAGE_SIZE: string = '30%';

  /**
   * Left tab width percentage: 10%.
   */
  static readonly LEFT_TAB_WIDTH: string = '10%';

  /**
   * Left tab height percentage: 12.5%.
   */
  static readonly LEFT_TAB_HEIGHT: string = '12.5%';

  /**
   * Mine column height percentage: 60%.
   */
  static readonly MINE_COLUMN_HEIGHT: string = '60%';

  /**
   * Mine image location of x-axis percentage: 50%.
   */
  static readonly MINE_IMAGE_X: string = '50%';

  /**
   * Mine image location of y-axis percentage: 40%.
   */
  static readonly MINE_IMAGE_Y: string = '40%';
}