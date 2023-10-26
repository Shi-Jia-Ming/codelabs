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

import { NewsTypeBean } from '../../viewmodel/NewsViewModel';

export class CommonConstant {

  /**
   * The host address of the server.
   */
  static readonly SERVER: string = 'http://**.**.**.**:9588';

  /**
   * Get the news type.
   */
  static readonly GET_NEWS_TYPE: string = 'news/getNewsType';

  /**
   * Get the news list.
   */
  static readonly GET_NEWS_LIST: string = 'news/getNewsList';

  /**
   * The request success status code.
   */
  static readonly SERVER_CODE_SUCCESS: string = 'success';

  /**
   * The off set coefficient.
   */
  static readonly Y_OFF_SET_COEFFICIENT: number = 0.1;

  /**
   * The page size.
   */
  static readonly PAGE_SIZE: number = 4;

  /**
   * The refresh and load height.
   */
  static readonly CUSTOM_LAYOUT_HEIGHT: number = 70;

  /**
   * Http request success status code.
   */
  static readonly HTTP_CODE_200: number = 200;

  /**
   * The animation delay time.
   */
  static readonly DELAY_ANIMATION_DURATION: number = 300;

  /**
   * The delay time.
   */
  static readonly DELAY_TIME: number = 1000;

  /**
   * The animation duration.
   */
  static readonly ANIMATION_DURATION: number = 2000;

  /**
   * The http timeout duration.
   */
  static readonly HTTP_READ_TIMEOUT: number = 10000;

  /**
   * Full the width.
   */
  static readonly FULL_WIDTH: string = '100%';

  /**
   * Full the height.
   */
  static readonly FULL_HEIGHT: string = '100%';

  /**
   * The TabBars constants.
   */
  static readonly TabBars_UN_SELECT_TEXT_FONT_SIZE: number = 18;
  static readonly TabBars_SELECT_TEXT_FONT_SIZE: number = 24;
  static readonly TabBars_UN_SELECT_TEXT_FONT_WEIGHT: number = 400;
  static readonly TabBars_SELECT_TEXT_FONT_WEIGHT: number = 700;
  static readonly TabBars_BAR_HEIGHT: string = '7.2%';
  static readonly TabBars_HORIZONTAL_PADDING: string  = '2.2%';
  static readonly TabBars_BAR_WIDTH: string = '100%';
  static readonly TabBars_DEFAULT_NEWS_TYPES: Array<NewsTypeBean> = [
    { id: 0, name: '全部' },
    { id: 1, name: '国内' },
    { id: 2, name: '国际' },
    { id: 3, name: '娱乐' },
    { id: 4, name: '军事' },
    { id: 5, name: '体育' },
    { id: 6, name: '科技' },
    { id: 7, name: '财经' }
  ];

  /**
   * The NewsListConstant constants.
   */
  static readonly NewsListConstant_LIST_DIVIDER_STROKE_WIDTH: number = 0.5;
  static readonly NewsListConstant_GET_TAB_DATA_TYPE_ONE: number = 1;
  static readonly NewsListConstant_ITEM_BORDER_RADIUS: number = 16;
  static readonly NewsListConstant_NONE_IMAGE_SIZE: number = 120;
  static readonly NewsListConstant_NONE_TEXT_opacity: number = 0.6;
  static readonly NewsListConstant_NONE_TEXT_size: number = 16;
  static readonly NewsListConstant_NONE_TEXT_margin: number = 12;
  // static readonly NewsListConstant_ITEM_MARGIN_TOP: string = '1.5%';
  static readonly NewsListConstant_LIST_MARGIN_LEFT: string = '3.3%';
  static readonly NewsListConstant_LIST_MARGIN_RIGHT: string = '3.3%';
  // static readonly NewsListConstant_ITEM_HEIGHT: string = '32%';
  static readonly NewsListConstant_LIST_WIDTH: string =  '93.3%';

