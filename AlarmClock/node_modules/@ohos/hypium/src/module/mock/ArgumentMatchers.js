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

class ArgumentMatchers {
    static ANY = "<any>";
    static ANY_STRING = "<any String>";
    static ANY_BOOLEAN = "<any Boolean>";
    static ANY_NUMBER = "<any Number>";
    static ANY_OBJECT = "<any Object>";
    static ANY_FOUNCTION = "<any Function>";
    static MATCH_REGEXS = "<match regexs>";
}

function matcheReturnKey() {
    let arg = arguments[0];
    let regex = arguments[1];
    let stubSetKey = arguments[2];

    if (stubSetKey && stubSetKey == ArgumentMatchers.ANY) {
        return ArgumentMatchers.ANY;
    }

    if (typeof arg === "string" && !regex) {
        return ArgumentMatchers.ANY_STRING;
    }

    if (typeof arg === "boolean" && !regex) {
        return ArgumentMatchers.ANY_BOOLEAN;
    }

    if (typeof arg === "number" && !regex) {
        return ArgumentMatchers.ANY_NUMBER;
    }

    if (typeof arg === "object" && !regex) {
        return ArgumentMatchers.ANY_OBJECT;
    }

    if (typeof arg === "function" && !regex) {
        return ArgumentMatchers.ANY_FOUNCTION;
    }

    if (typeof arg === "string" && regex) {
        return regex.test(arg);
    }

    return null;
}

function matcheStubKey() {
    let key = arguments[0];

    if (key === any) {
        return ArgumentMatchers.ANY;
    }

    if (key === anyString) {
        return ArgumentMatchers.ANY_STRING;
    }
    if (key === anyBoolean) {
        return ArgumentMatchers.ANY_BOOLEAN;
    }
    if (key === anyNumber) {
        return ArgumentMatchers.ANY_NUMBER;
    }
    if (key === anyObj) {
        return ArgumentMatchers.ANY_OBJECT;
    }
    if (key === anyFounction) {
        return ArgumentMatchers.ANY_FOUNCTION;
    }

    if (isRegExp(key)) {
        return key;
    }

    return null;
}

function any() {
}

function anyString() {
}

function anyBoolean() {
}

function anyNumber() {
}

function anyObj() {
}

function anyFounction() {
}

function matchRegexs() {
    let regex = arguments[0];
    if (isRegExp(regex)) {
        return regex;
    }
    throw Error("not a regex");
}

function isRegExp(value) {
    return Object.prototype.toString.call(value) === "[object RegExp]";
}

export {
    ArgumentMatchers,
    any,
    anyBoolean,
    anyNumber,
    anyObj,
    anyString,
    anyFounction,
    matcheReturnKey,
    matcheStubKey,
    matchRegexs,
    isRegExp,
};