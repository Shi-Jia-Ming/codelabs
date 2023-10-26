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

import { CommonConstant as Const } from '../common/constant/CommonConstant';
import { CustomRefreshLoadLayoutClass } from '../viewmodel/NewsViewModel';

/**
 * Custom layout to show refresh or load.
 */
@Component
export default struct CustomLayout {
  @ObjectLink customRefreshLoadClass: CustomRefreshLoadLayoutClass;

  build() {
    Row() {
      Image(this.customRefreshLoadClass.imageSrc)
        .width(Const.RefreshLayout_IMAGE_WIDTH)
        .height(Const.RefreshLayout_IMAGE_HEIGHT)

      Text(this.customRefreshLoadClass.textValue)
        .margin({
          left: Const.RefreshLayout_TEXT_MARGIN_LEFT,
          bottom: Const.RefreshLayout_TEXT_MARGIN_BOTTOM
        })
        .fontSize(Const.RefreshLayout_TEXT_FONT_SIZE)
        .textAlign(TextAlign.Center)
    }
    .clip(true)
    .width(Const.FULL_WIDTH)
    .justifyContent(FlexAlign.Center)
    .height(this.customRefreshLoadClass.heightValue)
  }
}