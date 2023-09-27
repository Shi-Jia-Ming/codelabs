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
 * See the License for the specific language go
 verning permissions and
 * limitations under the License.
 */

import { BreakpointSystem } from '../common/utils/BreakpointSystem';
import { MediaService } from '../common/utils/MediaService';
import { StyleConstants } from '../common/constants/StyleConstants';
import { BreakpointConstants } from '../common/constants/BreakpointConstants';
import { SongConstants } from '../common/constants/SongConstants';
import { Header } from '../components/Header';
import { Player } from '../components/Player';
import { Content } from '../components/Content';

@Entry
@Component
struct MusicList {
  private breakpointSystem: BreakpointSystem = new BreakpointSystem();
  @State currentBreakpoint: string = BreakpointConstants.BREAKPOINT_SM;

  aboutToAppear() {
    MediaService.getInstance();
    this.breakpointSystem.register();
  }

  aboutToDisappear() {
    this.breakpointSystem.unregister();
  }

  build() {
    Stack({ alignContent: Alignment.Top }) {
      Header({ currentBreakpoint: $currentBreakpoint })
      Content({ currentBreakpoint: $currentBreakpoint })
      Player({ currentBreakpoint: $currentBreakpoint })
    }
    .width(StyleConstants.FULL_WIDTH)
    .backgroundColor(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ?
    $r('app.color.page_background_sm') : $r('app.color.page_background_other'))
  }

  pageTransition() {
    PageTransitionEnter({ duration: SongConstants.TRANSITION_DURATION, curve: Curve.Smooth, type: RouteType.Pop })
    PageTransitionExit({ duration: SongConstants.TRANSITION_DURATION, curve: Curve.Smooth, type: RouteType.Push })
  }
}