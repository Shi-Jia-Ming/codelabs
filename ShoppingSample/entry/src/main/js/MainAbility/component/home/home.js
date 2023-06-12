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
    tag: 1,
    subtitleId: 0,
    selectTabs: 0,
    tabBarData: CommonConstants.HOME_TAB_DATA,
    swiperData: CommonConstants.HOME_SWIPER_DATA,
    contentTitleData: CommonConstants.CONTENT_TITLE_DATA,
    contentListData: CommonConstants.CONTENT_LIST_DATA,
    searchHint: CommonConstants.HOME_SEARCH_HINT,
    searchButtonText: CommonConstants.SEARCH_BUTTON_TEXT,
    eshop: CommonConstants.COMMON_ICON.eshop,
    scan: CommonConstants.COMMON_ICON.scan,
    splitLine: CommonConstants.COMMON_ICON.splitLine,
    moreWhite: CommonConstants.COMMON_ICON.moreWhite
  },
  toHomePage() {
    router.push({
      url: CommonConstants.ROUTER_PRODUCT_DETAILS
    });
  },
  changeSubtitle(val) {
    this.subtitleId = val;
  }
}



