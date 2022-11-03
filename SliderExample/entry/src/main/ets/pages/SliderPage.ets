/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

import { Constants, RotatePosition, SliderMode, SliderScale, SliderSpeed } from '../common/Constants';
import { PanelComponent } from '../view/PanelComponent';

@Entry
@Component
struct SliderPage {
  @State private speed: number = Constants.SPEED;
  @State private imageSize: number = Constants.IMAGE_SIZE_INITIAL;
  @State private angle: number = Constants.ANGLE;
  private interval: number = Constants.INTERVAL;

  build() {
    Column() {
      Image($rawfile('windmill.png'))
        .objectFit(ImageFit.Contain)
        .height(Constants.IMAGE_SIZE)
        .width(Constants.IMAGE_SIZE)
        .rotate({
          x: RotatePosition.X,
          y: RotatePosition.Y,
          z: RotatePosition.Z,
          angle: this.angle
        })
        .scale({ x: this.imageSize, y: this.imageSize })
      Row().height(Constants.WEIGHT_BLANK_IMAGE)
      PanelComponent({
        mode: SliderMode.SPEED,
        title: $r('app.string.speed_text'),
        text: this.speed.toFixed(Constants.FRACTION_DIGITS),
        callback: ((value: number, mode: SliderChangeMode) => {
          this.speed = value;
          clearInterval(this.interval);
          this.speedChange();
        }),
        options: {
          value: this.speed,
          min: SliderSpeed.MIN,
          max: SliderSpeed.MAX,
          step: SliderSpeed.STEP,
          style: SliderStyle.InSet
        }
      })
      PanelComponent({
        mode: SliderMode.SCALE,
        title: $r('app.string.scale_text'),
        text: this.imageSize.toFixed(Constants.FRACTION_DIGITS),
        callback: ((value: number, mode: SliderChangeMode) => {
          this.imageSize = value;
        }),
        options: {
          value: this.imageSize,
          min: SliderScale.MIN,
          max: SliderScale.MAX,
          step: SliderScale.STEP,
          style: SliderStyle.InSet
        }
      }).margin({ bottom: Constants.PANEL_MARGIN_BOTTOM,
          top: Constants.PANEL_MARGIN_TOP });
    }
    .justifyContent(FlexAlign.End)
    .height(Constants.PERCENTAGE_100)
    .backgroundColor($r('app.color.background_color'))
  }

  speedChange() {
    let that = this;
    this.angle = Constants.ANGLE;
    this.interval = setInterval(function () {
      that.angle += that.speed;
    }, Constants.DELAY_TIME)
  }

  onPageShow() {
    clearInterval(this.interval);
    this.speedChange();
  }
}