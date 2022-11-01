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

import * as commonConst from '../common/CommonConstants';

@Component
export default struct PutDownRefresh {
  @Link refreshText: Resource;

  build() {
    Row() {
      Image($r('app.media.refreshing'))
        .width(commonConst.ICON_WIDTH)
        .height(commonConst.ICON_HEIGHT)
      Text(this.refreshText).fontSize(commonConst.NORMAL_FONT_SIZE)
    }
    .justifyContent(FlexAlign.Center)
    .width(commonConst.GOODS_LIST_WIDTH)
    .height(commonConst.GOODS_LIST_HEIGHT)
  }
}