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

import router from '@ohos.router';
import { FULL_LENGTH } from '../common/constants/CommonConstants';
import DimensionUtil from '../common/utils/DimensionUtil';

@Component
export default struct BackContainer {
  private header?: string | Resource;

  build() {
    Row() {
      Image($r('app.media.ic_public_back'))
        .width(DimensionUtil.getVp($r('app.float.back_container_title_width')))
        .height(DimensionUtil.getVp($r('app.float.back_container_title_height')))
        .responseRegion({
          width: DimensionUtil.getVp($r('app.float.back_container_response_region_width')),
          height: FULL_LENGTH
        })
        .onClick(() => {
          router.back();
        })
      Text(this.header)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Regular)
        .fontSize(DimensionUtil.getFp($r('app.float.back_container_title_font_size')))
        .margin({
          left: DimensionUtil.getFp($r('app.float.back_container_title_margin')),
          right: DimensionUtil.getFp($r('app.float.back_container_title_margin'))
        })
    }
    .height(DimensionUtil.getFp($r('app.float.back_container_height')))
    .width(FULL_LENGTH)
  }
}