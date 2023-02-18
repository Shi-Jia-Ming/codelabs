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
import {
  INDEX_ANIMATION_MODE,
  FULL_LENGTH,
  DEFAULT_LAYOUT_WEIGHT,
  BORDER_RADIUS,
  DOMAIN,
  PREFIX,
  FORMAT
} from '../common/constants/CommonConstants';
import DimensionUtil from '../common/utils/DimensionUtil';
import hilog from '@ohos.hilog';

@Entry
@Component
struct Index {
  build() {
    Column() {
      Text($r('app.string.main_page_title'))
        .fontSize(DimensionUtil.getFp($r('app.float.main_page_title_font_size')))
        .fontWeight(FontWeight.Regular)
        .width(FULL_LENGTH)
        .margin({
          top: DimensionUtil.getVp($r('app.float.main_page_title_margin_top')),
          bottom: DimensionUtil.getVp($r('app.float.main_page_title_margin_bottom')),
          left: DimensionUtil.getVp($r('app.float.main_page_title_margin_left'))
        })

      Scroll() {
        Column() {
          ForEach(INDEX_ANIMATION_MODE, ({ imgRes , url }) => {
            Row()
              .backgroundImage(imgRes)
              .backgroundImageSize(ImageSize.Cover)
              .backgroundColor($r('app.color.trans_parent'))
              .height(DimensionUtil.getVp($r('app.float.main_page_body_height')))
              .margin({ bottom: DimensionUtil.getVp($r('app.float.main_page_body_margin')) })
              .width(FULL_LENGTH)
              .borderRadius(BORDER_RADIUS)
              .onClick(() => {
                router.pushUrl({ url: url })
                  .catch(err => {
                    hilog.error(DOMAIN, PREFIX, FORMAT, err);
                  });
              })
          }, item => JSON.stringify(item))
        }
      }
      .layoutWeight(DEFAULT_LAYOUT_WEIGHT)
      .scrollBar(null)
    }
    .height(FULL_LENGTH)
    .backgroundColor($r('app.color.grey_light'))
    .padding({
      left: DimensionUtil.getVp($r('app.float.main_page_body_padding')),
      right: DimensionUtil.getVp($r('app.float.main_page_body_padding'))
    })
  }
}