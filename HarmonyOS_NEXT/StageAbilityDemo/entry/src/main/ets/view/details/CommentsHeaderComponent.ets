/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { AppFontSize, AppFontWeight } from '../../common/constants/Constants';
import { CommentHeader } from '../../common/constants/DetailsConstants';

@Component
export default struct CommentsHeaderComponent {
  build() {
    Row() {
      Text($r('app.string.detail_comment_header_left'))
        .lineHeight(CommentHeader.LINE_HEIGHT)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .textCase(TextCase.UpperCase)
        .fontSize(AppFontSize.MIDDLE)
        .fontColor($r('app.color.text'))
        .fontWeight(AppFontWeight.BOLDER)
        .width(CommentHeader.LAYOUT_WEIGHT)
        .textAlign(TextAlign.Start)
      Row() {
        Text() {
          Span($r('app.string.commentRatio'))
            .textCase(TextCase.UpperCase)
            .fontSize(AppFontSize.SMALL)
            .fontColor(Color.Red)
            .fontWeight(AppFontWeight.BOLD)
          Span($r('app.string.detail_comment_header_right'))
            .textCase(TextCase.UpperCase)
            .fontSize(AppFontSize.SMALL)
            .fontColor($r('app.color.commentRate'))
            .fontWeight(AppFontWeight.BOLD)
          Span(CommentHeader.ARROW)
            .textCase(TextCase.UpperCase)
            .fontSize(AppFontSize.MIDDLE)
            .decoration({ type: TextDecorationType.None, color: Color.Red })
            .fontColor($r('app.color.commentRate'))
            .fontWeight(AppFontWeight.BOLD)
        }
        .width(CommentHeader.LAYOUT_WEIGHT)
        .textAlign(TextAlign.End)

      }
    }
  }
}