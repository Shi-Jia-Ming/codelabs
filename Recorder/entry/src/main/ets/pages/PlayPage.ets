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
import { CommonConstants as Const } from '../common/constants/CommonConstants';
import Utils from '../common/utils/Utils';
import PlayManager from '../manager/PlayManager';

@Entry
@Component
struct PlayPage {
  private player: PlayManager = new PlayManager();
  private uri: string = '';
  private audioName: string = '';
  private intervalId: number = 0;
  private timer: number = 0;
  private timeScale = Const.TIME_SCALE;
  @State @Watch('onPlayChange') isPlaying: boolean = false;
  @State @Watch('onPlayComplete') isCompleted: boolean = false;
  @State timeAdd: number = 0;
  @State milliseconds: number = 0;
  @State translateText: string = Const.INIT_TRANSLATE;
  @State translateImage: string = Const.INIT_TRANSLATE;
  @State @Watch('onTimeChanged') loader: number = 0;
  @State time: string = '00:00:00';
  @State total: number = 0;

  aboutToAppear() {
    let params = router.getParams() as Record<string, Object>;
    this.uri = params.uri as string;
    this.audioName = params.name as string;
    this.player.init(this);
  }

  onTimeChanged() {
    this.time = Utils.duration2Time(this.loader);
  }

  animator() {
    if (this.isPlaying) {
      this.intervalId = setInterval(() => {
        this.translateText = Const.TRANSLATE_TEXT;
        this.translateImage = Const.TRANSLATE_IMAGE;
        this.timeAdd += 1;
        animateTo({ duration: Const.TIME_1000, curve: Curve.Linear }, () => {
          this.translateImage = Const.INIT_TRANSLATE;
          this.translateText = Const.INIT_TRANSLATE;
        });
      }, Const.TIME_1000);
    } else {
      clearInterval(this.intervalId);
    }
  }

  startTimer() {
    if (this.isPlaying) {
      clearInterval(this.timer);
      this.timer = setInterval(() => {
        this.milliseconds += Const.TIME_1000;
      }, Const.TIME_1000);
    } else {
      clearInterval(this.timer);
    }
  }

  onPlayChange() {
    setTimeout((): void => this.startTimer(), Const.TIME_1000);
    this.animator();
  }

  onPlayComplete() {
    if (this.isCompleted) {
      this.isPlaying = false;
    }
  }

  build() {
    Row() {
      Column() {
        Row() {
          Image($r('app.media.ic_back'))
            .width($r('app.float.icon_back_width'))
            .height($r('app.float.icon_back_height'))
            .margin({ left: $r('app.float.icon_back_margin_left'), right: $r('app.float.icon_back_margin_right') })
            .onClick(() => {
              this.player.release();
              router.back();
            })

          Text(this.audioName)
            .fontSize($r('app.float.file_name_font_size'))
        }
        .width(Const.FULL_SIZE)
        .height($r('app.float.file_name_row_height'))
        .margin({ bottom: $r('app.float.file_name_row_margin') })

        Column() {
          Row() {
            ForEach(this.timeScale, (item: string) => {
              Column() {
                Text(Utils.updateSlider(this.timeAdd, this.timeScale.indexOf(item)))
                  .fontSize($r('app.float.time_slider_font_size'))
                  .fontColor(Color.Gray)
                  .textAlign(TextAlign.End)
                  .maxLines(1)
              }
              .width(Const.TIME_SLIDER_WIDTH)
            }, (item: string) => JSON.stringify(item))
          }
          .width(Const.FULL_SIZE)
          .height($r('app.float.time_slider_height'))
          .translate({ x: this.translateText })
          .justifyContent(FlexAlign.Center)

          Image($r('app.media.ic_slider_time'))
            .width(Const.TIME_SLIDER_IMAGE_WIDTH)
            .height($r('app.float.time_slider_image_height'))
            .objectFit(ImageFit.Fill)
            .translate({ x: this.translateImage })

          Image($r('app.media.ic_bg_play'))
            .width(Const.FULL_SIZE)
            .height($r('app.float.time_slider_bg_height'))
            .objectFit(ImageFit.Fill)

          Text(Utils.updateTime(this.milliseconds))
            .fontSize($r('app.float.cur_time_text_font_size'))
            .width($r('app.float.cur_time_text_width'))
            .height($r('app.float.cur_time_text_height'))

          Text(Utils.duration2Time(this.total))
            .fontSize($r('app.float.duration_font_size'))
            .width($r('app.float.duration_width'))
            .height($r('app.float.duration_height'))
        }
        .width(Const.FULL_SIZE)

        Button() {
          Image(this.isPlaying? $r('app.media.ic_pause_lg') : $r('app.media.ic_play_lg'))
        }
        .width($r('app.float.button_size'))
        .height($r('app.float.button_size'))
        .markAnchor({ x: $r('app.float.button_mark_anchor'), y: 0 })
        .position({ x: Const.POSITION_X, y: Const.POSITION_Y })
        .backgroundColor($r('app.color.background_color'))
        .onClick(() => {
          if (this.isPlaying) {
            this.player.pause();
            this.isPlaying = false;
          } else {
            this.player.play(this.uri);
            this.isPlaying = true;
          }
          if(this.isCompleted) {
            this.timeAdd = 0;
            this.milliseconds = 0;
            this.isCompleted = false;
          }
        })
      }
      .width(Const.FULL_SIZE)
      .height(Const.FULL_SIZE)
    }
    .width(Const.FULL_SIZE)
    .height(Const.FULL_SIZE)
    .backgroundColor($r('app.color.background_color'))
  }
}