  /**
   * The NewsTitle constants.
   */
  static readonly NewsTitle_TEXT_FONT_SIZE: number = 20;
  static readonly NewsTitle_TEXT_FONT_WEIGHT: number = 500;
  static readonly NewsTitle_TEXT_MARGIN_LEFT: string = '2.4%';
  static readonly NewsTitle_TEXT_WIDTH: string = '78.6%';
  static readonly NewsTitle_IMAGE_MARGIN_LEFT: string = '3.5%';
  static readonly NewsTitle_IMAGE_WIDTH: string = '11.9%';

  /**
   * The NewsContent constants.
   */
  static readonly NewsContent_WIDTH: string = '93%';
  static readonly NewsContent_HEIGHT: string = '16.8%';
  static readonly NewsContent_MARGIN_LEFT: string = '3.5%';
  static readonly NewsContent_MARGIN_TOP: string = '3.4%';
  static readonly NewsContent_MAX_LINES: number = 2;
  static readonly NewsContent_FONT_SIZE: number = 15;

  /**
   * The NewsSource constants.
   */
  static readonly NewsSource_MAX_LINES: number = 1;
  static readonly NewsSource_FONT_SIZE: number = 12;
  static readonly NewsSource_MARGIN_LEFT: string = '3.5%';
  static readonly NewsSource_MARGIN_TOP: string = '3.4%';
  static readonly NewsSource_HEIGHT: string = '7.2%';
  static readonly NewsSource_WIDTH: string = '93%';

  /**
   * The NewsGrid constants.
   */
  static readonly NewsGrid_MARGIN_LEFT: string = '3.5%';
  static readonly NewsGrid_MARGIN_RIGHT: string = '3.5%';
  static readonly NewsGrid_MARGIN_TOP: string = '5.1%';
  static readonly NewsGrid_WIDTH: string = '93%';
  static readonly NewsGrid_HEIGHT: string = '31.5%';
  static readonly NewsGrid_ASPECT_RATIO: number = 4;
  static readonly NewsGrid_COLUMNS_GAP: number = 5;
  static readonly NewsGrid_ROWS_TEMPLATE: string = '1fr';
  static readonly NewsGrid_IMAGE_BORDER_RADIUS: number = 8;

  /**
   * The RefreshLayout constants.
   */
  static readonly RefreshLayout_MARGIN_LEFT: string = '40%';
  static readonly RefreshLayout_TEXT_MARGIN_BOTTOM: number = 1;
  static readonly RefreshLayout_TEXT_MARGIN_LEFT: number = 7;
  static readonly RefreshLayout_TEXT_FONT_SIZE: number = 17;
  static readonly RefreshLayout_IMAGE_WIDTH: number = 18;
  static readonly RefreshLayout_IMAGE_HEIGHT: number = 18;

  /**
   * The NoMoreLayout constants.
   */
  static readonly NoMoreLayoutConstant_NORMAL_PADDING: number = 8;
  static readonly NoMoreLayoutConstant_TITLE_FONT: string = '16fp';

  /**
   * The RefreshConstant constants.
   */
  static readonly RefreshConstant_DELAY_PULL_DOWN_REFRESH: number = 50;
  static readonly RefreshConstant_CLOSE_PULL_DOWN_REFRESH_TIME: number = 150;
  static readonly RefreshConstant_DELAY_SHRINK_ANIMATION_TIME: number = 500;

  /**
   * Grid column templates.
   */
  static readonly GRID_COLUMN_TEMPLATES: string = '1fr ';

  /**
   * List offset unit.
   */
  static readonly LIST_OFFSET_UNIT: string = 'px';
}

/**
 * The refresh state enum.
 */
export const enum RefreshState {
  DropDown = 0,
  Release = 1,
  Refreshing = 2,
  Success = 3,
  Fail = 4
}

/**
 * The newsList state enum.
 */
export const enum PageState {
  Loading = 0,
  Success = 1,
  Fail = 2
}

/**
 * The request content type enum.
 */
export const enum ContentType {
  JSON = 'application/json'
}