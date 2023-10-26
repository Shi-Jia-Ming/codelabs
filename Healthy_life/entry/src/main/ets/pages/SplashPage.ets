
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

import common from '@ohos.app.ability.common';
import router from '@ohos.router';
import data_preferences from '@ohos.data.preferences';
import Logger from '../common/utils/Logger';
import { CommonConstants as Const } from '../common/constants/CommonConstants';
import UserPrivacyDialog from '../view/dialog/UserPrivacyDialog';

// app preferences name
const H_STORE: string = 'healthAppStore';
const IS_PRIVACY: string = 'isPrivacy';

@Entry
@Component
struct SplashIndex {
  context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;
  dialogController: CustomDialogController = new CustomDialogController({
    builder: UserPrivacyDialog(
      {
        cancel: () => { this.exitApp() },
        confirm: () => { this.onConfirm() }
      }),
    cancel: () => { this.exitApp() },
    autoCancel: false,
    alignment: DialogAlignment.Bottom,
    offset: { dx: 0, dy: Const.OFFSET_24 }
  });

  onConfirm() {
    let preferences = data_preferences.getPreferences(this.context, H_STORE);
    preferences.then((res) => {
      res.put(IS_PRIVACY, true).then(() => {
        res.flush();
        Logger.info('SplashPage','isPrivacy is put success');
      }).catch((err: Error) => {
        Logger.info('SplashPage','isPrivacy put failed. Cause:' + err);
      });
    })
    this.jumpAdPage();
  }

  exitApp() {
    this.context.terminateSelf();
  }

  jumpAdPage() {
    setTimeout(() => {
      router.replaceUrl({ url: 'pages/AdvertisingPage' });
    }, Const.LAUNCHER_DELAY_TIME);
  }

  aboutToAppear() {
    let preferences = data_preferences.getPreferences(this.context, H_STORE);
    preferences.then((res) => {
      res.get(IS_PRIVACY, false).then((isPrivate) => {
        if (isPrivate === true) {
          this.jumpAdPage();
        } else {
          this.dialogController.open();
        }
      });
    });
  }

  aboutToDisappear() {
    clearTimeout();
  }

  build() {
    Column() {
      Image($r('app.media.logo'))
        .width($r('app.float.default_120'))
        .aspectRatio(1)
        .margin({ top: $r('app.float.default_120') });
      Text($r('app.string.EntryAbility_label'))
        .fontFamily($r('app.string.HarmonyHeiTi_Bold'))
        .fontSize($r('app.float.default_24'))
        .fontColor($r('app.color.titleColor'))
        .fontWeight(Const.FONT_WEIGHT_700)
        .letterSpacing(Const.LETTER_1)
        .margin({
          top: $r('app.float.default_20'),
          bottom: $r('app.float.default_8') })
      Text($r('app.string.EntryAbility_desc'))
        .fontFamily($r('app.string.HarmonyHeiTi'))
        .fontColor($r('app.color.titleColor'))
        .fontWeight(Const.FONT_WEIGHT_400)
        .letterSpacing(Const.LETTER_34)
        .opacity(Const.OPACITY_6)
        .fontSize($r('app.float.default_16'))
    }
    .width('100%')
    .height('100%')
    .backgroundImagePosition({x: 0, y: 0})
    .backgroundImage($r('app.media.ic_splash_bg'))
    .backgroundImageSize({ width: '100%', height: '100%' })
  }
}