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

import router from '@ohos.router';
import { CommonConstants } from '../common/constants/CommonConstants';
import AlarmItem from '../viewmodel/AlarmItem';
import AlarmSettingItem from '../viewmodel/AlarmSettingItem';
import { AlarmSettingType } from '../common/constants/AlarmSettingType';
import { DetailConstant } from '../common/constants/DetailConstant';
import BackContainer from '../view/BackContainer';
import DetailModel from '../viewmodel/DetailViewModel';
import DatePickArea from '../view/detail/DatePickArea';
import SettingItem from '../view/Detail/SettingItem';
import DimensionUtil from '../common/utils/DimensionUtil';

@Entry
@Component
struct DetailIndex {
  @Watch('onAlarmItemChange') @Provide(DetailConstant.DEFAULT_PROVIDER_KEY) alarmItem: AlarmItem = new AlarmItem();
  @State repeatSettingArr: Array<AlarmSettingItem> = [];
  @State alarmSettingInfoArr: Array<AlarmSettingItem> = [];
  private isNow: boolean = true;
  private viewModel: DetailModel = DetailModel.instant;

  aboutToAppear() {
    let params = router.getParams() as Record<string, Object|undefined>;
    if (params !== undefined) {
      let alarmItem: AlarmItem = params.alarmItem as AlarmItem;
      if (alarmItem !== undefined) {
        this.isNow = false;
        this.alarmItem = alarmItem;
        this.viewModel.setAlarmDefaultTime(this.alarmItem);
      }else {
        this.viewModel.setAlarmDefaultTime();
      }
    } else {
      this.viewModel.setAlarmDefaultTime();
    }
    this.initData();
  }

  onAlarmItemChange() {
    this.initData();
  }

  initData() {
    this.repeatSettingArr = [
      new AlarmSettingItem(DetailConstant.DEFAULT_STRING_REPEAT,
        this.alarmItem.isRepeat ? DetailConstant.DEFAULT_STRING_REPEAT
                                : CommonConstants.DEFAULT_STRING_NO_REPEAT, AlarmSettingType.REPEAT)
    ];
    this.alarmSettingInfoArr = [
      new AlarmSettingItem(DetailConstant.DEFAULT_STRING_ALARM_NAME, this.alarmItem.name, AlarmSettingType.ALARM_NAME),
      new AlarmSettingItem(DetailConstant.DEFAULT_STRING_DURATION,
        this.alarmItem.duration + DetailConstant.DEFAULT_STRING_MINUTE, AlarmSettingType.RING_DURATION),
      new AlarmSettingItem(DetailConstant.DEFAULT_STRING_INTERVAL, this.alarmItem.intervalMinute
      + DetailConstant.DEFAULT_STRING_MINUTE + CommonConstants.DEFAULT_STRING_COMMA
      + this.alarmItem.intervalTimes + DetailConstant.DEFAULT_STRING_TIMES, AlarmSettingType.INTERVAL)
    ]
  }

  build() {
    Column() {
      BackContainer({
        header: this.isNow ? $r('app.string.new_alarm') : $r('app.string.update_alarm'),
        backImgRes: $r('app.media.ic_cancel'),
      }) {
        Button() {
          Image($r('app.media.ic_confirm')).objectFit(ImageFit.Fill)
        }
        .backgroundColor($r('app.color.trans_parent'))
        .width(DimensionUtil.getVp($r('app.float.title_button_size')))
        .height(DimensionUtil.getVp($r('app.float.title_button_size')))
        .onClick(() => {
          this.viewModel.setAlarmRemind(this.alarmItem);
          router.back();
        })
      }

      DatePickArea()

      SettingItem({
        settingInfo: $repeatSettingArr
      })
      SettingItem({
        settingInfo: $alarmSettingInfoArr
      })

      Blank()

      Button($r('app.string.delete'))
        .visibility(this.isNow ? Visibility.None : Visibility.Visible)
        .width(DimensionUtil.getVp($r('app.float.delete_button_width')))
        .height(DimensionUtil.getVp($r('app.float.delete_button_height')))
        .fontSize(DimensionUtil.getFp($r('app.float.delete_button_font_size')))
        .fontColor($r('app.color.red_light'))
        .backgroundColor($r('app.color.grey_with_opacity'))
        .borderRadius(DimensionUtil.getVp($r('app.float.delete_button_radius')))
        .margin({
          bottom: DimensionUtil.getVp($r('app.float.delete_button_margin_bottom'))
        })
        .onClick(() => {
          this.viewModel.removeAlarmRemind(this.alarmItem.id);
          router.back();
        })
    }
    .backgroundColor($r('app.color.grey_light'))
    .width(CommonConstants.FULL_LENGTH)
    .height(CommonConstants.FULL_LENGTH)
  }
}