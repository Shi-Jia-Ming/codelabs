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

import router from '@ohos.router';
import SettingItemComponent from '../view/SettingItemComponent';
import TitleBarComponent from '../view/TitleBarComponent';
import HomeViewModel from '../viewmodel/HomeViewModel';
import CommonConstants from '../common/constants/CommonConstants';
import StyleConstants from '../common/constants/StyleConstants';
import Logger from '../common/utils/Logger';
import PreferencesUtil from '../common/database/Preferencesutil';
import SettingData from '../viewmodel/SettingData';

const TAG = '[HomePage]';

/**
 * The HomePage is the entry point of the application.
 */
@Entry
@Component
struct HomePage {
  private settingArr = HomeViewModel.initSettingData();
  @State changeFontSize: number = CommonConstants.SET_SIZE_NORMAL;

  onPageShow() {
    PreferencesUtil.getChangeFontSize().then((value) => {
      this.changeFontSize = value;
      Logger.info(TAG, 'Get the value of changeFontSize: ' + this.changeFontSize);
    });
  }

  build() {
    Column() {
      TitleBarComponent({ isBack: false, title: $r('app.string.home_title') })

      Row() {
        SettingItemComponent({
          setting: this.settingArr[CommonConstants.DISPLAY_INDEX],
          changeFontSize: this.changeFontSize,
          itemClick: () => {}
        })
      }
      .blockBackground(StyleConstants.BLOCK_TOP_MARGIN_FIRST_PERCENT)

      Row() {
        SettingItemComponent({
          setting: this.settingArr[CommonConstants.VOICE_INDEX],
          changeFontSize: this.changeFontSize,
          itemClick: () => {}
        })
      }
      .blockBackground(StyleConstants.BLOCK_TOP_MARGIN_SECOND_PERCENT)

      Row() {
        this.SettingItems()
      }
      .blockBackground(StyleConstants.BLOCK_TOP_MARGIN_SECOND_PERCENT)
    }
    .backgroundColor($r('sys.color.ohos_id_color_sub_background'))
    .width(StyleConstants.FULL_WIDTH)
    .height(StyleConstants.FULL_HEIGHT)
  }

  @Builder SettingItems() {
    List() {
      ForEach(this.settingArr.slice(CommonConstants.START_INDEX, CommonConstants.END_INDEX),
        (item: SettingData, index?: number) => {
        ListItem() {
          SettingItemComponent({ setting: item, changeFontSize: this.changeFontSize, itemClick: () => {
            if (index === CommonConstants.SET_FONT_INDEX) {
              router.pushUrl({
                url: CommonConstants.SET_URL
              }).catch((error: Error) => {
                Logger.info(TAG, 'HomePage push error' + JSON.stringify(error));
              });
            }
          } })
        }
      }, (item: SettingData) => JSON.stringify(item))
    }
    .divider({
      strokeWidth: $r('app.float.setting_item_divider_width'),
      color: $r('app.color.setting_item_divider'),
      startMargin: $r('app.float.setting_item_divider_start_margin'),
      endMargin: StyleConstants.DIVIDER_END_MARGIN_PERCENT
    })
  }
}

@Extend(Row) function blockBackground (marginTop: string) {
  .backgroundColor(Color.White)
  .borderRadius($r('app.float.block_background_radius'))
  .margin({ top: marginTop })
  .width(StyleConstants.BLOCK_WIDTH_PERCENT)
  .padding({ top: $r('app.float.block_vertical_padding'), bottom: $r('app.float.block_vertical_padding') })
}