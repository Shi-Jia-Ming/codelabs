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

import ExtendInterface from "@ohos/hypium/src/module/mock/ExtendInterface";
import {
    ArgumentMatchers,
    any,
    anyString,
    anyBoolean,
    anyFounction,
    anyNumber,
    anyObj,
    matcheReturnKey,
    matcheStubKey,
    isRegExp,
} from "@ohos/hypium/src/module/mock/ArgumentMatchers";

class MockKit {
    constructor() {
        this.mFunctions = [];
        this.stubs = new Map();
        this.recordCalls = [];
        this.currentSetKey = null;
    }

    init() {
        this.reset();
    }

    reset() {
        this.mFunctions = [];
        this.stubs = {};
        this.recordCalls = [];
        this.currentSetKey = null;
    }

    clear() {
        this.reset();
        var props = Object.keys(this);
        for (var i = 0; i < props.length; i++) {
            delete this[props[i]];
        }

        var props = Object.getOwnPropertyNames(this);
        for (var i = 0; i < props.length; i++) {
            delete this[props[i]];
        }
        for (var key in this) {
            delete this[key];
        }
    }

    extend(dest, source) {
        dest["stub"] = source["stub"];
        dest["afterReturn"] = source["afterReturn"];
        dest["afterReturnNothing"] = source["afterReturnNothing"];
        dest["afterAction"] = source["afterAction"];
        dest["afterThrow"] = source["afterThrow"];
        dest["stubMockedCall"] = source["stubMockedCall"];
        dest["clear"] = source["clear"];
        return dest;
    }

    stubApply(f, params, returnInfo) {
        let values = this.stubs.get(f);
        if (!values) {
            values = new Map();
        }
        let key = params[0];
        if (matcheStubKey(key)) {
            key = matcheStubKey(key);
            if (key) {
                this.currentSetKey = key;
            }
        }
        values.set(key, returnInfo);
        console.info(
            "set stub:" + f + ";" + "key:" + key + ",returnInfo:" + returnInfo
        );
        this.stubs.set(f, values);
    }

    getReturnInfo(f, params) {
        let values = this.stubs.get(f);
        console.info(
            "getReruntInfo:" + f + ",values:" + values + ",params:" + params[0]
        );

        if (!values) {
            return undefined;
        }
        let retrunKet = params[0];
        let stubSetKey = this.currentSetKey;

        if (this.currentSetKey) {
            retrunKet = stubSetKey;
        }
        
        if (matcheReturnKey(params[0], undefined, stubSetKey) && matcheReturnKey(params[0], undefined, stubSetKey) != stubSetKey) {
            retrunKet = params[0];
        }

        values.forEach(function (value, key, map) {
            if (isRegExp(key) && matcheReturnKey(params[0], key)) {
                retrunKet = key;
            }
        })
       
        console.info("detail:" + values.get(retrunKet));
        return values.get(retrunKet);
    }
}

function ifMockedFunction(f) {
    if (Object.prototype.toString.call(f) != "[object Function]") {
        throw Error("not a function");
    }
    if (!f.stub) {
        throw Error("not a mock function");
    }
    return true;
}

function when(f) {
    if (ifMockedFunction(f)) {
        return f.stub.bind(f);
    }
}

function mockFunc(originalObject, originalMethod) {
    let tmp = this;
    let f = function () {
        let args = arguments;
        let action = tmp.getReturnInfo(f, args);
        if (action) {
            return action.apply(this, args);
        }
    };

    f.mocker = this;
    this.mFunctions.push(f);
    this.extend(f, new ExtendInterface(this));
    return f;
}

export { MockKit, when, mockFunc };