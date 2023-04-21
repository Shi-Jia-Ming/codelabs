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

import { DriveTabsItem, CommonConstants as Const } from '@ohos/common';
import { DriveList } from '../viewmodel/DriveTabsModel';

@Component
export struct DriveTabs {
  private scroller: Scroller = new Scroller();

  build() {
    Scroll(this.scroller) {
      GridRow({
        columns: { xs: Const.GRID_4, sm: Const.GRID_4, md: Const.GRID_8, lg: Const.GRID_12 },
        gutter: { x : $r('app.float.gutter_drive') },
        breakpoints: { value: [Const.BREAKPOINTS_SM, Const.BREAKPOINTS_MD, Const.BREAKPOINTS_LG] }
      }) {
        GridCol({ span: { xs: Const.GRID_4, sm: Const.GRID_4, md: Const.GRID_8, lg: Const.GRID_12 } }) {
          Row() {
            Text($r('app.string.title_drive'))
              .fontSize($r('app.float.title_font_size'))
              .fontWeight(Const.FONT_WEIGHT)
              .width(Const.FULL_SIZE)
              .margin({
                top: $r('app.float.drive_title_margin'),
                bottom: $r('app.float.drive_title_margin'),
                left: $r('app.float.drive_title_margin')
              })
          }
        }
        .height($r('app.float.title_height'))
        
        ForEach(DriveList, (item: DriveTabsItem) => {
          GridCol({ span: { xs: Const.NUM_2, sm: Const.NUM_2, md: Const.NUM_2, lg: Const.NUM_2 } }) {
            Column() {
              Image(item.img)
                .aspectRatio(1)
                .margin({ bottom: $r('app.float.drive_image_margin') })

              Text(item.title)
                .fontSize($r('app.float.drive_text_font_size1'))
                .fontWeight(Const.FONT_WEIGHT)
                .width(Const.FULL_SIZE)
                .height($r('app.float.drive_text_height1'))

              Text(item.intro)
                .fontSize($r('app.float.drive_text_font_size2'))
                .opacity(Const.OPACITY)
                .width(Const.FULL_SIZE)
                .height($r('app.float.drive_text_height2'))
                .margin({ bottom: $r('app.float.drive_text_margin') })
            }
          }
        }, item => JSON.stringify(item))
      }
    }
    .width(Const.FULL_SIZE)
    .height(Const.FULL_SIZE)
    .align(Alignment.TopStart)
    .scrollBar(BarState.Off)
    .edgeEffect(EdgeEffect.Spring)
  }
}

