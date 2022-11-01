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

export class BroadCast {
    private callBackArray = [];

    public on(event, callback) {
        (this.callBackArray[event] || (this.callBackArray[event] = [])).push(callback);
    }

    public off(event, callback) {
        if (event == null) {
            this.callBackArray = [];
        }
        const cbs = this.callBackArray[event];
        if (!cbs) {
            return;
        }
        if (callback == null) {
            this.callBackArray[event] = null;
        }
        let cb;
        let len = cbs.length;
        for (let i = 0; i < len; i++) {
            cb = cbs[i];
            if (cb === callback || cb.fn === callback) {
                cbs.splice(i, 1);
                break;
            }
        }
    }

    public emit(event, args?: any[]) {
        let _self = this;
        if (!this.callBackArray[event]) {
            return;
        }
        let cbs = [...this.callBackArray[event]];
        if (cbs) {
            let len = cbs.length;
            for (let i = 0; i < len; i++) {
                try {
                    cbs[i].apply(_self, args);
                } catch (e) {
                    new Error(e);
                }
            }
        }
    }
}

export enum BroadCastType {
    SHOW_TARGET_SETTING_DIALOG = 'showTargetSettingDialog',
    SHOW_REMIND_TIME_DIALOG = 'showRemindTimeDialog',
    SHOW_FREQUENCY_DIALOG = 'showFrequencyDialog'
}