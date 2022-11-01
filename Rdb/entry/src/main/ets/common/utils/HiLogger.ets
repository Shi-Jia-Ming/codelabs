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

import hilog from '@ohos.hilog';
import { ILogger } from './ILogger';

export class HiLogger implements ILogger {
  private appIdentifier: string;
  private appDomain: number = 0x0001;

  constructor(appIdentifier: string) {
    this.appIdentifier = appIdentifier;
  }

  public verbose(tag: string, msg: string): void {
    hilog.debug(this.appDomain, tag, `[${this.appIdentifier}] [verbose] tag:${tag} msg:${msg}`);
  }

  public debug(tag: string, msg: string): void {
    hilog.debug(this.appDomain, tag, `[${this.appIdentifier}] [debug] tag:${tag} msg:${msg}`);
  }

  public info(tag: string, msg: string): void {
    hilog.info(this.appDomain, tag, `[${this.appIdentifier}] [info] tag:${tag} msg:${msg}`);
  }

  public warn(tag: string, msg: string): void {
    hilog.warn(this.appDomain, tag, `[${this.appIdentifier}] [warn] tag:${tag} msg:${msg}`);
  }

  public error(tag: string, msg: string): void {
    hilog.error(this.appDomain, tag, `[${this.appIdentifier}] [error] tag:${tag} msg:${msg}`);
  }
}