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

/**
 * define the runJavaScript code.
 */
export const code = `
  const JSBridgeMap = {};
  let callID = 0;

  function JSBridgeCallback (id, params){
    JSBridgeMap[id](params);
    JSBridgeMap[id] = null;
    delete JSBridgeMap[id];
  }

  window.ohosCallNative = {
    callNative(method, params, callback){
      const id = callID++;
      const paramsObj = {
          callID: id,
          data: params || null
      }
      JSBridgeMap[id] = callback || (() => {});
      JSBridgeHandle.call(method, JSON.stringify(paramsObj));
    }
  }
`;