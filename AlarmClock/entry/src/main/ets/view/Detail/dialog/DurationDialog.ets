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
export default struct DurationDialog {
  @Consume(DetailConstant.DEFAULT_PROVIDER_KEY) alarmItem: AlarmItem;
  private durations: Array<number> = DetailConstant.RING_DURATION; //响铃时长，分钟
  controller?: CustomDialogController;

  build() {
    Flex() {
      CommonDialog({
        title: $r('app.string.ring_duration'),
        controller: this.controller
      }) {
        ForEach(this.durations, (item: number) => {
          Row() {
            Text(item + CommonConstants.DEFAULT_STRING_SPACE + DetailConstant.DEFAULT_STRING_MINUTE)
              .layoutWeight(CommonConstants.DEFAULT_LAYOUT_WEIGHT)
              .fontColor($r('app.color.grey_divider'))
              .fontSize(DimensionUtil.getFp($r('app.float.duration_dialog_content_font_size')))
            Radio({ value: item.toString(), group: DetailConstant.DEFAULT_STRING_GROUP_NAME })
              .checked(item === this.alarmItem.duration ? true : false)
              .height(DimensionUtil.getVp($r('app.float.duration_dialog_radio_size')))
              .width(DimensionUtil.getVp($r('app.float.duration_dialog_radio_size')))
              .onChange(() => {
                if (!this.controller) {
                  return;
                }
                this.controller.close();
                this.alarmItem.duration = item
              })
          }
          .width(CommonConstants.FULL_LENGTH)

          Divider()
            .opacity($r('app.float.divider_opacity'))
            .color($r('app.color.grey_divider'))
            .lineCap(LineCapStyle.Round)
        })
      }
    }
  }
}