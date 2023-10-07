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

import Intl from '@ohos.intl';
import { BusinessError } from '@ohos.base';
import connection from '@ohos.net.connection';
import promptAction from '@ohos.promptAction';
import agconnect from '@hw-agconnect/api-ohos';
import { FunctionResult } from '@hw-agconnect/function-ohos';
import Logger from '../../../../logger/Logger';
import { Triggers } from './Triggers';
import ErrorCode from '../../../../constants/ErrorCodeConstants';

const MAX_RETRIES = 3;
const TAG = '[Request]';
const locale = new Intl.Locale();

interface RejectError {
  code: number;
  message: string;
}

/**
 * FuncNetwork base class
 */
class Request {
  async performRequest(trigger: Triggers | string, params?: Object, times?: number): Promise<Object> {
    return new Promise((resolve: (value: Object | PromiseLike<Object>) => void, reject: ((reason?: RejectError) => void)) => {
      Logger.info(TAG, 'Request call :' + trigger);
      Logger.info(TAG, 'Request params :' + JSON.stringify(params));
      connection.hasDefaultNet((error: BusinessError, data: Object) => {
        if (!data) {
          Logger.error(TAG, 'The default data network is disconnected ' + JSON.stringify(error));
          promptAction.showToast({
            message: $r('app.string.network_error_msg')
          });
          reject({ code: ErrorCode.ERROR_NETWORK_CONNECT_FAILED, message: 'The network seems to have deserted' });
          return;
        }
        let functionCallable = agconnect.function().wrap(trigger);
        functionCallable.setTimeout(2000);
        functionCallable.call(params).then((functionResult: FunctionResult) => {
          Logger.info(TAG, 'Request call success--------' + JSON.stringify(functionResult));
          resolve(functionResult.getValue().data);
        }).catch((error: RejectError) => {
          if (times && times > 0) {
            Logger.error(TAG, 'retry times--------' + (MAX_RETRIES - times + 1));
            resolve(request.performRequest(trigger, params, times - 1));
          } else {
            Logger.error(TAG, 'reject error--------' + JSON.stringify(error));
            reject(error);
          }
        });
      })
    });
  }

  async call(trigger: Triggers | string, params?: Object): Promise<Object> {
    return await this.performRequest(trigger, params, MAX_RETRIES)
  }
}

let request = new Request();

export default request;