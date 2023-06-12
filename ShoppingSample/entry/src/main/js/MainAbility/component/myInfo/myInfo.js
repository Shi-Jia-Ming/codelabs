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
    commonQuantity: CommonConstants.COMMON_QUANTITY,
    orderStatusList: CommonConstants.ORDER_STATUS_LIST,
    memberList: CommonConstants.MEMBER_LIST,
    customerList: CommonConstants.CUSTOMER_LIST,
    myOrder: CommonConstants.MY_ORDER,
    seeOften: CommonConstants.SEE_OFTEN,
    livePicturesCard: CommonConstants.LIVE_PICTURES_CARD,
    setting: CommonConstants.COMMON_ICON.setting,
    scan: CommonConstants.COMMON_ICON.scan,
    person: CommonConstants.COMMON_ICON.person,
    rightArrowWhite: CommonConstants.COMMON_ICON.rightArrowWhite
  },
  toAllOrdersPage(title) {
    if (this.$t(title) === this.$t('strings.await_payment')) {
      router.push({
        url: CommonConstants.ROUTER_ALL_ORDERS
      });
    }
  }
}