/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License,Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import { StyleConstants, Logger, BreakpointSystem, BreakPointType } from '@ohos/common';
import { PageConstants } from '../constants/PageConstants';

@Entry
@Component
struct SplashPage {
  @StorageProp('currentBreakpoint') currentBreakpoint: string = 'sm';
  private breakpointSystem = new BreakpointSystem();
  private timeOutId: number = 0;

  build() {
    Flex({direction: FlexDirection.Column, alignItems: ItemAlign.Center}){
      Column() {
        Image($r('app.media.ic_eshop'))
          .width(new BreakPointType({
            sm: $r('app.float.splash_image_size'),
            md: $r('app.float.splash_image_size'),
            lg: $r('app.float.splash_image_size_lg')
          }).getValue(this.currentBreakpoint))
          .aspectRatio(PageConstants.IMAGE_ASPECT_RATIO)
          .objectFit(ImageFit.Contain)
      }
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .flexGrow(StyleConstants.FLEX_GROW)

      Image($r('app.media.ic_title'))
        .width($r('app.float.text_image_width'))
        .height($r('app.float.text_image_height'))
        .objectFit(ImageFit.Contain)
      Text($r('app.string.splash_desc'))
        .fontColor($r('app.color.forty_alpha_black'))
        .fontSize($r('app.float.bigger_font_size'))
        .letterSpacing(PageConstants.LETTER_SPACE)
        .margin({ top: $r('app.float.vp_twelve'), bottom: $r('app.float.splash_text_margin_bottom') })
    }
    .height(StyleConstants.FULL_HEIGHT)
    .width(StyleConstants.FULL_WIDTH)
    .backgroundColor($r('app.color.page_background'))
  }

  aboutToAppear() {
    this.breakpointSystem.register();
    this.timeOutId = setTimeout(() => {
      router.replaceUrl({ url: PageConstants.MAIN_PAGE_URL })
        .catch((err: Error) => {
          Logger.error(JSON.stringify(err));
        })
    }, PageConstants.DELAY_TIME);
  }

  aboutToDisappear() {
    this.breakpointSystem.unregister();
    clearTimeout(this.timeOutId);
  }
}