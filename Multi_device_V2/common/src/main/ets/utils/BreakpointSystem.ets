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

import mediaQuery from '@ohos.mediaquery';
import { CommonConstants as Const } from '../constants/CommonConstants';

export class BreakpointSystem {
  private currentBreakpoint: string = Const.MD;
  private smListener: mediaQuery.MediaQueryListener;
  private mdListener: mediaQuery.MediaQueryListener;
  private lgListener: mediaQuery.MediaQueryListener;

  private updateCurrentBreakpoint(breakpoint: string) {
    if (this.currentBreakpoint !== breakpoint) {
      this.currentBreakpoint = breakpoint;
      AppStorage.Set<string>('currentBreakpoint', this.currentBreakpoint);
    }
  }

  private isBreakpointSM = (mediaQueryResult) => {
    if (mediaQueryResult.matches) {
      this.updateCurrentBreakpoint(Const.SM);
    }
  }

  private isBreakpointMD = (mediaQueryResult) => {
    if (mediaQueryResult.matches) {
      this.updateCurrentBreakpoint(Const.MD);
    }
  }

  private isBreakpointLG = (mediaQueryResult) => {
    if (mediaQueryResult.matches) {
      this.updateCurrentBreakpoint(Const.LG);
    }
  }

  public register() {
    this.smListener = mediaQuery.matchMediaSync(Const.BREAKPOINTS_SCOPE_1);
    this.smListener.on('change', this.isBreakpointSM);
    this.mdListener = mediaQuery.matchMediaSync(Const.BREAKPOINTS_SCOPE_2);
    this.mdListener.on('change', this.isBreakpointMD);
    this.lgListener = mediaQuery.matchMediaSync(Const.BREAKPOINTS_SCOPE_3);
    this.lgListener.on('change', this.isBreakpointLG);
  }

  public unregister() {
    this.smListener.off('change', this.isBreakpointSM);
    this.mdListener.off('change', this.isBreakpointMD);
    this.lgListener.off('change', this.isBreakpointLG);
  }
}