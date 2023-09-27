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

import { HomeTabsItem, CommonConstants as Const } from '@ohos/common';
import { RecentlyPlayList } from '../viewmodel/HomeTabsModel';

@Component
export struct RecentlyPlayed {
  build() {
    Column() {
      Row() {
        Text($r('app.string.title_home_recently'))
          .fontSize($r('app.float.home_text_size1'))
          .fontWeight(Const.FONT_WEIGHT)
        Blank()
        Text($r('app.string.title_home_more'))
          .fontSize($r('app.float.home_text_size2'))
          .opacity(Const.OPACITY)
        Image($r('app.media.ic_more'))
          .width($r('app.float.home_image_size'))
      }
      .width(Const.FULL_SIZE)
      .height($r('app.float.home_row_width1'))
      .padding({
        top: $r('app.float.home_margin3'),
        left: $r('app.float.home_margin2'),
        right: $r('app.float.home_margin2')
      })

      Row() {
        List({ space: Const.ITEM_SPACE }) {
          ForEach(RecentlyPlayList, (item: HomeTabsItem) => {
            ListItem() {
              Column() {
                Image(item.img)
                  .height($r('app.float.home_image_height'))
                  .margin({ bottom: $r('app.float.home_margin1') })
                Text(item.title)
                  .width($r('app.float.home_text_width'))
                  .height($r('app.float.home_text_height1'))
                  .fontSize($r('app.float.home_text_size2'))
                  .fontWeight(Const.FONT_WEIGHT)
                Text(item.intro)
                  .width($r('app.float.home_text_width'))
                  .height($r('app.float.home_text_height2'))
                  .fontSize($r('app.float.home_text_size3'))
                  .opacity(Const.OPACITY)
              }
            }
          }, (item: HomeTabsItem) => JSON.stringify(item))
        }
        .width(Const.FULL_SIZE)
        .height($r('app.float.home_row_height1'))
        .listDirection(Axis.Horizontal)
      }
      .width(Const.FULL_SIZE)
      .height($r('app.float.home_row_height1'))
    }
  }
}