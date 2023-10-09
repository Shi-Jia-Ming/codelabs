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

import { DetailConstants } from '../constants/DetailConstants';

export class RelatedVideoViewModel {
  private relatedVideoList: RelatedVideo[] = [];
  private peripheralVideoList: RelatedVideo[] = [];

  constructor() {
    this.relatedVideoList.push(new RelatedVideo(DetailConstants.RELATED_VIDEO_TITLES[0],
      $r('app.media.related_video_1')));
    this.relatedVideoList.push(new RelatedVideo(DetailConstants.RELATED_VIDEO_TITLES[1],
      $r('app.media.related_video_2')));
    this.relatedVideoList.push(new RelatedVideo(DetailConstants.RELATED_VIDEO_TITLES[2],
      $r('app.media.related_video_3')));
    this.relatedVideoList.push(new RelatedVideo(DetailConstants.RELATED_VIDEO_TITLES[3],
      $r('app.media.related_video_4')));
    this.relatedVideoList.push(new RelatedVideo(DetailConstants.RELATED_VIDEO_TITLES[4],
      $r('app.media.related_video_5')));
    this.relatedVideoList.push(new RelatedVideo(DetailConstants.RELATED_VIDEO_TITLES[5],
      $r('app.media.related_video_1')));
    this.relatedVideoList.push(new RelatedVideo(DetailConstants.RELATED_VIDEO_TITLES[6],
      $r('app.media.related_video_2')));
    this.peripheralVideoList.push(new RelatedVideo(DetailConstants.PERIPHERAL_VIDEO_TITLE,
      $r('app.media.peripheral_video')));
    this.peripheralVideoList.push(new RelatedVideo(DetailConstants.PERIPHERAL_VIDEO_TITLE,
      $r('app.media.peripheral_video')));
    this.peripheralVideoList.push(new RelatedVideo(DetailConstants.PERIPHERAL_VIDEO_TITLE,
      $r('app.media.peripheral_video')));
    this.peripheralVideoList.push(new RelatedVideo(DetailConstants.PERIPHERAL_VIDEO_TITLE,
      $r('app.media.peripheral_video')));
    this.peripheralVideoList.push(new RelatedVideo(DetailConstants.PERIPHERAL_VIDEO_TITLE,
      $r('app.media.peripheral_video')));
  }

  getRelatedVideoList(): RelatedVideo[] {
    return this.relatedVideoList;
  }

  getPeripheralVideoList(): RelatedVideo[] {
    return this.peripheralVideoList;
  }
}

export class RelatedVideo {
  /**
   * Name of the related video.
   */
  private name: string;

  /**
   * Image src of related video.
   */
  private imageSrc: Resource;

  constructor(name: string, imageSrc: Resource) {
    this.name = name;
    this.imageSrc = imageSrc;
  }

  public getName(): string {
    return this.name;
  }

  public getImageSrc(): Resource {
    return this.imageSrc;
  }
}