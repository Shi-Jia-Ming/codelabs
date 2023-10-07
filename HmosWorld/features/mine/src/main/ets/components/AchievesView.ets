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

import { CommonConstants, ObservedArray } from '@ohos/common';
import Constants from '../constants/Constants';
import { UserModel } from '../model/UserModel';
import { AchieveImage, ACHIEVE_IMAGE_LIST } from '../model/AchievementModel';

@Component
export struct AchievesView {
  @State userModel: UserModel = UserModel.getInstance();
  @State learnedIds: ObservedArray<string> = this.userModel.learnedIds;

  aboutToAppear() {
    this.userModel.getUserAchievements();
  }

  getShowImg(item: AchieveImage): Resource | undefined {
    if (this.learnedIds.includes(item.pathId)) {
      return item.activeImage;
    }
    return item.defaultImage;
  }

  build() {
    Column() {
      Text($r('app.string.total_achieve_count', this.learnedIds.length))
        .fontSize($r('app.float.default_font_size'))
        .width(Constants.FULL_SCREEN)
        .fontFamily(CommonConstants.HARMONY_HEITI_MEDIUM_FONT_FAMILY)
        .padding({
          left: $r('app.float.achievements_count_padding_left'),
          top: $r('app.float.achievements_count_padding_top'),
          bottom: $r('app.float.achievements_count_padding_bottom')
        })
        .textAlign(TextAlign.Start)

      List({ space: Constants.MIDDLE_SPACE }) {
        ForEach(ACHIEVE_IMAGE_LIST, (item: AchieveImage) => {
          ListItem() {
            Image(this.getShowImg(item))
              .interpolation(ImageInterpolation.High)
              .width($r('app.float.achievement_image_size'))
              .height($r('app.float.achievement_image_size'))
          }
          .padding({
            left: $r('app.float.achievement_list_padding_left_right'),
            right: $r('app.float.achievement_list_padding_left_right'),
            bottom: $r('app.float.achievement_list_padding'),
            top: $r('app.float.achievement_list_padding') })
        }, (item: AchieveImage) => JSON.stringify(item))
      }
      .alignListItem(ListItemAlign.Center)
      .lanes(Constants.ACHIEVEMENT_LIST_LANES)
      .width(Constants.FULL_SCREEN)
      .edgeEffect(EdgeEffect.None)
      .scrollBar(BarState.Off)
    }
    .height(Constants.FULL_SCREEN)
    .width(Constants.FULL_SCREEN)
    .padding({
      left: $r('app.float.mine_page_padding'),
      right: $r('app.float.mine_page_padding')
    })
  }
}