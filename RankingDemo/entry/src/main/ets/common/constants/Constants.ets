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
 * The font size of application.
 */
export enum FontSize {
  SMALL = 14,
  MIDDLE = 16,
  LARGE = 20,
};

/**
 * The font weight of application.
 */
export enum FontWeight {
  BOLD = '400',
  BOLDER = '500',
};

/**
 * The weight is global default value for component size.
 */
export const WEIGHT = '100%';

/**
 * The duration of toast.
 */
export const TIME = 1000;

/**
 * The interval time of exit.
 */
export const APP_EXIT_INTERVAL: number = 4500;

/**
 * The tag is the page name,which is used to print.
 */
export const TAG: string = 'RankPage';

/**
 * The title of TitleComponent.
 */
export const TITLE: Resource = $r('app.string.title');

class style {
  RANK_PADDING: number = 15;
  CONTENT_WIDTH: string = '90%';
  BORDER_RADIUS: number = 20;
  STROKE_WIDTH: number = 1;
  HEADER_MARGIN_TOP: number = 20;
  HEADER_MARGIN_BOTTOM: number = 15;
  LIST_HEIGHT: string = '65%';
}

/**
 * The Style of RankPage.
 */
export const Style: style = {
  /**
   * The padding of ranking.
   */
  RANK_PADDING: 15,

  /**
   * The width of ranking content.
   */
  CONTENT_WIDTH: '90%',

  /**
   * The border radius.
   */
  BORDER_RADIUS: 20,

  /**
   * The stroke width of divider.
   */
  STROKE_WIDTH: 1,

  /**
   * The top margin of ranking header.
   */
  HEADER_MARGIN_TOP: 20,

  /**
   * The bottom margin of ranking header.
   */
  HEADER_MARGIN_BOTTOM: 15,

  /**
   * The height of list.
   */
  LIST_HEIGHT: '65%'
};

class listHeaderStyle {
  FONT_WEIGHT: number = 400;
  LAYOUT_WEIGHT_LEFT: string = '30%';
  LAYOUT_WEIGHT_CENTER: string = '50%';
  LAYOUT_WEIGHT_RIGHT: string = '20%';
}

/**
 * The Style of ListHeaderComponent.
 */
export const ListHeaderStyle: listHeaderStyle = {
  /**
   * The weight of font.
   */
  FONT_WEIGHT: 400,

  /**
   * The layout weight of left.
   */
  LAYOUT_WEIGHT_LEFT: '30%',

  /**
   * The layout weight of center.
   */
  LAYOUT_WEIGHT_CENTER: '50%',

  /**
   * The layout weight of right.
   */
  LAYOUT_WEIGHT_RIGHT: '20%',
};

class itemStyle {
  TEXT_LAYOUT_SIZE: number = 24;
  CIRCLE_TEXT_BORDER_RADIUS: number = 24;
  CIRCLE_TEXT_SIZE: number = 24;
  CIRCLE_TEXT_COLOR_STOP_1: number = 0.5;
  CIRCLE_TEXT_COLOR_STOP_2: number = 1.0;
  BAR_HEIGHT: number = 48;
  LAYOUT_WEIGHT_LEFT: string = '30%';
  LAYOUT_WEIGHT_CENTER: string = '50%';
  LAYOUT_WEIGHT_RIGHT: string = '20%';
  BORDER_WIDTH: number = 1;
  COLOR_BLUE: Resource = $r('app.color.item_color');
  COLOR_BLACK: Resource = $r('app.color.item_color_black');
}

/**
 * The Style of ListItemComponent.
 */
export const ItemStyle: itemStyle = {
  /**
   * The line height of text.
   */
  TEXT_LAYOUT_SIZE: 24,

  /**
   * The border radius of circle text.
   */
  CIRCLE_TEXT_BORDER_RADIUS: 24,

  /**
   * The size of circle text.
   */
  CIRCLE_TEXT_SIZE: 24,

  /**
   * Gradient color proportion.
   */
  CIRCLE_TEXT_COLOR_STOP_1: 0.5,

  /**
   * Gradient color proportion.
   */
  CIRCLE_TEXT_COLOR_STOP_2: 1.0,

  /**
   * The height of item.
   */
  BAR_HEIGHT: 48,

  /**
   * The layout weight of left.
   */
  LAYOUT_WEIGHT_LEFT: '30%',

  /**
   * The layout weight of center.
   */
  LAYOUT_WEIGHT_CENTER: '50%',

  /**
   * The layout weight of right.
   */
  LAYOUT_WEIGHT_RIGHT: '20%',

  /**
   * The width of border.
   */
  BORDER_WIDTH: 1,

  /**
   * The blue color of item.
   */
  COLOR_BLUE: $r('app.color.item_color'),

  /**
   * The black color of item.
   */
  COLOR_BLACK: $r('app.color.item_color_black')
};

class titleBarStyle {
  IMAGE_BACK_SIZE: number = 21;
  IMAGE_BACK_MARGIN_RIGHT: number = 18;
  IMAGE_LOADING_SIZE: number = 22;
  BAR_HEIGHT: number = 47;
  BAR_MARGIN_HORIZONTAL: number = 26;
  BAR_MARGIN_TOP: number = 10;
  WEIGHT: string = '50%';
}

/**
 * The Style of TitleComponent.
 */
export const TitleBarStyle: titleBarStyle = {
  /**
   * The image size of back button.
   */
  IMAGE_BACK_SIZE: 21,

  /**
   * The right margin of back button.
   */
  IMAGE_BACK_MARGIN_RIGHT: 18,

  /**
   * The size of loading image.
   */
  IMAGE_LOADING_SIZE: 22,

  /**
   * The height of TitleComponent.
   */
  BAR_HEIGHT: 47,

  /**
   * The horizontal margin of TitleComponent.
   */
  BAR_MARGIN_HORIZONTAL: 26,

  /**
   * The top margin of TitleComponent.
   */
  BAR_MARGIN_TOP: 10,

  /**
   * The weight of Row layout.
   */
  WEIGHT: '50%',
};




