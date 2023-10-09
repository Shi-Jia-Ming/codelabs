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

export class SearchConstants {
  /**
   * Searching for a recommendation list.
   */
  static readonly SEARCH_RECOMMEND: string[] = ['推荐内容1', '推荐内容2', '推荐内容3', '推荐内容4', '推荐内容5', '推荐内容6'];

  /**
   * Searching for a recommendation list in large devices.
   */
  static readonly SEARCH_RECOMMEND_LARGE: string[] = ['推荐内容1', '推荐内容2', '推荐内容3', '推荐内容4', '推荐内容5',
    '推荐内容6', '推荐内容7', '推荐内容8', '推荐内容9'];

  /**
   * Tabs list.
   */
  static readonly SEARCH_TABS: string[] = ['热搜', '剧场', '电影', '综艺', '动漫', '儿童', '记录'];

  /**
   * Search List for hua.
   */
  static readonly HUA_LIST: string[] = ['华为游戏', '华为会员电视剧场', '华为开发者大会2023cloud主题演讲...', '华为发布会',
    '华为发布会Harmonyos4', '华为会员电影专区'];

  /**
   * Search result tab List.
   */
  static readonly SEARCH_RESULT_TAB_LIST: string[] = ['全部', '影视', '短视频', '用户'];

  /**
   * Search video img title list.
   */
  static readonly SEARCH_IMG_IMG_TITLES: string[] = ['建筑人文史迹', '生命之谜语', '自然地貌一览', '舞动者们', '万家灯火',
    '山河壮丽 下集', '山河壮丽 中集', '山河壮丽 上集', '山河壮丽 上集'];

  /**
   * Search video img content list.
   */
  static readonly SEARCH_IMG_IMG_CONTENTS: string[] = ['欧洲建筑的历史责任在于...', '小小世界的生存智慧如此...',
    '亿万年前地貌的痕迹是在...', '那些艺术者们信仰是那......', '莹莹亮光是被治愈游子......', '桂林山水甲天下，阳朔......',
    '亿万年前地貌的痕迹是在......', '这是千百年前的痕迹是......', '这是千百年前的痕迹是......'];

  /**
   * Search result title list.
   */
  static readonly SEARCH_RESULT_TITLES: string[] = ['华为折叠屏旗舰及全场景新品发布会', '华为旗舰新品发布会',
    '2022华为全屋智能及全场景新品春季...'];

  /**
   * Search result content list.
   */
  static readonly SEARCH_RESULT_CONTENTS: string[] = ['发布会 · 华为终端 · 202...', '发布会 · 华为终端 · 202...',
    '2022华为全屋智能及全场景新品春季...'];

  /**
   * Search result more info list.
   */
  static readonly SEARCH_RESULT_MORE: string[] = ['9.8万次播放', '75.2万次播放', '10.1万次播放'];

  /**
   * Search sub title list.
   */
  static readonly SEARCH_SUB_TITLES: string[] = ['搜索历史', '搜索内容', '搜索推荐'];

  /**
   * Another batch.
   */
  static readonly ANOTHER_BATCH: string = '换一批';

  /**
   * Search recommend list lanes.
   */
  static readonly SEARCH_LIST_LANES: number[] = [3, 2, 1];

  /**
   * Hot trending list spaces.
   */
  static readonly HOT_TRENDING_LIST_SPACES: string[] = ['16vp', '24vp', '36vp'];

  /**
   * Search recommend divider padding.
   */
  static readonly SEARCH_RECOMMEND_DIVIDER_PADDING: string = '12vp';

  /**
   * Search index.
   */
  static readonly SEARCH_INDEX: number[] = [2, 3];

  /**
   * Search placeholder.
   */
  static readonly SEARCH_PLACEHOLDER: string = '搜索...';

  /**
   * Type tabs divider stroke width.
   */
  static readonly TYPE_TABS_DIVIDER_STROKE_WIDTH: string = '2vp';

  /**
   * Search result title.
   */
  static readonly SEARCH_RESULT_TITLE: string = '华为发布会';

  /**
   * Search result button text list.
   */
  static readonly SEARCH_RESULT_BUTTON_TEXTS: string[] = ['播放', '缓存'];

  /**
   * Video detail url.
   */
  static readonly VIDEO_DETAIL_URL: string = '@bundle:com.huawei.videoapplication/videoDetail/ets/pages/Index';

  /**
   * Search input list.
   */
  static readonly SEARCH_INPUT_LIST: string[] = ['华', '华为发布会'];
}