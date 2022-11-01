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
  SHARE_TRANSITION_ID,
  SHARE_ITEM_DURATION,
  SHARE_ITEM_ANIMATION_DELAY
} from '../common/constants/CommonConstants';

@Entry
@Component
struct SharePage {
  build() {
    Column() {
      TransitionElement({ imgFit: ImageFit.Cover })
        .sharedTransition(SHARE_TRANSITION_ID, {
          duration: SHARE_ITEM_DURATION,
          curve: Curve.Smooth,
          delay: SHARE_ITEM_ANIMATION_DELAY
        })
    }
  }
}