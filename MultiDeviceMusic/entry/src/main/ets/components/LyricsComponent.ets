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

import { BreakpointType } from '../common/utils/BreakpointSystem';
import { SongItem } from '../viewmodel/SongData';
import { MusicList } from '../viewmodel/MusicListViewModel';
import { PlayConstants } from '../common/constants/PlayConstants';
import { StyleConstants } from '../common/constants/StyleConstants';


@Component
export struct LyricsComponent {
  @StorageProp('currentBreakpoint') currentBreakpoint: string = 'sm';
  songList: SongItem[] = MusicList;
  @StorageProp('selectIndex') selectIndex: number = 0;

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
            md: PlayConstants.SPAN_SIX,
            lg: PlayConstants.SPAN_SIX
          },
          offset: {
            md: PlayConstants.OFFSET_ONE,
            lg: PlayConstants.OFFSET_SIX
          }
        }) {
          Flex({ direction: FlexDirection.Column }) {
            Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
              Text(this.songList[this.selectIndex].title)
                .fontSize(new BreakpointType({
                  sm: $r('app.float.font_twenty_four'),
                  md: $r('app.float.font_twenty_four'),
                  lg: $r('app.float.font_thirty')
                }).getValue(this.currentBreakpoint))
                .fontColor($r('app.color.text_color'))
                .textAlign(TextAlign.Start)
                .width(StyleConstants.FULL_WIDTH)

              Image($r('app.media.ic_like'))
                .width($r('app.float.image_like_size'))
                .aspectRatio(1)
                .objectFit(ImageFit.Contain)
                .visibility(new BreakpointType({
                  sm: Visibility.None,
                  md: Visibility.None,
                  lg: Visibility.Visible
                }).getValue(this.currentBreakpoint))
            }

            Text(this.songList[this.selectIndex].singer)
              .textAlign(TextAlign.Start)
              .fontSize(new BreakpointType({
                sm: $r('app.float.font_fourteen'),
                md: $r('app.float.font_fourteen'),
                lg: $r('app.float.font_eighteen')
              }).getValue(this.currentBreakpoint))
              .fontColor($r("app.color.text_sixty_color"))
              .margin({ top: $r('app.float.text_singer_margin_top') })
              .width(StyleConstants.FULL_WIDTH)

            Text(PlayConstants.LYRICS_CONTENT)
              .fontSize(new BreakpointType({
                sm: $r('app.float.font_twenty'),
                md: $r('app.float.font_twenty'),
                lg: $r('app.float.font_twenty_four')
              }).getValue(this.currentBreakpoint))
              .fontColor($r("app.color.text_sixty_color"))
              .textAlign(TextAlign.Start)
              .width(StyleConstants.FULL_WIDTH)
              .margin({ top: $r('app.float.lyrics_text_margin_top') })
          }
        }
      }
    }
    .margin({
      top: new BreakpointType({
        sm: $r('app.float.twenty_four'),
        md: $r('app.float.twenty_four'),
        lg: $r('app.float.lyrics_margin_top_lg')
      }).getValue(this.currentBreakpoint),
      left: $r('app.float.twenty_four'),
      right: $r('app.float.twenty_four')
    })
  }
}