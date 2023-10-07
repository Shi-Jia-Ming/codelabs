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

const MIN_OPACITY: number = 0.5;
const MAX_OPACITY: number = 1.2;

@Component
export default struct LocationItem {
  @Prop imgScale: number = 0;
  @Consume('introductionData') introductionData: ZonesItem;

  build() {
    Column() {
      Image(this.introductionData.starLinePic[1])
        .height($r('app.float.star_img_height'))
        .aspectRatio(Const.STAR_IMG_ASPECT)
        .margin({ top: $r('app.float.introduction_star_line_margin'), bottom: $r('app.float.introduction_star_line_margin') })

      Stack() {
        Image(this.introductionData.geographyPics[0])
          .width(Const.FULL_PERCENT)
          .height(Const.FULL_PERCENT)
          .borderRadius($r('app.float.introduction_image_border_radius'))
          .opacity(1 - MAX_OPACITY * (this.imgScale - MIN_OPACITY))
        Image(this.introductionData.geographyPics[1])
          .width(Const.FULL_PERCENT)
          .height(Const.FULL_PERCENT)
          .borderRadius($r('app.float.introduction_image_border_radius'))
        Image($r('app.media.ic_location'))
          .scale({
            x: this.imgScale,
            y: this.imgScale,
            z: 1,
            centerX: Const.HALF_PERCENT,
            centerY: Const.FULL_PERCENT
          })
          .position(this.introductionData.position)
          .width($r('app.float.location_img_size'))
          .aspectRatio(1)
      }
      .margin({ top: $r('app.float.introduction_image_margin') })
      .width(Const.FULL_PERCENT)
      .height($r('app.float.building_img_height'))
    }
    .padding($r('app.float.guide_padding'))
  }
}