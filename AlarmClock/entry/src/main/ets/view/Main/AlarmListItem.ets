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

import MainModel from './../../viewmodel/MainViewModel';
import { CommonConstants } from '../../common/constants/CommonConstants';
import AlarmItem from '../../viewmodel/AlarmItem';
import DimensionUtil from '../../common/utils/DimensionUtil';

@Component
export default struct AlarmListItem {
  private mainModel: MainModel = MainModel.instant;
  private alarmItem: AlarmItem = new AlarmItem();

  build() {
    Row() {
      Column() {
        Row() {
          Text(this.mainModel.getNoonContent(this.alarmItem.hour))
            .CommonTextAttr(DimensionUtil.getFp($r('app.float.alarms_item_noon_font_size')),
              FontWeight.Regular)
          Text(this.mainModel.getTaskTimeContent(this.alarmItem.hour, this.alarmItem.minute))
            .CommonTextAttr(DimensionUtil.getFp($r('app.float.alarms_item_time_font_size')),
              FontWeight.Regular,
              { left: DimensionUtil.getVp($r('app.float.alarms_item_time_margin_left')) })
        }

        Text(this.mainModel.getDescContent(this.alarmItem))
          .CommonTextAttr(DimensionUtil.getFp($r('app.float.alarms_item_dec_font_size')),
            FontWeight.Normal,
            { top: DimensionUtil.getVp($r('app.float.alarms_item_dec_margin_top')) },
            $r('app.float.alarms_item_desc_text_opacity'))
      }
      .width(CommonConstants.FULL_LENGTH)
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(CommonConstants.DEFAULT_LAYOUT_WEIGHT)

      Toggle({ type: ToggleType.Switch, isOn: this.alarmItem.isOpen })
        .onChange((isOn: boolean) => {
          this.mainModel.openAlarm(this.alarmItem.id, isOn);
        })
        .width(DimensionUtil.getVp($r('app.float.alarms_item_toggle_width')))
        .height(DimensionUtil.getVp($r('app.float.alarms_item_toggle_height')))
    }
    .padding({
      left: DimensionUtil.getVp($r('app.float.alarm_list_content_distance')),
      right: DimensionUtil.getVp($r('app.float.alarm_list_content_distance'))
    })
    .width(CommonConstants.FULL_LENGTH)
    .height(DimensionUtil.getVp($r('app.float.alarms_item_height')))
    .backgroundColor(Color.White)
    .borderRadius(DimensionUtil.getVp($r('app.float.alarms_item_radius')))
  }
}

@Extend(Text)
function CommonTextAttr(fontSize: number, fontWeight: number, margin?: Margin,
                        opacity?: Resource) {
  .fontColor($r('app.color.grey_divider'))
  .fontSize(fontSize)
  .fontWeight(fontWeight)
  .margin(margin != undefined ? margin : 0)
  .opacity(opacity != undefined ? opacity : 1)
}