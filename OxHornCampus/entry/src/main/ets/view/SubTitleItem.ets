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

import { CommonConstants as Const } from '../common/constants/CommonConstants';
import ZonesItem from '../viewmodel/ZonesItem';

@Component
export default struct SubTitleItem {
  @Consume('introductionData') introductionData: ZonesItem;

  build() {
    Column() {
      Column() {
        Text(this.introductionData.title)
          .fontSize($r('app.float.font_size_larger'))
          .fontColor($r('app.color.font_color_white'))
          .height($r('app.float.zone_title_height'))
          .fontWeight(FontWeight.Medium)
          .margin({ top: $r('app.float.zone_title_margin_top') })
        Text(this.introductionData.subTitle)
          .fontSize($r('app.float.font_size_normal'))
          .fontColor($r('app.color.font_color_white'))
          .height($r('app.float.sub_title_container_height'))
          .opacity(Const.FONT_COLOR_OPACITY_NORMAL)
          .margin({
            top: $r('app.float.sub_title_margin_top'),
            bottom: $r('app.float.sub_title_margin_bottom')
          })
        Image(this.introductionData.starLinePic[0])
          .height($r('app.float.star_line_image_height'))
          .margin({ bottom: $r('app.float.sub_title_margin_bottom') })
          .width($r('app.float.star_line_image_width'))
        Text(this.introductionData.createTime)
          .fontSize($r('app.float.font_size_normal'))
          .height($r('app.float.sub_title_container_height'))
          .margin({ bottom: $r('app.float.create_time_margin_bottom') })
          .fontColor($r('app.color.font_color_white'))
          .opacity(Const.FONT_COLOR_OPACITY_NORMAL)
      }
      .width(Const.FULL_SIZE)
      .alignItems(HorizontalAlign.Center)

      Image(this.introductionData.subPicTop)
        .height($r('app.float.picture_top_height'))
        .objectFit(ImageFit.Fill)
        .width(Const.FULL_SIZE)
    }
    .backgroundColor(this.introductionData.backgroundColor)
  }
}