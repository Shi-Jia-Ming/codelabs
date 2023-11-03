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
import Constants from '../common/constants/Constants';
import Logger from '../common/utils/Logger';

@Entry
@Component
struct IndexPage {
  jumpPage(url: string) {
    router.pushUrl({ url })
      .catch((error: Error) => {
        Logger.error(Constants.INDEX_PAGE_TAG, JSON.stringify(error));
      });
  }

  build() {
    Column({ space: Constants.COLUMN_SPACE }) {
      Button($r('app.string.pixel_introduce'))
        .height($r('app.float.btn_height'))
        .width(Constants.FULL_PERCENT)
        .backgroundColor($r('app.color.blue_background'))
        .onClick(():void => this.jumpPage(Constants.INTRODUCTION_PAGE_URL))
      Button($r('app.string.pixel_conversion'))
        .height($r('app.float.btn_height'))
        .width(Constants.FULL_PERCENT)
        .backgroundColor($r('app.color.blue_background'))
        .onClick(():void => this.jumpPage(Constants.CONVERSION_PAGE_URL))
    }
    .backgroundColor($r('app.color.page_background'))
    .justifyContent(FlexAlign.Center)
    .padding(Constants.COLUMN_SPACE)
    .width(Constants.FULL_PERCENT)
    .height(Constants.FULL_PERCENT)
  }
}