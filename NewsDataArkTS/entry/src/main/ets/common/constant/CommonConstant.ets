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

/**
 * The host address of the server.
 */
export const SERVER: string = 'http://**.**.**.**:9588';

/**
 * Get the news type.
 */
export const GET_NEWS_TYPE: string = 'news/getNewsType';

/**
 * Get the news list.
 */
export const GET_NEWS_LIST: string = 'news/getNewsList';

/**
 * The request success status code.
 */
export const SERVER_CODE_SUCCESS: string = 'success';

/**
 * The off set coefficient.
 */
export const Y_OFF_SET_COEFFICIENT: number = 0.1;

/**
 * The page size.
 */
export const PAGE_SIZE: number = 4;

/**
 * The refresh and load height.
 */
export const CUSTOM_LAYOUT_HEIGHT: number = 70;

/**
 * Http request success status code.
 */
export const HTTP_CODE_200: number = 200;

/**
 * The animation delay time.
 */
export const DELAY_ANIMATION_DURATION: number = 300;

/**
 * The delay time.
 */
export const DELAY_TIME: number = 1000;

/**
 * The animation duration.
 */
export const ANIMATION_DURATION: number = 2000;

/**
 * The http timeout duration.
 */
export const HTTP_READ_TIMEOUT: number = 10000;

/**
 * Full the width.
 */
export const FULL_WIDTH: string = '100%';

/**
 * Full the height.
 */
export const FULL_HEIGHT: string = '100%';

/**
 * The TabBars constants.
 */
export const TabBars = {
  UN_SELECT_TEXT_FONT_SIZE: 18,
  SELECT_TEXT_FONT_SIZE: 24,
  UN_SELECT_TEXT_FONT_WEIGHT: 400,
  SELECT_TEXT_FONT_WEIGHT: 700,
  BAR_HEIGHT: '7.2%',
  HORIZONTAL_PADDING: '2.2%',
  BAR_WIDTH: '100%',
  DEFAULT_NEWS_TYPES:
  [
    { id: 0, name: '全部' },
    { id: 1, name: '国内' },
    { id: 2, name: '国际' },
    { id: 3, name: '娱乐' },
    { id: 4, name: '军事' },
    { id: 5, name: '体育' },
    { id: 6, name: '科技' },
    { id: 7, name: '财经' }
  ]
}

/**
 * The NewsListConstant constants.
 */
export const NewsListConstant = {
  LIST_DIVIDER_STROKE_WIDTH: 0.5,
  GET_TAB_DATA_TYPE_ONE: 1,
  ITEM_BORDER_RADIUS: 16,
  NONE_IMAGE_SIZE: 120,
  NONE_TEXT_opacity: 0.6,
  NONE_TEXT_size: 16,
  NONE_TEXT_margin: 12,
  ITEM_MARGIN_TOP: '1.5%',
  LIST_MARGIN_LEFT: '3.3%',
  LIST_MARGIN_RIGHT: '3.3%',
  ITEM_HEIGHT: '32%',
  LIST_WIDTH: '93.3%'
}

/**
 * The NewsTitle constants.
 */
export const NewsTitle = {
  TEXT_MAX_LINES: 3,
  TEXT_FONT_SIZE: 20,
  TEXT_FONT_WEIGHT: 500,
  TEXT_MARGIN_LEFT: '2.4%',
  TEXT_MARGIN_TOP: '7.2%',
  TEXT_HEIGHT: '9.6%',
  TEXT_WIDTH: '78.6%',
  IMAGE_MARGIN_LEFT: '3.5%',
  IMAGE_MARGIN_TOP: '7.9%',
  IMAGE_HEIGHT: '8.9%',
  IMAGE_WIDTH: '11.9%',
}

/**
 * The NewsContent constants.
 */
export const NewsContent = {
  WIDTH: '93%',
  HEIGHT: '16.8%',
  MARGIN_LEFT: '3.5%',
  MARGIN_TOP: '3.4%',
  MAX_LINES: 2,
  FONT_SIZE: 15,
}

/**
 * The NewsSource constants.
 */
export const NewsSource = {
  MAX_LINES: 1,
  FONT_SIZE: 12,
  MARGIN_LEFT: '3.5%',
  MARGIN_TOP: '3.4%',
  HEIGHT: '7.2%',
  WIDTH: '93%',
}

/**
 * The NewsGrid constants.
 */
export const NewsGrid = {
  MARGIN_LEFT: '3.5%',
  MARGIN_RIGHT: '3.5%',
  MARGIN_TOP: '5.1%',
  WIDTH: '93%',
  HEIGHT: '31.5%',
  ASPECT_RATIO: 4,
  COLUMNS_GAP: 5,
  ROWS_TEMPLATE: '1fr',
  IMAGE_BORDER_RADIUS: 8
}

/**
 * The RefreshLayout constants.
 */
export const RefreshLayout = {
  MARGIN_LEFT: '40%',
  TEXT_MARGIN_BOTTOM: 1,
  TEXT_MARGIN_LEFT: 7,
  TEXT_FONT_SIZE: 17,
  IMAGE_WIDTH: 18,
  IMAGE_HEIGHT: 18
}

/**
 * The NoMoreLayout constants.
 */
export const NoMoreLayoutConstant = {
  NORMAL_PADDING: 8,
  TITLE_FONT: '16fp'
}

/**
 * The RefreshConstant constants.
 */
export const RefreshConstant = {
  DELAY_PULL_DOWN_REFRESH: 50,
  CLOSE_PULL_DOWN_REFRESH_TIME: 150,
  DELAY_SHRINK_ANIMATION_TIME: 500,
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