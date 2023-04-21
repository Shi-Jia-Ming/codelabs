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

import StyleConstants from '../common/constants/StyleConstants';

@Component
export default struct StarsWidget {
  private rating: string = '';
  private stars: Resource[];

  build() {
    Row() {
      List({ space: StyleConstants.STARS_LIST_SPACE }) {
        ForEach(this.stars, (item) => {
          ListItem() {
            Image(item)
              .width($r('app.float.stars_image_size'))
              .height($r('app.float.stars_image_size'))
          }
        }, (item, index) => JSON.stringify(item) + index)
      }
      .listDirection(Axis.Horizontal)
      .edgeEffect(EdgeEffect.None)
      .height($r('app.float.stars_list_height'))
      .width($r('app.float.stars_list_width'))

      Blank().width($r('app.float.blank_width'))
      Text(this.rating)
        .fontSize($r('app.float.rating_text_size'))
        .fontWeight(FontWeight.Bolder)
        .fontColor($r('app.color.common_font_color'))
    }
    .margin({
      top: $r('app.float.stars_margin_size'),
      bottom: $r('app.float.stars_margin_size')
    })
    .alignSelf(ItemAlign.Start)
  }
}