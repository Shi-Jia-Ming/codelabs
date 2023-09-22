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

import { Constants, SliderMode } from '../common/Constants';

@Component
export struct PanelComponent {
  @Prop text: string = '';
  private title?: Resource;
  private mode?: SliderMode;
  private options?: SliderOptions;
  private callback: (value: number, mode: SliderChangeMode) => void = () => {};

  build() {
    Column() {
      Text(this.title)
        .width(Constants.PANEL_WIDTH)
        .padding({ left: Constants.TITLE_PADDING })
        .fontSize(Constants.FONT_SIZE)
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.font_color'))
        .margin({ left: Constants.TITLE_MARGIN_HORIZONTAL,
          right: Constants.TITLE_MARGIN_HORIZONTAL })
      Column() {
        Text(this.text)
          .fontSize(Constants.FONT_SIZE)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.font_color'))
          .margin({ bottom: Constants.SPEED_MARGIN_BOTTOM })
        Row() {
          if (this.mode === SliderMode.SPEED) {
            Image($rawfile('speedLow.png'))
              .objectFit(ImageFit.Contain)
              .height(Constants.PANEL_IMAGE_HEIGHT)
              .width(Constants.PANEL_IMAGE_WIDTH)
          } else {
            Text(Constants.PANEL_HOLDER)
              .fontSize(Constants.PANEL_FONT_SIZE)
              .fontWeight(FontWeight.Medium)
              .fontColor($r('app.color.font_color'))
              .margin({ bottom: Constants.SPEED_MARGIN_BOTTOM })
          }

          Slider(this.options)
            .layoutWeight(Constants.LAYOUT_WEIGHT)
            .selectedColor(Constants.SLIDER_SKIN)
            .onChange((value: number, mode: SliderChangeMode) => {
              this.callback(value, mode);
            })
            .margin({ left: Constants.SLIDER_MARGIN_HORIZONTAL,
              right: Constants.SLIDER_MARGIN_HORIZONTAL })

          if (this.mode === SliderMode.SPEED) {
            Image($rawfile('speed.png'))
              .objectFit(ImageFit.Contain)
              .height(Constants.PANEL_IMAGE_BIG_HEIGHT)
              .width(Constants.PANEL_IMAGE_BIG_WIDTH)
              .height(Constants.PANEL_IMAGE_BIG_HEIGHT)
              .width(Constants.PANEL_IMAGE_BIG_WIDTH)
          } else {
            Text(Constants.PANEL_HOLDER)
              .fontSize(Constants.PANEL_END_FONT_SIZE)
              .fontWeight(FontWeight.Medium)
              .fontColor($r('app.color.font_color'))
              .margin({ bottom: Constants.SPEED_MARGIN_BOTTOM })
          }

        }
      }
      .justifyContent(FlexAlign.Center)
      .backgroundColor(Color.White)
      .borderRadius(Constants.PANEL_RADIUS)
      .height(Constants.PANEL_HEIGHT)
      .width(Constants.PANEL_WIDTH)
      .padding({ left: Constants.PANEL_PADDING,
        right: Constants.PANEL_PADDING })
      .margin({ top: Constants.PANEL_MARGIN,
        bottom: Constants.PANEL_MARGIN })
    }
    .padding({ left: Constants.PANEL_PADDING,
      right: Constants.PANEL_PADDING })
    .width(Constants.PERCENTAGE_100)
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}