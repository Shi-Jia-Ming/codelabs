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

import { VideoItem } from '../../viewmodel/VideoItem';

/**
 * Data of video.
 */
export const VIDEO_DATA: VideoItem[] = [
  {
    id: '1',
    src: $rawfile('video1.mp4'),
    likesCount: 0,
    isLikes: false,
    commentCount: 102,
    shareTimes: 666
  },
  {
    id: '2',
    src: $rawfile('video2.mp4'),
    likesCount: 8654,
    isLikes: true,
    commentCount: 0,
    shareTimes: 0
  }
];

/**
 * state of video play.
 */
export enum PlayState {
  STOP = 0,
  START = 1,
  PAUSE = 2
}