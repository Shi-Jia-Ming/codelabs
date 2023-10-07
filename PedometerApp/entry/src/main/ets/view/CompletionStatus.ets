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

import { CommonConstants } from '../common/constants/CommonConstants';
import InputDialog from '../view/InputDialog';
import Logger from '../common/utils/Logger';
import StepsUtil from '../common/utils/StepsUtil';

const TAG: string = 'CompletionStatus';

@Component
export struct CompletionStatus {
  @Link progressValue: number;
  @Consume stepGoal: string;

  inputDialogController: CustomDialogController = new CustomDialogController({
    builder: InputDialog({
      cancel: this.inputDialogCancel,
      confirm: this.inputDialogConfirm
    }),
    autoCancel: false,
    customStyle: true,
    alignment: DialogAlignment.Bottom,
    offset: { dx: CommonConstants.OFFSET_DX, dy: CommonConstants.OFFSET_DY }
  })

  inputDialogCancel() {
    Logger.info(TAG, 'Callback when the cancel button is clicked');
  }

  inputDialogConfirm() {
    if (StepsUtil.checkStrIsEmpty(this.stepGoal)) {
      return;
    }
    StepsUtil.putStorageValue(CommonConstants.STEP_GOAL, this.stepGoal);
  }

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      Column() {
        Progress({
          value: 0,
          total: CommonConstants.PROGRESS_TOTAL,
          type: ProgressType.Ring
        })
          .color(Color.White)
          .value(this.progressValue)
          .width($r('app.float.progress_width'))
          .style({
            strokeWidth: CommonConstants.PROGRESS_STROKE_WIDTH,
            scaleCount: CommonConstants.PROGRESS_SCALE_COUNT,
            scaleWidth: CommonConstants.PROGRESS_SCALE_WIDTH
          })
          .margin({ top: $r('app.float.progress_margin_top') })
          .borderRadius(CommonConstants.PROGRESS_BORDER_RADIUS)

        Button($r('app.string.set_target'))
          .width($r('app.float.target_button_width'))
          .height($r('app.float.target_button_height'))
          .borderRadius($r('app.float.target_button_radius'))
          .fontSize($r('app.float.target_button_font'))
          .fontColor($r('app.color.button_font'))
          .fontWeight(CommonConstants.SMALL_FONT_WEIGHT)
          .backgroundColor(Color.White)
          .margin({
            top: $r('app.float.target_margin_top'),
            bottom: $r('app.float.target_margin_bottom')
          })
          .onClick(() => {
            this.inputDialogController.open();
          })
      }
      .width(CommonConstants.FULL_WIDTH)
      .backgroundImage($r('app.media.ic_orange'))

      Row() {
        Text(this.progressValue.toString())
          .borderRadius($r('app.float.progress_text_radius'))
          .fontSize($r('app.float.progress_text_font'))
          .fontColor(Color.White)
          .fontWeight(CommonConstants.BIG_FONT_WEIGHT)
          .textAlign(TextAlign.Center)
          .margin({ top: $r('app.float.value_margin_top') })

        Text(CommonConstants.PERCENT_SIGN)
          .borderRadius($r('app.float.percent_text_radius'))
          .fontSize($r('app.float.percent_text_font'))
          .fontColor(Color.White)
          .fontWeight(CommonConstants.SMALL_FONT_WEIGHT)
          .textAlign(TextAlign.Center)
          .margin({ top: $r('app.float.percent_margin_top') })
      }
      .width(CommonConstants.FULL_WIDTH)
      .justifyContent(FlexAlign.Center)
    }
  }
}