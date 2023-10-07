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

import { ChallengeConstants as Const } from '../constants/ChallengeConstants';
import { MapElement } from '../model/MapData';

@Component
export default struct AnimIcon {
  private item: MapElement = new MapElement();
  @State translateY: number = 0;
  @State scaleX: number = 1;
  @State scaleY: number = 1;

  performAnimation(): void {
    animateTo(
      {
        duration: Const.ANIMATION_DURATION_NORMAL,
        curve: Curve.EaseIn,
        iterations: -1,
        playMode: PlayMode.Alternate,
      }, () => {
      this.translateY = Const.MAP_ICON_TRANSLATE_Y;
      this.scaleX = Const.MAP_ICON_SCALE_X;
      this.scaleY = Const.MAP_ICON_SCALE_Y;
    });
  }

  build() {
    Column() {
      Stack() {
        Image($r('app.media.icon_bg'))
          .height($r('app.float.map_icon_bg_size'))
          .width($r('app.float.map_icon_bg_size'))
        Image(this.item.icon)
          .interpolation(ImageInterpolation.High)
          .height($r('app.float.map_icon_size'))
          .width($r('app.float.map_icon_size'))
      }
      .onAppear(() => {
        const randomDelay = Math.floor(Math.random() * Const.ICON_RANDOM_DELAY);
        setTimeout(() => {
          this.performAnimation();
        }, randomDelay);
      })
      .translate({ y: this.translateY })
      .scale({ x: this.scaleX, y: this.scaleY })
    }
  }
}