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

/**
 * Home view model, providing page display data.
 */
export class HomeViewModel {
  settingArr: Array<SettingData> = [];

  initSettingData(): Array<SettingData> {
    if (this.settingArr.length === 0) {
      this.settingArr = new Array();
      let settingData = new SettingData();
      settingData.settingName = $r('app.string.home_display_and_brightness');
      settingData.settingImage = $r('app.media.ic_display_and_brightness');
      this.settingArr.push(settingData);
      settingData = new SettingData();
      settingData.settingName = $r('app.string.home_voice');
      settingData.settingImage = $r('app.media.ic_voice');
      this.settingArr.push(settingData);
      settingData = new SettingData();
      settingData.settingName = $r('app.string.home_app_management');
      settingData.settingImage = $r('app.media.ic_app_management');
      this.settingArr.push(settingData);
      settingData = new SettingData();
      settingData.settingName = $r('app.string.home_storage');
      settingData.settingImage = $r('app.media.ic_storage');
      this.settingArr.push(settingData);
      settingData = new SettingData();
      settingData.settingName = $r('app.string.home_privacy');
      settingData.settingImage = $r('app.media.ic_privacy');
      this.settingArr.push(settingData);
      settingData = new SettingData();
      settingData.settingName = $r('app.string.home_setting_the_font_size');
      settingData.settingImage = $r('app.media.ic_setting_the_font_size');
      this.settingArr.push(settingData);
    }
    return this.settingArr;
  }
}

export default new HomeViewModel();