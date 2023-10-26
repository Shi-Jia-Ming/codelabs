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

import { RefreshState, RefreshConstants } from '../common/constants/RefreshConstants';
import CommonConstants from '../common/constants/CommonConstants';
import DimensionUtil from '../common/utils/DimensionUtil';
import ClassifyModel from '../viewmodel/AnimationModel';

@Component
export default struct RefreshAnimHeader {
  @Consume(RefreshConstants.REFRESH_STATE_TAG) @Watch('onStateCheck') state: number;
  @State iconWidth: number = CommonConstants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH;

  private onStateCheck() {
    if (this.state === RefreshState.REFRESHING) {
      this.iconWidth = CommonConstants.REFRESH_HEADER_ITEM_SCALE_WIDTH;
    } else {
      this.iconWidth = CommonConstants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH;
    }
  }

  @Builder AttrAnimIcons(iconItem: ClassifyModel) {
    Image(iconItem.imgRes)
      .width(px2vp(DimensionUtil.adaptDimension(this.iconWidth)))
      .position({ x: iconItem.posX })
      .objectFit(ImageFit.Contain)
      .animation({
        duration: CommonConstants.REFRESH_HEADER_ITEM_ANIM_DURATION,
        tempo: CommonConstants.REFRESH_HEADER_ITEM_ANIM_TEMPO,
        delay: iconItem.delay,
        curve: Curve.Linear,
        playMode: PlayMode.Alternate,
        iterations: CommonConstants.REFRESH_HEADER_ITEM_ANIM_ITERATIONS
      })
  }

  build() {
    Row() {
      if (this.state !== RefreshState.IDLE) { // stop animation when idle state.
        ForEach(CommonConstants.REFRESH_HEADER_FEATURE, (iconItem: ClassifyModel) => {
          this.AttrAnimIcons(iconItem)
        }, (item: ClassifyModel) => JSON.stringify(item))
      }
    }
    .width(CommonConstants.FULL_LENGTH)
    .height(CommonConstants.FULL_LENGTH)
    .onAppear(() => {
      this.onStateCheck();
    })
  }
}