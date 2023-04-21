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
 * Constants for breakpoint.
 */
export class BreakpointConstants {
  /**
   * Breakpoints that represent small device types.
   */
  static readonly BREAKPOINT_SM: string = 'sm';

  /**
   * Breakpoints that represent middle device types.
   */
  static readonly BREAKPOINT_MD: string = 'md';

  /**
   * Breakpoints that represent large device types.
   */
  static readonly BREAKPOINT_LG: string = 'lg';

  /**
   * Current breakpoints that to query the device types.
   */
  static readonly CURRENT_BREAKPOINT: string = 'currentBreakpoint';

  /**
   * Font size of the current device types.
   */
  static readonly FONT_SIZE: string = 'fontSize';

  /**
   * Album cover margin for the current device type.
   */
  static readonly COVER_MARGIN: string = 'coverMargin';

  /**
   * Font size of the small device type.
   */
  static readonly FONT_SIZE_SM: number = 14;

  /**
   * Font size of the middle device type.
   */
  static readonly FONT_SIZE_MD: number = 16;

  /**
   * Font size of the large device type.
   */
  static readonly FONT_SIZE_LG: number = 18;

  /**
   * Cover margin of the small device type.
   */
  static readonly COVER_MARGIN_SM: number = 10;

  /**
   * Cover margin of the middle device type.
   */
  static readonly COVER_MARGIN_MD: number = 30;

  /**
   * Cover margin of the large device type.
   */
  static readonly COVER_MARGIN_LG: number = 40;

  /**
   * Range of the small device width.
   */
  static readonly RANGE_SM: string = '(320vp<=width<600vp)';

  /**
   * Range of the middle device width.
   */
  static readonly RANGE_MD: string = '(600vp<=width<840vp)';

  /**
   * Range of the large device width.
   */
  static readonly RANGE_LG: string = '(840vp<=width)';
}