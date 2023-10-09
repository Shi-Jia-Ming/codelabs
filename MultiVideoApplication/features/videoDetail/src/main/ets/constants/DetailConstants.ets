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

export class DetailConstants {
  /**
   * Initial comment image height.
   */
  static readonly INITIAL_COMMENT_IMAGE_HEIGHT: string = '150vp';

  /**
   * Initial comment image width.
   */
  static readonly INITIAL_COMMENT_IMAGE_WIDTH: string = '219vp';

  /**
   * Initial related video height.
   */
  static readonly INITIAL_RELATED_VIDEO_HEIGHT: number = 169;

  /**
   * Initial related video height.
   */
  static readonly INITIAL_VIDEO_HEIGHT: number = 100;

  /**
   * Comment image min height number.
   */
  static readonly COMMENT_IMAGE_MIN_HEIGHT_NUMBER: number = 150;

  /**
   * Comment image min width number.
   */
  static readonly COMMENT_IMAGE_MIN_WIDTH_NUMBER: number = 219;

  /**
   * Comment image max height number.
   */
  static readonly COMMENT_IMAGE_MAX_HEIGHT_NUMBER: number = 182;

  /**
   * Comment image max width number.
   */
  static readonly COMMENT_IMAGE_MAX_WIDTH_NUMBER: number = 266;

  /**
   * Side bar min width number.
   */
  static readonly SIDE_BAR_MIN_WIDTH_NUMBER: number = 320;

  /**
   * Side bar max width number.
   */
  static readonly SIDE_BAR_MAX_WIDTH_NUMBER: number = 512;

  /**
   * Offset for scrolling to top.
   */
  static readonly SCROLL_TO_TOP: string = '{"xOffset":0,"yOffset":0}';

  /**
   * Sub title list.
   */
  static readonly SUB_TITLES: string[] = ['全部评论', '相关列表', '更多', '视频简介', '选集', '周边视频'];

  /**
   * Comment image aspect ratio.
   */
  static readonly COMMENT_IMAGE_ASPECT_RATIO: number = 1.46;

  /**
   * Comment image width list.
   */
  static readonly COMMENT_IMAGE_WIDTH: string[] = ['227vp', '371vp'];

  /**
   * Comment image height list.
   */
  static readonly COMMENT_IMAGE_HEIGHT: string[] = ['155vp', '254vp'];

  /**
   * Episodes list.
   */
  static readonly EPISODES_LIST: string[] = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];

  /**
   * Length unit.
   */
  static readonly LENGTH_UNIT: string = 'vp';

  /**
   * Introduction content.
   */
  static readonly INTRODUCTION_CONTENT: string[] = ['北京时间3月23日，华为春季旗舰新品发布会，我们不见不散。',
    '23.4万次播放··华为终端·华为资讯·2023·中国大陆'];

  /**
   * Icon list.
   */
  static readonly ICON_LIST: Resource[] = [$r('app.media.ic_public_favor'), $r('app.media.ic_public_comments'),
    $r('app.media.ic_public_thumb_sup'), $r('app.media.ic_public_download'), $r('app.media.ic_public_share')];

  /**
   * Shadow radius.
   */
  static readonly SHADOW_RADIUS: number = 50;

  /**
   * Shadow offset y.
   */
  static readonly SHADOW_OFFSET_Y: number = 10;

  /**
   * Percent sign.
   */
  static readonly PERCENT_SIGN: string = '%';

  /**
   * Related video title list.
   */
  static readonly RELATED_VIDEO_TITLES: string[] = ['HUAWEI P10系列...', '华为旗舰新品发布会', '华为Mate Book 系...',
    'nova 10系列及全...', '华为冬季旗舰新品...', 'nova 9系列新品线...', 'HDC成都华为开发...'];

  /**
   * Peripheral video title list.
   */
  static readonly PERIPHERAL_VIDEO_TITLE: string = 'HUAWEI P60系列发布...';

  /**
   * User info name list.
   */
  static readonly USER_INFO_NAMES: string[] = ['m******', 'H******', 'BEI***'];

  /**
   * User info comment list.
   */
  static readonly USER_INFO_COMMENTS: string[] = [
    '感觉很不错啊，下一款准备入手Mate X3了，很喜欢折叠屏的分屏功能，终于可以一边聊天一边看短视频了！',
    '好喜欢这张图，很惊艳！！！竟然是手机拍出来的，太给力了！', '这个背面真的很有设计感，珠光贝母，种草了种草了'];

  /**
   * User info date.
   */
  static readonly USER_INFO_DATE: string = '7月27日';

  /**
   * Placeholder of comment text input.
   */
  static readonly COMMENT_PLACEHOLDER: string = '评论...';

  /**
   * Min video percent.
   */
  static readonly MIN_VIDEO_PERCENT: number = 53;

  /**
   * Max video percent.
   */
  static readonly MAX_VIDEO_PERCENT: number = 100;

  /**
   * Ten.
   */
  static readonly TEN: number = 10;

  /**
   * Related list height.
   */
  static readonly RELATED_LIST_HEIGHT: number = 169;

  /**
   * Video detail.
   */
  static readonly VIDEO_DETAIL: string = 'videoDetail';

  /**
   * Full-screen page url.
   */
  static readonly FULL_SCREEN_URL: string = '@bundle:com.huawei.videoapplication/videoPlayer/ets/pages/Index';
}