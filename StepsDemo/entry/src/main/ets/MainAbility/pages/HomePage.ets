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

import featureAbility from '@ohos.ability.featureAbility';
import prompt from '@ohos.prompt';
import sensor from '@ohos.sensor';
import { CommonConstants } from '../common/constants/CommonConstants';
import { CurrentSituation } from '../view/CurrentSituation';
import { CompletionStatus } from '../view/CompletionStatus';
import Logger from '../common/util/Logger';
import StepsUtil from '../common/util/StepsUtil';
import EmitterUtil from '../common/util/EmitterUtil';

const TAG: string = 'HomePage';

@Entry
@Component
struct HomePage {
  @State currentSteps: string = CommonConstants.INITIALIZATION_VALUE;
  @Provide stepGoal: string = '';
  @State oldSteps: string = '';
  @State startPosition: string = '';
  @State currentLocation: string = '';
  @State progressValue: number = 0;
  @State isStart: boolean = false;

  onPageShow() {
    this.init();
    EmitterUtil.emitterOn();
    this.requestPermissions();
  }

  onPageHide() {
    EmitterUtil.emitterOff();
    sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER);
  }

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      CompletionStatus({
        progressValue: $progressValue
      })

      CurrentSituation({
        currentSteps: this.currentSteps,
        startPosition: this.startPosition,
        currentLocation: this.currentLocation
      })

      Row() {
        Button(this.isStart ? $r('app.string.stop') : $r('app.string.start'))
          .width($r('app.float.start_button_width'))
          .height($r('app.float.start_button_height'))
          .borderRadius($r('app.float.start_button_radius'))
          .backgroundColor($r('app.color.button_background'))
          .fontSize($r('app.float.start_font_size'))
          .fontColor(Color.White)
          .fontWeight(CommonConstants.BIG_FONT_WEIGHT)
          .onClick(() => {
            if (this.isStart) {
              this.isStart = false;
              this.oldSteps = '';
              StepsUtil.CleanStepsData();
              EmitterUtil.emitEventData(CommonConstants.FALSE, CommonConstants.EVENT_SERVICE_ID);
            } else {
              if (this.stepGoal === '' || this.currentLocation === '') {
                prompt.showToast({ message: CommonConstants.WAIT });
              } else {
                this.isStart = true;
                this.startPosition = this.currentLocation;
                StepsUtil.putStorageValue(CommonConstants.START_POSITION, this.startPosition);
                this.currentSteps = CommonConstants.INITIALIZATION_VALUE;
                this.progressValue = 0;
                EmitterUtil.emitEventData(CommonConstants.TRUE, CommonConstants.EVENT_SERVICE_ID);
              }
            }
            StepsUtil.putStorageValue(CommonConstants.IS_START, String(this.isStart));
          })
      }
      .width(CommonConstants.FULL_WIDTH)
      .height($r('app.float.button_height'))
      .margin({ top: $r('app.float.button_margin_top') })
      .justifyContent(FlexAlign.Center)
    }
    .width(CommonConstants.FULL_WIDTH)
    .height(CommonConstants.FULL_HEIGHT)
    .backgroundColor(Color.White)
  }

  init() {
    StepsUtil.getStorageValue(CommonConstants.IS_START, (res: string) => {
      if (res === CommonConstants.TRUE) {
        this.isStart = true;

        StepsUtil.getStorageValue(CommonConstants.CURRENT_STEPS, (res: string) => {
          if (StepsUtil.checkStrIsEmpty(res)) {
            return;
          }
          this.currentSteps = res;
        });

        StepsUtil.getStorageValue(CommonConstants.PROGRESS_VALUE_TAG, (res: string) => {
          if (StepsUtil.checkStrIsEmpty(res)) {
            return;
          }
          this.progressValue = parseInt(res);
        });

        StepsUtil.getStorageValue(CommonConstants.START_POSITION, (res: string) => {
          if (StepsUtil.checkStrIsEmpty(res)) {
            return;
          }
          this.startPosition = res;
        });

        StepsUtil.getStorageValue(CommonConstants.OLD_STEPS, (res: string) => {
          if (StepsUtil.checkStrIsEmpty(res)) {
            return;
          }
          this.oldSteps = res;
        });
      } else {
        this.isStart = false;
      }
    });

    StepsUtil.getStorageValue(CommonConstants.STEP_GOAL, (res: string) => {
      if (StepsUtil.checkStrIsEmpty(res)) {
        return;
      }
      this.stepGoal = res;
    });
  }

  requestPermissions() {
    featureAbility.getContext().requestPermissionsFromUser(CommonConstants.REQUEST_PERMISSIONS, 1).then((data) => {
      if (data.authResults[0] !== 0 || data.authResults[1] !== 0) {
        return;
      }
      const that = this;
      sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, function (data) {
        try {
          if (that.isStart) {
            if (StepsUtil.checkStrIsEmpty(that.oldSteps)) {
              that.oldSteps = data.steps.toString();
              StepsUtil.putStorageValue(CommonConstants.OLD_STEPS, that.oldSteps);
            } else {
              that.currentSteps = (data.steps - parseInt(that.oldSteps)).toString();
            }
          } else {
            that.currentSteps = data.steps.toString();
          }

          if (StepsUtil.checkStrIsEmpty(that.stepGoal) || !that.isStart) {
            return;
          }
          StepsUtil.putStorageValue(CommonConstants.CURRENT_STEPS, that.currentSteps);
          that.progressValue = StepsUtil.getProgressValue(parseInt(that.stepGoal), parseInt(that.currentSteps));
          StepsUtil.putStorageValue(CommonConstants.PROGRESS_VALUE_TAG, String(that.progressValue));
        } catch (err) {
          Logger.error(TAG, 'Sensor on err' + JSON.stringify(err));
        }
      });

      StepsUtil.startService();
      EmitterUtil.callbackLocation((res: string) => {
        this.currentLocation = res;
      });
    });
  }
}