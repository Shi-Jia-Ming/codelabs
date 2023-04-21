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

import { StyleConstants } from '@ohos/common';
import { BreakpointConstants } from '@ohos/common';
import { songList } from '../viewmodel/SongListData';
import { SongDataSource, SongItem } from '../viewmodel/SongDataSource';
import { ContentConstants } from '../constants/ContentConstants';

@Component
export struct PlayList {
  @StorageProp('currentBreakpoint') currentBreakpoint: string = 'sm';
  @StorageProp('fontSize') fontSize: number = 0;

  @Builder
  PlayAll() {
    Row() {
      Image($r("app.media.ic_play_all"))
        .height($r('app.float.play_all_icon_size'))
        .width($r('app.float.play_all_icon_size'))
      Text($r('app.string.play_all'))
        .maxLines(ContentConstants.PLAY_ALL_MAX_LINES)
        .padding({ left: $r('app.float.play_all_text_padding') })
        .fontColor($r('app.color.black'))
        .fontSize(this.fontSize)
      Blank()
      Image($r('app.media.ic_order_play'))
        .width($r('app.float.order_icon_size'))
        .height($r('app.float.order_icon_size'))
        .margin({ right: $r('app.float.order_icon_margin') })
      Image($r('app.media.ic_sort_list'))
        .height($r('app.float.order_icon_size'))
        .width($r('app.float.order_icon_size'))
    }
    .height($r('app.float.play_all_area_height'))
    .width(StyleConstants.FULL_WIDTH)
    .backgroundColor($r('app.color.white'))
    .padding({
      left: $r('app.float.play_all_area_padding'),
      right: $r('app.float.play_all_area_padding')
    })
    .borderRadius({
      topRight: $r('app.float.play_all_border_radius'),
      topLeft: $r('app.float.play_all_border_radius')
    })
    .position({ x: 0, y: 0 })
  }

  @Builder
  SongItem(title: string, label: Resource, singer: string) {
    Row() {
      Column() {
        Text(title)
          .fontColor($r('app.color.black'))
          .fontSize(this.fontSize)
          .margin({ bottom: $r('app.float.list_item_title_margin') })
        Row() {
          Image(label)
            .width($r('app.float.list_item_image_size'))
            .height($r('app.float.list_item_image_size'))
            .margin({ right: $r('app.float.list_item_image_margin') })
          Text(singer)
            .opacity($r('app.float.singer_opacity'))
            .fontColor($r('app.color.black'))
            .fontSize(this.fontSize - ContentConstants.SINGER_FONT_REDUCE)
        }
      }
      .alignItems(HorizontalAlign.Start)

      Blank()
      Image($r('app.media.ic_list_more'))
        .height($r('app.float.order_icon_size'))
        .width($r('app.float.order_icon_size'))
    }
    .height($r('app.float.list_item_height'))
    .width(StyleConstants.FULL_WIDTH)
  }

  build() {
    Column() {
      this.PlayAll()
      List() {
        LazyForEach(new SongDataSource(songList), (item: SongItem) => {
          ListItem() {
            Column() {
              this.SongItem(item.title, item.label, item.singer)
              Divider()
                .strokeWidth(ContentConstants.DIVIDER_STROKE_WIDTH)
                .color($r('app.color.black'))
                .opacity($r('app.float.divider_opacity'))
            }
            .padding({
              left: $r('app.float.list_item_padding'),
              right: $r('app.float.list_item_padding')
            })
          }
        }, (item, index) => JSON.stringify(item) + index)
      }
      .width(StyleConstants.FULL_WIDTH)
      .height(StyleConstants.FULL_HEIGHT)
      .backgroundColor($r('app.color.white'))
      .margin({ top: $r('app.float.list_area_margin_top') })
      .lanes(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
        ContentConstants.COL_TWO : ContentConstants.COL_ONE)

    }
    .padding({
      top: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ? 0 : $r('app.float.list_area_padding_top'),
      bottom: $r('app.float.list_area_padding_bottom')
    })
  }
}