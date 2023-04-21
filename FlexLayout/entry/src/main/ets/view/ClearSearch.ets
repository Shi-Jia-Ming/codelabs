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
export default struct ClearSearch {
  @Link searchArr: Array<string>;

  build() {
    Flex({ alignItems: ItemAlign.Center }) {
      if (this.searchArr.length > 0) {
        Text($r('app.string.recent_searches'))
          .fontSize($r('app.float.font_size'))
          .fontColor($r('app.color.recent_search_font_color'))
          .fontWeight(StyleConstants.FONT_WEIGHT)
          .height(StyleConstants.RECENT_TEXT_HEIGHT)
          .layoutWeight(StyleConstants.LAYOUT_WEIGHT)
          .margin({
            left: $r('app.float.margin_left'),
            top: $r('app.float.clear_text_top'),
            bottom: $r('app.float.clear_text_bottom')
          })

        Image($r('app.media.ic_delete'))
          .height(StyleConstants.DELETE_IMAGE_HEIGHT)
          .width(StyleConstants.DELETE_IMAGE_WIDTH)
          .margin({ right: $r('app.float.clear_image_right') })
          .onClick(() => {
            this.searchArr.splice(0, this.searchArr.length);
            this.searchArr.length = 0;
          })
      } else {
        Column() {
          Image($r('app.media.ic_no_search'))
            .height(StyleConstants.NO_SEARCH_IMAGE_HEIGHT)
            .width(StyleConstants.NO_SEARCH_IMAGE_WIDTH)
            .margin({
              top: $r('app.float.clear_no_search_top'),
              bottom: $r('app.float.margin_top_bottom')
            })

          Text($r('app.string.no_search_content'))
            .fontSize($r('app.float.font_size'))
            .fontColor($r('app.color.no_search_font_color'))
            .height(StyleConstants.NO_SEARCH_TEXT_HEIGHT)
            .width(StyleConstants.NO_SEARCH_TEXT_WIDTH)
        }
        .width(StyleConstants.FULL_PERCENT)
        .justifyContent(FlexAlign.Center)
      }
    }
  }
}