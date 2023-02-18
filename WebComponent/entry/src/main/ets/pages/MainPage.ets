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

import { MainConstant, WEB_PAGE_URI, LOCAL_PATH, CLOUD_PATH } from '../common/Constant';

@Extend(Button) function fancy (top: string) {
  .fontSize(MainConstant.BUTTON_FONT_SIZE)
  .fontColor($r('app.color.start_window_background'))
  .width(MainConstant.BUTTON_WIDTH)
  .height(MainConstant.BUTTON_HEIGHT)
  .margin({ top: top })
  .backgroundColor($r('app.color.blue'))
  .borderRadius(MainConstant.BUTTON_BORDER_RADIUS)
}

@Entry
@Component
struct MainPage {
  build() {
    Column() {
      Image($r('app.media.background'))
        .width(MainConstant.FULL_HEIGHT)
        .height(MainConstant.IMAGE_HEIGHT)
      Navigator({ target: WEB_PAGE_URI, type: NavigationType.Push }) {
        Button($r('app.string.loadLocalH5'))
          .fancy(MainConstant.BUTTON_MARGIN_TOP)
      }
      .params({ path: LOCAL_PATH, tips: $r('app.string.local') })

      Navigator({ target: WEB_PAGE_URI, type: NavigationType.Push }) {
        Button($r('app.string.loadCloudH5'))
          .fancy(MainConstant.BUTTON_MARGIN_TOP_BUTTON)
      }
      .params({ path: CLOUD_PATH, tips: $r('app.string.online') })
    }
    .height(MainConstant.FULL_HEIGHT)
    .backgroundColor($r('app.color.navy_blue'))
  }
}