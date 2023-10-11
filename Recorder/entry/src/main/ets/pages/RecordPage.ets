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

import mediaLibrary from '@ohos.multimedia.mediaLibrary';
import preferences from '@ohos.data.preferences';
import router from '@ohos.router';
import { CommonConstants as Const } from '../common/constants/CommonConstants';
import Utils from '../common/utils/Utils';
import MediaManager from '../manager/MediaManager';
import RecordManager from '../manager/RecordManager';

@Entry
@Component
struct RecordPage {
  private recorder: RecordManager = new RecordManager();
  private audioFile?: mediaLibrary.FileAsset;
  private fd?: number;
  private intervalId: number = 0;
  private timer: number = 0;
  private timeScale: Array<string> = Const.TIME_SCALE;
  private preferences?: preferences.Preferences;
  @State @Watch('onRecordChange') isRecording: boolean = true;
  @State fileName: string = '';
  @State timeAdd: number = 0;
  @State milliseconds: number = 0;
  @State translateText: string = Const.INIT_TRANSLATE;
  @State translateImage: string = Const.INIT_TRANSLATE;

  async aboutToAppear() {
    this.recorder.init();
    this.audioFile = await MediaManager!.createAudioFile();
    this.fd = await this.audioFile!.open('rw');
    this.fileName = this.audioFile!.displayName;
    this.recorder.start(`fd://${this.fd}`);
  }

  onPageShow() {
    setTimeout((): void => this.startTimer(), Const.TIME_1000);
    this.animator();
    let promise = preferences.getPreferences(getContext(this), 'duration');
    promise.then((obj: preferences.Preferences) => {
      this.preferences = obj;
    })
  }

  animator() {
    if (this.isRecording) {
      this.intervalId = setInterval(() => {
        this.translateText = Const.TRANSLATE_TEXT;
        this.translateImage = Const.TRANSLATE_IMAGE;
        this.timeAdd += 1;
        animateTo({ duration: Const.TIME_1000, curve: Curve.Linear }, () => {
          this.translateText = Const.INIT_TRANSLATE;
          this.translateImage = Const.INIT_TRANSLATE;
        });
      }, Const.TIME_1000);
    } else {
      clearInterval(this.intervalId);
    }
  }

  startTimer() {
    if (this.isRecording) {
      this.timer = setInterval(() => {
        this.milliseconds += Const.TIME_1000;
      }, Const.TIME_1000);
    } else {
      clearInterval(this.timer);
    }
  }

  onRecordChange() {
    setTimeout((): void => this.startTimer(), Const.TIME_1000);
    this.animator();
  }

  saveDuration() {
    this.preferences!.put(this.fileName, this.milliseconds).then(() => {
      this.preferences!.flush().then(() => {
        console.log('[Recorder]success!' + this.fileName + this.milliseconds)
      })
    })
  }

  build() {
    Row() {
      Column() {
        Row() {
          Image($r('app.media.ic_back'))
            .width($r('app.float.icon_back_width'))
            .height($r('app.float.icon_back_height'))
            .margin({ left: $r('app.float.icon_back_margin_left'), right: $r('app.float.icon_back_margin_right') })
            .onClick(async () => {
              this.recorder.finish();
              await this.audioFile!.close(this.fd!);
              router.back();
            })

          Text(this.fileName)
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
        }
        .width(Const.FULL_SIZE)

        Button() {
          Image($r('app.media.ic_finish'))
        }
        .width($r('app.float.button_size'))
        .height($r('app.float.button_size'))
        .markAnchor({ x: $r('app.float.button_mark_anchor'), y: 0 })
        .position({ x: Const.POSITION_X, y: Const.POSITION_Y })
        .backgroundColor($r('app.color.background_color'))
        .onClick(async () => {
          this.recorder.finish();
          await this.audioFile!.close(this.fd!);
          this.saveDuration();
          router.back();
        })

        Button() {
          Image(this.isRecording ? $r('app.media.ic_pause') : $r('app.media.ic_resume'))
        }
        .width($r('app.float.audio_little_icon_size'))
        .height($r('app.float.audio_little_icon_size'))
        .markAnchor({ x: $r('app.float.audio_little_icon_mark_anchor'), y: 0 })
        .position({ x: Const.ICON_POSITION_X, y: Const.ICON_POSITION_Y })
        .backgroundColor($r('app.color.background_color'))
        .onClick(() => {
          if (this.isRecording) {
            this.recorder.pause();
            this.isRecording = false;
          } else {
            this.recorder.resume();
            this.isRecording = true;
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