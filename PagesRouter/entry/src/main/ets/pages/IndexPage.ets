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

import router from '@ohos.router';
import CommonConstants from '../common/constants/CommonConstants';
import Logger from '../common/utils/Logger';

const TAG = '[IndexPage]';

/**
 * The IndexPage is the entry point of the application.
 */
@Entry
@Component
struct IndexPage {
  @State message: string = CommonConstants.INDEX_MESSAGE;

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(CommonConstants.FONT_SIZE)
          .fontWeight(FontWeight.Bold)
        Blank()
        Button($r('app.string.next'))
          .fontSize(CommonConstants.BUTTON_FONT_SIZE)
          .width(CommonConstants.BUTTON_WIDTH)
          .height(CommonConstants.BUTTON_HEIGHT)
          .backgroundColor($r('app.color.button_bg'))
          .onClick(() => {
            router.pushUrl({
              url: CommonConstants.SECOND_URL,
              params: {
                src: CommonConstants.SECOND_SRC_MSG
              }
            }).catch((error: Error) => {
              Logger.info(TAG, 'IndexPage push error' + JSON.stringify(error));
            });
          })
      }
      .width(CommonConstants.FULL_WIDTH)
      .height(CommonConstants.LAYOUT_HEIGHT)
    }
    .height(CommonConstants.FULL_HEIGHT)
    .backgroundColor($r('app.color.page_bg'))
  }
}