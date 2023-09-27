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

import { BottomTabsItem, CommonConstants as Const } from '@ohos/common';
import { BottomTabsList } from '../viewmodel/BottomTabsModel';

function getTabImgSrc(item: BottomTabsItem, index: number) {
  let imgSrc = item.icon;
  if (BottomTabsList.indexOf(item) === index) {
    imgSrc = item.iconSelected;
  }
  return imgSrc;
}

function getTabTextColor(item: BottomTabsItem, index: number) {
  let color = $r('app.color.bottom_tabs_font_color');
  if (BottomTabsList.indexOf(item) === index) {
    color = $r('app.color.bottom_tabs_font_color_selected');
  }
  return color;
}

@Component
export struct LeftTabs {
  @Link bottomTabIndex: number;

  build() {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      Row()
        .width(Const.FULL_SIZE)
        .height(Const.ROW_WIDTH)

      ForEach(BottomTabsList, (item: BottomTabsItem) => {
        Column() {
          Image(getTabImgSrc(item, this.bottomTabIndex))
            .width(Const.LEFT_IMAGE_SIZE)
            .height(Const.LEFT_IMAGE_SIZE)
            .objectFit(ImageFit.Contain)
            .margin({ bottom: $r('app.float.left_margin') })

          Text(item.text)
            .fontSize($r('app.float.left_font_size'))
            .opacity(Const.OPACITY)
            .fontColor(getTabTextColor(item, this.bottomTabIndex))
        }
        .width(Const.FULL_SIZE)
        .height(Const.LEFT_TAB_HEIGHT)
        .onClick(() => {
          this.bottomTabIndex = BottomTabsList.indexOf(item);
        })
      }, (item: BottomTabsItem) => JSON.stringify(item))

      Row()
        .width(Const.FULL_SIZE)
        .height(Const.ROW_WIDTH)
    }
    .width(Const.LEFT_TAB_WIDTH)
    .height(Const.FULL_SIZE)
    .backgroundColor($r('app.color.bottom_tabs_background_color'))
  }
}