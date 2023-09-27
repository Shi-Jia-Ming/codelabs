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

import CommonUtils from '../common/utils/CommonUtils';
import StyleConstants from '../common/constants/StyleConstants';
import DataSource from '../common/datasource/DataSource';

@Component
export default struct MovieStills {
  private dataSource: DataSource<Resource> = new DataSource([]);

  aboutToAppear() {
    this.dataSource = new DataSource(CommonUtils.getStillsData());
  }

  build() {
    Column() {
      Row() {
        Text($r('app.string.stills'))
          .fontSize($r('app.float.stills_title_size'))
          .fontColor($r('app.color.common_font_color'))
          .fontWeight(FontWeight.Bolder)
        Text($r('app.string.stills_count'))
          .fontSize($r('app.float.stills_content_size'))
          .opacity($r('app.float.common_opacity'))
          .fontColor($r('app.color.common_font_color'))
          .layoutWeight(StyleConstants.WEIGHT_ONE)
          .width(StyleConstants.STILLS_TEXT_WIDTH)
          .textAlign(TextAlign.End)
          .fontWeight(FontWeight.Normal)
          .margin({ right: $r('app.float.stills_margin_right') })
        Image($r("app.media.ic_arrow"))
          .width($r('app.float.image_arrow_width'))
          .height($r('app.float.image_arrow_height'))
      }
      .margin({
        left: StyleConstants.COMMON_MARGIN_LEFT,
        top: StyleConstants.COMMON_MARGIN_TOP,
        right: StyleConstants.COMMON_MARGIN_RIGHT,
        bottom: StyleConstants.COMMON_MARGIN_BOTTOM
      })
      .width(StyleConstants.STILLS_WIDTH)

      List({ space: StyleConstants.STILLS_LIST_SPACE }) {
        LazyForEach(this.dataSource, (item: Resource) => {
          ListItem() {
            Image(item)
              .width($r('app.float.stills_image_width'))
              .height($r('app.float.stills_image_height'))
              .borderRadius($r('app.float.stills_image_radius'))
          }
        }, (item: Resource) => JSON.stringify(item))
      }
      .listDirection(Axis.Horizontal)
      .edgeEffect(EdgeEffect.None)
      .margin({ left: StyleConstants.COMMON_MARGIN_LEFT })
      .width(StyleConstants.STILLS_LIST_WIDTH)
      .height($r('app.float.stills_list_height'))
    }
  }
}