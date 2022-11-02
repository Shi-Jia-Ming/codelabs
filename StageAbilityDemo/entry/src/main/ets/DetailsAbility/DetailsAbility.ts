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

import hilog from '@ohos.hilog';
import Ability from '@ohos.application.Ability';

const TAG: string = 'DetailsAbility';
const KEY: string = 'GoodsPosition';
const DETAIL_ABILITY_DOMAIN = 0x00002;

export default class DetailsAbility extends Ability {
    onCreate(want, launchParam) {
        let index: number = want?.parameters?.position;
        AppStorage.SetOrCreate(KEY, index);
        hilog.info(DETAIL_ABILITY_DOMAIN, TAG, '%{public}s', 'Ability onCreate');
    }

    onDestroy() {
        hilog.info(DETAIL_ABILITY_DOMAIN, TAG, '%{public}s', 'Ability onDestroy');
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        hilog.info(0x0000, TAG, '%{public}s', 'Ability onWindowStageCreate');

        windowStage.loadContent('pages/DetailsPage', (err, data) => {
            if (err.code) {
                hilog.error(DETAIL_ABILITY_DOMAIN, TAG, 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
                return;
            }
            hilog.info(DETAIL_ABILITY_DOMAIN, TAG, 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
        });
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        hilog.info(DETAIL_ABILITY_DOMAIN, TAG, '%{public}s', 'Ability onWindowStageDestroy');
    }

    onForeground() {
        // Ability has brought to foreground
        hilog.info(DETAIL_ABILITY_DOMAIN, TAG, '%{public}s', 'Ability onForeground');
    }

    onBackground() {
        // Ability has back to background
        hilog.info(DETAIL_ABILITY_DOMAIN, TAG, '%{public}s', 'Ability onBackground');
    }
};
