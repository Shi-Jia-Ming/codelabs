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

import WebView from '@ohos.web.webview';
import contact from '@ohos.contact';
import { code } from '../constant/CodeConstant';
import { ParamsBean } from '../../viewmodel/ParamsBean';
import { JavaScriptBean } from '../../viewmodel/JavaScriptBean';
import Logger from './Logger';

/**
 * Define bridge class connect WebView and ArkTS.
 */
export default class JsBridge {
  controller: WebView.WebviewController;

  constructor(controller: WebView.WebviewController) {
    this.controller = controller;
  }

  /**
   * Injects the JavaScript object into window and invoke the function in window.
   *
   * @returns javaScriptProxy object.
   */
  get javaScriptProxy(): JavaScriptBean {
    let result: JavaScriptBean = {
      object: {
        call: this.call
      },
      name: "JSBridgeHandle",
      methodList: ['call'],
      controller: this.controller
    }
    return result;
  }

  /**
   * initialize the bridge.
   */
  initJsBridge(): void {
    this.controller.runJavaScript(code);
  }

  /**
   * Use system ability of getting contacts.
   */
  chooseContact = (): Promise<string> => {
    let phone = '';
    let name = '';
    return new Promise((resolve) => {
      Logger.info('选择通讯录...');
      let promise = contact.selectContact();
      Logger.info('选择通讯录...');
      promise.then((info: Array<contact.Contact>) => {
        Logger.info(`selectContact success: data->${JSON.stringify(info)}`);
        info.forEach((item: contact.Contact) => {
          phone = item?.phoneNumbers ? item?.phoneNumbers[0].phoneNumber : '';
          name = item?.name ? item?.name?.fullName : '';
        })
        resolve(phone + '_' + name);
      }).catch((err: object | string) => {
        Logger.error(`selectContact fail: err->${JSON.stringify(err)}`);
      });
    })
  }

  /**
   * Change tel function.
   */
  changeTel = (params: ParamsBean): Promise<string> => {
    Logger.info('手机号', JSON.stringify(params));
    const tel: string = params.data.tel ?? '';
    AppStorage.Set<string>('tel', tel);
    return new Promise((resolve) => {
      resolve('success');
    })
  }

  /**
   * Change amount function.
   */
  changeAmount = (): Promise<string> => {
    AppStorage.Set<boolean>('isClick', true);
    return new Promise((resolve) => {
      resolve('success');
    })
  }

  /**
   * Compatible with different dpi.
   */
  getProportion = (): Promise<string> => {
    return new Promise((resolve) => {
      resolve(String(AppStorage.Get<number>('proportion')));
    })
  }

  /**
   * Invoke the chooseContact function.
   */
  call = (func: string, params: string): void => {
    const paramsObject: ParamsBean = JSON.parse(params);
    let result: Promise<string> = new Promise((resolve) => resolve(''));
    switch (func) {
      case 'chooseContact':
        result = this.chooseContact();
        break;
      case 'changeTel':
        result = this.changeTel(paramsObject);
        break;
      case 'changeAmount':
        result = this.changeAmount();
        break;
      case 'getProportion':
        result = this.getProportion();
        break;
      default:
        break;
    }
    result.then((data: string) => {
      this.callback(paramsObject?.callID, data);
    })
  }

  /**
   * The ArkTS invoke the WebView by using runJavaScript.
   */
  callback = (id: number, data: string): void => {
    this.controller.runJavaScript(`JSBridgeCallback("${id}", ${JSON.stringify(data)})`);
  }
}