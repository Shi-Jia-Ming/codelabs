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
import { HorizontalVideoItem } from './HorizontalVideoItem';
import { SwiperVideoItem } from './SwiperVideoItem';

export const SWIPER_VIDEOS: SwiperVideoItem[] = [
  new SwiperVideoItem($r('app.media.banner1')),
  new SwiperVideoItem($r('app.media.banner2')),
  new SwiperVideoItem($r('app.media.banner3'))
];

export const HORIZONTAL_VIDEOS: HorizontalVideoItem[] = [
  new HorizontalVideoItem(1, $r('app.media.video_list0'), '视频1'),
  new HorizontalVideoItem(2, $r('app.media.video_list1'), '视频2'),
  new HorizontalVideoItem(3, $r('app.media.video_list2'), '视频3')
];