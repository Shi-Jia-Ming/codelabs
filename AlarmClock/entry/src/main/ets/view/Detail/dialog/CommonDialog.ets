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

import { CommonConstants } from '../../../common/constants/CommonConstants';
import DimensionUtil from '../../../common/utils/DimensionUtil';

@Component
export default struct CommonDialog {
  private title?: string | Resource;
  private controller?: CustomDialogController;
  private onConfirm: () => void = () => {
  };
  @BuilderParam closer: () => void = () => {
  };

  build() {
    Column() {
      Text(this.title)
        .fontSize(DimensionUtil.getFp($r('app.float.common_dialog_title_font_size')))
        .width(CommonConstants.FULL_LENGTH)
        .fontColor($r('app.color.grey_divider'))
        .margin({
          bottom: DimensionUtil.getVp($r('app.float.common_dialog_title_margin_vertical'))
        })
      this.closer()
      Row() {
        Button($r('app.string.cancel')).actionBtnStyle().onClick(() => {
          if (!this.controller) {
            return;
          }
          this.controller.close();
        })
        if (this.onConfirm) {
          Button($r('app.string.confirm')).actionBtnStyle().onClick(() => {
            this.onConfirm();
            if (!this.controller) {
             return;
            }
            this.controller.close();
          })
        }
      }
      .margin({ top: DimensionUtil.getVp($r('app.float.common_dialog_margin_vertical')) })
    }
    .width(CommonConstants.FULL_LENGTH)
    .padding(DimensionUtil.getVp($r('app.float.common_dialog_padding')))
    .justifyContent(FlexAlign.Center)
  }
}

@Extend(Button)
function actionBtnStyle() {
  .fontSize(DimensionUtil.getFp($r('app.float.common_dialog_button_font_size')))
  .height(DimensionUtil.getVp($r('app.float.common_dialog_button_height')))
  .layoutWeight(CommonConstants.DEFAULT_LAYOUT_WEIGHT)
  .fontColor($r('app.color.green_light'))
  .backgroundColor($r('app.color.trans_parent'))
}