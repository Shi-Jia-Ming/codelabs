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
 * The constant of GoodsTitleComponent.
 */
export class GoodsTitle {
  /**
   * The max lines of title text.
   */
  static readonly MAX_LINE: number = 2;
  /**
   * The line height of title text.
   */
  static readonly LINE_HEIGHT: number = 32;
};

/**
 * The constant of PanelComponent.
 */
export class ActionPanel {

  /**
   * The image height of PanelComponent.
   */
  static readonly IMAGE_HEIGHT: number = 18;

  /**
   * The blank width of PanelComponent.
   */
  static readonly BLANK_WIDTH: number = 4;
};

/**
 * The constant of AddressComponent.
 */
export class AddressPicker {

  /**
   * The size of image to show loaction.
   */
  static readonly IMAGE_SIZE_LOCATION: number = 18;

  /**
   * The image size for more operations.
   */
  static readonly IMAGE_SIZE_MORE: number = 14;

  /**
   * The max lines.
   */
  static readonly MAX_LINES: number = 1;

  /**
   * The layout weight of left.
   */
  static readonly LAYOUT_WEIGHT_LEFT: string = '12%';

  /**
   * The layout weight of center.
   */
  static readonly LAYOUT_WEIGHT_CENTER: string = '80%';

  /**
   * The layout weight of right.
   */
  static readonly LAYOUT_WEIGHT_RIGHT: string = '8%';

  /**
   * The margin of right image.
   */
  static readonly MARGIN_RIGHT_IMAGE: string = '2%';
};

/**
 * The constant of CommentsComponent.
 */
export class CommentList {

  /**
   * The space of List.
   */
  static readonly SPACE: number = 5;

  /**
   * The image size of head portrait.
   */
  static readonly IMAGE_SIZE_HEAD_PORTRAIT: number = 45;

  /**
   * The margin of head portrait.
   */
  static readonly MARGIN_HEAD_PORTRAIT: number = 16;

  /**
   * The line height of phone number text.
   */
  static readonly LINE_HEIGHT_PHONE: number = 32;

  /**
   * The blank height of phone number text.
   */
  static readonly BLANK_HEIGHT_PHONE: number = 6;

  /**
   * The width of blank.
   */
  static readonly MARK_BLANK_WIDTH: number = 15;

  /**
   * The width of image.
   */
  static readonly IMAGE_MARK_WIDTH: number = 20;

  /**
   * The max lines.
   */
  static readonly COMMENT_MAX_LINES: number = 1;

  /**
   * The line height.
   */
  static readonly COMMENT_LINE_HEIGHT: number = 26;

  /**
   * The margin of text.
   */
  static readonly MARGIN_TEXT: number = 5;

  /**
   * The height of List.
   */
  static readonly HEIGHT: string = '40%';
};

/**
 * The constant of CommentsHeaderComponent.
 */
export class CommentHeader {

  /**
   * The layout weight.
   */
  static readonly LAYOUT_WEIGHT: string = '50%';

  /**
   * The arrow text.
   */
  static readonly ARROW: string = '  >';

  /**
   * The line height.
   */
  static readonly LINE_HEIGHT: number = 20;
};

/**
 * The constant of BottomBarComponent.
 */
export class BottomBar {

  /**
   * The height of divider.
   */
  static readonly DIVIDER_HEIGHT: number = 0.5;

  /**
   * The line height of text.
   */
  static readonly TEXT_LINE_HEIGHT: number = 20;

  /**
   * The width of container.
   */
  static readonly CONTAINER_SIZE_WIDTH: number = 195;

  /**
   * The height of container.
   */
  static readonly CONTAINER_SIZE_HEIGHT: number = 40;

  /**
   * The padding of right.
   */
  static readonly BAR_PADDING_RIGHT: number = 12;

  /**
   * The padding of top.
   */
  static readonly BAR_PADDING_TOP: number = 9;

  /**
   * The padding of bottom.
   */
  static readonly BAR_PADDING_BOTTOM: number = 7;

  /**
   * The width of text.
   */
  static readonly TEXT_WIDTH: string = '50%';
};

/**
 * The constant of PickerComponent.
 */
export class GoodsPicker {

  /**
   * The line height of GoodsPicker text.
   */
  static readonly LINE_HEIGHT_TEXT_SELECTED: number = 25;

  /**
   * The max lines.
   */
  static readonly MAX_LINES: number = 2;

  /**
   * The lines height of description text.
   */
  static readonly LINE_HEIGHT_DESCRIPTION: number = 25;

  /**
   * The left margin of description text.
   */
  static readonly MARGIN_LEFT_DESCRIPTION: number = 15;

  /**
   * The left weight of layout.
   */
  static readonly LAYOUT_WEIGHT_LEFT: string = '10%';

  /**
   * The center weight of layout.
   */
  static readonly LAYOUT_WEIGHT_CENTER: string = '80%';

  /**
   * The right weight of layout.
   */
  static readonly LAYOUT_WEIGHT_RIGHT: string = '10%';
};

/**
 * The constant of PreviewerComponent.
 */
export class GoodsPreviewer {
  /**
   * The bottom padding of image.
   */
  static readonly PADDING_IMAGE_BOTTOM: number = 40;

  /**
   * The top padding of image.
   */
  static readonly PADDING_IMAGE_TOP: number = 20;

  /**
   * The text of indicator.
   */
  static readonly INDICATOR_TEXT: string = '1/4';

  /**
   * The right margin of indicator.
   */
  static readonly INDICATOR_MARGIN_RIGHT: number = 24;

  /**
   * The bottom margin of indicator.
   */
  static readonly INDICATOR_MARGIN_BOTTOM: number = 17;

  /**
   * The horizontal padding of indicator.
   */
  static readonly INDICATOR_PADDING_HORIZONTAL: number = 0;

  /**
   * The top padding of indicator.
   */
  static readonly INDICATOR_PADDING_TOP: number = 3;

  /**
   * The bottom padding of indicator.
   */
  static readonly INDICATOR_PADDING_BOTTOM: number = 2;

  /**
   * The border radius.
   */
  static readonly BORDER_RADIUS: number = 9;

  /**
   * The location text.
   */
  static readonly LOCATION: string = "86%";

  /**
   * The zIndex of layout.
   */
  static readonly INDEX: number = 2;
};

/**
 * The constant of ServiceItemComponent.
 */
export class GoodsServiceItem {
  /**
   * The max lines of text.
   */
  static readonly MAX_LINES: number = 1;

  /**
   * The size of service image.
   */
  static readonly IMAGE_SIZE_SERVICE: number = 18;

  /**
   * The size of more action image.
   */
  static readonly IMAGE_SIZE_MORE: number = 14;

  /**
   * The layout weight of left.
   */
  static readonly LAYOUT_WEIGHT_LEFT: string = '12%';

  /**
   * The layout weight of center.
   */
  static readonly LAYOUT_WEIGHT_CENTER: string = '80%';

  /**
   * The layout weight of right.
   */
  static readonly LAYOUT_WEIGHT_RIGHT: string = '8%';

  /**
   * The right margin of image.
   */
  static readonly MARGIN_RIGHT_IMAGE: string = '2%';
};

/**
 * The constant of ServicesComponent.
 */
export class GoodsService {
  /**
   * The space of List.
   */
  static readonly SPACE: number = 20;

  /**
   * The height of List.
   */
  static readonly LIST_HEIGHT: number = 94;
};










