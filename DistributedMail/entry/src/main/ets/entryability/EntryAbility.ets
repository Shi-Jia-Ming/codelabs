/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import abilityAccessCtrl, { Permissions } from '@ohos.abilityAccessCtrl';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import bundleManager from '@ohos.bundle.bundleManager';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import Logger from '../common/utils/Logger';
import { CommonConstants } from '../common/constants/CommonConstants';
import { AppendixBean } from '../common/bean/AppendixBean';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    Logger.info('EntryAbility', 'Ability onCreate');
    this.restoringData(want, launchParam);
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    Logger.info('EntryAbility', 'Ability onNewWant');
    this.restoringData(want, launchParam);
  }

  restoringData(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    this.checkPermissions();
    // Recovering migrated data from want.
    if (launchParam.launchReason === AbilityConstant.LaunchReason.CONTINUATION) {
      // get user data from want params.
      AppStorage.setOrCreate<string>('recipient', want.parameters?.recipient as string);
      AppStorage.setOrCreate<string>('sender', want.parameters?.sender as string);
      AppStorage.setOrCreate<string>('subject', want.parameters?.subject as string);
      AppStorage.setOrCreate<string>('emailContent', want.parameters?.emailContent as string);
      AppStorage.setOrCreate<string>('isContinuation', CommonConstants.CAN_CONTINUATION);
      AppStorage.setOrCreate<Array<AppendixBean>>('appendix', JSON.parse(want.parameters?.appendix as string) as Array<AppendixBean>);
      this.context.restoreWindowStage(new LocalStorage());
    }
  }

  onContinue(wantParam: Record<string, Object | undefined>): AbilityConstant.OnContinueResult {
    // The data to be migrated is stored in wantParam.
    wantParam.recipient = AppStorage.get<string>('recipient');
    wantParam.sender = AppStorage.get<string>('sender');
    wantParam.subject = AppStorage.get<string>('subject');
    wantParam.emailContent = AppStorage.get<string>('emailContent');
    wantParam.appendix = JSON.stringify(AppStorage.get<Array<AppendixBean>>('appendix'));
    return AbilityConstant.OnContinueResult.AGREE;
  }

  async checkPermissions(): Promise<void> {
    const permissions: Array<Permissions> = ['ohos.permission.DISTRIBUTED_DATASYNC'];
    // Checking permission granting.
    let grantStatus: abilityAccessCtrl.GrantStatus | undefined = await this.checkAccessToken(permissions[0]);
    if (grantStatus === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED) {
      // Has been authorised.
      Logger.info('EntryAbility', 'checkPermissions', 'Permission already granted.');
    } else {
      // No authorization is obtained. You need to apply for authorization from the user.
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        atManager.requestPermissionsFromUser(this.context, permissions);
      } catch (err) {
        Logger.error('EntryAbility', 'checkPermissions', `Catch err: ${err}`);
        return;
      }
    }
  }

  async checkAccessToken(permission: Permissions): Promise<abilityAccessCtrl.GrantStatus | undefined> {
    let atManager = abilityAccessCtrl.createAtManager();
    let grantStatus: abilityAccessCtrl.GrantStatus | undefined;
    // Get the access token id for the application.
    let tokenId: number | undefined;
    try {
      let bundleInfo: bundleManager.BundleInfo =
        await bundleManager.getBundleInfoForSelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
      let appInfo: bundleManager.ApplicationInfo = bundleInfo.appInfo;
      tokenId = appInfo.accessTokenId;
    } catch (err) {
      Logger.error('EntryAbility', 'Failed to get bundle info for self, ', `Catch err: ${err}`);
    }
    // Check whether the permission is granted to the application.
    try {
      grantStatus = await atManager.checkAccessToken(tokenId, permission);
    } catch (err) {
      Logger.error('EntryAbility', 'Failed to check access token, ', `Catch err: ${err}`);
    }
    return grantStatus;
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability.
    Logger.info('EntryAbility', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/MailHomePage', (err, data) => {
      if (err.code) {
        Logger.error('EntryAbility', 'Failed to load the content, ', `Catch err: ${err}`);
        return;
      }
      Logger.info('EntryAbility', 'Succeeded in loading the content, ', `Data: ${data}`);
    });
  }

  onWindowStageDestroy() {
    Logger.info('EntryAbility', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    Logger.info('EntryAbility', 'Ability onForeground');
  }

  onBackground() {
    Logger.info('EntryAbility', 'Ability onBackground');
  }

  onDestroy() {
    Logger.info('EntryAbility', 'Ability onDestroy');
  }
}
