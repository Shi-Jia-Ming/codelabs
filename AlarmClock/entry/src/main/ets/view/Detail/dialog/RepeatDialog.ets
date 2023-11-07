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
import DetailModel from '../../../viewmodel/DetailViewModel';
import CommonDialog from './CommonDialog';
import DataTypeUtils from '../../../common/utils/DataTypeUtils';
import DimensionUtil from '../../../common/utils/DimensionUtil';

@CustomDialog
export default struct RepeatDialog {
  @Consume(DetailConstant.DEFAULT_PROVIDER_KEY) alarmItem: AlarmItem;
  private viewModel: DetailModel = DetailModel.instant;
  private selects: number[] = [];
  controller: CustomDialogController = new CustomDialogController({
    builder: RepeatDialog(),
    autoCancel: true
  });

  aboutToAppear() {
    this.selects = DataTypeUtils.deepCopy(this.alarmItem.repeatDays);
  }

  build() {
    Flex() {
      CommonDialog({
        title: $r('app.string.repeat_name'),
        controller: this.controller,
        onConfirm: () => {
          this.selects.sort();
          this.alarmItem.repeatDays = this.selects;
          this.alarmItem.isRepeat = this.selects.length > 0;
        }
      }) {
        ForEach(DetailConstant.WEEKDAY_DATA, (item: number) => {
          Row() {
            Text(this.viewModel.transAlarmRepeatDayContent(item))
              .layoutWeight(CommonConstants.DEFAULT_LAYOUT_WEIGHT)
              .fontColor($r('app.color.grey_divider'))
              .fontSize(DimensionUtil.getFp($r('app.float.repeat_dialog_check_font_size')))

            Checkbox({ name: item.toString() })
              .select(this.alarmItem.repeatDays.indexOf(item) !== CommonConstants.DEFAULT_NUMBER_NEGATIVE)
              .width(DimensionUtil.getVp($r('app.float.repeat_dialog_check_box_size')))
              .height(DimensionUtil.getVp($r('app.float.repeat_dialog_check_box_size')))
              .onChange((value: boolean) => {
                if (value) {
                  this.selects.push(item);
                } else {
                  let index = this.selects.indexOf(item);
                  this.selects.splice(index, CommonConstants.DEFAULT_SINGLE);
                }
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