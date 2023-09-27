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

  public on(event: string, callback: Function) {
    (this.callBackArray[event] || (this.callBackArray[event] = [])).push(callback);
  }

  public off() {
    this.callBackArray = [];
  }

  public emit(event: string) {
    let _self = this;
    if (!this.callBackArray[event]) {
      return;
    }
    let cbs: Function[] = this.callBackArray[event];
    if (cbs) {
      let len = cbs.length;
      for (let i = 0; i < len; i++) {
        try {
          cbs[i](_self);
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