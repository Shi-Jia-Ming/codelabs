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

import CommonConstants from '../../common/constant/commonConstants';

export default {
  props: ['tag'],
  data: {
    commonIcon: CommonConstants.COMMON_TOOLBAR_ICON,
    toolbarName: CommonConstants.COMMON_TOOLBAR_NAME,
    // Main page index.
    homePageIndex: CommonConstants.HOME_PAGE_INDEX,
    // New product page index.
    newProductIndex: CommonConstants.NEW_PRODUCT_INDEX,
    // Shopping Cart Page Index.
    shoppingCartIndex: CommonConstants.SHOPPING_CART_INDEX,
    // My page index.
    myInfoIndex: CommonConstants.MY_INFO_INDEX
  },

  /**
   * Passing Values to Parent Components.
   *
   * @param value Index of the selected sub-module.
   */
  switchToolbar(index) {
    this.$emit('switchToolbar', {
      index: index
    });
  }
}



