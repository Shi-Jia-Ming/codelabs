var _f397d57662ccc58514719b849a3d374d;
/******/ (() => { // webpackBootstrap
/******/ 	"use strict";
/******/ 	var __webpack_modules__ = ({

/***/ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/Application/MyAbilityStage.ts?entry":
/*!**************************************************************************************************************************!*\
  !*** ../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/Application/MyAbilityStage.ts?entry ***!
  \**************************************************************************************************************************/
/***/ (function(__unused_webpack_module, exports) {


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
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
var _ohos_hilog_1  = globalThis.requireNapi('hilog') || (isSystemplugin('hilog', 'ohos') ? globalThis.ohosplugin.hilog : isSystemplugin('hilog', 'system') ? globalThis.systemplugin.hilog : undefined);
var _ohos_application_AbilityStage_1  = globalThis.requireNapi('application.AbilityStage') || (isSystemplugin('application.AbilityStage', 'ohos') ? globalThis.ohosplugin.application.AbilityStage : isSystemplugin('application.AbilityStage', 'system') ? globalThis.systemplugin.application.AbilityStage : undefined);
class MyAbilityStage extends _ohos_application_AbilityStage_1 {
    onCreate() {
        _ohos_hilog_1.isLoggable(0x0000, 'testTag', _ohos_hilog_1.LogLevel.INFO);
        _ohos_hilog_1.info(0x0000, 'testTag', '%{public}s', 'AbilityStage onCreate');
    }
}
globalThis.exports.default = MyAbilityStage;


/***/ })

/******/ 	});
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module is referenced by other modules so it can't be inlined
/******/ 	var __webpack_exports__ = {};
/******/ 	__webpack_modules__["../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/Application/MyAbilityStage.ts?entry"](0, __webpack_exports__);
/******/ 	_f397d57662ccc58514719b849a3d374d = __webpack_exports__;
/******/ 	
/******/ })()
;
//# sourceMappingURL=MyAbilityStage.js.map