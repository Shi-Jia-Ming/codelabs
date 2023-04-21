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
export default struct MovieStarring {
  private dataSource: DataSource<Resource>;

  aboutToAppear() {
    this.dataSource = new DataSource(CommonUtils.getStarringData());
  }

  build() {
    Column() {
      Row() {
        Text($r("app.string.starring_text"))
          .fontSize($r('app.float.starring_title_size'))
          .fontColor($r('app.color.common_font_color'))
          .fontWeight(FontWeight.Bolder)
        Text($r('app.string.starring_count'))
          .fontSize($r('app.float.starring_content_size'))
          .opacity($r('app.float.common_opacity'))
          .fontColor($r('app.color.common_font_color'))
          .layoutWeight(StyleConstants.WEIGHT_ONE)
          .width(StyleConstants.STARRING_TEXT_WIDTH)
          .textAlign(TextAlign.End)
          .fontWeight(FontWeight.Normal)
          .margin({ right: $r('app.float.starring_text_margin') })
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
      .width(StyleConstants.STARRING_WIDTH)

      List({ space: StyleConstants.STARRING_SPACE }) {
        LazyForEach(this.dataSource, (item: Resource) => {
          ListItem() {
            Column() {
              Image(item)
                .width($r('app.float.starring_image_size'))
                .height($r('app.float.starring_image_size'))
                .borderRadius($r('app.float.starring_image_radius'))
              Text($r('app.string.actors'))
                .fontSize($r('app.float.actors_font_size'))
                .fontColor($r('app.color.common_font_color'))
                .fontWeight(FontWeight.Normal)
                .alignSelf(ItemAlign.Start)
                .margin({
                  top: $r('app.float.actors_margin_top'),
                  bottom: $r('app.float.actors_margin_bottom')
                })
              Text($r('app.string.play_the_role'))
                .fontSize($r('app.float.role_font_size'))
                .opacity($r('app.float.common_opacity'))
                .fontColor($r('app.color.common_font_color'))
                .alignSelf(ItemAlign.Start)
                .fontWeight(FontWeight.Normal)
            }
          }
        }, item => JSON.stringify(item))
      }
      .listDirection(Axis.Horizontal)
      .edgeEffect(EdgeEffect.None)
      .margin({ left: StyleConstants.COMMON_MARGIN_LEFT })
      .width(StyleConstants.STARRING_LIST_WIDTH)
      .height(StyleConstants.STARRING_LIST_HEIGHT)
    }
  }
}