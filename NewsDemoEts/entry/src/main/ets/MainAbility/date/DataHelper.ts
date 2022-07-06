/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

export function HttpRequestGet(url: string, params: Array<any>) {
  // 拼接get请求URL,参数在URL后面
  if (params) {
    for (var index = 0; index < params.length; index++) {
      const temp = params[index]
      if (index == 0) {
        url = url + "?" + temp.key + "=" + temp.value
      } else {
        url = url + "&" + temp.key + "=" + temp.value
      }
    }
  }
  // 每一个httpRequest对应一个http请求任务，不可复用
  let httpRequest = http.createHttp()
  // 发送数据请求
  let promise = httpRequest.request(url, {
    method: http.RequestMethod.GET,
    readTimeout: 60000,
    connectTimeout: 60000
  })
  // 处理数据，并返回
  return promise.then((value) => {
    let data: {
      code: number,
      data: any,
      msg: string
    } = { code: 0, data: '', msg: '' }
    data.code = value.responseCode
    if (value.responseCode === 200) {
      // 获取返回数据
      var result = value.result+''
      var result_json = JSON.parse(result);
      if (result_json.code === 200) {
        data.code = result_json.code
        data.data = result_json.data
        data.msg = result_json.msg
      } else {
        data.code = result_json.code
        data.msg = result_json.msg
      }
    } else {
      data.code = -1
      data.msg = '网络异常，请稍后尝试！'
    }
    console.info(" return data " + JSON.stringify(data))
    return data
  })
}

