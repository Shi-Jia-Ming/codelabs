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

import { VideoItem } from '../../common/bean/VideoItem';
import { CommonConstants } from '../../common/constants/CommonConstant';
import { PlayState } from '../../common/constants/VideoConstants';
import { NavigationView } from './NavigationView';
import { CommentView } from './CommentView';
import { DescriptionView } from './DescriptionView';

/**
 * Video play view.
 */
@Component
export struct PlayView {
  private isShow: boolean = false;
  // Change the video playing state according to the index and pageShow changes.
  @Link @Watch('needPageShow') index: number;
  @Link @Watch('needPageShow') pageShow: boolean;
  @State item: VideoItem = new VideoItem();
  private barPosition: number = 0;
  @State private playState: number = PlayState.STOP;
  private videoController: VideoController = new VideoController();

  build() {
    Stack({ alignContent: Alignment.End }) {
      Video({
        src: this.item.src,
        controller: this.videoController
      })
        .controls(false)
        .autoPlay(this.playState === PlayState.START ? true : false)
        .objectFit(ImageFit.Fill)
        .loop(true)
        .height(CommonConstants.WIDTH_VIDEO)
        .width(CommonConstants.FULL_WIDTH)
        .onClick(() => {
          if (this.playState === PlayState.START) {
            this.playState = PlayState.PAUSE;
            this.videoController.pause();
          } else if (this.playState === PlayState.PAUSE) {
            this.playState = PlayState.START;
            this.videoController.start();
          }
        })

      NavigationView()
      CommentView({ item: this.item })
      DescriptionView()
    }
    .backgroundColor(Color.Black)
    .width(CommonConstants.FULL_WIDTH)
    .height(CommonConstants.FULL_HEIGHT)
  }

  onPageSwiperShow(): void {
    if (this.playState != PlayState.START) {
      this.playState = PlayState.START;
      this.videoController.start();
    }
  }

  onPageSwiperHide(): void {
    if (this.playState != PlayState.STOP) {
      this.playState = PlayState.STOP;
      this.videoController.stop();
    }
  }

  needPageShow(): void {
    if (this.pageShow === true) {
      if (this.barPosition === this.index) { // Judge whether the index is the same as the current location.
        this.isShow = true;
        this.onPageSwiperShow();
      } else {
        if (this.isShow === true) { // The already visible status is changed to invisible, and the invisible method callback is triggered.
          this.isShow = false;
          this.onPageSwiperHide();
        }
      }
    } else { // Stop when the page goes back to the background.
      this.isShow = false;
      this.onPageSwiperHide();
    }
  }
}