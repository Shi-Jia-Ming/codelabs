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

import { CommonConstants } from '../../common/constants/CommonConstants';
import { AlarmSettingType } from '../../common/constants/AlarmSettingType';
import AlarmSettingItem from '../../viewmodel/AlarmSettingItem';
import DimensionUtil from '../../common/utils/DimensionUtil';
import IntervalDialog from './dialog/IntervalDialog';
import DurationDialog from './dialog/DurationDialog';
import RenameDialog from './dialog/RenameDialog';
import RepeatDialog from './dialog/RepeatDialog';

@Component
export default struct SettingItem {
  @Link settingInfo: Array<AlarmSettingItem>;
  repeatDialogController: CustomDialogController = new CustomDialogController({
    builder: RepeatDialog(),
    autoCancel: true
  });
  reNameDialogController: CustomDialogController = new CustomDialogController({
    builder: RenameDialog(),
    autoCancel: true
  });
  durationDialogController: CustomDialogController = new CustomDialogController({
    builder: DurationDialog(),
    autoCancel: true
  });
  intervalDialogController: CustomDialogController = new CustomDialogController({
    builder: IntervalDialog(),
    autoCancel: true
  });

  private showSettingDialog(sType: AlarmSettingType) {
    switch (sType) {
      case AlarmSettingType.REPEAT:
        this.repeatDialogController.open();
        break;
      case AlarmSettingType.ALARM_NAME:
        this.reNameDialogController.open();
        break;
      case AlarmSettingType.RING_DURATION:
        this.durationDialogController.open();
        break;
      case AlarmSettingType.INTERVAL:
        this.intervalDialogController.open();
        break;
      default:
        break
    }
  }

  build() {
    Column() {
      ForEach(this.settingInfo, (item: AlarmSettingItem, index: number | undefined) => {
        Divider()
          .visibility(index === 0 ? Visibility.Hidden : Visibility.Visible)
          .opacity($r('app.float.divider_opacity'))
          .color($r('app.color.grey_divider'))
          .lineCap(LineCapStyle.Round)
          .margin({
            left: DimensionUtil.getVp($r('app.float.setting_item_divider_margin_horizon')),
            right: DimensionUtil.getVp($r('app.float.setting_item_divider_margin_horizon'))
          })
        Row() {
          Text(item.title)
            .fontSize(DimensionUtil.getFp($r('app.float.setting_item_name_font_size')))
            .fontWeight(FontWeight.Regular)
            .fontColor($r('app.color.grey_divider'))
            .layoutWeight(CommonConstants.DEFAULT_LAYOUT_WEIGHT)
          Text(item.content)
            .fontSize(DimensionUtil.getFp($r('app.float.setting_item_content_font_size')))
            .fontWeight(FontWeight.Normal)
            .fontColor($r('app.color.grey_divider'))
            .opacity($r('app.float.setting_item_content_font_opacity'))
          Image($r('app.media.ic_right'))
            .width(DimensionUtil.getVp($r('app.float.setting_item_image_width')))
            .height(DimensionUtil.getVp($r('app.float.setting_item_image_height')))
            .objectFit(ImageFit.Fill)
            .margin({
              left: DimensionUtil.getVp($r('app.float.setting_item_image_margin_horizon'))
            })
        }
        .height(DimensionUtil.getVp($r('app.float.setting_item_height')))
        .alignItems(VerticalAlign.Center)
        .padding({
          left: DimensionUtil.getVp($r('app.float.setting_item_interval')),
          right: DimensionUtil.getVp($r('app.float.setting_item_interval'))
        })
        .onClick(() => {
          this.showSettingDialog(item.sType);
        })
      }, (item: AlarmSettingItem, index: number | undefined) => JSON.stringify(item) + index)
    }
    .margin({
      bottom: DimensionUtil.getVp($r('app.float.setting_item_interval')),
      left: DimensionUtil.getVp($r('app.float.setting_item_interval')),
      right: DimensionUtil.getVp($r('app.float.setting_item_interval'))
    })
    .borderRadius(DimensionUtil.getVp($r('app.float.setting_item_border_radius')))
    .backgroundColor(Color.White)
  }
}