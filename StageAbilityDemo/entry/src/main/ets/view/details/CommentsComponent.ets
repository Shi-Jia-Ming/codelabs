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

import { AppFontSize, AppFontWeight, PERCENTAGE_100 } from '../../common/constants/Constants';
import { CommentList } from '../../common/constants/DetailsConstants';

@Extend(Image) function setImageStyle () {
  .objectFit(ImageFit.Contain)
  .size({ width: CommentList.IMAGE_MARK_WIDTH })
}

@Component
export default struct CommentsComponent {
  build() {
    List({ space: CommentList.SPACE }) {
      ListItem() {
        this.CommentItem()
      }

      ListItem() {
        this.CommentItem()
      }

      ListItem() {
        this.CommentItem()
      }
    }
    .height(CommentList.HEIGHT)
    .width(PERCENTAGE_100)
    .backgroundColor(Color.White)
    .edgeEffect(EdgeEffect.None)
  }

  @Builder CommentItem() {
    Column() {
      Row() {
        Image($rawfile('detail/head_portrait.png'))
          .objectFit(ImageFit.Contain)
          .size({ width: CommentList.IMAGE_SIZE_HEAD_PORTRAIT })
          .margin({ right: CommentList.MARGIN_HEAD_PORTRAIT })
        Column() {
          Text($r('app.string.detail_comment_phone'))
            .lineHeight(CommentList.LINE_HEIGHT_PHONE)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .textCase(TextCase.UpperCase)
            .fontSize(AppFontSize.SMALL)
            .fontWeight(AppFontWeight.BOLDER)
          Blank()
            .height(CommentList.BLANK_HEIGHT_PHONE)
          Row() {
            Image($rawfile('detail/detail_comment_mark.png'))
              .setImageStyle()
            Blank().width(CommentList.MARK_BLANK_WIDTH)
            Image($rawfile('detail/detail_comment_mark.png'))
              .setImageStyle()
            Blank().width(CommentList.MARK_BLANK_WIDTH)
            Image($rawfile('detail/detail_comment_mark.png'))
              .setImageStyle()
            Blank().width(CommentList.MARK_BLANK_WIDTH)
            Image($rawfile('detail/detail_comment_mark.png'))
              .setImageStyle()
          }
        }
        .width(PERCENTAGE_100)
        .alignItems(HorizontalAlign.Start)
      }

      Text($r('app.string.detail_comment'))
        .maxLines(CommentList.COMMENT_MAX_LINES)
        .lineHeight(CommentList.COMMENT_LINE_HEIGHT)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .textCase(TextCase.UpperCase)
        .fontSize(AppFontSize.SMALL)
        .fontWeight(AppFontWeight.BOLD)
        .margin({ top: CommentList.MARGIN_TEXT })
    }
    .alignItems(HorizontalAlign.Start)
    .width(PERCENTAGE_100)
  }
}