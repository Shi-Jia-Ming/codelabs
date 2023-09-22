/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import worker, { ThreadWorkerGlobalScope, MessageEvents, ErrorEvent } from '@ohos.worker';
import { adjustSaturation } from '../utils/AdjustUtil';

let workerPort : ThreadWorkerGlobalScope = worker.workerPort;

/**
* Defines the event handler to be called when the worker thread receives a message sent by the host thread.
* The event handler is executed in the worker thread.
*
* @param e message data
*/
workerPort.onmessage = function (event: MessageEvents) {
    let bufferArray = event.data.buf;
    let last = event.data.last;
    let cur = event.data.cur;
    let buffer = adjustSaturation(bufferArray, last, cur)
    workerPort.postMessage(buffer);
    workerPort.close();
}

/**
* Defines the event handler to be called when the worker receives a message that cannot be deserialized.
* The event handler is executed in the worker thread.
*
* @param e message data
*/
workerPort.onmessageerror = function (event: MessageEvents) {
    hilog.error(0x0000, 'AdjustSaturationWork', 'Failed to load the content. Cause: %{public}s', `on message error ${JSON.stringify(event)}`);
}

/**
* Defines the event handler to be called when an exception occurs during worker execution.
* The event handler is executed in the worker thread.
*
* @param e error message
*/
workerPort.onerror = function (error: ErrorEvent) {
    hilog.error(0x0000, 'AdjustSaturationWork', 'Failed to load the content. Cause: %{public}s', `on worker error ${JSON.stringify(error)}`);
}