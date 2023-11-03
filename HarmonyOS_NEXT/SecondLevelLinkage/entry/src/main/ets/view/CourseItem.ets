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
import CourseModel from '../viewmodel/CourseModel';

@Component
export default struct CourseItem {
  @Prop itemStr: string = '';
  item?: CourseModel;

  aboutToAppear() {
    this.item = JSON.parse(this.itemStr) as CourseModel;
  }

  build() {
    Row() {
      Image(this.item !== undefined ? this.item?.imageUrl : '')
        .height(Constants.FULL_PERCENT)
        .aspectRatio(1)
      Column() {
        Text(this.item?.courseName)
          .fontSize($r('app.float.normal_font_size'))
          .fontColor($r('app.color.base_font_color'))
          .fontFamily($r('app.string.hei_ti_medium'))
          .maxLines(Constants.TITLE_LINE_NUMBER)
          .textOverflow({ overflow: TextOverflow.Clip })
          .lineHeight($r('app.float.title_line_height'))
          .width(Constants.FULL_PERCENT)
        Text(this.item?.price === 0 ? $r('app.string.free_price') : $r('app.string.price_str', this.item?.price))
          .fontSize($r('app.float.header_font_size'))
          .fontColor($r('app.color.price_color'))
          .fontFamily($r('app.string.hei_ti_medium'))
      }
      .padding($r('app.float.course_item_padding'))
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
      .justifyContent(FlexAlign.SpaceBetween)
      .height(Constants.FULL_PERCENT)
    }
    .clip(true)
    .borderRadius($r('app.float.normal_border_radius'))
    .backgroundColor($r('app.color.start_window_background'))
    .width('100%')
    .height($r('app.float.course_item_height'))
  }
}