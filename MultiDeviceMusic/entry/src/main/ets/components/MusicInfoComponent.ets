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

import router from '@ohos.router';
import { BreakpointType } from '../common/utils/BreakpointSystem';
import { SongItem } from '../viewmodel/SongData';
import { MusicList } from '../viewmodel/MusicListViewModel';
import { RouterUrlConstants } from '../common/constants/RouterUrlConstants';
import { StyleConstants } from '../common/constants/StyleConstants';
import { playImage } from '../viewmodel/PlayData';
import { ControlConstants } from '../common/constants/ControlConstants';
import { PlayConstants } from '../common/constants/PlayConstants';
import { PlayControlModel } from '../viewmodel/PlayControlModel';
import { Logger } from '../common/utils/Logger';

@Component
export struct MusicInfoComponent {
  @StorageProp('currentBreakpoint') currentBreakpoint: string = 'sm';
  @StorageProp('selectIndex') selectIndex: number = 0;
  songList: SongItem[] = MusicList;

  build() {
    Column() {
      GridRow({
        columns: {
          sm: PlayConstants.COLUMN_FOUR,
          md: PlayConstants.COLUMN_EIGHT,
          lg: PlayConstants.COLUMN_TWELVE
        },
        gutter: PlayConstants.GRID_COL_GUTTER
      }) {
        GridCol({
          span: {
            sm: PlayConstants.SPAN_FOUR,
            md: PlayConstants.SPAN_FOUR,
            lg: PlayConstants.SPAN_FOUR
          },
          offset: {
            md: PlayConstants.OFFSET_TWO,
            lg: PlayConstants.OFFSET_ONE
          }
        }) {
          this.CoverInfo()
        }

        GridCol({
          span: { sm: PlayConstants.SPAN_FOUR, md: PlayConstants.SPAN_SIX, lg: 0 },
          offset: { md: PlayConstants.OFFSET_THREE }
        }) {
          this.MusicInfo()
        }
      }

      Blank()
      GridRow({
        columns: {
          sm: PlayConstants.COLUMN_FOUR,
          md: PlayConstants.COLUMN_EIGHT,
          lg: PlayConstants.COLUMN_TWELVE
        },
        gutter: PlayConstants.GRID_COL_GUTTER
      }) {
        GridCol({
          span: {
            sm: PlayConstants.SPAN_FOUR,
            md: PlayConstants.SPAN_SIX,
            lg: PlayConstants.SPAN_FOUR
          },
          offset: {
            md: PlayConstants.OFFSET_ONE,
            lg: PlayConstants.OFFSET_ONE
          }
        }) {
          this.OperationInfo()
        }
      }
    }
    .margin({ left: $r('app.float.twenty_four'), right: $r('app.float.twenty_four') })
    .height(StyleConstants.FULL_HEIGHT)
  }

  @Builder
  CoverInfo() {
    Image(this.songList[this.selectIndex].label)
      .constraintSize({ maxWidth: new BreakpointType({
        sm: $r('app.float.cover_image_width'),
        md: $r('app.float.cover_image_width'),
        lg: $r('app.float.cover_image_width_lg')
      }).getValue(this.currentBreakpoint) })
      .width(StyleConstants.FULL_WIDTH)
      .aspectRatio(1)
      .borderRadius($r('app.float.cover_radius'))
      .margin({
        left: new BreakpointType({
          sm: $r('app.float.music_play_cover_margin_left_sm')
        }).getValue(this.currentBreakpoint),
        right: new BreakpointType({
          sm: $r('app.float.music_play_cover_margin_right_sm')
        }).getValue(this.currentBreakpoint),
        top: new BreakpointType({
          sm: $r('app.float.music_play_cover_margin_top_sm'),
          md: $r('app.float.music_play_cover_margin_top_md'),
          lg: $r('app.float.music_play_cover_margin_top_lg')
        }).getValue(this.currentBreakpoint)
      })
  }

  @Builder
  MusicInfo() {
    Column() {
      Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
        Text(this.songList[this.selectIndex].title)
          .fontSize($r('app.float.font_twenty_four'))
          .fontColor($r('app.color.text_color'))
        Image($r('app.media.ic_like'))
          .width($r('app.float.twenty_four'))
          .aspectRatio(1)
          .objectFit(ImageFit.Contain)
      }

      Text(this.songList[this.selectIndex].singer)
        .textAlign(TextAlign.Start)
        .fontSize($r('app.float.font_fourteen'))
        .fontColor($r("app.color.text_sixty_color"))
        .margin({ top: $r('app.float.music_text_margin_top') })
        .width(StyleConstants.FULL_WIDTH)
    }
    .margin({ top: $r('app.float.music_info_margin_top') })
  }

  @Builder
  OperationInfo() {
    Flex({ justifyContent: FlexAlign.SpaceBetween }) {
      ForEach(playImage, (item: PlayControlModel) => {
        Image(item.icon)
          .aspectRatio(1)
          .width(new BreakpointType({
            sm: $r('app.float.twenty_four'),
            md: $r('app.float.twenty_four'),
            lg: $r('app.float.operation_image_width_lg')
          }).getValue(this.currentBreakpoint))
          .objectFit(ImageFit.Contain)
          .onClick(() => this.controlClick(item.key))
      }, (item: PlayControlModel, index?: number) => index + JSON.stringify(item))
    }
  }

  controlClick(key: string) {
    if (key === ControlConstants.REVIEW) {
      router.pushUrl({
        url: RouterUrlConstants.MUSIC_COMMENT
      }, router.RouterMode.Single).catch((error: Error) => {
        Logger.error('pushUrl failed :' + JSON.stringify(error));
      })
    }
  }
}