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

import ZonesItem from '../common/bean/ZonesItem';
import { CommonConstants as Const } from '../common/constants/CommonConstants';

@Component
export default struct BuildListItem {
  @Prop type: string = '';
  @Consume('introductionData') introductionData: ZonesItem;

  build() {
    Column() {
      Image(this.introductionData.starLinePic[1])
        .height($r('app.float.star_line_image_height'))
        .width(Const.CONTENT_WIDTH_PERCENT)
        .margin({ bottom: $r('app.float.introduction_star_line_margin') })
      if (this.type === Const.BUILDING_TEXT) {
        Text(this.introductionData.buildingInformation)
          .width(Const.CONTENT_WIDTH_PERCENT)
          .fontSize($r('app.float.font_size_normal'))
          .letterSpacing(0)
      }
      Column() {
        if (this.type === Const.BUILDING_TEXT) {
          Image(this.introductionData.buildingPic)
            .height($r('app.float.introduction_image_height'))
            .width(Const.FULL_SIZE)
            .borderRadius($r('app.float.introduction_image_border_radius'))
            .margin({ top: $r('app.float.introduction_image_margin') })
        } else {
          Image(this.type === Const.GEOGRAPHY_LIGHT ?
          this.introductionData.geographyPicLight : this.introductionData.geographyPic)
            .height($r('app.float.introduction_image_height'))
            .width(Const.FULL_SIZE)
            .borderRadius($r('app.float.introduction_image_border_radius'))
            .margin({ top: $r('app.float.introduction_image_margin') })
        }
      }
      .width(Const.CONTENT_WIDTH_PERCENT)
      .height($r('app.float.introduction_image_height'))
      .margin({ bottom: $r('app.float.introduction_container_margin') })
      .justifyContent(FlexAlign.Center)
    }
    .width(Const.FULL_SIZE)
    .alignItems(HorizontalAlign.Center)
    .height($r('app.float.fixed_item_height'))
  }
}