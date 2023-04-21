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

import { CommonConstants } from '../../common/constants/CommonConstant';

/**
 * Navigation component.
 */
@Component
export struct NavigationView {
  build() {
    Navigator({ target: CommonConstants.HOME_PAGE, type: NavigationType.Back }) {
      Row({ space: CommonConstants.SPACE_NAVIGATION }) {
        Image($r('app.media.ic_back'))
          .width(CommonConstants.WIDTH_BACK_ICON)
          .height(CommonConstants.HEIGHT_BACK_ICON)
          .objectFit(ImageFit.Contain)

        Text($r('app.string.movie'))
          .fontSize(CommonConstants.FONT_SIZE_TITLE)
          .fontWeight(CommonConstants.FONT_WEIGHT_BOLD)
          .fontColor($r('app.color.start_window_background'))
          .textAlign(TextAlign.Center)
          .margin(CommonConstants.MARGIN_PLAY_PAGE)
          .lineHeight(CommonConstants.LINE_HEIGHT_NAVIGATION)
      }
    }
    .position({ x: CommonConstants.START_POSITION, y: CommonConstants.START_POSITION })
    .margin({ left: CommonConstants.LEFT_NAVIGATION, top: CommonConstants.TOP_IMAGE_VOTE })
  }
}