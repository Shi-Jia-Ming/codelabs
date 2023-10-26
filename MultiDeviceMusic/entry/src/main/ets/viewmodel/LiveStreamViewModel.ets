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

import { LiveStream } from './LiveStream'
export class LiveStreamViewModel {
  getLiveStreamList(): LiveStream[] {
    let LiveStreamList: Array<LiveStream> = [];
    LiveStreamList.push(new LiveStream($r('app.string.live_one'), $r('app.string.live_one_introduction'),
      $r('app.media.snow_mountain')));
    LiveStreamList.push(new LiveStream($r('app.string.live_two'), $r('app.string.live_two_introduction'),
      $r('app.media.meal')));
    LiveStreamList.push(new LiveStream($r('app.string.live_three'), $r('app.string.live_three_introduction'),
      $r('app.media.insects_world')));
    return LiveStreamList;
  }
}