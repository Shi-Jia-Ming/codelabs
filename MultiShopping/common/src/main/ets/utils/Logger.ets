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

import hilog from '@ohos.hilog';

/**
 * Common log for all features.
 *
 * @param {string} prefix Identifies the log tag.
 */


let domain: number = 0xFF00;
let prefix: string = 'MultiShopping';
let format: string = `%{public}s, %{public}s`;

export class Logger {
  static debug(...args: string[]) {
    hilog.debug(domain, prefix, format, args);
  }

  static info(...args: string[]) {
    hilog.info(domain, prefix, format, args);
  }

  static warn(...args: string[]) {
    hilog.warn(domain, prefix, format, args);
  }

  static error(...args: string[]) {
    hilog.error(domain, prefix, format, args);
  }

  static fatal(...args: string[]) {
    hilog.fatal(domain, prefix, format, args);
  }

  static isLoggable(level: LogLevel) {
    hilog.isLoggable(domain, prefix, level);
  }
}

/**
 * Log level define
 *
 * @syscap SystemCapability.HiviewDFX.HiLog
 */
enum LogLevel {
  DEBUG = 3,
  INFO = 4,
  WARN = 5,
  ERROR = 6,
  FATAL = 7
}
