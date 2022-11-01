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
 *route for secondPage
 */
export const SECOND_PAGE: string = 'pages/Second';

/**
 *moduleList of string
 */
export const MODULE_LIST: string = 'moduleList';

/**
 *componentName of string
 */
export const COMPONENT_NAME: string = 'componentName';

/**
 *containerType of string
 */
export const CONTAINER_TYPE_STR: string = 'containerType';

/**
 * height percent of the list item
 */
export const EIGHT_POINT_TWO_PERCENT: string = '8.2%';

/**
 * with percent of the index component
 */
export const INDEX_COMPONENT_WITH_PERCENT: string = '93.3%';

/**
 * full percent
 */
export const ALL_PERCENT: string = '100%';

/**
 * opacity of text
 */
export const ATTRIBUTE_OPACITY: number = parseFloat('0.6');

/**
 * title font weight
 */
export const TITLE_FONT_WEIGHT: number = 700;

/**
 * common font weight
 */
export const COMMON_FONT_WEIGHT: number = 500;

/**
 * container data list
 */
export const LIST: number[] = [1, 2, 3, 4, 5, 6, 7];

/**
 * container type enum
 */
export const enum CONTAINER {
    FLEX = 'Flex',
    ROW = 'Row',
    COLUMN = 'Column',
    STACK = 'Stack',
};

/**
 * attribute  enum
 */
export const enum ATTRIBUTE {
    ROW = 'Row',
    COLUMN = 'Column',
    COLUMN_REVERSE = 'ColumnReverse',
    NOWRAP = 'NoWrap',
    WRAP = 'Wrap',
    WRAP_REVERSE = 'WrapReverse',
    START = 'Start',
    CENTER = 'Center',
    END = 'End',
    TOP = 'Top',
    BOTTOM = 'Bottom',
    TOP_START = 'TopStart',
    TOP_END = 'TopEnd',
    BOTTOM_START = 'BottomStart',
    BOTTOM_END = 'BottomEnd'
};

/**
 * attribute group enum
 */
export const enum GROUP {
    MAIN_DIRECTION = 'MAIN_DIRECTION',
    WRAP_TYPE = 'WRAP_TYPE',
    MAIN_ALIGN = 'MAIN_ALIGN',
    AXI_ALIGN = 'AXI_ALIGN',
    ALIGN_TYPE = 'ALIGN_TYPE'
};

/**
 * The height percent of show list
 */
export const enum SHOW_LIST_HEIGHT_PERCENT {
    FLEX_SHOW_LIST_HEIGHT = '43.6%',
    COLUMN_ROW_SHOW_LIST_HEIGHT = '51.3%',
    STACK_SHOW_LIST_HEIGHT = '46.2%',
    STACK_SHOW_SMALL_HEIGHT = '72.2%',
};

/**
 * The number of container type
 */
export const enum CONTAINER_TYPE {
    FLEX = 1,
    COLUMN = 2,
    ROW = 3,
    STACK = 4,
};

/**
 * The number of margin ,font size or space
 */
export const enum MARGIN_FONT_SIZE_SPACE {
    COMMON_PADDING = 4,
    COMMON_MARGIN = 8,
    FIRST_MARGIN = 10,
    SECOND_MARGIN = 12,
    THIRD_MARGIN = 14,
    FOURTH_MARGIN = 16,
    FIFTH_MARGIN = 18,
    SIXTH_MARGIN = 20,
    SEVENTH_MARGIN = 24,
    EIGHTH_MARGIN = 28,
    NINTH_MARGIN = 32,
    LAST_MARGIN = 50,
};
