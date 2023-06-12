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
import { LocalDataManager, Commodity } from '@ohos/common';
import { CommodityDetail } from '@ohos/commoditydetail';
import { PageConstants } from '../constants/PageConstants';

@Entry
@Component
struct CommodityDetailPage {
  @State commodityId: string = '';
  @State info: Commodity = undefined;
  private localDataManager: LocalDataManager = LocalDataManager.instance();

  aboutToAppear() {
    this.commodityId = (router.getParams() || {})[PageConstants.ID_KEY];
    this.info = this.localDataManager.queryCommodityListById(this.commodityId);
  }

  build() {
    Row() {
      CommodityDetail({
        commodityId: this.commodityId
      })
    }
    .backgroundColor($r('app.color.page_background'))
  }
}