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

import {
  ALL_PERCENT,
  MARGIN_FONT_SIZE,
  SMALL_TRACK_THICK_NESS,
  DEFAULT_OPACITY,
  STRING_PERCENT,
  BIG_TRACK_THICK_NESS,
  IMAGE_SIZE,
  STACK_STYLE
} from '../common/constants/CommonConstants';

/**
 * video slider component
 */
@Component
export struct VideoSlider {
  @Consume isOpacity: boolean;
  private controller: VideoController = new VideoController();
  @Consume currentStringTime: string;
  @Consume currentTime: number;
  @Consume durationTime: number;
  @Consume durationStringTime: string;
  @Consume isPlay: boolean;
  @Consume flag: boolean;
  @Consume isLoading: boolean;
  @Consume progressVal: number;

  build() {
    Row({ space: MARGIN_FONT_SIZE.FIRST_MARGIN }) {
      Image(this.isPlay ? $r('app.media.ic_pause') : $r('app.media.ic_play'))
        .width(IMAGE_SIZE)
        .height(IMAGE_SIZE)
        .margin({ left: MARGIN_FONT_SIZE.FIRST_MARGIN })
        .onClick(() => {
          this.iconOnclick();
        })
      Text(this.currentStringTime)
        .fontSize(MARGIN_FONT_SIZE.SECOND_MARGIN)
        .fontColor(Color.White)
        .margin({ left: MARGIN_FONT_SIZE.FIRST_MARGIN })
      Slider({
        value: this.currentTime,
        min: 0,
        max: this.durationTime,
        step: 1,
        style: SliderStyle.OutSet
      })
        .blockColor($r('app.color.white'))
        .width(STRING_PERCENT.SLIDER_WITH)
        .trackColor(Color.Gray)
        .selectedColor($r("app.color.white"))
        .showSteps(true)
        .showTips(true)
        .trackThickness(this.isOpacity ? SMALL_TRACK_THICK_NESS : BIG_TRACK_THICK_NESS)
        .onChange((value: number, mode: SliderChangeMode) => {
          this.sliderOnchange(value, mode);
        })
      Text(this.durationStringTime)
        .fontSize(MARGIN_FONT_SIZE.SECOND_MARGIN)
        .margin({ right: MARGIN_FONT_SIZE.FIRST_MARGIN })
        .fontColor(Color.White)
    }
    .opacity(this.isOpacity ? DEFAULT_OPACITY : 1)
    .width(ALL_PERCENT)
    .alignItems(VerticalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }

  /**
   * icon onclick callback
   */
  iconOnclick() {
    if (this.isPlay === true) {
      this.controller.pause()
      this.isPlay = false;
      this.isOpacity = false;
      return;
    }
    if (this.flag === true) {
      this.controller.start();
      this.isPlay = true;
      this.isOpacity = true;
    } else {
      this.isLoading = true;
      // The video loading is not complete. The loading action is displayed.
      let intervalLoading = setInterval(() => {
        if (this.progressVal >= STACK_STYLE.PROGRESS_TOTAL) {
          this.progressVal = 0;
        } else {
          this.progressVal += STACK_STYLE.PROGRESS_STEP;
        }
      }, STACK_STYLE.MILLI_SECONDS)
      // The scheduled task determines whether the video loading is complete.
      let intervalFlag = setInterval(() => {
        if (this.flag === true) {
          this.controller.start();
          this.isPlay = true;
          this.isOpacity = true;
          this.isLoading = false;
          clearInterval(intervalFlag);
          clearInterval(intervalLoading);
        }
      }, STACK_STYLE.MILLI_SECONDS);
    }
  }

  /**
   * video slider component onchange callback
   */
  sliderOnchange(value: number, mode: SliderChangeMode) {
    this.currentTime = Number.parseInt(value.toString());
    this.controller.setCurrentTime(Number.parseInt(value.toString()), SeekMode.Accurate);
    if (mode === SliderChangeMode.Begin || mode === SliderChangeMode.Moving) {
      this.isOpacity = false;
    }
    if (mode === SliderChangeMode.End) {
      this.isOpacity = true;
    }
  }
}