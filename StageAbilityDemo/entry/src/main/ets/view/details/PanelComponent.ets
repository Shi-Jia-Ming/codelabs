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

import { AppFontSize, PERCENTAGE_100 } from '../../common/constants/Constants';
import { ActionPanel } from '../../common/constants/DetailsConstants';

@Component
export default struct PanelComponent {
  @Styles globalSize() {
    .size({ width: ActionPanel.IMAGE_HEIGHT })
  }

  build() {
    Row() {
      Row() {
        Image($rawfile('detail/detail_action_share_to.png'))
          .globalSize()
        Blank()
          .width(ActionPanel.BLANK_WIDTH)
        Text($r('app.string.detail_enjoy'))
          .fontSize(AppFontSize.SMALLER)
          .fontColor($r('app.color.text'))
      }

      Row() {
        Image($rawfile('detail/detail_action_add_to_favorites.png'))
          .globalSize()
        Blank()
          .width(ActionPanel.BLANK_WIDTH)
        Text($r('app.string.detail_collection'))
          .fontSize(AppFontSize.SMALLER)
          .fontColor($r('app.color.text'))
      }

      Row() {
        Image($rawfile('detail/detail_action_price_notify.png'))
          .globalSize()
        Blank()
          .width(ActionPanel.BLANK_WIDTH)
        Text($r('app.string.detail_price_notify'))
          .fontSize(AppFontSize.SMALLER)
          .fontColor($r('app.color.text'))
      }
    }
    .width(PERCENTAGE_100)
    .justifyContent(FlexAlign.SpaceAround)
  }
}