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
import BackContainer from '../view/BackContainer';
import {
  TRANSITION_ANIMATION_DURATION,
  SHARE_TRANSITION_ID,
  SHARE_ITEM_ANIMATION_DELAY,
  SHARE_PAGE_URL,
  FULL_LENGTH,
  DOMAIN,
  PREFIX,
  FORMAT
} from '../common/constants/CommonConstants';
import DimensionUtil from '../common/utils/DimensionUtil';
import hilog from '@ohos.hilog';

@Entry
@Component
struct ShareItem {
  @Builder PreviewArea() {
    Column() {
      Image($r('app.media.bg_transition'))
        .width(FULL_LENGTH)
        .height(DimensionUtil.getVp($r('app.float.share_item_element_height')))
        .borderRadius(DimensionUtil.getVp($r('app.float.share_item_radius')))
        .margin({ bottom: DimensionUtil.getVp($r('app.float.share_item_element_margin_bottom')) })
        .sharedTransition(SHARE_TRANSITION_ID, {
          duration: TRANSITION_ANIMATION_DURATION,
          curve: Curve.Smooth,
          delay: SHARE_ITEM_ANIMATION_DELAY
        })
        .onClick(() => {
          router.pushUrl({ url: SHARE_PAGE_URL })
            .catch(err => {
              hilog.error(DOMAIN, PREFIX, FORMAT, err);
            });
        })
      Text($r('app.string.Share_Item_hint'))
        .width(FULL_LENGTH)
        .textAlign(TextAlign.Start)
        .fontSize(DimensionUtil.getFp($r('app.float.share_item_element_content_font_size')))
        .fontWeight(FontWeight.Regular)
        .fontColor($r('app.color.share_item_content_font'))
    }
    .borderRadius(DimensionUtil.getVp($r('app.float.share_item_radius')))
    .height(DimensionUtil.getVp($r('app.float.share_item_height')))
    .backgroundColor(Color.White)
    .width(FULL_LENGTH)
    .padding({
      top: DimensionUtil.getVp($r('app.float.share_item_element_margin_top')),
      left: DimensionUtil.getVp($r('app.float.share_item_element_margin_left')),
      right: DimensionUtil.getVp($r('app.float.share_item_element_margin_right')),
    })
  }

  build() {
    Column() {
      BackContainer({ header: $r('app.string.Share_Item_header') })
        .margin({ bottom: DimensionUtil.getVp($r('app.float.back_container_margin')) })
      this.PreviewArea()
    }
    .width(FULL_LENGTH)
    .height(FULL_LENGTH)
    .backgroundColor($r('app.color.grey_light'))
    .padding({
      left: DimensionUtil.getVp($r('app.float.share_item_padding')),
      right: DimensionUtil.getVp($r('app.float.share_item_padding'))
    })
  }
}