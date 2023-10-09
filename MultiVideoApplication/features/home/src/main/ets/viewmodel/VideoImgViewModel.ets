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

import { BreakpointConstants } from '@ohos/commons';
import { HomeConstants } from '../constants/HomeConstants';

export class VideoImgViewModel {
  private videoImgList: VideoImage[] = [];
  private newVideoImgList: VideoImage[] = [];
  private dailyVideoImgList: VideoImage[] = [];
  private mainDailyVideoImg: VideoImage;
  private previousVideoImgListOne: VideoImage[] = [];
  private previousVideoImgListTwo: VideoImage[] = [];

  constructor() {
    this.videoImgList.push(new VideoImage($r('app.media.ic_video_grid_1'), HomeConstants.VIDEO_GRID_RATES[0],
      HomeConstants.VIDEO_GRID_NAMES[0], HomeConstants.VIDEO_GRID_CONTENTS[0], ''));
    this.videoImgList.push(new VideoImage($r('app.media.ic_video_grid_2'), HomeConstants.VIDEO_GRID_RATES[1],
      HomeConstants.VIDEO_GRID_NAMES[1], HomeConstants.VIDEO_GRID_CONTENTS[1], ''));
    this.videoImgList.push(new VideoImage($r('app.media.ic_video_grid_3'), HomeConstants.VIDEO_GRID_RATES[2],
      HomeConstants.VIDEO_GRID_NAMES[2], HomeConstants.VIDEO_GRID_CONTENTS[2], ''));
    this.videoImgList.push(new VideoImage($r('app.media.ic_video_grid_4'), HomeConstants.VIDEO_GRID_RATES[3],
      HomeConstants.VIDEO_GRID_NAMES[3], HomeConstants.VIDEO_GRID_CONTENTS[3], ''));
    this.videoImgList.push(new VideoImage($r('app.media.ic_video_grid_5'), HomeConstants.VIDEO_GRID_RATES[4],
      HomeConstants.VIDEO_GRID_NAMES[4], HomeConstants.VIDEO_GRID_CONTENTS[4], ''));
    this.videoImgList.push(new VideoImage($r('app.media.ic_video_grid_6'), HomeConstants.VIDEO_GRID_RATES[5],
      HomeConstants.VIDEO_GRID_NAMES[5], HomeConstants.VIDEO_GRID_CONTENTS[5], ''));
    this.videoImgList.push(new VideoImage($r('app.media.ic_video_grid_7'), HomeConstants.VIDEO_GRID_RATES[6],
      HomeConstants.VIDEO_GRID_NAMES[6], HomeConstants.VIDEO_GRID_CONTENTS[6], ''));
    this.videoImgList.push(new VideoImage($r('app.media.ic_video_grid_8'), HomeConstants.VIDEO_GRID_RATES[7],
      HomeConstants.VIDEO_GRID_NAMES[7], HomeConstants.VIDEO_GRID_CONTENTS[7], ''));
    this.videoImgList.push(new VideoImage($r('app.media.ic_video_grid_9'), HomeConstants.VIDEO_GRID_RATES[8],
      HomeConstants.VIDEO_GRID_NAMES[8], HomeConstants.VIDEO_GRID_CONTENTS[8], ''));
    this.videoImgList.push(new VideoImage($r('app.media.ic_video_grid_10'), HomeConstants.VIDEO_GRID_RATES[9],
      HomeConstants.VIDEO_GRID_NAMES[9], HomeConstants.VIDEO_GRID_CONTENTS[9], ''));

    this.newVideoImgList.push(new VideoImage($r('app.media.new_video_1'), HomeConstants.NEW_VIDEO_RATES[0],
      HomeConstants.NEW_VIDEO_NAMES[0], HomeConstants.NEW_VIDEO_CONTENTS[0], ''));
    this.newVideoImgList.push(new VideoImage($r('app.media.new_video_2'), HomeConstants.NEW_VIDEO_RATES[1],
      HomeConstants.NEW_VIDEO_NAMES[1], HomeConstants.NEW_VIDEO_CONTENTS[1], ''));
    this.newVideoImgList.push(new VideoImage($r('app.media.new_video_3'), HomeConstants.NEW_VIDEO_RATES[2],
      HomeConstants.NEW_VIDEO_NAMES[2], HomeConstants.NEW_VIDEO_CONTENTS[2], ''));
    this.newVideoImgList.push(new VideoImage($r('app.media.new_video_4'), HomeConstants.NEW_VIDEO_RATES[3],
      HomeConstants.NEW_VIDEO_NAMES[3], HomeConstants.NEW_VIDEO_CONTENTS[3], ''));
    this.newVideoImgList.push(new VideoImage($r('app.media.new_video_5'), HomeConstants.NEW_VIDEO_RATES[4],
      HomeConstants.NEW_VIDEO_NAMES[4], HomeConstants.NEW_VIDEO_CONTENTS[4], ''));
    this.newVideoImgList.push(new VideoImage($r('app.media.new_video_6'), HomeConstants.NEW_VIDEO_RATES[5],
      HomeConstants.NEW_VIDEO_NAMES[5], HomeConstants.NEW_VIDEO_CONTENTS[5], ''));
    this.newVideoImgList.push(new VideoImage($r('app.media.new_video_7'), HomeConstants.NEW_VIDEO_RATES[6],
      HomeConstants.NEW_VIDEO_NAMES[6], HomeConstants.NEW_VIDEO_CONTENTS[6], ''));

    this.mainDailyVideoImg = new VideoImage($r('app.media.daily_video'), HomeConstants.MAIN_DAILY_VIDEO_RATE,
      HomeConstants.MAIN_DAILY_VIDEO_NAME, HomeConstants.MAIN_DAILY_VIDEO_CONTENT, HomeConstants.MAIN_DAILY_VIDEO_MORE);

    this.dailyVideoImgList.push(new VideoImage($r('app.media.ic_video_grid_6'), HomeConstants.DAILY_VIDEO_RATES[0],
      HomeConstants.DAILY_VIDEO_NAMES[0], HomeConstants.DAILY_VIDEO_CONTENTS[0], ''));
    this.dailyVideoImgList.push(new VideoImage($r('app.media.ic_video_grid_5'), HomeConstants.DAILY_VIDEO_RATES[1],
      HomeConstants.DAILY_VIDEO_NAMES[1], HomeConstants.DAILY_VIDEO_CONTENTS[1], ''));
    this.dailyVideoImgList.push(new VideoImage($r('app.media.ic_video_grid_8'), HomeConstants.DAILY_VIDEO_RATES[2],
      HomeConstants.DAILY_VIDEO_NAMES[2], HomeConstants.DAILY_VIDEO_CONTENTS[2], ''));
    this.dailyVideoImgList.push(new VideoImage($r('app.media.ic_video_grid_7'), HomeConstants.DAILY_VIDEO_RATES[3],
      HomeConstants.DAILY_VIDEO_NAMES[3], HomeConstants.DAILY_VIDEO_CONTENTS[3], ''));

    this.previousVideoImgListOne.push(new VideoImage($r('app.media.previous_video_1'), '',
      HomeConstants.PREVIOUS_VIDEO_NAMES_ONE[0], HomeConstants.PREVIOUS_VIDEO_CONTENTS_ONE[0],
      HomeConstants.PREVIOUS_VIDEO_MORE_ONE[0]));
    this.previousVideoImgListOne.push(new VideoImage($r('app.media.previous_video_2'), '',
      HomeConstants.PREVIOUS_VIDEO_NAMES_ONE[1], HomeConstants.PREVIOUS_VIDEO_CONTENTS_ONE[1],
      HomeConstants.PREVIOUS_VIDEO_MORE_ONE[1]));
    this.previousVideoImgListOne.push(new VideoImage($r('app.media.previous_video_3'), '',
      HomeConstants.PREVIOUS_VIDEO_NAMES_ONE[2], HomeConstants.PREVIOUS_VIDEO_CONTENTS_ONE[2],
      HomeConstants.PREVIOUS_VIDEO_MORE_ONE[2]));

    this.previousVideoImgListTwo.push(new VideoImage($r('app.media.previous_video_4'), '',
      HomeConstants.PREVIOUS_VIDEO_NAMES_TWO[0], HomeConstants.PREVIOUS_VIDEO_CONTENTS_TWO[0], ''));
    this.previousVideoImgListTwo.push(new VideoImage($r('app.media.previous_video_5'), '',
      HomeConstants.PREVIOUS_VIDEO_NAMES_TWO[1], HomeConstants.PREVIOUS_VIDEO_CONTENTS_TWO[1], ''));
    this.previousVideoImgListTwo.push(new VideoImage($r('app.media.previous_video_6'), '',
      HomeConstants.PREVIOUS_VIDEO_NAMES_TWO[2], HomeConstants.PREVIOUS_VIDEO_CONTENTS_TWO[2], ''));
    this.previousVideoImgListTwo.push(new VideoImage($r('app.media.previous_video_7'), '',
      HomeConstants.PREVIOUS_VIDEO_NAMES_TWO[3], HomeConstants.PREVIOUS_VIDEO_CONTENTS_TWO[3], ''));
    this.previousVideoImgListTwo.push(new VideoImage($r('app.media.previous_video_8'), '',
      HomeConstants.PREVIOUS_VIDEO_NAMES_TWO[4], HomeConstants.PREVIOUS_VIDEO_CONTENTS_TWO[4], ''));
    this.previousVideoImgListTwo.push(new VideoImage($r('app.media.previous_video_9'), '',
      HomeConstants.PREVIOUS_VIDEO_NAMES_TWO[5], HomeConstants.PREVIOUS_VIDEO_CONTENTS_TWO[5], ''));
  }

