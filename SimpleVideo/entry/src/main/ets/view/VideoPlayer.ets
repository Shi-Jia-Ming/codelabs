/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import prompt from '@ohos.prompt';
import { VideoSlider } from '../view/VideoPlaySlider';
import { prepared, finish, videoOnclick, changeSliderTime } from '../model/VideoControll';
import {
  VIDEO_TYPE,
  NET,
  START_TIME,
  STRING_PERCENT,
  COMMON_NUM_DURATION,
  MESSAGE,
  ALL_PERCENT
} from '../common/constants/CommonConstants';

/**
 * video controller component
 */
@Component
export struct VideoPlayer {
  private source: string;
  private controller: VideoController;
  private innerResource: Resource = $rawfile('videoTest.mp4');
  private previewUris: Resource = $r('app.media.preview');
  private isUseDefaultControl: boolean = false;
  @Provide currentTime: number = 0;
  @Provide durationTime: number = 0;
  @Provide durationStringTime: string = START_TIME;
  @Provide sliderStartTime: string = START_TIME;
  @Consume isPlay: boolean;
  @Consume isOpacity: boolean;

  build() {
    Column() {
      Video({
        src: this.source === VIDEO_TYPE.INNER ? this.innerResource : NET,
        previewUri: this.previewUris,
        controller: this.controller
      })
        .width(ALL_PERCENT)
        .height(STRING_PERCENT.NINETY_PERCENT)
        .controls(this.isUseDefaultControl)
        .autoPlay(false)
        .loop(false)
        .onUpdate((event) => {
          this.currentTime = event.time;
          this.sliderStartTime = changeSliderTime(this.currentTime);
        })
        .onPrepared((event) => {
          prepared.call(this, event);
        })
        .onFinish(() => {
          finish.call(this);
        })
        .onError(() => {
          prompt.showToast({
            duration: COMMON_NUM_DURATION,
            message: MESSAGE
          });
        })
        .onClick(() => {
          videoOnclick.call(this);
        })
      VideoSlider({ controller: this.controller })
    }
  }
}