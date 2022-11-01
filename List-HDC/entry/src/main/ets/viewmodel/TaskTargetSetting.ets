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

import {
    TODAY,
    DRINK_STEP,
    DRINK_MAX_RANGE,
    EAT_APPLE_RANGE,
    TIMES_100
} from '../common/constants/CommonConstant';
import { padTo2Digits } from './FrequencySetting';

export const formatParams = (params) => {
    return JSON.stringify(params)
}

/**
 * @description Returns the timestamp of today's selected time
 * @param currentTime
 * @return timestamp
 */
export const returnTimeStamp = (currentTime: string) => {
    const timeString = `${TODAY} ${currentTime}`;
    return new Date(timeString).getTime();
}

/**
 * @description It is used for formatting time and displayed in the form of HH: mm
 * @param value
 */
export const formatTime = (value) => {
    return `${padTo2Digits(value?.hour)}:${padTo2Digits(value?.minute)}`;
}

/**
 * @description Range of generated drinking water 0.25 - 5 L
 * @return Array<string>
 */
export const createDrinkRange = () => {
    const drinkRangeArr = []
    for (let i = DRINK_STEP; i <= DRINK_MAX_RANGE; i += DRINK_STEP) {
        drinkRangeArr.push(`${i / TIMES_100} L`);
    }
    return drinkRangeArr;
}

/**
 * @description Generate the range of eating apples 1 - 100
 * @return Array<string>
 */
export const createAppleRange = () => {
    const appleRangeArr = []
    for (let i = 1; i <= EAT_APPLE_RANGE; i++) {
        appleRangeArr.push(`${i} 个`);
    }
    return appleRangeArr;
}