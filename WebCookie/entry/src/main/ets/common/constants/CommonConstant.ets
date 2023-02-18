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
 * user center path
 */
export const USER_CENTER_URL = 'https://id1.cloud.huawei.com/AMW/portal/userCenter/index.html?' +
'service=http://developer.huawei.com/consumer/cn/#/accountCenter/userCenter';

/**
 * about path
 */
export const USER_ABOUT_URL = 'https://id1.cloud.huawei.com/AMW/portal/userCenter/index.html?' +
'service=http://developer.huawei.com/consumer/cn/#/accountCenter/about';

/**
 * font size of navigation text
 */
export const NAVIGATOR_SIZE = '20fp';

/**
 * font size of page title text
 */
export const TITLE_SIZE = '18fp';

/**
 * font size of button text
 */
export const BUTTON_SIZE = '14fp';

/**
 * margin of divider
 */
export const DIVIDER_MARGIN = 12;

/**
 * height of divider
 */
export const DIVIDER_HEIGHT = '2.2%';

/**
 * url of verify page
 */
export const PAGE_VERIFY = 'pages/Verify';

/**
 * url of index page
 */
export const PAGE_INDEX = 'pages/WebIndex';

/**
 * Maximum of width
 */
export const FULL_WIDTH = '100%';

/**
 * Maximum of height
 */
export const FULL_HEIGHT = '100%';

/**
 * width of back icon
 */
export const BACK_WIDTH = '6.7%';

/**
 * height of back icon
 */
export const BACK_HEIGHT = '3.1%';

/**
 * height of web component
 */
export const WEB_HEIGHT = '60%';

/**
 * width of web component
 */
export const WEB_WIDTH = '90%';

/**
 * height of page title text
 */
export const PAGE_TITLE_HEIGHT = '3.1%';

/**
 * width of page title text
 */
export const PAGE_TITLE_WIDTH = '25.6%';

/**
 * top margin of navigation
 */
export const NAVIGATOR_MARGIN_TOP = '1.7%';

/**
 * left margin of navigation
 */
export const NAVIGATOR_MARGIN_LEFT = '10%';

/**
 * deeper font weight than normal font
 */
export const FONT_WEIGHT_DEEPER = 500;

/**
 * top margin of app title
 */
export const APP_TITLE_MARGIN_TOP = '15vp';

/**
 * left margin of app title
 */
export const APP_TITLE_MARGIN_LEFT = '26vp';

/**
 * bottom margin of web
 */
export const WEB_MARGIN_BOTTOM = '90vp';

/**
 * type of cookie Operation
 */
export enum CookieOperation {
  GET_COOKIE = '读取cookie',
  SET_COOKIE = '设置cookie',
  DELETE_COOKIE = '删除cookie',
  VERIFY_COOKIE = '验证cookie'
}