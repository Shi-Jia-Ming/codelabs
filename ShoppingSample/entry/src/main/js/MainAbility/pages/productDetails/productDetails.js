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

import router from '@ohos.router';
import CommonConstants from '../../common/constant/commonConstants';

export default {
  data: {
    swiperData: CommonConstants.DETAILS_SWIPER_DATA,
    productInfo: CommonConstants.PRODUCT_DETAILS_INFO,
    productInfoList: CommonConstants.PRODUCT_INFO_LIST,
    widgetsData: CommonConstants.WIDGETS_DATA,
    icon: CommonConstants.PRODUCT_DETAILS_ICON,
    otherList: CommonConstants.OTHER_LIST,
    reviewListData: CommonConstants.REVIEW_LIST_DATA,
    backgroundColorBack: CommonConstants.COMMON_ICON.backgroundColorBack,
    share: CommonConstants.COMMON_ICON.share,
    greyRightArrow: CommonConstants.COMMON_ICON.greyRightArrow
  },
  toHomePage() {
    this.routeInfo(CommonConstants.ROUTER_HOME_PAGE);
  },
  toShoppingCart() {
    router.push({
      url: CommonConstants.ROUTER_HOME_PAGE,
      params: {
        tag: CommonConstants.SHOPPING_CART_INDEX
      }
    });
  },
  showPanel() {
    this.$element(CommonConstants.PANEL_ID).show();
  },
  closePanel() {
    this.$element(CommonConstants.PANEL_ID).close();
  },
  subtractNum() {
    this.productInfo.num > 0 ? this.productInfo.num-- : false;
  },
  addNum() {
    this.productInfo.num++;
  },
  changeMode(type) {
    if (type.mode === CommonConstants.PANEL_STATUS_MINI) {
      this.closePanel();
    }
  },
  nowBuy() {
    this.routeInfo(CommonConstants.ROUTER_PENDING_PAYMENT);
  },
  routeInfo(url) {
    router.push({
      url: url
    });
  }
}