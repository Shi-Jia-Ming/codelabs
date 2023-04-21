/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import emitter from '@ohos.events.emitter';

const EVENT_ID: number = 1;
const DATA_ID: number = 1;

/**
 * Emitter util function.
 */
export class EmitterUtil {
  private callbackPlaceName: (param: string) => void;

  /**
   * Callback location data.
   *
   * @param {callback} callbackPlaceName
   */
  callbackLocation(callbackPlaceName) {
    this.callbackPlaceName = callbackPlaceName;
  }

  /**
   * Emitter on.
   */
  emitterOn() {
    const that = this;
    let innerEvent = {
      eventId: EVENT_ID
    };
    let callback = (eventData) => {
      that.callbackPlaceName(eventData.data.content);
    };
    emitter.on(innerEvent, callback);
  }

  /**
   * Emitter off.
   */
  emitterOff() {
    emitter.off(EVENT_ID);
  }

  /**
   * Emitter emit with data.
   *
   * @param {string} data
   */
  emitterEmit(data: string) {
    if (data.trim().length === 0) {
      return;
    }
    let eventData = {
      data: {
        'content': data,
        'id': DATA_ID
      }
    };
    let innerEvent = {
      eventId: EVENT_ID,
      priority: emitter.EventPriority.IMMEDIATE
    };
    emitter.emit(innerEvent, eventData);
  }

  /**
   * Emitter emit with data.
   *
   * @param {string} data
   */
  emitEventData(data: string, evenId: number) {
    if (data.trim().length === 0 || evenId === null) {
      return;
    }
    let eventData = {
      data: {
        'content': data,
        'id': DATA_ID
      }
    };
    let innerEvent = {
      eventId: evenId,
      priority: emitter.EventPriority.IMMEDIATE
    };
    emitter.emit(innerEvent, eventData);
  }
}

let emitterUtil = new EmitterUtil();

export default emitterUtil as EmitterUtil;