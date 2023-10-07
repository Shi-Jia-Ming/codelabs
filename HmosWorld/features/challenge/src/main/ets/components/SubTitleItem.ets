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

import { ChallengeConstants as Const } from '../constants/ChallengeConstants';
import ZonesItem from '../entity/ZonesItem';

@Component
export default struct SubTitleItem {
  @State imgHeight: number = Math.ceil((AppStorage.get('deviceWidth') as number) / Const.TOP_IMG_ASPECT);
  @Consume('introductionData') introductionData: ZonesItem;
  @Prop topImgOffset: number = 0;

  build() {
    Column() {
      Text(this.introductionData.title)
        .fontSize($r('app.float.navigation_title_size'))
        .fontColor($r('app.color.white'))
        .fontWeight(FontWeight.Medium)
        .margin({ top: $r('app.float.zone_title_margin') })
      Text(this.introductionData.subTitle)
        .fontSize($r('app.float.font_size_normal'))
        .margin({ bottom: $r('app.float.navigation_margin'), top: $r('app.float.normal_margin') })
        .fontColor($r('app.color.desc_white_font_color'))
      Image(this.introductionData.starLinePic[0])
        .height($r('app.float.star_img_height'))
        .aspectRatio(Const.STAR_IMG_ASPECT)
      Column() {
        Text(this.introductionData.createTime)
          .fontSize($r('app.float.font_size_normal'))
          .fontColor($r('app.color.desc_white_font_color'))
      }
      .padding({ top: $r('app.float.sub_title_margin_bottom'), bottom: $r('app.float.zone_desc_margin') })
      .backgroundColor(this.introductionData.backgroundColor)
      .zIndex(2)

      Stack({ alignContent: Alignment.Top }) {
        Image(this.introductionData.subPicMedium)
          .offset({ x: 0, y: -this.topImgOffset })
          .height(this.imgHeight)
          .width(Const.FULL_PERCENT)
          .objectFit(ImageFit.Fill)
        Image(this.introductionData.subPicTop)
          .objectFit(ImageFit.Cover)
          .width(Const.FULL_PERCENT)
      }
      .margin({ top: $r('app.float.intro_margin_top') })
      .width(Const.FULL_PERCENT)
      .height(this.imgHeight - this.topImgOffset)
      .clip(true)
    }
    .width(Const.FULL_PERCENT)
    .alignItems(HorizontalAlign.Center)
    .margin({ top: $r('app.float.intro_margin_top') })
    .backgroundColor(this.introductionData.backgroundColor)
  }
}