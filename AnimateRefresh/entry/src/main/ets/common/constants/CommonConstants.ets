/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License,Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * constant about common feature
 */
export default class CommonConstants {

  /**
   * common full length
   */
  static readonly FULL_LENGTH = '100%';

  /**
   * refresh header item width
   */
  static readonly REFRESH_HEADER_ITEM_DEFAULT_WIDTH = 30;

  /**
   * refresh header item scale width
   */
  static readonly REFRESH_HEADER_ITEM_SCALE_WIDTH = 80;

  /**
   * refresh default time out
   */
  static readonly REFRESH_DEFAULT_TIMEOUT = 6000;

  /**
   * refresh header item animation duration
   */
  static readonly REFRESH_HEADER_ITEM_ANIM_DURATION = 2000;

  /**
   * refresh header item animation temp
   */
  static readonly REFRESH_HEADER_ITEM_ANIM_TEMPO = 3.0;

  /**
   * refresh header item animation ITERATIONS
   */
  static readonly REFRESH_HEADER_ITEM_ANIM_ITERATIONS = -1;

  /**
   * refresh header item feature
   */
  static readonly REFRESH_HEADER_FEATURE = [
    {
      imgRes: $r('app.media.ic_loading_game'),
      posX: (px2vp(globalThis.display.width) / 2 - CommonConstants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH / 2) - 100,
      delay: 400
    },
    {
      imgRes: $r('app.media.ic_loading_heart'),
      posX: (px2vp(globalThis.display.width) / 2 - CommonConstants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH / 2) - 50,
      delay: 800
    },
    {
      imgRes: $r('app.media.ic_loading_louder'),
      posX: px2vp(globalThis.display.width) / 2 - CommonConstants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH / 2,
      delay: 1200
    },
    {
      imgRes: $r('app.media.ic_loading_bag'),
      posX: (px2vp(globalThis.display.width) / 2 - CommonConstants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH / 2) + 50,
      delay: 1600
    },
    {
      imgRes: $r('app.media.ic_loading_file'),
      posX: (px2vp(globalThis.display.width) / 2 - CommonConstants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH / 2) + 100,
      delay: 2000
    }
  ];

  /**
   * refresh header item width
   */
  static readonly FILE_MANAGER_Z_INDEX = 1;

  /**
   * index default select
   */
  static readonly INDEX_DEFAULT_SELECT = 1;

  /**
   * index tab item feature
   */
  static readonly INDEX_TAB = [
    {
      selectedIcon: $r('app.media.ic_tab_main_select'),
      defaultIcon: $r('app.media.ic_tab_main_default'),
      content: '首页'
    },
    {
      selectedIcon: $r('app.media.ic_tab_file_select'),
      defaultIcon: $r('app.media.ic_tab_file_default'),
      content: '文件'
    },
    {
      selectedIcon: $r('app.media.ic_tab_cloud_select'),
      defaultIcon: $r('app.media.ic_tab_cloud_default'),
      content: '云村'
    },
    {
      selectedIcon: $r('app.media.ic_tab_copy_select'),
      defaultIcon: $r('app.media.ic_tab_copy_default'),
      content: '备份'
    },
    {
      selectedIcon: $r('app.media.ic_tab_mine_select'),
      defaultIcon: $r('app.media.ic_tab_mine_default'),
      content: '我的'
    }
  ];
}