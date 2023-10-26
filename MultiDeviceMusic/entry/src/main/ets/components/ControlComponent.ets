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

import { MediaService} from '../common/utils/MediaService';
import { BreakpointType } from '../common/utils/BreakpointSystem';
import { PlayControlModel } from '../viewmodel/PlayControlModel';
import { ControlConstants } from '../common/constants/ControlConstants';
import { PlayConstants } from '../common/constants/PlayConstants';
import { playControl } from '../viewmodel/PlayData';
import { PlayControlComponent } from './PlayControlComponent';

@Component
export struct ControlComponent {
  @StorageProp('currentBreakpoint') currentBreakpoint: string = 'sm';
  @StorageLink('isPlay') @Watch('updatePlay') isPlay: boolean = false;
  @StorageLink('currentTime') currentTime: string = '00:00';
  @StorageLink('totalTime') totalTime: string = '00:00';
  @StorageLink('progress') value: number = 0;
  @StorageLink('progressMax') max: number = 0;

  aboutToAppear() {
    this.updatePlay();
  }

  updatePlay() {
    playControl.forEach((item: PlayControlModel, index: number) => {
      if (index === PlayConstants.PLAY_INDEX) {
        item.icon = this.isPlay ? $r('app.media.ic_play_big') : $r('app.media.ic_pause_big');
        item.key = this.isPlay ? ControlConstants.PAUSE : ControlConstants.PLAY;
      }
    })
  }

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
            lg: PlayConstants.SPAN_FOUR
          },
          offset: {
            md: PlayConstants.OFFSET_ONE,
            lg: PlayConstants.OFFSET_ONE
          }
        }) {
          Column() {
            Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
              Text(this.currentTime)
                .width($r('app.float.slide_text_width'))
                .textAlign(TextAlign.Center)
                .fontColor($r("app.color.text_sixty_color"))
                .fontSize(new BreakpointType({
                  sm: $r('app.float.font_twelve'),
                  md: $r('app.float.font_twelve'),
                  lg: $r('app.float.font_fifteen')
                }).getValue(this.currentBreakpoint))
              Slider({ min: 0, max: this.max, step: PlayConstants.SLIDE_STEP, value: this.value })
                .blockColor($r('app.color.text_color'))
                .selectedColor($r('app.color.text_color'))
                .trackColor($r('app.color.text_twenty_color'))
                .onChange((value: number, mode: SliderChangeMode) => {
                  if (mode === SliderChangeMode.End || mode === SliderChangeMode.Begin ||
                    mode === SliderChangeMode.Click) {
                    MediaService.getInstance().seek(value);
                  }
                })
              Text(this.totalTime)
                .width($r('app.float.slide_text_width'))
                .textAlign(TextAlign.Center)
                .fontColor($r("app.color.text_sixty_color"))
                .fontSize(new BreakpointType({
                  sm: $r('app.float.font_twelve'),
                  md: $r('app.float.font_twelve'),
                  lg: $r('app.float.font_fifteen')
                }).getValue(this.currentBreakpoint))
            }
            .margin({ top: $r('app.float.music_play_cover_margin'), bottom: $r('app.float.music_play_cover_margin') })

            Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
              ForEach(playControl, (item: PlayControlModel, index?: number) => {
                PlayControlComponent({
                  playControl: item,
                  index: index
                })
              }, (item: PlayControlModel, index?: number) => index + JSON.stringify(item))
            }
          }
        }
      }
    }
    .margin({
      top: $r('app.float.twenty_four'),
      left: $r('app.float.twenty_four'),
      right: $r('app.float.twenty_four'),
      bottom: $r('app.float.fifty_six')
    })
  }
}