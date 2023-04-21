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

import { Header } from '@ohos/header';
import { Player } from '@ohos/player';
import { Content } from '@ohos/content';
import { BreakpointSystem } from '@ohos/common';
import { StyleConstants } from '@ohos/common';
import { BreakpointConstants } from '@ohos/common';

@Entry
@Component
struct MainPage {
  private breakpointSystem: BreakpointSystem = new BreakpointSystem();
  @StorageProp('currentBreakpoint') currentBreakpoint: string = 'sm';

  aboutToAppear() {
    this.breakpointSystem.register();
  }

  aboutToDisappear() {
    this.breakpointSystem.unregister();
  }

  build() {
    Stack({ alignContent: Alignment.Top }) {
      Header()
      Content()
      Player()
    }
    .width(StyleConstants.FULL_WIDTH)
    .backgroundColor(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ?
      $r('app.color.page_background_sm') : $r('app.color.page_background_other'))
  }
}