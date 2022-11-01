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

import { ILogger } from './ILogger';
import { HiLogger } from './HiLogger';

export class Logger implements ILogger {
    private static isAppDebugMode: boolean = true;
    private static appIdentifier: string = 'TPLAPP';

    // if true, use a ConsoleLogger, or HiLogger otherwise
    private static useConsoleLogger: boolean = true;

    public static verbose(tag: string, msg: string): void {
        if (Logger.isAppDebugMode) {
            Logger.getInstance().verbose(tag, msg);
        }
    }

    public static debug(tag: string, msg: string): void {
        if (Logger.isAppDebugMode) {
            Logger.getInstance().debug(tag, msg);
        }
    }

    public static info(tag: string, msg: string): void {
        if (Logger.isAppDebugMode) {
            Logger.getInstance().info(tag, msg);
        }
    }

    public static warn(tag: string, msg: string): void {
        if (Logger.isAppDebugMode) {
            Logger.getInstance().warn(tag, msg);
        }
    }

    public static error(tag: string, msg: string): void {
        if (Logger.isAppDebugMode) {
            Logger.getInstance().error(tag, msg);
        }
    }

    private static logger: ILogger;

    private constructor() {
    }

    public static getInstance(): Logger {
        if (!Logger.logger) {
            Logger.logger = new HiLogger(Logger.appIdentifier);
        }

        return Logger.logger;
    }

    public verbose(tag: string, msg: string): void {
        Logger.logger.verbose(tag, msg);
    }

    public debug(tag: string, msg: string): void {
        Logger.debug(tag, msg);
    }

    public info(tag: string, msg: string): void {
        Logger.info(tag, msg);
    }

    public warn(tag: string, msg: string): void {
        Logger.warn(tag, msg);
    }

    public error(tag: string, msg: string): void {
        Logger.error(tag, msg);
    }
}