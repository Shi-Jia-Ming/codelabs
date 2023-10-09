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

/**
 * Common constants for common component.
 */
export class CommonConstants {
  // font family
  static readonly HARMONY_HEI_TI_FONT_FAMILY = 'HarmonyHeiTi';
  static readonly HARMONY_HEITI_MEDIUM_FONT_FAMILY = 'HarmonyHeiTi-Medium';
  static readonly HARMONY_HEITI_BOLD_FONT_FAMILY = 'HarmonyHeiTi-Bold';
  // opacity
  static readonly FIRST_LEVEL_OPACITY: number = 0.9;
  static readonly SECOND_LEVEL_OPACITY: number = 0.6;
  static readonly HALF_OPACITY: number = 0.5;
  static readonly THIRD_LEVEL_OPACITY: number = 0.3;
  static readonly FOURTH_LEVEL_OPACITY: number = 0.1;
  // blur
  static readonly REGULAR_BLUR: number = 250;
  // blur scale
  static readonly BLUR_SCALE: number = 0.15;
  // space
  static readonly SPACE_12: number = 12;
  static readonly SPACE_16: number = 16;
  static readonly SPACE_20: number = 20;
  static readonly SM_SPACE: number = 5
  static readonly MD_SPACE: number = 10
  static readonly LG_SPACE: number = 15
  // maxLines
  static readonly MAX_LINE_ONE: number = 1;
  static readonly MAX_LINE_TWO: number = 2;
  // swiper duration
  static readonly SWIPER_DURATION: number = 1000;
  // percent
  static readonly FULL_PERCENT: string = '100%';
  // common event
  static readonly COLLECTED_EVENT: string = 'collected_event';
  static readonly LIKED_EVENT: string = 'liked_event';
  static readonly LEARNING_EVENT: string = 'learning_event';
  static readonly VIEW_EVENT: string = 'view_event';
  // router path
  static readonly DISCOVER_FEED_DETAIL_PAGE = '/discover/ets/pages/FeedDetailPage';
  static readonly DISCOVER_ARTICLE_DETAIL_PAGE = '/discover/ets/pages/ArticleDetailPage';
  // skeleton animation config
  static readonly SKELETON_ANIMATION: AnimateParam = {
    duration: 400,
    tempo: 0.6,
    curve: Curve.EaseInOut,
    delay: 200,
    iterations: -1,
    playMode: PlayMode.Alternate
  }
}