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

const chineseNumOfWeek: string[] = ['一', '二', '三', '四', '五', '六', '日'];
const WEEK: string = '星期';

// one digit or two number convert into two digit time format
export function padTo2Digits(num: number) {
    return num.toString().padStart(2, '0');
}

export const frequencyRange = () => {
    const frequencyRangeArr = []
    chineseNumOfWeek.forEach((item, index) => {
        frequencyRangeArr.push({
            id: (index + 1),
            label: `${WEEK}${item}`,
            isChecked: false
        })
    });
    return frequencyRangeArr;
}

export const oneWeekDictFunc = () => {
    const oneWeekDict = {};
    chineseNumOfWeek.forEach((item, index) => {
        oneWeekDict[index + 1] = `${WEEK}${chineseNumOfWeek[index]}`;
    });
    return oneWeekDict;
}

