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

import { NavigatorModel } from '../viewmodel/NavigatorModel';
import { CommonConstant as Const } from '../common/Constant';

@Extend(Button) function fancy (top: string) {
  .fontSize(Const.MainConstant_BUTTON_FONT_SIZE)
  .fontColor($r('app.color.start_window_background'))
  .width(Const.MainConstant_BUTTON_WIDTH)
  .height(Const.MainConstant_BUTTON_HEIGHT)
  .margin({ top: top })
  .backgroundColor($r('app.color.blue'))
  .borderRadius(Const.MainConstant_BUTTON_BORDER_RADIUS)
}

@Entry
@Component
struct MainPage {
  build() {
    Column() {
      Image($r('app.media.background'))
        .width(Const.MainConstant_FULL_HEIGHT)
        .height(Const.MainConstant_IMAGE_HEIGHT)
      Navigator({ target: Const.WEB_PAGE_URI, type: NavigationType.Push }) {
        Button($r('app.string.loadLocalH5'))
          .fancy(Const.MainConstant_BUTTON_MARGIN_TOP)
      }
      .params({ path: Const.LOCAL_PATH, tips: $r('app.string.local') } as NavigatorModel)

      Navigator({ target: Const.WEB_PAGE_URI, type: NavigationType.Push }) {
        Button($r('app.string.loadCloudH5'))
          .fancy(Const.MainConstant_BUTTON_MARGIN_TOP_BUTTON)
      }
      .params({ path: Const.CLOUD_PATH, tips: $r('app.string.online') } as NavigatorModel)
    }
    .height(Const.MainConstant_FULL_HEIGHT)
    .backgroundColor($r('app.color.navy_blue'))
  }
}