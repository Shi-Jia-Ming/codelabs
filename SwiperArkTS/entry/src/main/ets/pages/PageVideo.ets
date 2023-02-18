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
import { initializeOnStartup } from '../viewmodel/VideoViewModel';
import { PlayView } from '../view/play/PlayView';
import { CommonConstants } from '../common/constants/CommonConstant';

/**
 * Video playing page
 */
@Entry
@Component
struct PageVideo {
  @State videoArray: Array<VideoItem> = initializeOnStartup();
  @State index: number = 0; // video index
  @State pageShow: boolean = false;

  build() {
    Column() {
      Swiper() {
        ForEach(this.videoArray.map((item, index) => {
          return { i: index, data: item };
        }),
          item => {
            PlayView({ index: $index, pageShow: $pageShow, item: item.data, barPosition: item.i })
          },
          item => item.data.id)
      }
      .width(CommonConstants.FULL_WIDTH)
      .height(CommonConstants.FULL_HEIGHT)
      .indicator(false)
      .loop(false)
      .vertical(true)
      .onChange((index: number) => {
        this.index = index;
      })
    }
  }

  onPageShow(): void {
    this.pageShow = true;
  }

  onPageHide(): void {
    this.pageShow = false;
  }
}