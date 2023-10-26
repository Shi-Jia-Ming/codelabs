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

import { PictureItem } from '../../viewmodel/PictureItem';

/**
 * Pictures of banner.
 */
export const PICTURE_BANNER: PictureItem[] = [
  { id: '1', name: '怒海', description: '怒海波涛', image: $r('app.media.image1') },
  { id: '2', name: '大山深处', description: '大山深处感人的亲情之歌', image: $r('app.media.image2') },
  { id: '3', name: '荒漠', description: '荒漠的亲情之歌', image: $r('app.media.image3') }
];

/**
 * pictures of recently play.
 */
export const PICTURE_RECENTLY: PictureItem[] = [
  { id: '1', name: '背影', description: '感人的亲情之歌', image: $r('app.media.recently1') },
  { id: '2', name: '废墟之上', description: '勇闯无人之境', image: $r('app.media.recently2') },
  { id: '3', name: '无根之人', description: '悬疑国产力作', image: $r('app.media.recently3') },
  { id: '4', name: '摩天轮', description: '每个人心中都有一个童话', image: $r('app.media.recently4') }
];

/**
 * pictures of photo.
 */
export const PICTURE_PHOTO: PictureItem[] = [
  { id: '1', name: '蓝·静', description: '用放大镜看世界', image: $r('app.media.photo1') },
  { id: '2', name: '花', description: '每个人心中都有一个童话', image: $r('app.media.photo2') },
  { id: '3', name: '无根之人', description: '悬疑国产力作', image: $r('app.media.recently3') },
  { id: '4', name: '摩天轮', description: '每个人心中都有一个童话', image: $r('app.media.recently4') }
];

/**
 * pictures of newest.
 */
export const PICTURE_LATEST: PictureItem[] = [
  { id: '1', name: '潮·设计大会', description: '国际设计大师分...', image: $r('app.media.movie1') },
  { id: '2', name: '食客', description: '味蕾爆炸', image: $r('app.media.movie2') },
  { id: '3', name: '绿野仙踪', description: '热带雨林的故事', image: $r('app.media.image3') },
  { id: '4', name: '塔', description: '2021最期待的电...', image: $r('app.media.movie4') },
  { id: '5', name: '微缩世界', description: '用放大镜看世界', image: $r('app.media.movie5') },
  { id: '6', name: '非常规接触', description: '少年的奇妙之旅', image: $r('app.media.movie6') },
  { id: '7', name: '绿野仙踪', description: '热带雨林的故事', image: $r('app.media.movie7') },
  { id: '8', name: '塔', description: '用放大镜看世界', image: $r('app.media.movie8') },
  { id: '9', name: '食客', description: '热带雨林的故事', image: $r('app.media.movie9') }
];

/**
 * type of pictures.
 */
export enum PictureType {
  RECENTLY = 'recently',
  PHOTO = 'photo',
  LATEST = 'latest',
  BANNER = 'banner'
}