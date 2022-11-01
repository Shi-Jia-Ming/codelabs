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

import Ability from '@ohos.application.Ability';
import display from '@ohos.display';

export default class MainAbility extends Ability {
    onCreate(want) {
        globalThis.abilityWant = want;
    }

    async onWindowStageCreate(windowStage) {
        globalThis.display = await display.getDefaultDisplay();
        windowStage.setUIContent(this.context, "pages/Index", null);
    }
};