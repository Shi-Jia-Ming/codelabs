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

import http from '@ohos.net.http';
import { HTTP_READ_TIMEOUT, HTTP_CODE_200, SERVER_CODE_SUCCESS } from '../constant/CommonConstant';

/**
 * Initiates an HTTP request to a given URL.
 *
 * @param url URL for initiating an HTTP request.
 * @param params Params for initiating an HTTP request.
 */
export function httpRequestGet(url: string, params: any) {
  if (params) {
    url = `${url}?${'currentPage'}=${params.currentPage}&${'pageSize'}=${params.pageSize}`
    + `&${'currentIndex'}=${params.currentIndex}`;
  }
  let httpRequest = http.createHttp();
  let responseResult = httpRequest.request(url, {
    method: http.RequestMethod.GET,
    readTimeout: HTTP_READ_TIMEOUT,
    connectTimeout: HTTP_READ_TIMEOUT
  });
  let serverData: {
    code,
    data: any,
    msg: string | Resource
  } = { code: 0, data: '', msg: '' };
  // Processes the data and returns.
  return responseResult.then((value) => {
    if (value.responseCode === HTTP_CODE_200) {
      // Obtains the returned data.
      let result = `${value.result}`;
      let resultJson = JSON.parse(result);
      if (resultJson.code === SERVER_CODE_SUCCESS) {
        serverData.data = resultJson.data;
      }
      serverData.code = resultJson.code;
      serverData.msg = resultJson.msg;
    } else {
      serverData.code = value.responseCode;
      serverData.msg = `${$r('app.string.http_error_message')}&${value.responseCode}`;
    }
    return serverData;
  }).catch(() => {
    serverData.msg = $r('app.string.http_error_message');
    return serverData;
  })
}

