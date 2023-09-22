/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

export default class Constants {

  /**
   * banner list
   */
  static readonly BANNER_IMG_LIST: Array<Resource> = [
    $r('app.media.ic_scene_1'),
    $r('app.media.ic_food_0'),
    $r('app.media.ic_life_0'),
    $r('app.media.ic_men_0')
  ];

  /**
   * scene list
   */
  static readonly SCENE_LIST: Array<Resource> = [
    $r('app.media.ic_scene_1'),
    $r('app.media.ic_scene_2'),
    $r('app.media.ic_scene_0')
  ];

  /**
   * men list
   */
  static readonly MEN_LIST: Array<Resource> = [
    $r('app.media.ic_men_0'),
    $r('app.media.ic_men_2'),
    $r('app.media.ic_men_3')
  ];

  /**
   * food list
   */
  static readonly FOOD_LIST: Array<Resource> = [
    $r('app.media.ic_food_1'),
    $r('app.media.ic_food_0'),
  ];

  /**
   * life list
   */
  static readonly LIFE_LIST: Array<Resource> = [
    $r('app.media.ic_life_1'),
    $r('app.media.ic_life_0'),
    $r('app.media.ic_life_2'),
    $r('app.media.ic_life_3'),
    $r('app.media.ic_life_4'),
    $r('app.media.ic_life_5')
  ];

  /**
   * index page img arr
   */
  static readonly IMG_ARR: Resource[][] = [
    new Array<Resource>().concat(Constants.SCENE_LIST, Constants.LIFE_LIST, Constants.MEN_LIST),
    new Array<Resource>().concat(Constants.MEN_LIST, Constants.LIFE_LIST, Constants.SCENE_LIST),
    new Array<Resource>().concat(Constants.FOOD_LIST, Constants.SCENE_LIST, Constants.SCENE_LIST),
    new Array<Resource>().concat(Constants.LIFE_LIST, Constants.FOOD_LIST, Constants.MEN_LIST)
  ];

  /**
   * title font weight
   */
  static readonly TITLE_FONT_WEIGHT: number = 500;

  /**
   * aspect ratio
   */
  static readonly BANNER_ASPECT_RATIO: number = 1.5;

  /**
   * animate duration
   */
  static readonly BANNER_ANIMATE_DURATION: number = 300;

  /**
   * share delay
   */
  static readonly SHARE_TRANSITION_DELAY: number = 100;

  /**
   * aspect ratio
   */
  static readonly STACK_IMG_RATIO: number = 0.7;

  /**
   * item space
   */
  static readonly LIST_ITEM_SPACE: number = 2;

  /**
   * cache size
   */
  static readonly CACHE_IMG_SIZE: number = 4;

  /**
   * cache list
   */
  static readonly CACHE_IMG_LIST: string[] = ['', '', '', ''];

  /**
   * title
   */
  static readonly PAGE_TITLE: string = '电子相册';

  /**
   *  router param
   */
  static readonly PARAM_PHOTO_ARR_KEY: string = 'photoArr';

  /**
   *  selected index
   */
  static readonly SELECTED_INDEX_KEY: string = 'selectedIndex';

  /**
   * grid column template
   */
  static readonly GRID_COLUMNS_TEMPLATE: string = '1fr 1fr 1fr 1fr';

  /**
   * index page columns template
   */
  static readonly INDEX_COLUMNS_TEMPLATE: string = '1fr 1fr';

  /**
   *  percent
   */
  static readonly FULL_PERCENT: string = '100%';

  /**
   * photo item percent
   */
  static readonly PHOTO_ITEM_PERCENT: string = '90%';

  /**
   * show count
   */
  static readonly SHOW_COUNT: number = 8;

  /**
   * default width
   */
  static readonly DEFAULT_WIDTH: number = 360;

  /**
   * padding
   */
  static readonly PHOTO_ITEM_PADDING: number = 8;

  /**
   * offset
   */
  static readonly PHOTO_ITEM_OFFSET: number = 16;

  /**
   * item opacity offset
   */
  static readonly ITEM_OPACITY_OFFSET: number = 0.2;

  /**
   * double number
   */
  static readonly DOUBLE_NUMBER: number = 2;

  /**
   * list page url
   */
  static readonly URL_LIST_PAGE: string = 'pages/ListPage';

  /**
   * detail list page url
   */
  static readonly URL_DETAIL_LIST_PAGE: string = 'pages/DetailListPage';

  /**
   * detail page url
   */
  static readonly URL_DETAIL_PAGE: string = 'pages/DetailPage';

  /**
   * index page tag
   */
  static readonly TAG_INDEX_PAGE: string = 'IndexPage push error ';

  /**
   * list page tag
   */
  static readonly TAG_LIST_PAGE: string = 'ListPage push error ';

  /**
   * detail list page tag
   */
  static readonly TAG_DETAIL_PAGE: string = 'DetailListPage push error ';

}
