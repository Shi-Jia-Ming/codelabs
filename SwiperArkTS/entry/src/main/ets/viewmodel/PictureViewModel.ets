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

import { PictureItem } from './PictureItem';
import { PICTURE_RECENTLY, PICTURE_PHOTO, PICTURE_LATEST, PICTURE_BANNER } from '../common/constants/PictureConstants';
import { PictureType } from '../common/constants/PictureConstants';
import { CommonConstants } from '../common/constants/CommonConstant';

/**
 * Initialize picture data according to type.
 *
 * @param initType Init type.
 */
export function initializePictures(initType: string): Array<PictureItem> {
  let imageDataArray: Array<PictureItem> = [];
  switch (initType) {
    case PictureType.BANNER:
      PICTURE_BANNER.forEach((item: PictureItem) => {
        imageDataArray.push(item);
      })
      break;
    case PictureType.RECENTLY:
      PICTURE_RECENTLY.forEach((item: PictureItem) => {
        imageDataArray.push(item);
      })
      break;
    case PictureType.PHOTO:
      PICTURE_PHOTO.forEach((item: PictureItem) => {
        imageDataArray.push(item);
      })
      break;
    case PictureType.LATEST:
      PICTURE_LATEST.forEach((item: PictureItem) => {
        imageDataArray.push(item);
      })
      break;
    default:
      break;
  }
  return imageDataArray;
}

let timerIds: number[] = [];

/**
 * start scheduled task.
 *
 * @param swiperController Controller.
 */
export function startPlay(swiperController: SwiperController): void {
  let timerId = setInterval(() => {
    swiperController.showNext();
  }, CommonConstants.SWIPER_TIME);
  timerIds.push(timerId);
}

/**
 * stop scheduled task.
 */
export function stopPlay(): void {
  timerIds.forEach((item: number) => {
    clearTimeout(item);
  })
}