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

import TransitionElement from '../view/TransitionElement';
import {
  TRANSITION_ANIMATION_DURATION,
  FULL_CUSTOM_TRANSITION_DEFAULT_ANIM_VALUE,
  FULL_CUSTOM_TRANSITION_ROTATE_Z,
  FULL_CUSTOM_TRANSITION_ANGLE
} from '../common/constants/CommonConstants';

@Entry
@Component
struct FullCustomTransition {
  @State animValue: number = FULL_CUSTOM_TRANSITION_DEFAULT_ANIM_VALUE;

  build() {
    Column() {
      TransitionElement()
    }
    .opacity(this.animValue)
    .scale({ x: this.animValue, y: this.animValue })
    .rotate({
      z: FULL_CUSTOM_TRANSITION_ROTATE_Z,
      angle: FULL_CUSTOM_TRANSITION_ANGLE * this.animValue
    })
  }

  /**
   * 页面转场通过全局pageTransition方法进行配置转场参数
   *
   * 进场过程中会逐帧触发onEnter回调，入参为动效的归一化进度(0 - 1)
   * 进场过程中会逐帧触发onExit回调，入参为动效的归一化进度(0 - 1)
   */
  pageTransition() {
    PageTransitionEnter({ duration: TRANSITION_ANIMATION_DURATION, curve: Curve.Smooth })
      .onEnter((type: RouteType, progress: number) => {
        this.animValue = progress;
      });
    PageTransitionExit({ duration: TRANSITION_ANIMATION_DURATION, curve: Curve.Smooth })
      .onExit((type: RouteType, progress: number) => {
        this.animValue = FULL_CUSTOM_TRANSITION_DEFAULT_ANIM_VALUE - progress;
      });
  }
}