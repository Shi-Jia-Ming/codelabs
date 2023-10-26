/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import SettingData from '../viewmodel/SettingData';
import StyleConstants from '../common/constants/StyleConstants';

/**
 * The setting list item component.
 */
@Component
export default struct SettingItemComponent {
  setting: SettingData = new SettingData();
  @Prop changeFontSize: number = 0;
  itemClick: Function = () => {
  };

  build() {
    Row() {
      Image(this.setting.settingImage)
        .height($r('app.float.setting_item_ic_size'))
        .width($r('app.float.setting_item_ic_size'))
        .margin({ left: $r('app.float.setting_ic_margin_left'), right: $r('app.float.setting_ic_margin_right') })

      Text(this.setting.settingName)
        .fontSize(this.changeFontSize + StyleConstants.UNIT_FP)
        .fontColor($r('app.color.text'))
        .fontWeight(FontWeight.Medium)
    }
    .width(StyleConstants.FULL_WIDTH)
    .height($r('app.float.setting_item_height'))
    .onClick(() => {
      this.itemClick();
    })
  }
}