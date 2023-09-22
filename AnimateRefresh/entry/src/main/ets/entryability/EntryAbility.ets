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

import window from '@ohos.window';
import display from '@ohos.display';
import Want from '@ohos.app.ability.Want';
import Ability from '@ohos.app.ability.UIAbility';
import { GlobalContext } from '../common/utils/GlobalContext';

export default class EntryAbility extends Ability {
  onCreate(want: Want) {
    GlobalContext.getContext().setObject('abilityWant', want);
  }

  async onWindowStageCreate(windowStage: window.WindowStage) {
    GlobalContext.getContext().setObject('display', await display.getDefaultDisplaySync());
    windowStage.loadContent('pages/TabIndex');
  }
};
