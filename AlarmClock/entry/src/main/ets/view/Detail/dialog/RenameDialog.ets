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
import { DetailConstant } from '../../../common/constants/DetailConstant';
import AlarmItem from '../../../viewmodel/AlarmItem';
import CommonDialog from './CommonDialog';
import DimensionUtil from '../../../common/utils/DimensionUtil';

@CustomDialog
export default struct RenameDialog {
  @Consume(DetailConstant.DEFAULT_PROVIDER_KEY) alarmItem: AlarmItem;
  private name: string = '';
  controller: CustomDialogController = new CustomDialogController({
    builder: RenameDialog(),
    autoCancel: true
  });

  build() {
    Flex() {
      CommonDialog({
        title: $r('app.string.alarm_name'),
        controller: this.controller,
        onConfirm: () => {
          this.alarmItem.name = this.name;
        }
      }) {
        TextArea({ text: this.alarmItem.name })
          .width(CommonConstants.FULL_LENGTH)
          .margin({ bottom: DimensionUtil.getVp($r('app.float.rename_dialog_text_margin_bottom')) })
          .onChange((value: string) => {
            this.name = value;
          })
        Divider()
          .opacity($r('app.float.divider_opacity'))
          .color($r('app.color.grey_divider'))
          .lineCap(LineCapStyle.Round)
      }
    }
  }
}