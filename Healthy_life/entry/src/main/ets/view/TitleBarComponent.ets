/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { CommonConstants as Const } from '../common/constants/CommonConstants';

@Component
export struct TitleBar {
  build() {
    Row() {
      Text($r('app.string.achievement'))
        .fontSize($r('app.float.default_24'))
        .fontColor($r('app.color.white'))
        .align(Alignment.Start)
        .padding({left: Const.ACHIEVE_TITLE_BAR_LEFT,top: Const.ACHIEVE_TITLE_BAR_TOP})
    }
    .width(Const.FULL_WIDTH)
  }
}