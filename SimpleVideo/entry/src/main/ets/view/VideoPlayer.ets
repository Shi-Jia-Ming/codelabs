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

import prompt from '@ohos.promptAction';
import { VideoSlider } from '../view/VideoPlaySlider';
import {changeSliderTime } from '../model/VideoControll';
import {
  START_TIME,
  STRING_PERCENT,
  COMMON_NUM_DURATION,
  MESSAGE,
  ALL_PERCENT,
  COMMON_NUM_MINUTE,
  COMMON_NUM_DOUBLE,
  ZERO_STR,
  SPLIT
} from '../common/constants/CommonConstants';

/**
 * video controller component
 */
@Component
export struct VideoPlayer {
  private source: string | Resource = '';
  private controller: VideoController = new VideoController();
  private previewUris: Resource = $r('app.media.preview');
  @Provide currentTime: number = 0;
  @Provide durationTime: number = 0;
  @Provide durationStringTime: string = START_TIME;
  @Provide currentStringTime: string = START_TIME;
  @Consume isPlay: boolean;
  @Consume isOpacity: boolean;
  @Consume flag: boolean;
  @Consume isLoading: boolean;
  @Consume progressVal: number;

  build() {
    Column() {
      Video({
        src: this.source,
        previewUri: this.previewUris,
        controller: this.controller
      })
        .width(ALL_PERCENT)
        .height(STRING_PERCENT.NINETY_PERCENT)
        .controls(false)
        .autoPlay(false)
        .objectFit(ImageFit.Contain)
        .loop(false)
        .onUpdate((event) => {
          if (event) {
            this.currentTime = event.time;
            this.currentStringTime = changeSliderTime(this.currentTime);
          }
        })
        .onPrepared((event) => {
          this.prepared(event?.duration);
        })
        .onFinish(() => {
          this.finish();
        })
        .onError(() => {
          prompt.showToast({
            duration: COMMON_NUM_DURATION,
            message: MESSAGE
          });
        })
      VideoSlider({ controller: this.controller })
    }
  }

  /**
   * video component prepared callback
   */
  prepared(duration: number) {
    this.durationTime = duration;
    let second: number = duration % COMMON_NUM_MINUTE;
    let min: number = Number.parseInt((duration / COMMON_NUM_MINUTE).toString());
    let head = min < COMMON_NUM_DOUBLE ? `${ZERO_STR}${min}` : min;
    let end = second < COMMON_NUM_DOUBLE ? `${ZERO_STR}${second}` : second;
    this.durationStringTime = `${head}${SPLIT}${end}`;
    this.flag = true;
  }

  /**
   * video component finish callback
   */
  finish() {
    this.isPlay = false;
    this.isOpacity = false;
  }
}