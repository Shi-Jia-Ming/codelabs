var _ed5f3d8eeddb64db6d429a154213e514;
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "../../../../../../../codeHub/930/930HarmonyOS/Animation/entry/src/main/ets/entryability/EntryAbility.ts?entry":
/*!*********************************************************************************************************************!*\
  !*** ../../../../../../../codeHub/930/930HarmonyOS/Animation/entry/src/main/ets/entryability/EntryAbility.ts?entry ***!
  \*********************************************************************************************************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {

"use strict";

var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
var _ohos_hilog_1  = globalThis.requireNapi('hilog') || (isSystemplugin('hilog', 'ohos') ? globalThis.ohosplugin.hilog : isSystemplugin('hilog', 'system') ? globalThis.systemplugin.hilog : undefined);
var _ohos_application_Ability_1  = globalThis.requireNapi('application.Ability') || (isSystemplugin('application.Ability', 'ohos') ? globalThis.ohosplugin.application.Ability : isSystemplugin('application.Ability', 'system') ? globalThis.systemplugin.application.Ability : undefined);
__webpack_require__(/*! @ohos.window */ "../../api/@ohos.window.d.ts");
class EntryAbility extends _ohos_application_Ability_1 {
    onCreate(want, launchParam) {
        var _a, _b;
        _ohos_hilog_1.isLoggable(0x0000, 'testTag', _ohos_hilog_1.LogLevel.INFO);
        _ohos_hilog_1.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
        _ohos_hilog_1.info(0x0000, 'testTag', '%{public}s', (_a = 'want param:' + JSON.stringify(want)) !== null && _a !== void 0 ? _a : '');
        _ohos_hilog_1.info(0x0000, 'testTag', '%{public}s', (_b = 'launchParam:' + JSON.stringify(launchParam)) !== null && _b !== void 0 ? _b : '');
    }
    onDestroy() {
        _ohos_hilog_1.isLoggable(0x0000, 'testTag', _ohos_hilog_1.LogLevel.INFO);
        _ohos_hilog_1.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
    }
    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        _ohos_hilog_1.isLoggable(0x0000, 'testTag', _ohos_hilog_1.LogLevel.INFO);
        _ohos_hilog_1.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
        windowStage.loadContent('pages/Index', (err, data) => {
            var _a, _b;
            if (err.code) {
                _ohos_hilog_1.isLoggable(0x0000, 'testTag', _ohos_hilog_1.LogLevel.ERROR);
                _ohos_hilog_1.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', (_a = JSON.stringify(err)) !== null && _a !== void 0 ? _a : '');
                return;
            }
            _ohos_hilog_1.isLoggable(0x0000, 'testTag', _ohos_hilog_1.LogLevel.INFO);
            _ohos_hilog_1.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', (_b = JSON.stringify(data)) !== null && _b !== void 0 ? _b : '');
        });
    }
    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        _ohos_hilog_1.isLoggable(0x0000, 'testTag', _ohos_hilog_1.LogLevel.INFO);
        _ohos_hilog_1.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
    }
    onForeground() {
        // Ability has brought to foreground
        _ohos_hilog_1.isLoggable(0x0000, 'testTag', _ohos_hilog_1.LogLevel.INFO);
        _ohos_hilog_1.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
    }
    onBackground() {
        // Ability has back to background
        _ohos_hilog_1.isLoggable(0x0000, 'testTag', _ohos_hilog_1.LogLevel.INFO);
        _ohos_hilog_1.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
    }
}
globalThis.exports.default = EntryAbility;


/***/ }),

/***/ "../../api/@ohos.window.d.ts":
/*!***********************************!*\
  !*** ../../api/@ohos.window.d.ts ***!
  \***********************************/
/***/ (() => {



/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		var commonCachedModule = globalThis["__common_module_cache___ed5f3d8eeddb64db6d429a154213e514"] ? globalThis["__common_module_cache___ed5f3d8eeddb64db6d429a154213e514"][moduleId]: null;
/******/ 		if (commonCachedModule) { return commonCachedModule.exports; }
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		function isCommonModue(moduleId) {
/******/ 		                if (globalThis["webpackChunk_ed5f3d8eeddb64db6d429a154213e514"]) {
/******/ 		                  const length = globalThis["webpackChunk_ed5f3d8eeddb64db6d429a154213e514"].length;
/******/ 		                  switch (length) {
/******/ 		                    case 1:
/******/ 		                      return globalThis["webpackChunk_ed5f3d8eeddb64db6d429a154213e514"][0][1][moduleId];
/******/ 		                    case 2:
/******/ 		                      return globalThis["webpackChunk_ed5f3d8eeddb64db6d429a154213e514"][0][1][moduleId] ||
/******/ 		                      globalThis["webpackChunk_ed5f3d8eeddb64db6d429a154213e514"][1][1][moduleId];
/******/ 		                  }
/******/ 		                }
/******/ 		                return undefined;
/******/ 		              }
/******/ 		if (globalThis["__common_module_cache___ed5f3d8eeddb64db6d429a154213e514"] && String(moduleId).indexOf("?name=") < 0 && isCommonModue(moduleId)) {
/******/ 		  globalThis["__common_module_cache___ed5f3d8eeddb64db6d429a154213e514"][moduleId] = module;
/******/ 		}
/******/ 		__webpack_modules__[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module is referenced by other modules so it can't be inlined
/******/ 	var __webpack_exports__ = __webpack_require__("../../../../../../../codeHub/930/930HarmonyOS/Animation/entry/src/main/ets/entryability/EntryAbility.ts?entry");
/******/ 	_ed5f3d8eeddb64db6d429a154213e514 = __webpack_exports__;
/******/ 	
/******/ })()
;
//# sourceMappingURL=EntryAbility.js.map