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

import window from '@ohos.window';
import Logger from '../common/utils/Logger';
import DrawModel from '../viewmodel/DrawModel';
import PrizeDialog from '../view/PrizeDialog';
import PrizeData from '../common/bean/PrizeData';
import StyleConstants from '../common/constants/StyleConstants';
import CommonConstants from '../common/constants/CommonConstants';
import { startAnimator } from '../viewmodel/DrawModel';

// Get context.
let context = getContext(this);

@Entry
@Component
struct CanvasPage {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private canvasContext: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  @State drawModel: DrawModel = new DrawModel();
  @State screenWidth: number = 0;
  @State screenHeight: number = 0;
  @State rotateDegree: number = 0;
  @State enableFlag: boolean = true;
  @State prizeData: PrizeData = new PrizeData();
  dialogController: CustomDialogController = new CustomDialogController({
    builder: PrizeDialog({
      prizeData: $prizeData,
      enableFlag: $enableFlag
    }),
    autoCancel: false
  });

  aboutToAppear() {
    // Obtains the width and height of the screen, excluding the height of the navigation view.
    window.getLastWindow(context)
      .then((windowClass) => {
        let windowProperties = windowClass.getWindowProperties();
        this.screenWidth = px2vp(windowProperties.windowRect.width);
        this.screenHeight = px2vp(windowProperties.windowRect.height);
      })
      .catch((error) => {
        Logger.error('Failed to obtain the window size. Cause: ' + JSON.stringify(error));
      })
  }

  build() {
    Stack({ alignContent: Alignment.Center }) {
      Canvas(this.canvasContext)
        .width(StyleConstants.FULL_PERCENT)
        .height(StyleConstants.FULL_PERCENT)
        .onReady(() => {
          this.drawModel.draw(this.canvasContext, this.screenWidth, this.screenHeight);
        })
        .rotate({
          x: 0,
          y: 0,
          z: 1,
          angle: this.rotateDegree,
          centerX: this.screenWidth / CommonConstants.TWO,
          centerY: this.screenHeight / CommonConstants.TWO
        })

      Image($r('app.media.ic_center'))
        .width(StyleConstants.CENTER_IMAGE_WIDTH)
        .height(StyleConstants.CENTER_IMAGE_HEIGHT)
        .enabled(this.enableFlag)
        .onClick(() => {
          this.enableFlag = !this.enableFlag;
          startAnimator.call(this);
        })
    }
    .width(StyleConstants.FULL_PERCENT)
    .height(StyleConstants.FULL_PERCENT)
    .backgroundImage($r('app.media.ic_background'), ImageRepeat.NoRepeat)
    .backgroundImageSize({
      width: StyleConstants.FULL_PERCENT,
      height: StyleConstants.BACKGROUND_IMAGE_SIZE
    })
  }
}