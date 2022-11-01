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

import BackContainer from '../view/BackContainer';
import {
  COMPONENT_TRANSITION_SCALE,
  COMPONENT_TRANSITION_OPACITY,
  COMPONENT_TRANSITION_ROTATE,
  TRANSITION_ANIMATION_DURATION,
  FULL_LENGTH
} from '../common/constants/CommonConstants';
import DimensionUtil from '../common/utils/DimensionUtil';

@Entry
@Component
struct ComponentTransition {
  @State isShow: boolean = false;

  build() {
    Column() {
      BackContainer({ header: $r('app.string.Component_transition_header') })
        .margin({ bottom: DimensionUtil.getVp($r('app.float.back_container_margin')) })
      if (this.isShow) {
        Image($r('app.media.bg_element'))
          .TransitionEleStyles()
          .transition({
            type: TransitionType.Insert,
            scale: COMPONENT_TRANSITION_SCALE,
            opacity: COMPONENT_TRANSITION_OPACITY
          })
          .transition({
            type: TransitionType.Delete,
            rotate: COMPONENT_TRANSITION_ROTATE,
            opacity: COMPONENT_TRANSITION_OPACITY
          })
      }
      Image($r('app.media.bg_element')).TransitionEleStyles()
      Button($r('app.string.Component_transition_toggle'))
        .height(DimensionUtil.getVp($r('app.float.element_trans_btn_height')))
        .width(DimensionUtil.getVp($r('app.float.element_trans_btn_width')))
        .fontColor(Color.White)
        .backgroundColor($r('app.color.light_blue'))
        .onClick(() => {
          animateTo({ duration: TRANSITION_ANIMATION_DURATION }, () => {
            this.isShow = !this.isShow;
          })
        })
    }
    .padding({
      left: DimensionUtil.getVp($r('app.float.element_transition_padding')),
      right: DimensionUtil.getVp($r('app.float.element_transition_padding'))
    })
    .height(FULL_LENGTH)
    .width(FULL_LENGTH)
  }
}

@Extend(Image) function TransitionEleStyles () {
  .objectFit(ImageFit.Fill)
  .borderRadius(DimensionUtil.getVp($r('app.float.element_transition_radius')))
  .margin({ bottom: DimensionUtil.getVp($r('app.float.element_transition_margin')) })
  .height(DimensionUtil.getVp($r('app.float.element_transition_height')))
  .width(FULL_LENGTH)
}