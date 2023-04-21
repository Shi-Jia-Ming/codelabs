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

import display from '@ohos.display';
import UIAbility from '@ohos.app.ability.UIAbility';
import PreferencesHandler from '../model/database/PreferencesHandler';

export default class EntryAbility extends UIAbility {
  onCreate(want) {
    let abilityInfo = this.context.abilityInfo;
    globalThis.bundleName = abilityInfo.bundleName;
    globalThis.abilityName = abilityInfo.name;
    globalThis.abilityWant = want;
    globalThis.preference = PreferencesHandler.getInstance();
  }

  async onWindowStageCreate(windowStage) {
    globalThis.display = await display.getDefaultDisplay();
    await globalThis.preference.configure(this.context.getApplicationContext());
    windowStage.setUIContent(this.context, "pages/MainIndex", null);
  }
}