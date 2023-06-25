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

import * as commonConst from '../../common/constants/CommonConstants';
import { AchievementMap } from '../../model/TaskInitList';

const ANGLE_LARGE = 360;

@CustomDialog
export struct AchievementDialog {
  controller: CustomDialogController;
  @Consume achievementLevel: number;
  @State private opacityValue: number = 0;
  @State private angle: number = 0;
  @State private scaleValue: number = 0;

  build() {
    Column() {

      Image(AchievementMap[`${this.achievementLevel}_on`])
        .width(commonConst.THOUSANDTH_560)
        .height(commonConst.THOUSANDTH_400)
        .objectFit(ImageFit.Contain)

      Text($r('app.string.task_achievement_level', this.achievementLevel))
        .fontSize($r('app.float.default_24'))
        .fontWeight(commonConst.FONT_WEIGHT_500)
        .fontColor($r('app.color.white'))
        .fontFamily($r('app.string.HarmonyHeiTi'))
        .margin({ top: $r('app.float.default_12') })
    }
    .height(commonConst.THOUSANDTH_800)
    .width(commonConst.THOUSANDTH_1000)
    .justifyContent(FlexAlign.Center)
    .gesture(TapGesture().onAction(() => {
      this.controller.close();
    }))
    .scale({ x: this.scaleValue, y: this.scaleValue })
    .rotate({ x: 0, y: 1, z: 0, angle: this.angle })
    .opacity(this.opacityValue)
    .onAppear(() => {
      animateTo({
        duration: commonConst.DURATION_800,
        curve: Curve.EaseOut,
        delay: commonConst.DURATION_100,
        iterations: 1
      }, () => {
        this.opacityValue = 1;
        this.scaleValue = 1;
        this.angle = ANGLE_LARGE;
      });
    })
  }
}



