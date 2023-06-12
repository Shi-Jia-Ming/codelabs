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
  data: {
    isAllSelect: false,
    shoppingListData: CommonConstants.SHOPPING_LIST_DATA,
    commonIcon: CommonConstants.SHOPPING_CART_ICON,
    person: CommonConstants.COMMON_ICON.person
  },

  /**
   * Select all/not all products in the shopping cart.
   */
  checkboxOnChange() {
    this.isAllSelect = !this.isAllSelect;
    this.shoppingListData.filter((item) => {
      return item.isSelect = this.isAllSelect;
    });
  },

  /**
   * Select a single offering.
   *
   * @param subscript Index of the selected offering.
   * @param event Radio button event.
   */
  singleAnswer(subscript, event) {
    // Modifying the Select Status of a Product.
    this.shoppingListData.forEach((item, index) => {
      if (index === subscript) {
        item.isSelect = event.checked;
      }
    })
    // Check whether all products in the shopping cart are selected.
    var selectAll = this.shoppingListData.every(item => item.isSelect === true);
    if (selectAll === true) {
      this.isAllSelect = true;
    } else{
      this.isAllSelect = false;
    }
  },

  /**
   * Reduce product quantity logic.
   *
   * @param value Current product quantity.
   */
  subtractNum(value) {
    this.shoppingListData[value].num > 0 ? this.shoppingListData[value].num-- : false;
  },

  /**
   * Logic for adding product quantity.
   *
   * @param value Current product quantity.
   */
  addNum(value) {
    this.shoppingListData[value].num++;
  }
}