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
  CUSTOM_TRANSITION_OPACITY,
  CUSTOM_TRANSITION_SCALE,
  CUSTOM_TRANSITION_TRANSLATE
} from '../common/constants/CommonConstants';

@Entry
@Component
struct CustomTransition {
  build() {
    Column() {
      TransitionElement()
    }
  }

  /**
   * 页面转场通过全局pageTransition方法进行配置转场参数
   *
   * 进场时透明度设置从0.2到1；x、y轴缩放从0变化到1
   * 退场时x、y轴的偏移量为500
   */
  pageTransition() {
    PageTransitionEnter({ duration: TRANSITION_ANIMATION_DURATION, curve: Curve.Smooth })
      .opacity(CUSTOM_TRANSITION_OPACITY)
      .scale(CUSTOM_TRANSITION_SCALE)
    PageTransitionExit({ duration: TRANSITION_ANIMATION_DURATION, curve: Curve.Smooth })
      .translate(CUSTOM_TRANSITION_TRANSLATE)
  }
}