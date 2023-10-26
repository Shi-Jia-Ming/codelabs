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

/**
 * DayInfo
 *
 * @param date
 * @param targetTaskNum
 * @param finTaskNum
 */
export default class DayInfo {
    date: string;
    targetTaskNum: number;
    finTaskNum: number;

    constructor(date: string, targetTaskNum: number, finTaskNum: number) {
        this.date = date;
        this.targetTaskNum = targetTaskNum;
        this.finTaskNum = finTaskNum;
    }
}