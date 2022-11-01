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

import Ability from '@ohos.application.Ability';

export default class MainAbility extends Ability {
    private static TAG: string = 'MainAbility';

    onCreate(want, launchParam) {
        console.debug(MainAbility.TAG, 'onCreate');
        globalThis.abilityWant = want;
        globalThis.abilityContext = this.context;
    }

    onDestroy() {
        console.debug(MainAbility.TAG, 'onDestroy');
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.debug(MainAbility.TAG, 'onWindowStageCreate');
        windowStage.loadContent("pages/SplashPage", (err, data) => {
            if (err.code) {
                console.error('windowStage', 'Failed to load the content. Cause:' + JSON.stringify(err));
                return;
            }
            console.info('windowStage', 'Succeeded in loading the content. Data: ' + JSON.stringify(data));
        });
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.debug(MainAbility.TAG, 'onWindowStageDestroy');
    }

    onForeground() {
        // Ability has brought to foreground
        console.debug(MainAbility.TAG, 'onForeground');
    }

    onBackground() {
        // Ability has back to background
        console.debug(MainAbility.TAG, 'onBackground');
    }

    onNewWant(want, launchParam) {
        // Ability has new want
        console.debug(MainAbility.TAG, `onNewWant ${JSON.stringify(want)}`);
        globalThis.abilityWant = want;
    }
};
