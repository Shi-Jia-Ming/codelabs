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

import ZonesItem from '../entity/ZonesItem';
import { ChallengeConstants as Const } from '../constants/ChallengeConstants';

@Component
export default struct BuildListItem {
  @Consume('introductionData') introductionData: ZonesItem;
  @Prop buildingImgRatio: number = 0;

  build() {
    Column() {
      Image(this.introductionData.starLinePic[1])
        .height($r('app.float.star_img_height'))
        .aspectRatio(Const.STAR_IMG_ASPECT)
        .margin({ bottom: $r('app.float.introduction_star_line_margin') })
      Text(this.introductionData.buildingInformation)
        .width(Const.FULL_PERCENT)
        .fontSize($r('app.float.font_size_normal'))
        .letterSpacing(0)
      Column() {
        Image(this.introductionData.buildingPic)
          .width(Const.FULL_PERCENT)
          .height($r('app.float.building_img_truly_height'))
          .margin({ top: `${-this.buildingImgRatio * Const.BUILDING_COEFFICIENT}%` })
      }
      .width(Const.FULL_PERCENT)
      .height($r('app.float.building_img_height'))
      .borderRadius($r('app.float.introduction_image_border_radius'))
      .margin({ top: $r('app.float.introduction_image_margin') })
      .clip(true)
    }
    .padding($r('app.float.guide_padding'))
  }
}