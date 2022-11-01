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

import { CustomRefreshLoadLayoutClass } from '../common/bean/NewsData';
import { RefreshLayout, FULL_WIDTH } from '../common/constant/CommonConstant';

/**
 * Custom layout to show refresh or load.
 */
@Component
export default struct CustomLayout {
  @ObjectLink customRefreshLoadClass: CustomRefreshLoadLayoutClass;

  build() {
    Row() {
      Image(this.customRefreshLoadClass.imageSrc)
        .width(RefreshLayout.IMAGE_WIDTH)
        .height(RefreshLayout.IMAGE_HEIGHT)

      Text(this.customRefreshLoadClass.textValue)
        .margin({ left: RefreshLayout.TEXT_MARGIN_LEFT,
          bottom: RefreshLayout.TEXT_MARGIN_BOTTOM })
        .fontSize(RefreshLayout.TEXT_FONT_SIZE).textAlign(TextAlign.Center)
    }
    .width(FULL_WIDTH)
    .justifyContent(FlexAlign.Center)
    .height(this.customRefreshLoadClass.heightValue)
  }
}