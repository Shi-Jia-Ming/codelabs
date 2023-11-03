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
import { BottomBar } from '../../common/constants/DetailsConstants';

@Extend(Text)
function setTextStyle() {
  .width(BottomBar.TEXT_WIDTH)
  .lineHeight(BottomBar.TEXT_LINE_HEIGHT)
  .textAlign(TextAlign.Center)
  .fontColor($r('app.color.background'))
  .fontSize(AppFontSize.MIDDLE)
}

@Component
export default struct BottomBarComponent {
  private barHeight: Length = 0;

  build() {
    Flex({ justifyContent: FlexAlign.SpaceBetween, direction: FlexDirection.Column }) {
      Divider()
        .height(BottomBar.DIVIDER_HEIGHT)
        .backgroundColor($r('app.color.navigation_line'))
      Blank()
      Row() {
        Row() {
          Text($r('app.string.put_in_shopping_cart'))
            .setTextStyle()
          Text($r('app.string.buy_now'))
            .setTextStyle()
        }
        .width(BottomBar.CONTAINER_SIZE_WIDTH)
        .height(BottomBar.CONTAINER_SIZE_HEIGHT)
        .backgroundImage($rawfile('detail/detail_bottom_panel_background.png'), ImageRepeat.NoRepeat)
        .backgroundImageSize(ImageSize.Cover)
      }
      .padding({
        right: BottomBar.BAR_PADDING_RIGHT
      })
      .width(PERCENTAGE_100)
      // .height(this.barHeight)
      .justifyContent(FlexAlign.End)
    }.height(PERCENTAGE_100).padding({ bottom: BottomBar.BAR_PADDING_BOTTOM })
  }
}