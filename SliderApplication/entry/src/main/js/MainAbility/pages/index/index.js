/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import Constants from '../../common/constants/constants';

export default {
  data: {
    imgUrl: Constants.IMG_URL,
    speedImg: Constants.SPEED_IMG_URL,
    animationDuration: Constants.ANIMATION_DURATION,
    animationDurationNum: Constants.ANIMATION_DURATION_NUM,
    speed: Constants.INIT_SPEED,
    minSpeed: Constants.MIN_SPEED,
    maxSpeed: Constants.MAX_SPEED,
    imageSize: Constants.INIT_IMAGE_SIZE,
    size: Constants.INIT_SIZE_SLIDER,
    minSize: Constants.MIN_SIZE_SLIDER,
    maxSize: Constants.MAX_SIZE_SLIDER
  },

  /**
   * Change the speed.
   * @param event : slider event.
   */
  changeSpeed(event) {
    if (event.mode === Constants.SLIDER_EVENT_MODE_END || event.mode === Constants.SLIDER_EVENT_MODE_CLICK) {
      this.speed = event.value;
      this.animationDurationNum = Constants.MAX_ANIMATION_DURATION -
        (event.value * Constants.ANIMATION_DURATION_MULTIPLE);
      this.animationDuration = this.animationDurationNum + Constants.MILLISECOND_ABBREVIATION;
    }
  },

  /**
   * Change the size.
   * @param event : slider event.
   */
  changeSize(event) {
    if (event.mode === Constants.SLIDER_EVENT_MODE_END || event.mode === Constants.SLIDER_EVENT_MODE_CLICK) {
      this.size = event.value;
      // ImageSize range: 0.1 to 2.
      this.imageSize = (this.size / Constants.HALF_HUNDRED) < Constants.MIN_IMAGE_SIZE ?
        Constants.MIN_IMAGE_SIZE : (this.size / Constants.HALF_HUNDRED);
      this.imageSize = this.imageSize.toFixed(2);
    }
  }
};