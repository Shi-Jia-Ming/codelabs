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

import { VideoItem } from '../../viewmodel/VideoItem';
import { CommonConstants } from '../../common/constants/CommonConstant';

/**
 * text style.
 * @param fontSize Font size.
 * @param fonWeight Font weight.
 */
@Extend(Text) function textStyle(fontSize: number, fonWeight: number) {
  .fontSize(fontSize)
  .fontWeight(fonWeight)
  .fontColor($r('app.color.start_window_background'))
  .textAlign(TextAlign.Center)
}

/**
 * Comment component.
 */
@Component
export struct CommentView {
  @ObjectLink private item: VideoItem;

  build() {
    Column() {
      Image($r('app.media.head'))
        .width(CommonConstants.WIDTH_HEAD)
        .height(CommonConstants.HEIGHT_HEAD)
        .margin({ top: CommonConstants.TOP_HEAD })
        .objectFit(ImageFit.Contain)
        .border({
          width: CommonConstants.WIDTH_HEAD_BORDER,
          color: Color.White,
          radius: CommonConstants.RADIUS_HEAD
        })

      Image(this.item.isLikes ? $r('app.media.vote1') : $r('app.media.vote0'))
        .width(CommonConstants.WIDTH_VOTE)
        .height(CommonConstants.HEIGHT_COMMENT)
        .onClick(() => {
          if (this.item.isLikes) {
            this.item.likesCount--;
          } else {
            this.item.likesCount++;
          }
          this.item.isLikes = !this.item.isLikes;
        })
        .margin({ top: CommonConstants.TOP_IMAGE_VOTE })

      Text(this.item.likesCount === 0 ? $r('app.string.like') : (this.item.likesCount.toString()))
        .textStyle(CommonConstants.FONT_SIZE_DESCRIPTION, CommonConstants.FONT_WEIGHT_LIGHT)

      Image($r('app.media.comment'))
        .width(CommonConstants.WIDTH_VOTE)
        .height(CommonConstants.HEIGHT_COMMENT)
        .margin({ top: CommonConstants.TOP_IMAGE_VOTE })
      Text(this.item.commentCount === 0 ? $r('app.string.comment') : (this.item.commentCount.toString()))
        .textStyle(CommonConstants.FONT_SIZE_DESCRIPTION, CommonConstants.FONT_WEIGHT_LIGHT)

      Image($r('app.media.share'))
        .width(CommonConstants.WIDTH_VOTE)
        .height(CommonConstants.HEIGHT_COMMENT)
        .margin({ top: CommonConstants.TOP_IMAGE_VOTE })
      Text(this.item.shareTimes === 0 ? $r('app.string.share') : (this.item.shareTimes.toString()))
        .textStyle(CommonConstants.FONT_SIZE_DESCRIPTION, CommonConstants.FONT_WEIGHT_LIGHT)
    }
    .offset({ x: CommonConstants.OFFSET_COMMENT_X, y: CommonConstants.OFFSET_COMMENT_Y })
  }
}