  getVideoImgList(): VideoImage[] {
    return this.videoImgList;
  }

  getNewVideoImgList(): VideoImage[] {
    return this.newVideoImgList;
  }

  getDailyVideoImgList(): VideoImage[] {
    return this.dailyVideoImgList;
  }

  getMainDailyVideoImg(): VideoImage {
    return this.mainDailyVideoImg;
  }

  getPreviousVideoOne(): VideoImage[] {
    return this.previousVideoImgListOne;
  }

  getPreviousVideoTwo(currentBreakpoint: string): VideoImage[] {
    if (currentBreakpoint === BreakpointConstants.BREAKPOINT_MD) {
      return this.previousVideoImgListTwo;
    } else if (currentBreakpoint === BreakpointConstants.BREAKPOINT_LG) {
      return this.previousVideoImgListTwo.slice(0, 5);
    } else {
      return this.previousVideoImgListTwo.slice(0, 4);
    }
  }
}

export class VideoImage {
  /**
   * Image src of the video.
   */
  private imgSrc: Resource;

  /**
   * Rating of the video.
   */
  private rating: string;

  /**
   * Title of the video.
   */
  private title: string;

  /**
   * Content of the video.
   */
  private content: string;

  /**
   * Other information of the video.
   */
  private otherInfo: string;

  constructor(imgSrc: Resource, rating: string, title: string, content: string, otherInfo: string) {
    this.imgSrc = imgSrc;
    this.rating = rating;
    this.title = title;
    this.content = content;
    this.otherInfo = otherInfo;
  }

  getImgSrc(): Resource {
    return this.imgSrc;
  }

  getRating(): string {
    return this.rating;
  }

  getTitle(): string {
    return this.title;
  }

  getContent(): string {
    return this.content;
  }

  getOtherInfo(): string {
    return this.otherInfo;
  }
}