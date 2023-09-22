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
import ConversionItem from '../common/bean/ConversionItem';

@Extend(Text) function descTextStyle() {
  .fontColor($r('app.color.title_font'))
  .fontSize($r('app.float.title_font_size'))
  .fontFamily($r('app.string.HarmonyHeiTi'))
  .lineHeight($r('app.float.desc_line_height'))
  .fontWeight(Constants.LABEL_FONT_WEIGHT)
  .margin({ top: $r('app.float.desc_margin_top') })
}

@Extend(Text) function titleTextStyle() {
  .fontColor($r('app.color.title_font'))
  .fontSize($r('app.float.name_font_size'))
  .fontFamily($r('app.string.HarmonyHeiTi_Medium'))
  .fontWeight(Constants.TITLE_FONT_WEIGHT)
}

@Styles function blueStyle() {
  .backgroundColor($r('app.color.blue_background'))
  .height($r('app.float.value_height'))
  .borderRadius($r('app.float.value_border_radius'))
  .margin({ top: $r('app.float.blue_margin_top') })
}

@Component
export default struct ConversionItemComponent {
  model: ConversionItem = new ConversionItem();

  build() {
    Column() {
      Text(this.model.title)
        .titleTextStyle()
        .margin({ top: $r('app.float.title_margin_top') })
      Text(this.model.subTitle)
        .descTextStyle()
        .opacity($r('app.float.label_opacity'))
      Row()
        .blueStyle()
        .width(this.model.value)
      Text(this.model.conversionTitle)
        .titleTextStyle()
        .margin({ top: $r('app.float.item_margin_top') })
      Text(this.model.conversionSubTitle)
        .descTextStyle()
        .opacity($r('app.float.label_opacity'))
      Row()
        .blueStyle()
        .width(this.model.conversionValue)
      if (this.model.notice) {
        Text(this.model.notice)
          .descTextStyle()
          .fontColor($r('app.color.notice_font'))
      }
    }
    .alignItems(HorizontalAlign.Start)
    .width(Constants.FULL_PERCENT)
    .padding($r('app.float.item_padding'))
    .borderRadius($r('app.float.item_border_radius'))
    .backgroundColor($r('app.color.item_background'))
  }
}