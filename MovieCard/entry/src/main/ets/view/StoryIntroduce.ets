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

import CommonConstants from '../common/constants/CommonConstants';

@Component
export default struct StoryIntroduce {
  @State tipsTextLines: number = CommonConstants.DEFAULT_LINES;
  @State tipsText: Resource = $r("app.string.expand_text");
  private introduction: string = '';

  build() {
    Column() {
      Text($r('app.string.story_introduction'))
        .fontSize($r('app.float.story_font_size'))
        .fontWeight(FontWeight.Bolder)
        .fontColor($r('app.color.common_font_color'))
        .alignSelf(ItemAlign.Start)
        .margin({
          top: $r('app.float.story_margin_left'),
          bottom: $r('app.float.story_margin_right')
        })
      Stack({ alignContent: Alignment.BottomEnd }) {
        Text(this.introduction)
          .fontSize($r('app.float.introduction_font_size'))
          .lineHeight($r('app.float.introduction_line_height'))
          .fontColor($r('app.color.common_font_color'))
          .opacity($r('app.float.common_opacity'))
          .fontWeight(FontWeight.Normal)
          .maxLines(this.tipsTextLines)
        Image($r("app.media.ic_masking"))
          .width($r('app.float.masking_width'))
          .height($r('app.float.masking_height'))
        Text(this.tipsText)
          .fontColor($r('app.color.tips_text_color'))
          .fontSize($r('app.float.tips_font_size'))
          .lineHeight($r('app.float.tips_line_height'))
          .fontWeight(FontWeight.Bolder)
          .backgroundColor(Color.White)
          .textAlign(TextAlign.End)
          .onClick(() => {
            if (this.tipsTextLines === CommonConstants.DEFAULT_LINES) {
              this.tipsTextLines = CommonConstants.MAX_LINES;
              this.tipsText = $r('app.string.collapse_text');
            } else {
              this.tipsTextLines = CommonConstants.DEFAULT_LINES;
              this.tipsText = $r('app.string.expand_text');
            }
          })
      }
    }
  }
}