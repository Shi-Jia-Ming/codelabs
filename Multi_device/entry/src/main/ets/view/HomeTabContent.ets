/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License,Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { TopTabs } from '../view/TopTabsComponent';
import { HomeSwiper } from '../view/HomeSwiperComponent';
import { SwiperItem } from '../common/bean/Item';
import { ListResource } from '../viewmodel/HomeListModel';
import Const from '../common/constants/CommonConstants';

@Component
export struct HomeTabComponent {
  @StorageProp('currentBreakpoint') currentBreakpoint: string = 'md';

  build() {
    Column() {
      TopTabs()
        .margin({ bottom: $r('app.float.top_margin') })

      List() {
        ListItem() {
          HomeSwiper()
        }

        ForEach(ListResource, item => {
          ListItem() {
            Column() {
              Row() {
                Column() {
                  Text(item.title)
                    .textAlign(TextAlign.Start)
                    .fontSize($r('app.float.list_title_size'))
                }
                .layoutWeight(Const.LAYOUT_WEIGHT)
                .alignItems(HorizontalAlign.Start)

                Text($r('app.string.more'))
                  .fontSize($r('app.float.more_font_size'))
                  .fontColor(Color.Gray)
                  .margin({ right: $r('app.float.more_margin') })

                Image($r('app.media.more'))
                  .width($r('app.float.more_width'))
                  .height($r('app.float.more_height'))
                  .objectFit(ImageFit.Contain)
              }
              .width(Const.FULL_SIZE)
              .height($r('app.float.list_height'))
              .margin({ bottom: $r('app.float.list_margin') })

              List() {
                ForEach(item.Item, (listItem: SwiperItem) => {
                  ListItem() {
                    Column() {
                      Image(listItem.img)
                        .width($r('app.float.list_image_width'))
                        .height(ListResource.indexOf(item) === 1 ? $r('app.float.list_image_height_vertical'): $r('app.float.list_image_height_horizontal'))
                        .borderRadius($r('app.float.list_image_border_radius'))
                        .margin({ bottom: $r('app.float.list_image_margin'), right: $r('app.float.list_image_margin') })

                      Text(listItem.title)
                        .fontSize($r('app.float.listItem_title_size'))
                        .margin({ bottom: $r('app.float.listItem_margin') })

                      Text(listItem.text)
                        .fontSize($r('app.float.listItem_text_size'))
                        .fontColor(Color.Gray)
                    }
                    .alignItems(HorizontalAlign.Start)
                  }
                })
              }
              .width(Const.FULL_SIZE)
              .height(ListResource.indexOf(item) === 1 ? $r('app.float.childList_height_vertical'): $r('app.float.childList_height_horizontal'))
              .listDirection(Axis.Horizontal)
            }
          }
          .height(ListResource.indexOf(item) === 1 ? $r('app.float.list_height_vertical'): $r('app.float.list_height_horizontal'))
        })
      }
      .width(Const.FULL_SIZE)
      .height(Const.FULL_SIZE)
      .listDirection(Axis.Vertical)
      .layoutWeight(Const.LAYOUT_WEIGHT)
    }
    .width(Const.FULL_SIZE)
  }
}