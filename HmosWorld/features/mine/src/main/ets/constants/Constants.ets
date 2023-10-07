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

export default class Constants {
  /**
   * percent
   */
  static readonly FULL_SCREEN: string = '100%';
  static readonly ACCOUNT_POSITION_X: string = '46%';
  static readonly PERCENT_50 = '50%';
  static readonly PERCENT_90 = '90%';
  /**
   * opacity
   */
  static readonly FULL_OPACITY: number = 1;
  static readonly NONE_OPACITY: number = 0;
  /**
   *  space:SMALL Middle Large
   */
  static readonly SMALL_SPACE: number = 5;
  static readonly MIDDLE_SPACE: number = 10;
  static readonly RESOURCE_LIST_SPACE: number = 12;
  static readonly LARGE_SPACE: number = 15;
  static readonly ROW_SPACE: number = 16;
  /**
   * duration
   */
  static readonly SHORT_ANIMATION_DURATION: number = 200;
  static readonly DEFAULT_DURATION: number = 300;
  static readonly LONG_ANIMATION_DURATION: number = 500;
  /**
   * other
   */
  static readonly REFRESH_DELAY: number = 1000;
  static readonly ACHIEVEMENT_LIST_LANES: number = 3;
}

/**
 * SkeletonData for SkeletonView
 */
export const SkeletonData: SkeType[] = [
  {
    isMine: true,
    isFeed: false
  },
  {
    isMine: true,
    isFeed: true
  },
  {
    isMine: true,
    isFeed: false
  },
  {
    isMine: true,
    isFeed: true
  },
  {
    isMine: true,
    isFeed: false
  },
  {
    isMine: true,
    isFeed: true
  },
]

export interface SkeType {
  isMine: boolean;
  isFeed: boolean;
}