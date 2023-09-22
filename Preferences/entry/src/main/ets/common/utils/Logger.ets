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

import hilog from '@ohos.hilog';

/**
 * A utility class for printing logs.
 *
 * @param prefix The prefix of Logger.
 */
class Logger {
    private domain: number;
    private prefix: string;
    private format: string = '%{public}s, %{public}s';

    constructor(prefix: string) {
        this.prefix = prefix;
        this.domain = 0xFF00;
    }

    /**
     * Outputs debug-level logs.
     *
     * @param args Indicates the log parameters.
     */
    debug(...args: string[]) {
        hilog.debug(this.domain, this.prefix, this.format, args);
    }

    /**
     * Outputs info-level logs.
     *
     * @param args Indicates the log parameters.
     */
    info(...args: string[]) {
        hilog.info(this.domain, this.prefix, this.format, args);
    }

    /**
     * Outputs warning-level logs.
     *
     * @param args Indicates the log parameters.
     */
    warn(...args: string[]) {
        hilog.warn(this.domain, this.prefix, this.format, args);
    }

    /**
     * Outputs error-level logs.
     *
     * @param args Indicates the log parameters.
     */
    error(...args: string[]) {
        hilog.error(this.domain, this.prefix, this.format, args);
    }
}

export default new Logger('[Preferences]');