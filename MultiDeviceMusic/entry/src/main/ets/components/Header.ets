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

import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import { BreakpointType } from '../common/utils/BreakpointSystem';

import { MenuData } from '../viewmodel/MenuData';
import { StyleConstants } from '../common/constants/StyleConstants';
import { HeaderConstants } from '../common/constants/HeaderConstants';

@Component
export struct Header {
  @Link currentBreakpoint: string;

  build() {
    Row() {
      Image($r('app.media.ic_back'))
        .width($r('app.float.icon_width'))
        .height($r('app.float.icon_height'))
        .margin({ left: $r('app.float.icon_margin') })
        .onClick(() => {
          router.back()
        })
      Text($r('app.string.play_list'))
        .fontSize(new BreakpointType({
          sm: $r('app.float.header_font_sm'),
          md: $r('app.float.header_font_md'),
          lg: $r('app.float.header_font_lg')
        }).getValue(this.currentBreakpoint))
        .fontWeight(HeaderConstants.TITLE_FONT_WEIGHT)
        .fontColor($r('app.color.title_color'))
        .opacity($r('app.float.title_opacity'))
        .letterSpacing(HeaderConstants.LETTER_SPACING)
        .padding({ left: $r('app.float.title_padding_left') })

      Blank()

      Image($r('app.media.ic_more'))
        .width($r('app.float.icon_width'))
        .height($r('app.float.icon_height'))
        .margin({ right: $r('app.float.icon_margin') })
        .bindMenu(this.getMenu())
    }
    .width(StyleConstants.FULL_WIDTH)
    .height($r('app.float.title_bar_height'))
    .zIndex(HeaderConstants.Z_INDEX)
  }

  getMenu(): MenuData[] {
    let menuItem: MenuData = new MenuData();
    let menuDatas: MenuData[] = [];
    if (canIUse(HeaderConstants.SYSCAP_ETHERNET)) {
      menuItem.value = HeaderConstants.AUDIO_DEVICE_SERVICE;
      menuItem.action = (): void => {
        promptAction.showToast({
          message: HeaderConstants.AUDIO_DEVICE_SERVICE,
          duration: HeaderConstants.TOAST_DURATION
        });
      };
      menuDatas.push(menuItem);
    }
    return menuDatas;
  }
}