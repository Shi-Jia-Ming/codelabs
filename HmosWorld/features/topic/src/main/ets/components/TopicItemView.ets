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

import { Topic } from '@ohos/common';
import { THEME_LIST, ThemeConstants } from '../constants/ThemeConstants';
import { TopicModel } from '../model/TopicModel';

@Component
export struct TopicItem {
  @Prop item: Topic = new Topic();
  topicModel: TopicModel = TopicModel.getInstance();

  build() {
    Stack() {
      Image($r('app.media.ic_checked'))
        .size({ width: $r('app.float.topic_icon_size'), height: $r('app.float.topic_icon_size') })
        .offset({ x: ThemeConstants.TOPIC_ICON_OFFSET_X, y: ThemeConstants.TOPIC_ICON_OFFSET_Y })
        .zIndex(ThemeConstants.Z_INDEX_TWO)
        .visibility(this.item.isFollowed ? Visibility.Visible : Visibility.None)

      Column({ space: ThemeConstants.COLUMN_SPACE }) {
        Image(THEME_LIST[this.item.id])
          .interpolation(ImageInterpolation.High)
          .width($r('app.float.topic_image_size'))
          .height($r('app.float.topic_image_size'))
        Text(this.item.name)
          .topicTitleStyle()
      }
      .width($r('app.float.topic_size'))
      .height($r('app.float.topic_size'))
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Center)
      .borderWidth(this.item.isFollowed ? $r('app.float.topic_icon_border') : 0)
      .borderColor(this.item.isFollowed ? $r('app.color.btn_bg') : $r('app.color.item_white_bg'))
      .borderRadius($r('app.float.topic_border'))
      .backgroundColor($r('app.color.item_white_bg'))
    }
    .onClick(() => {
      this.topicModel.changeFollowedTopic(this.item,!this.item.isFollowed);
    })
  }
}

@Extend(Text)
function topicTitleStyle() {
  .fontFamily($r('app.string.topic_title_main_family'))
  .fontColor($r('app.color.topic_color'))
  .fontSize($r('app.float.topic_title_font'))
}
