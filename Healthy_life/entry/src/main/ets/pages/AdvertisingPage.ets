/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { CommonConstants as Const } from '../common/constants/CommonConstants';

@Entry
@Component
struct AdvertisingPage {
  @State duration: number = Const.AD_DURATION;
  private intervalId: number = -1;

  goToHomePage() {
    clearInterval(this.intervalId);
    router.replaceUrl({ url: 'pages/MainPage' });
  }

  aboutToAppear() {
    this.intervalId = setInterval(() => {
      if (this.duration > 0) {
        this.duration -= 1;
      } else {
        this.goToHomePage();
      }
    }, Const.DURATION_1000)
  }

  build() {
    Column() {
      Row() {
        Text($r('app.string.jump_ad', this.duration))
          .fontSize($r('app.float.default_12'))
          .fontColor($r('app.color.white'))
          .borderRadius($r('app.float.default_16'))
          .letterSpacing(Const.LETTER_1)
          .height($r('app.float.default_36'))
          .backgroundColor('rgba(0,0,0,0.20)')
          .border({ color: $r('app.color.white'), width: $r('app.float.default_1') })
          .margin({ top: $r('app.float.default_36') })
          .padding($r('app.float.default_8'))
          .onClick(() => this.goToHomePage())
      }
      .width('90%')
      .justifyContent(FlexAlign.End)

      Row() {
        Image($r('app.media.logo'))
          .width($r('app.float.default_56'))
          .height($r('app.float.default_56'))
          .objectFit(ImageFit.Contain)
        Column({ space: Const.SPACE_4 }) {
          Text($r('app.string.EntryAbility_label'))
            .fontFamily($r('app.string.HarmonyHeiTi_Bold'))
            .fontSize($r('app.float.default_26'))
            .fontColor($r('app.color.titleColor'))
            .fontWeight(Const.FONT_WEIGHT_700)
            .letterSpacing(Const.LETTER_1)
          Text($r('app.string.EntryAbility_desc'))
            .fontFamily($r('app.string.HarmonyHeiTi'))
            .fontColor($r('app.color.titleColor'))
            .fontWeight(Const.FONT_WEIGHT_400)
            .letterSpacing(Const.LETTER_34)
            .opacity(Const.OPACITY_4)
            .fontSize($r('app.float.default_16'))
        }
        .alignItems(HorizontalAlign.Start)
        .margin({ left: $r('app.float.default_12') })
      }
      .height($r('app.float.default_100'))
      .width('100%')
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
    .backgroundImagePosition({x: 0, y: 0})
    .backgroundImage($r('app.media.ic_ad_bg'))
    .backgroundImageSize({ width: '100%', height: '100%' })
    .justifyContent(FlexAlign.SpaceBetween)
  }
}