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

import Constants from '../common/constants/Constants';
import IntroductionItem from '../common/bean/IntroductionItem';

@Extend(Text) function titleTextStyle() {
  .fontColor($r('app.color.title_font'))
  .fontFamily($r('app.string.HarmonyHeiTi_Medium'))
  .fontWeight(Constants.TITLE_FONT_WEIGHT)
}

@Component
export default struct IntroduceItemComponent {
  model: IntroductionItem = new IntroductionItem();

  build() {
    Column() {
      Text(this.model.name)
        .titleTextStyle()
        .fontSize($r('app.float.name_font_size'))
      Text(this.model.title)
        .titleTextStyle()
        .fontSize($r('app.float.title_font_size'))
        .fontFamily($r('app.string.HarmonyHeiTi'))
        .lineHeight($r('app.float.desc_line_height'))
        .margin({ top: $r('app.float.desc_margin_top') })
        .fontWeight(Constants.LABEL_FONT_WEIGHT)
      if (this.model.subTitle) {
        Text(this.model.subTitle)
          .titleTextStyle()
          .opacity($r('app.float.label_opacity'))
          .lineHeight($r('app.float.subtitle_line_height'))
          .fontSize($r('app.float.subtitle_font_size'))
          .fontFamily($r('app.string.HarmonyHeiTi'))
          .margin({ top: $r('app.float.subtitle_margin_top') })
          .fontWeight(Constants.LABEL_FONT_WEIGHT)
      }
      if (this.model.value.length > 0) {
        Text(this.model.value)
          .titleTextStyle()
          .fontColor($r('app.color.item_background'))
          .fontSize($r('app.float.name_font_size'))
          .textAlign(TextAlign.Center)
          .backgroundColor($r('app.color.blue_background'))
          .height($r('app.float.value_height'))
          .width(this.model.value)
          .borderRadius($r('app.float.value_border_radius'))
          .margin({ top: $r('app.float.item_padding') })
      } else {
        Column() {
          Text($r('app.string.font_desc', this.model.smallFontSize))
            .titleTextStyle()
            .fontSize(this.model.smallFontSize)
          Text($r('app.string.font_desc', this.model.largeFontSize))
            .titleTextStyle()
            .fontSize(this.model.largeFontSize)
            .margin({ top: $r('app.float.title_margin_top') })
        }
        .alignItems(HorizontalAlign.Start)
        .backgroundColor($r('app.color.font_background'))
        .width(Constants.FULL_PERCENT)
        .borderRadius($r('app.float.notice_border_radius'))
        .padding($r('app.float.item_padding'))
        .margin({ top: $r('app.float.item_padding') })
      }
    }
    .alignItems(HorizontalAlign.Start)
    .width(Constants.FULL_PERCENT)
    .padding($r('app.float.item_padding'))
    .borderRadius($r('app.float.item_border_radius'))
    .backgroundColor($r('app.color.item_background'))
  }
}