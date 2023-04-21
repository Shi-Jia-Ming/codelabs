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
export default struct FlexLayout {
  @Link searchArr: Array<string>;

  build() {
    Scroll() {
      Flex({ justifyContent: FlexAlign.Start, wrap: FlexWrap.Wrap }) {
        if (this.searchArr.length > 0) {
          ForEach(this.searchArr, (item: string) => {
            Text(`${item}`)
              .fontSize($r("app.float.flex_font_size"))
              .borderStyle(BorderStyle.Solid)
              .borderWidth($r('app.float.border_width'))
              .borderColor($r("app.color.flex_layout_color"))
              .borderRadius($r('app.float.border_radius'))
              .backgroundColor($r("app.color.flex_layout_color"))
              .padding({
                top: StyleConstants.FLEX_PADDING_TOP,
                bottom: StyleConstants.FLEX_PADDING_BOTTOM,
                left: StyleConstants.FLEX_PADDING_LEFT,
                right: StyleConstants.FLEX_PADDING_RIGHT
              })
              .margin({
                top: $r("app.float.flex_layout_margin"),
                right: $r("app.float.flex_layout_margin")
              })
              .textOverflow({ overflow: TextOverflow.Ellipsis })
              .maxLines(StyleConstants.TEXT_MAX_LINE)
          }, item => JSON.stringify(item))
        }
      }
      .margin({
        left: $r('app.float.margin_left'),
        right: $r('app.float.margin_left')
      })
      .padding({ bottom: $r('app.float.margin_left') })
    }
  }
}