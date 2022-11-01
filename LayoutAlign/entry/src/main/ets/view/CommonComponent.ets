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

import { MARGIN_FONT_SIZE_SPACE } from '../common/Constants/CommonConstants';

/**
 *Show List in Column
 */
@Component
export struct CommonItem {
  private item: number;

  build() {
    Text(this.item.toString())
      .fontSize(MARGIN_FONT_SIZE_SPACE.FIFTH_MARGIN)
      .width(MARGIN_FONT_SIZE_SPACE.NINTH_MARGIN)
      .height(MARGIN_FONT_SIZE_SPACE.NINTH_MARGIN)
      .fontColor($r("app.color.show_list_fontColor"))
      .textAlign(TextAlign.Center)
      .align(Alignment.Center)
      .backgroundColor($r("app.color.white"))
      .borderRadius(MARGIN_FONT_SIZE_SPACE.COMMON_PADDING)
      .margin(MARGIN_FONT_SIZE_SPACE.COMMON_PADDING)
  }
}