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
import Logger from '../common/utils/Logger';
import CommonConstants from '../common/constants/CommonConstants';

/**
 * Stay on the advertising page for a few seconds to jump to the home page.
 */
@Entry
@Component
struct AdvertisingPage {
  @State countDownSeconds: number = CommonConstants.ADVERTISING_COUNT_DOWN_SECONDS;
  private timeId: number;

  onPageShow() {
    this.timeId = setInterval(() => {
      if (this.countDownSeconds == 0) {
        this.jumpToAppHomePage();
      } else {
        this.countDownSeconds--;
      }
    }, CommonConstants.ADVERTISING_INTERVAL_TIME);
  }

  onPageHide() {
    router.clear();
    clearInterval(this.timeId);
  }

  /**
   * Jump to app home page.
   */
  jumpToAppHomePage() {
    router.pushUrl({
      url: CommonConstants.APP_HOME_PAGE_URL
    }).catch((error) => {
      Logger.error(CommonConstants.ADVERTISING_PAGE_TAG, 'AdvertisingPage pushUrl error ' + JSON.stringify(error));
    });
  }

  build() {
    Stack({ alignContent: Alignment.Top }) {
      Image($r('app.media.ic_advertising_background'))
        .width(CommonConstants.FULL_WIDTH)
        .height(CommonConstants.FULL_HEIGHT)
      Text($r('app.string.advertising_text_title', this.countDownSeconds))
        .fontColor(Color.White)
        .fontSize($r('app.float.advertising_text_font_size'))
        .letterSpacing(CommonConstants.ADVERTISING_TITLE_TEXT_LETTER_SPACING)
        .backgroundColor($r('app.color.advertising_text_background_color'))
        .border({
          radius: $r('app.float.advertising_text_radius'),
          width: $r('app.float.advertising_text_border_width'),
          color: Color.White
        })
        .margin({
          top: $r('app.float.advertising_title_text_margin_top'),
          left: $r('app.float.advertising_title_text_margin_left')
        })
        .padding({
          left: $r('app.float.advertising_text_padding_left'),
          top: $r('app.float.advertising_text_padding_top'),
          right: $r('app.float.advertising_text_padding_left'),
          bottom: $r('app.float.advertising_text_padding_bottom')
        })
        .onClick(() => {
          this.jumpToAppHomePage();
        })
      Row() {
        Image($r('app.media.ic_logo'))
          .width($r('app.float.advertising_image_width'))
          .height($r('app.float.advertising_image_height'))
          .margin({ bottom: CommonConstants.ADVERTISING_ROW_MARGIN_BOTTOM })
        Column() {
          Text($r('app.string.healthy_life_text'))
            .bottomTextStyle(FontWeight.Bolder,
            CommonConstants.ADVERTISING_HEALTHY_LIFE_TEXT_SPACING,
            $r('app.float.advertising_text_title_size'),
            $r('app.color.advertising_text_title_color'))
          Text($r('app.string.healthy_life_introduce'))
            .bottomTextStyle(FontWeight.Normal,
            CommonConstants.ADVERTISING_TEXT_INTRODUCE_LETTER_SPACING,
            $r('app.float.advertising_text_introduce_size'),
            $r('app.color.launcher_text_introduce_color'))
            .opacity($r('app.float.advertising_text_opacity'))
            .margin({ top: CommonConstants.ADVERTISING_TEXT_INTRODUCE_MARGIN_TOP })
        }
        .alignItems(HorizontalAlign.Start)
        .margin({
          left: CommonConstants.ADVERTISING_COLUMN_MARGIN_LEFT,
          bottom: CommonConstants.ADVERTISING_ROW_MARGIN_BOTTOM
        })
      }
      .alignItems(VerticalAlign.Bottom)
      .height(CommonConstants.FULL_HEIGHT)
    }
    .width(CommonConstants.FULL_WIDTH)
    .height(CommonConstants.FULL_HEIGHT)
  }
}
// Bottom text common style.
@Extend(Text) function bottomTextStyle (fontWeight: number,
  textAttribute: number, fontSize: Resource, fontColor: Resource) {
    .fontWeight(fontWeight)
    .letterSpacing(textAttribute)
    .fontSize(fontSize)
    .fontColor(fontColor)
}
