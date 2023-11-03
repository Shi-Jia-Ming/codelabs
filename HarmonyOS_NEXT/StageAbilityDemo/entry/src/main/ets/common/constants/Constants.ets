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
 * The font weight of application.
 */
enum AppFontWeight {
  BOLD = '400',
  BOLDER = '500',
};

/**
 * The font size of application.
 */
enum AppFontSize {
  SMALLER = 13,
  SMALL = 14,
  MIDDLE = 16,
  LARGE = 20,
  LARGER = 35,
};

export { AppFontSize, AppFontWeight };

/**
 * The percentage of 100.
 */
export const PERCENTAGE_100 = '100%';

/**
 * The percentage of 20.
 */
export const PERCENTAGE_20 = '20%';

/**
 * The percentage of 50.
 */
export const PERCENTAGE_50 = '50%';

/**
 * The text margin of 18.
 */
export const Text_Margin = 18;

/**
 * The style of CardComponent.
 */
export class CardStyle {
  /**
   * The horizontal margin of CardComponent.
   */
  static readonly CARD_MARGIN_HORIZONTAL: number = 16;

  /**
   * The top margin of CardComponent.
   */
  static readonly CARD_MARGIN_TOP: number = 24;

  /**
   * The vertical padding of CardComponent.
   */
  static readonly CARD_PADDING_VERTICAL: number = 25;

  /**
   * The horizontal padding of CardComponent.
   */
  static readonly CARD_PADDING_HORIZONTAL: number = 16;

  /**
   * The border radius of CardComponent.
   */
  static readonly CARD_RADIUS: number = 18;
};

/**
 * The style of BalanceComponent.
 */
export class BalanceStyle {
  /**
   * The layout weight of BalanceComponent.
   */
  static readonly LAYOUT_WEIGHT: number = 1;
};

/**
 * The style of ToolBarComponent.
 */
export class ToolBarStyle {
  /**
   * The bottom margin.
   */
  static readonly MARGIN_BOTTOM: number = 10;

  /**
   * The size of image.
   */
  static readonly IMAGE_SIZE: number = 24;

  /**
   * The weight of layout.
   */
  static readonly LAYOUT_WEIGHT: string = '25%';

  /**
   * The height of divider.
   */
  static readonly DIVIDER_HEIGHT: number = 0.5;

  /**
   * The opacity of divider.
   */
  static readonly DIVIDER_OPACITY: number = 0.05;
};

/**
 * The style of NavPage.
 */
export class NavPageStyle {
  /**
   * The height of Tabs.
   */
  static readonly BAR_HEIGHT: number = 0;

  /**
   * The default position of Tabs.
   */
  static readonly POSITION_INITIAL: number = 0;
};

/**
 * The style of HomePage.
 */
export class HomePageStyle {
  /**
   * The vertical padding.
   */
  static readonly PADDING_VERTICAL: number = 8;

  /**
   * The horizontal padding.
   */
  static readonly PADDING_HORIZONTAL: number = 16;

  /**
   * The height of blank.
   */
  static readonly BLANK_HEIGHT: number = 15;
};

/**
 * The style of DetailsPage.
 */
export class DetailsPageStyle {
  /**
   * The size of top image.
   */
  static readonly TOP_IMAGE_SIZE: number = 32;

  /**
   * The margin of top.
   */
  static readonly MARGIN_TOP_LAYOUT: number = 16;

  /**
   * The top margin of title.
   */
  static readonly TITLE_MARGIN_TOP: number = 4;

  /**
   * The bottom margin of title.
   */
  static readonly TITLE_MARGIN_BOTTOM: number = 20;

  /**
   * The height of divider.
   */
  static readonly DIVIDER_HEIGHT: number = 0.25;

  /**
   * The left margin of divider.
   */
  static readonly DIVIDER_MARGIN_LEFT: string = '12%';

  /**
   * The top margin of divider.
   */
  static readonly DIVIDER_MARGIN_TOP: number = 10;

  /**
   * The bottom margin of divider.
   */
  static readonly DIVIDER_MARGIN_BOTTOM: number = 18;

  /**
   * The top margin of comment list.
   */
  static readonly COMMENT_LIST_MARGIN_TOP: number = 10;

  /**
   * The height of top layout.
   */
  static readonly TOP_LAYOUT_HEIGHT: string = '45%';

  /**
   * The height of scroll layout.
   */
  static readonly SCROLL_LAYOUT_WEIGHT: string = '93%';

  /**
   * The weight of tool bar layout.
   */
  static readonly TOOLBAR_WEIGHT: string = '7%';

  /**
   * The image size for more action.
   */
  static readonly IMAGE_SIZE_MORE: number = 14;
};

/**
 * ability name.
 */
export const DETAILS_ABILITY_NAME = 'DetailsAbility'















