/*
 * Copyright (c) 2021-2022 Huawei Device Co., Ltd.
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

import Core from './core';

const core = Core.getInstance();

const describe = function (desc, func) {
    if (typeof globalThis !== 'undefined') {
        return globalThis.describe(desc, func);
    }
    return core.describe(desc, func);
};
const it = function (desc, filter, func) {
    if (typeof globalThis !== 'undefined') {
        return globalThis.it(desc, filter, func);
    }
    return core.it(desc, filter, func);
};
const beforeEach = function (func) {
    if (typeof globalThis !== 'undefined') {
        return globalThis.beforeEach(func);
    }
    return core.beforeEach(func);
};
const afterEach = function (func) {
    if (typeof globalThis !== 'undefined') {
        return globalThis.afterEach(func);
    }
    return core.afterEach(func);
};
const beforeAll = function (func) {
    if (typeof globalThis !== 'undefined') {
        return globalThis.beforeAll(func);
    }
    return core.beforeAll(func);
};
const afterAll = function (func) {
    if (typeof globalThis !== 'undefined') {
        return globalThis.afterAll(func);
    }
    return core.afterAll(func);
};
const expect = function (actualValue) {
    if (typeof globalThis !== 'undefined') {
        return globalThis.expect(actualValue);
    }
    return core.expect(actualValue);
};

export {
    describe, it, beforeAll, beforeEach, afterEach, afterAll, expect
};
