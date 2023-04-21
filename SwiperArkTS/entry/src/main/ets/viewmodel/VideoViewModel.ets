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

import { VideoItem } from '../common/bean/VideoItem';
import { VIDEO_DATA, PlayState } from '../common/constants/VideoConstants';

/**
 * Init video data.
 */
export function initializeOnStartup(): Array<VideoItem> {
  let videoDataArray: Array<VideoItem> = []
  VIDEO_DATA.forEach(item => {
    videoDataArray.push(new VideoItem(item.id, item.src, item.likesCount, item.isLikes, item.commentCount, item.shareTimes));
  })
  return videoDataArray;
}

/**
 * video show.
 */
export function onPageSwiperShow() {
  if (this.playState != PlayState.START) {
    this.playState = PlayState.START;
    this.videoController.start();
  }
}

/**
 * video hide.
 */
export function onPageSwiperHide() {
  if (this.playState != PlayState.STOP) {
    this.playState = PlayState.STOP;
    this.videoController.stop();
  }
}

/**
 * play page show.
 */
export function needPageShow() {
  if (this.pageShow) {
    if (this.barPosition === this.index) { // Judge whether the index is the same as the current location.
      this.isShow = true;
      onPageSwiperShow.call(this);
    } else {
      if (this.isShow) { // The already visible status is changed to invisible, and the invisible method callback is triggered.
        this.isShow = false;
        onPageSwiperHide.call(this);
      }
    }
  } else { // Stop when the page goes back to the background.
    this.isShow = false;
    onPageSwiperHide.call(this);
  }
}