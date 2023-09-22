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

import nativeRender from 'libnativerender.so';
import { ContextType } from '../entryability/EntryAbility';
import CommonConstants from '../common/CommonConstants';

const nativePageLifecycle: Record<string, () => void> =
  nativeRender.getContext(ContextType.PAGE_LIFECYCLE) as Record<string, () => void>;

@Entry
@Component
struct Index {
  private xComponentContext: Record<string, () => void> = {};

  aboutToAppear(): void {
    console.log('[LIFECYCLE-Index] aboutToAppear');
    nativePageLifecycle.aboutToAppear();
  }

  aboutToDisappear(): void {
    console.log('[LIFECYCLE-Index] aboutToDisappear');
    nativePageLifecycle.aboutToDisappear();
  }

  onPageShow(): void {
    console.log('[LIFECYCLE-Page] onPageShow');
    nativePageLifecycle.onPageShow();
  }

  onPageHide(): void {
    console.log('[LIFECYCLE-Page] onPageHide');
    nativePageLifecycle.onPageHide();
  }

  build() {
    Column() {
      Row() {
        Text($r('app.string.title'))
          .fontSize($r('app.float.title_text_font_size'))
          .fontWeight(CommonConstants.FONT_WEIGHT)
          .margin({
            left: $r('app.float.title_text_margin_left'),
            top: $r('app.float.title_text_margin_top')
          })
      }
      .margin({ top: $r('app.float.title_margin_top') })
      .width(CommonConstants.FULL_PARENT)
      .height($r('app.float.title_height'))

      Column() {
        XComponent({
          id: CommonConstants.XCOMPONENT_ID,
          type: CommonConstants.XCOMPONENT_TYPE,
          libraryname: CommonConstants.XCOMPONENT_LIBRARY_NAME
        })
          .onLoad((xComponentContext?: object | Record<string, () => void>) => {
            if (xComponentContext) {
              this.xComponentContext = xComponentContext as Record<string, () => void>;
            }
          })
      }
      .margin({
        top: $r('app.float.xcomponent_margin_top'),
        left: $r('app.float.xcomponent_margin_left'),
        right: $r('app.float.xcomponent_margin_right')
      })
      .height(CommonConstants.XCOMPONENT_HEIGHT)

      Row() {
        Button($r('app.string.button_text'))
          .fontSize($r('app.float.button_font_size'))
          .fontWeight(CommonConstants.FONT_WEIGHT)
          .margin({ bottom: $r('app.float.button_margin_bottom') })
          .onClick(() => {
            if (this.xComponentContext) {
              this.xComponentContext.drawRectangle();
            }
          })
          .width(CommonConstants.BUTTON_WIDTH)
          .height($r('app.float.button_height'))
      }
      .width(CommonConstants.FULL_PARENT)
      .justifyContent(FlexAlign.Center)
      .alignItems(VerticalAlign.Bottom)
      .layoutWeight(CommonConstants.LAYOUT_WEIGHT)
    }
    .width(CommonConstants.FULL_PARENT)
    .height(CommonConstants.FULL_PARENT)
  }
}