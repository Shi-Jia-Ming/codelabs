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

export default {
  data: {
    videoId: 'video',
    muted: false,
    src: '/common/video/video.mp4',
    autoplay: false,
    posterSrc: '/common/images/ic_poster.png',
    controlShow: false,
    loop: false,
    pauseIcon: '/common/images/ic_pause.png',
    playIcon: '/common/images/ic_play.png',
    publicPlayIcon: '/common/images/ic_public_play.png',
    sliderMin: 0,
    sliderMax: 100,
    sliderValue: 0,
    nowTime: '00:00',
    duration: 0,
    durationTime: '00:00',
    isPlay: false,
    secondUnit: 60,
    zero: '0',
    initTime: '00:00',
    paddingLen: 2,
    milliSeconds: 1000,
    finishFlag: false
  },

  /**
   * Video preparation completed.
   *
   * @param event return value after the video preparation is complete.
   */
  prepared(event) {
    this.duration = event.duration;
    this.durationTime = this.secondToTime(event.duration);
  },
  /**
   * The video starts to play.
   */
  start() {
    this.isPlay = true;
  },
  /**
   * Pause the video.
   */
  pause() {
    this.isPlay = false;
  },
  /**
   * The video playback is complete.
   */
  finish() {
    this.finishFlag = true;
    setTimeout(() => {
      this.nowTime = this.initTime;
      this.sliderValue = this.sliderMin;
    }, this.milliSeconds);
  },
  /**
   * The playback progress changes.
   *
   * @param event Value returned when the playback progress changes.
   */
  timeUpdate(event) {
    let currSliderValue = event.currenttime / this.duration * this.sliderMax;
    this.sliderValue = ((this.sliderValue > currSliderValue) ? this.sliderValue : currSliderValue);
    let currTime = this.sliderValue * this.duration / this.sliderMax;
    this.nowTime = this.secondToTime(Math.round(currTime));
  },
  /**
   * Video Pause or Playback.
   */
  startOrPause() {
    this.finishFlag = false;
    if (this.isPlay) {
      this.$element(this.videoId).pause();
    } else {
      this.$element(this.videoId).start();
    }
  },
  /**
   * Drag the progress bar.
   *
   * @param event Return value of dragging the slider.
   */
  change(event) {
    this.sliderValue = event.progress;
    this.$element(this.videoId).setCurrentTime({
      currenttime: (this.duration * event.progress / this.sliderMax)
    });
  },
  /**
   * Time conversion.
   *
   * @param duration Time required for conversion - seconds.
   * @returns Formatted character string.
   */
  secondToTime(duration) {
    let hourUnit = this.secondUnit * this.secondUnit;
    let hour = Math.floor(duration / hourUnit);
    let minute = Math.floor((duration - hour * hourUnit) / this.secondUnit);
    let second = duration - hour * hourUnit - minute * this.secondUnit;
    if (hour > 0) {
      return `${this.padding(hour.toString())}${':'}
            ${this.padding(minute.toString())}${':'}${this.padding(second.toString())}`;
    } else {
      return `${this.padding(minute.toString())}${':'}${this.padding(second.toString())}`;
    }
    return this.initTime;
  },
  /**
   * Fill position.
   *
   * @param num Data to be filled.
   * @returns Data after filling.
   */
  padding(num) {
    for (var len = (num.toString()).length; len < this.paddingLen; len = num.length) {
      num = `${this.zero}${num}`;
    }
    return num;
  }
};
