var _f397d57662ccc58514719b849a3d374d;
/******/ (() => { // webpackBootstrap
/******/ 	"use strict";
/******/ 	var __webpack_modules__ = ({

/***/ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/common/bean/NewsData.ets":
/*!***************************************************************************************************************!*\
  !*** ../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/common/bean/NewsData.ets ***!
  \***************************************************************************************************************/
/***/ (function(__unused_webpack_module, exports) {


var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
exports.CustomRefreshLoadLayoutClass = exports.NewsFile = exports.NewsData = void 0;
let __generate__Id = 0;
function generateId() {
    return "NewsData_" + ++__generate__Id;
}
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
/**
 * News list item info.
 */
class NewsData {
    constructor(title, content, imagesUrl, source) {
        this.title = title;
        this.content = content;
        this.imagesUrl = imagesUrl;
        this.source = source;
    }
}
exports.NewsData = NewsData;
/**
 * News image list item info.
 */
class NewsFile {
    constructor(id, url, type, newsId) {
        this.id = id;
        this.type = type;
        this.url = url;
        this.newsId = newsId;
    }
}
exports.NewsFile = NewsFile;
/**
 * Custom refresh load layout data.
 */
let CustomRefreshLoadLayoutClass = class CustomRefreshLoadLayoutClass {
    constructor(isVisible, imageSrc, textValue, heightValue) {
        this.isVisible = isVisible;
        this.imageSrc = imageSrc;
        this.textValue = textValue;
        this.heightValue = heightValue;
    }
};
CustomRefreshLoadLayoutClass = __decorate([
    Observed
], CustomRefreshLoadLayoutClass);
exports.CustomRefreshLoadLayoutClass = CustomRefreshLoadLayoutClass;


/***/ }),

/***/ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/common/constant/CommonConstant.ets":
/*!*************************************************************************************************************************!*\
  !*** ../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/common/constant/CommonConstant.ets ***!
  \*************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports) => {


Object.defineProperty(exports, "__esModule", ({ value: true }));
exports.PageState = exports.RefreshState = exports.RefreshConstant = exports.RefreshLayout = exports.NewsGrid = exports.NewsSource = exports.NewsContent = exports.NewsTitle = exports.NewsListConstant = exports.TabBars = exports.FULL_HEIGHT = exports.FULL_WIDTH = exports.HTTP_READ_TIMEOUT = exports.ANIMATION_DURATION = exports.DELAY_TIME = exports.DELAY_ANIMATION_DURATION = exports.HTTP_CODE_200 = exports.GET_TAB_DATA_CURRENT_PAGE = exports.CUSTOM_LAYOUT_HEIGHT = exports.PAGE_SIZE = exports.Y_OFF_SET_COEFFICIENT = exports.SERVER_CODE_SUCCESS = exports.GET_NEWS_LIST = exports.GET_NEWS_TYPE = exports.SERVER = void 0;
let __generate__Id = 0;
function generateId() {
    return "CommonConstant_" + ++__generate__Id;
}
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
/**
 * The host address of the server.
 */
exports.SERVER = 'http://49.232.7.55:8091';
/**
 * Get the news type.
 */
exports.GET_NEWS_TYPE = 'getNewsType';
/**
 * Get the news list.
 */
exports.GET_NEWS_LIST = 'getNewsList';
/**
 * The request success status code.
 */
exports.SERVER_CODE_SUCCESS = 'success';
/**
 * The off set coefficient.
 */
exports.Y_OFF_SET_COEFFICIENT = 0.1;
/**
 * The page size.
 */
exports.PAGE_SIZE = 10;
/**
 * The refresh and load height.
 */
exports.CUSTOM_LAYOUT_HEIGHT = 70;
/**
 * Gt tab data current page.
 */
exports.GET_TAB_DATA_CURRENT_PAGE = 1;
/**
 * Http request success status code.
 */
exports.HTTP_CODE_200 = 200;
/**
 * The animation delay time.
 */
exports.DELAY_ANIMATION_DURATION = 300;
/**
 * The delay time.
 */
exports.DELAY_TIME = 1000;
/**
 * The animation duration.
 */
exports.ANIMATION_DURATION = 2000;
/**
 * The http timeout duration.
 */
exports.HTTP_READ_TIMEOUT = 10000;
/**
 * Full the width.
 */
exports.FULL_WIDTH = '100%';
/**
 * Full the height.
 */
exports.FULL_HEIGHT = '100%';
/**
 * The TabBars constants.
 */
exports.TabBars = {
    UN_SELECT_TEXT_FONT_SIZE: 18,
    SELECT_TEXT_FONT_SIZE: 24,
    UN_SELECT_TEXT_FONT_WEIGHT: 400,
    SELECT_TEXT_FONT_WEIGHT: 700,
    BAR_HEIGHT: '7.2%',
    HORIZONTAL_PADDING: '2.2%',
    BAR_WIDTH: '100%',
    DEFAULT_NEWS_TYPES: [{ id: 0, name: '全部' }, { id: 1, name: '国内' }, { id: 2, name: '国际' }, { id: 3, name: '娱乐' },
        { id: 4, name: '军事' }, { id: 5, name: '体育' }, { id: 6, name: '科技' }, { id: 7, name: '财经' },]
};
/**
 * The NewsListConstant constants.
 */
exports.NewsListConstant = {
    LIST_DIVIDER_STROKE_WIDTH: 0.5,
    GET_TAB_DATA_TYPE_ONE: 1,
    ITEM_BORDER_RADIUS: 16,
    NONE_IMAGE_SIZE: 120,
    NONE_TEXT_opacity: 0.6,
    NONE_TEXT_size: 16,
    NONE_TEXT_margin: 12,
    ITEM_MARGIN_TOP: '1.5%',
    LIST_MARGIN_LEFT: '3.3%',
    LIST_MARGIN_RIGHT: '3.3%',
    ITEM_HEIGHT: '32%',
    LIST_WIDTH: '93.3%'
};
/**
 * The NewsTitle constants.
 */
exports.NewsTitle = {
    TEXT_MAX_LINES: 3,
    TEXT_FONT_SIZE: 20,
    TEXT_FONT_WEIGHT: 500,
    TEXT_MARGIN_LEFT: '2.4%',
    TEXT_MARGIN_TOP: '7.2%',
    TEXT_HEIGHT: '9.6%',
    TEXT_WIDTH: '78.6%',
    IMAGE_MARGIN_LEFT: '3.5%',
    IMAGE_MARGIN_TOP: '7.9%',
    IMAGE_HEIGHT: '8.9%',
    IMAGE_WIDTH: '11.9%',
};
/**
 * The NewsContent constants.
 */
exports.NewsContent = {
    WIDTH: '93%',
    HEIGHT: '16.8%',
    MARGIN_LEFT: '3.5%',
    MARGIN_TOP: '3.4%',
    MAX_LINES: 3,
    FONT_SIZE: 15,
};
/**
 * The NewsSource constants.
 */
exports.NewsSource = {
    MAX_LINES: 1,
    FONT_SIZE: 12,
    MARGIN_LEFT: '3.5%',
    MARGIN_TOP: '3.4%',
    HEIGHT: '7.2%',
    WIDTH: '93%',
};
/**
 * The NewsGrid constants.
 */
exports.NewsGrid = {
    MARGIN_LEFT: '3.5%',
    MARGIN_RIGHT: '3.5%',
    MARGIN_TOP: '5.1%',
    WIDTH: '93%',
    HEIGHT: '31.5%',
    ASPECT_RATIO: 4,
    COLUMNS_GAP: 5,
    ROWS_TEMPLATE: '1fr',
    IMAGE_BORDER_RADIUS: 8
};
/**
 * The RefreshLayout constants.
 */
exports.RefreshLayout = {
    MARGIN_LEFT: '40%',
    TEXT_MARGIN_BOTTOM: 1,
    TEXT_MARGIN_LEFT: 7,
    TEXT_FONT_SIZE: 17,
    IMAGE_WIDTH: 18,
    IMAGE_HEIGHT: 18
};
/**
 * The RefreshConstant constants.
 */
exports.RefreshConstant = {
    DELAY_PULL_DOWN_REFRESH: 50,
    CLOSE_PULL_DOWN_REFRESH_TIME: 150,
    DELAY_SHRINK_ANIMATION_TIME: 500,
};
/**
 * The refresh state enum.
 */
var RefreshState;
(function (RefreshState) {
    RefreshState[RefreshState["DropDown"] = 0] = "DropDown";
    RefreshState[RefreshState["Release"] = 1] = "Release";
    RefreshState[RefreshState["Refreshing"] = 2] = "Refreshing";
    RefreshState[RefreshState["Success"] = 3] = "Success";
    RefreshState[RefreshState["Fail"] = 4] = "Fail";
})(RefreshState = exports.RefreshState || (exports.RefreshState = {}));
/**
 * The newsList state enum.
 */
var PageState;
(function (PageState) {
    PageState[PageState["Loading"] = 0] = "Loading";
    PageState[PageState["Success"] = 1] = "Success";
    PageState[PageState["Fail"] = 2] = "Fail";
})(PageState = exports.PageState || (exports.PageState = {}));


/***/ }),

/***/ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/common/utils/DataUtils.ets":
/*!*****************************************************************************************************************!*\
  !*** ../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/common/utils/DataUtils.ets ***!
  \*****************************************************************************************************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {


var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
exports.loadNewsTypes = exports.getTabData = void 0;
let __generate__Id = 0;
function generateId() {
    return "DataUtils_" + ++__generate__Id;
}
/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
var _ohos_prompt_1  = globalThis.requireNapi('prompt') || (isSystemplugin('prompt', 'ohos') ? globalThis.ohosplugin.prompt : isSystemplugin('prompt', 'system') ? globalThis.systemplugin.prompt : undefined);
const CommonConstant_1 = __webpack_require__(/*! ../constant/CommonConstant */ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/common/constant/CommonConstant.ets");
const HttpUtil_1 = __webpack_require__(/*! ../utils/HttpUtil */ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/common/utils/HttpUtil.ets");
/**
 * Initiate request for tab data.
 *
 * @param currentPage The current page number.
 * @param pageSize The number of current pages.
 * @param currentIndex The current index.
 * @param callback The function callback.
 */
async function getTabData(currentPage, pageSize, currentIndex, callback) {
    currentPage = currentPage + CommonConstant_1.GET_TAB_DATA_CURRENT_PAGE;
    if (currentPage > pageSize) {
        _ohos_prompt_1.showToast({ message: { "id": 16777223, "type": 10003, params: [], "bundleName": "com.example.newsdataarkts", "moduleName": "entry" } });
        currentPage = currentPage - CommonConstant_1.GET_TAB_DATA_CURRENT_PAGE;
    }
    let newsPageData = [];
    let url = `${CommonConstant_1.SERVER}/${CommonConstant_1.GET_NEWS_LIST}`;
    let params = { 'currentPage': currentPage, 'pageSize': pageSize, 'currentIndex': currentIndex };
    let data = await HttpUtil_1.httpRequestGet(url, params);
    if (data.code === CommonConstant_1.SERVER_CODE_SUCCESS) {
        newsPageData = data.data.pageData;
        callback.onSuccess({ currentPage, newsPageData });
    }
    else {
        callback.onFail(data.msg);
    }
}
exports.getTabData = getTabData;
/**
 * Initiate request news type.
 *
 * @param callback The function callback.
 */
async function loadNewsTypes(callback) {
    let tabBars = [];
    let url = `${CommonConstant_1.SERVER}/${CommonConstant_1.GET_NEWS_TYPE}`;
    let data = await HttpUtil_1.httpRequestGet(url, null);
    if (data.code === CommonConstant_1.SERVER_CODE_SUCCESS) {
        tabBars = data.data;
        callback.onSuccess(tabBars);
    }
    else {
        callback.onFail(data.msg);
    }
}
exports.loadNewsTypes = loadNewsTypes;


/***/ }),

/***/ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/common/utils/HttpUtil.ets":
/*!****************************************************************************************************************!*\
  !*** ../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/common/utils/HttpUtil.ets ***!
  \****************************************************************************************************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {


var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
exports.httpRequestGet = void 0;
let __generate__Id = 0;
function generateId() {
    return "HttpUtil_" + ++__generate__Id;
}
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
var _ohos_net_http_1  = globalThis.requireNapi('net.http') || (isSystemplugin('net.http', 'ohos') ? globalThis.ohosplugin.net.http : isSystemplugin('net.http', 'system') ? globalThis.systemplugin.net.http : undefined);
const CommonConstant_1 = __webpack_require__(/*! ../constant/CommonConstant */ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/common/constant/CommonConstant.ets");
/**
 * Initiates an HTTP request to a given URL.
 *
 * @param url URL for initiating an HTTP request.
 * @param params Params for initiating an HTTP request.
 */
function httpRequestGet(url, params) {
    if (params) {
        url = `${url}?${'currentPage'}=${params.currentPage}&${'pageSize'}=${params.pageSize}`
            + `&${'currentIndex'}=${params.currentIndex}`;
    }
    let httpRequest = _ohos_net_http_1.createHttp();
    let responseResult = httpRequest.request(url, {
        method: _ohos_net_http_1.RequestMethod.GET,
        readTimeout: CommonConstant_1.HTTP_READ_TIMEOUT,
        connectTimeout: CommonConstant_1.HTTP_READ_TIMEOUT
    });
    let serverData = { code: 0, data: '', msg: '' };
    // 处理数据，并返回
    return responseResult.then((value) => {
        if (value.responseCode === CommonConstant_1.HTTP_CODE_200) {
            // 获取返回数据
            let result = `${value.result}`;
            let resultJson = JSON.parse(result);
            if (resultJson.code === CommonConstant_1.SERVER_CODE_SUCCESS) {
                serverData.data = resultJson.data;
            }
            serverData.code = resultJson.code;
            serverData.msg = resultJson.msg;
        }
        else {
            serverData.code = value.responseCode;
            serverData.msg = `${{ "id": 16777220, "type": 10003, params: [], "bundleName": "com.example.newsdataarkts", "moduleName": "entry" }}&${value.responseCode}`;
        }
        return serverData;
    }).catch(() => {
        serverData.msg = { "id": 16777220, "type": 10003, params: [], "bundleName": "com.example.newsdataarkts", "moduleName": "entry" };
        return serverData;
    });
}
exports.httpRequestGet = httpRequestGet;


/***/ }),

/***/ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/common/utils/PullDownRefresh.ets":
/*!***********************************************************************************************************************!*\
  !*** ../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/common/utils/PullDownRefresh.ets ***!
  \***********************************************************************************************************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {


var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
exports.closeRefresh = exports.pullRefreshState = exports.touchUpPullRefresh = exports.touchMovePullRefresh = exports.listTouchEvent = void 0;
let __generate__Id = 0;
function generateId() {
    return "PullDownRefresh_" + ++__generate__Id;
}
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
var _ohos_prompt_1  = globalThis.requireNapi('prompt') || (isSystemplugin('prompt', 'ohos') ? globalThis.ohosplugin.prompt : isSystemplugin('prompt', 'system') ? globalThis.systemplugin.prompt : undefined);
const DataUtils_1 = __webpack_require__(/*! ./DataUtils */ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/common/utils/DataUtils.ets");
const PullUpLoadMore_1 = __webpack_require__(/*! ./PullUpLoadMore */ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/common/utils/PullUpLoadMore.ets");
const CommonConstant_1 = __webpack_require__(/*! ../constant/CommonConstant */ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/common/constant/CommonConstant.ets");
function listTouchEvent(event) {
    switch (event.type) {
        case TouchType.Down:
            this.downY = event.touches[0].y;
            this.lastMoveY = event.touches[0].y;
            break;
        case TouchType.Move:
            if (this.isRefreshing || this.isLoading) {
                return;
            }
            let isDownPull = event.touches[0].y - this.lastMoveY > 0;
            if ((isDownPull || this.isPullRefreshOperation) && !this.isCanLoadMore) {
                // 手指移动，处理下拉刷新
                touchMovePullRefresh.call(this, event);
            }
            else {
                // 手指移动，处理加载更多
                PullUpLoadMore_1.touchMoveLoadMore.call(this, event);
            }
            this.lastMoveY = event.touches[0].y;
            break;
        case TouchType.Cancel:
            break;
        case TouchType.Up:
            if (this.isRefreshing || this.isLoading) {
                return;
            }
            if (this.isPullRefreshOperation) {
                // 手指抬起，处理下拉刷新
                touchUpPullRefresh.call(this);
            }
            else {
                // 手指抬起，处理加载更多
                PullUpLoadMore_1.touchUpLoadMore.call(this);
            }
            break;
        default:
            break;
    }
}
exports.listTouchEvent = listTouchEvent;
function touchMovePullRefresh(event) {
    if (this.startIndex === 0) {
        this.isPullRefreshOperation = true;
        let height = vp2px(this.pullDownRefreshHeight);
        this.offsetY = event.touches[0].y - this.downY;
        // 滑动的偏移量大于下拉刷新布局高度，达到刷新条件
        if (this.offsetY >= height) {
            pullRefreshState.call(this, CommonConstant_1.RefreshState.Release);
            this.offsetY = height + this.offsetY * CommonConstant_1.Y_OFF_SET_COEFFICIENT;
        }
        else {
            pullRefreshState.call(this, CommonConstant_1.RefreshState.DropDown);
        }
        if (this.offsetY < 0) {
            this.offsetY = 0;
            this.isPullRefreshOperation = false;
        }
    }
}
exports.touchMovePullRefresh = touchMovePullRefresh;
function touchUpPullRefresh() {
    if (this.isCanRefresh) {
        this.offsetY = vp2px(this.pullDownRefreshHeight);
        pullRefreshState.call(this, CommonConstant_1.RefreshState.Refreshing);
        setTimeout(() => {
            let self = this;
            DataUtils_1.getTabData(self.currentPage, self.pageSize, self.currentIndex, {
                onSuccess: (value) => {
                    self.currentPage = parseInt(value.currentPage.toString());
                    self.newsData = value.newsPageData;
                    closeRefresh.call(self, true);
                },
                onFail: (msg) => {
                    _ohos_prompt_1.showToast({ message: msg });
                    closeRefresh.call(self, false);
                }
            });
        }, CommonConstant_1.DELAY_TIME);
    }
    else {
        closeRefresh.call(this, false);
    }
}
exports.touchUpPullRefresh = touchUpPullRefresh;
function pullRefreshState(state) {
    switch (state) {
        case CommonConstant_1.RefreshState.DropDown:
            this.pullDownRefreshText = { "id": 16777224, "type": 10003, params: [], "bundleName": "com.example.newsdataarkts", "moduleName": "entry" };
            this.pullDownRefreshImage = { "id": 16777240, "type": 20000, params: [], "bundleName": "com.example.newsdataarkts", "moduleName": "entry" };
            this.isCanRefresh = false;
            this.isRefreshing = false;
            this.isVisiblePullDown = true;
            break;
        case CommonConstant_1.RefreshState.Release:
            this.pullDownRefreshText = { "id": 16777229, "type": 10003, params: [], "bundleName": "com.example.newsdataarkts", "moduleName": "entry" };
            this.pullDownRefreshImage = { "id": 16777242, "type": 20000, params: [], "bundleName": "com.example.newsdataarkts", "moduleName": "entry" };
            this.isCanRefresh = true;
            this.isRefreshing = false;
            break;
        case CommonConstant_1.RefreshState.Refreshing:
            this.offsetY = vp2px(this.pullDownRefreshHeight);
            this.pullDownRefreshText = { "id": 16777228, "type": 10003, params: [], "bundleName": "com.example.newsdataarkts", "moduleName": "entry" };
            this.pullDownRefreshImage = { "id": 16777241, "type": 20000, params: [], "bundleName": "com.example.newsdataarkts", "moduleName": "entry" };
            this.isCanRefresh = true;
            this.isRefreshing = true;
            break;
        case CommonConstant_1.RefreshState.Success:
            this.pullDownRefreshText = { "id": 16777227, "type": 10003, params: [], "bundleName": "com.example.newsdataarkts", "moduleName": "entry" };
            this.pullDownRefreshImage = { "id": 16777243, "type": 20000, params: [], "bundleName": "com.example.newsdataarkts", "moduleName": "entry" };
            this.isCanRefresh = true;
            this.isRefreshing = true;
            break;
        case CommonConstant_1.RefreshState.Fail:
            this.pullDownRefreshText = { "id": 16777226, "type": 10003, params: [], "bundleName": "com.example.newsdataarkts", "moduleName": "entry" };
            this.pullDownRefreshImage = { "id": 16777239, "type": 20000, params: [], "bundleName": "com.example.newsdataarkts", "moduleName": "entry" };
            this.isCanRefresh = true;
            this.isRefreshing = true;
            break;
        default:
            break;
    }
}
exports.pullRefreshState = pullRefreshState;
function closeRefresh(isRefreshSuccess) {
    let self = this;
    setTimeout(() => {
        let delay = CommonConstant_1.RefreshConstant.DELAY_PULL_DOWN_REFRESH;
        if (self.isCanRefresh) {
            pullRefreshState.call(this, isRefreshSuccess ? CommonConstant_1.RefreshState.Success : CommonConstant_1.RefreshState.Fail);
            delay = CommonConstant_1.RefreshConstant.DELAY_SHRINK_ANIMATION_TIME;
        }
        Context.animateTo({
            duration: CommonConstant_1.RefreshConstant.CLOSE_PULL_DOWN_REFRESH_TIME,
            delay: delay,
            onFinish: () => {
                pullRefreshState.call(this, CommonConstant_1.RefreshState.DropDown);
                self.isVisiblePullDown = false;
                self.isPullRefreshOperation = false;
            }
        }, () => {
            self.offsetY = 0;
        });
    }, self.isCanRefresh ? CommonConstant_1.DELAY_ANIMATION_DURATION : 0);
}
exports.closeRefresh = closeRefresh;


/***/ }),

/***/ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/common/utils/PullUpLoadMore.ets":
/*!**********************************************************************************************************************!*\
  !*** ../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/common/utils/PullUpLoadMore.ets ***!
  \**********************************************************************************************************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {


var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
exports.closeLoadMore = exports.touchUpLoadMore = exports.touchMoveLoadMore = void 0;
let __generate__Id = 0;
function generateId() {
    return "PullUpLoadMore_" + ++__generate__Id;
}
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
var _ohos_prompt_1  = globalThis.requireNapi('prompt') || (isSystemplugin('prompt', 'ohos') ? globalThis.ohosplugin.prompt : isSystemplugin('prompt', 'system') ? globalThis.systemplugin.prompt : undefined);
const DataUtils_1 = __webpack_require__(/*! ../utils/DataUtils */ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/common/utils/DataUtils.ets");
const CommonConstant_1 = __webpack_require__(/*! ../constant/CommonConstant */ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/common/constant/CommonConstant.ets");
function touchMoveLoadMore(event) {
    if (this.endIndex === this.newsData.length - 1 || this.endIndex === this.newsData.length) {
        this.offsetY = event.touches[0].y - this.downY;
        if (Math.abs(this.offsetY) > vp2px(this.pullUpLoadHeight) / 2) {
            this.isCanLoadMore = true;
            this.isVisiblePullUpLoad = true;
            this.offsetY = -vp2px(this.pullUpLoadHeight) + this.offsetY * CommonConstant_1.Y_OFF_SET_COEFFICIENT;
        }
    }
}
exports.touchMoveLoadMore = touchMoveLoadMore;
function touchUpLoadMore() {
    let self = this;
    Context.animateTo({
        duration: CommonConstant_1.ANIMATION_DURATION,
    }, () => {
        self.offsetY = 0;
    });
    if (self.isCanLoadMore) {
        self.isLoading = true;
        setTimeout(() => {
            closeLoadMore.call(this);
            DataUtils_1.getTabData(self.currentPage, self.pageSize, self.currentIndex, {
                onSuccess: (value) => {
                    self.currentPage = parseInt(value.currentPage.toString());
                    self.newsData = self.newsData.concat(value.newsPageData);
                },
                onFail: (msg) => _ohos_prompt_1.showToast({ message: msg })
            });
        }, CommonConstant_1.DELAY_TIME);
    }
    else {
        closeLoadMore.call(this);
    }
}
exports.touchUpLoadMore = touchUpLoadMore;
function closeLoadMore() {
    this.isCanLoadMore = false;
    this.isLoading = false;
    this.isVisiblePullUpLoad = false;
}
exports.closeLoadMore = closeLoadMore;


/***/ }),

/***/ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/pages/Index.ets?entry":
/*!************************************************************************************************************!*\
  !*** ../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/pages/Index.ets?entry ***!
  \************************************************************************************************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {


var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
let __generate__Id = 0;
function generateId() {
    return "Index_" + ++__generate__Id;
}
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
const TabBar_1 = __importDefault(__webpack_require__(/*! ../view/TabBar */ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/view/TabBar.ets"));
const CommonConstant_1 = __webpack_require__(/*! ../common/constant/CommonConstant */ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/common/constant/CommonConstant.ets");
class Index extends View {
    constructor(compilerAssignedUniqueChildId, parent, params) {
        super(compilerAssignedUniqueChildId, parent);
        this.updateWithValueParams(params);
    }
    updateWithValueParams(params) {
    }
    aboutToBeDeleted() {
        SubscriberManager.Get().delete(this.id());
    }
    render() {
        Column.create();
        Column.width(CommonConstant_1.FULL_WIDTH);
        Column.backgroundColor({ "id": 16777236, "type": 10001, params: [], "bundleName": "com.example.newsdataarkts", "moduleName": "entry" });
        Column.justifyContent(FlexAlign.Center);
        let earlierCreatedChild_2 = (this && this.findChildById) ? this.findChildById("2") : undefined;
        if (earlierCreatedChild_2 == undefined) {
            View.create(new TabBar_1.default("2", this, {}));
        }
        else {
            earlierCreatedChild_2.updateWithValueParams({});
            View.create(earlierCreatedChild_2);
        }
        Column.pop();
    }
}
loadDocument(new Index("1", undefined, {}));


/***/ }),

/***/ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/view/CustomRefreshLoadLayout.ets":
/*!***********************************************************************************************************************!*\
  !*** ../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/view/CustomRefreshLoadLayout.ets ***!
  \***********************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {


Object.defineProperty(exports, "__esModule", ({ value: true }));
let __generate__Id = 0;
function generateId() {
    return "CustomRefreshLoadLayout_" + ++__generate__Id;
}
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
__webpack_require__(/*! ../common/bean/NewsData */ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/common/bean/NewsData.ets");
const CommonConstant_1 = __webpack_require__(/*! ../common/constant/CommonConstant */ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/common/constant/CommonConstant.ets");
class CustomLayout extends View {
    constructor(compilerAssignedUniqueChildId, parent, params) {
        super(compilerAssignedUniqueChildId, parent);
        this.__customRefreshLoadClass = new SynchedPropertyNesedObject(params.customRefreshLoadClass, this, "customRefreshLoadClass");
        this.updateWithValueParams(params);
    }
    updateWithValueParams(params) {
        this.__customRefreshLoadClass.set(params.customRefreshLoadClass);
    }
    aboutToBeDeleted() {
        this.__customRefreshLoadClass.aboutToBeDeleted();
        SubscriberManager.Get().delete(this.id());
    }
    get customRefreshLoadClass() {
        return this.__customRefreshLoadClass.get();
    }
    render() {
        Row.create();
        Row.width(CommonConstant_1.FULL_WIDTH);
        Row.justifyContent(FlexAlign.Center);
        Row.height(this.customRefreshLoadClass.heightValue);
        Image.create(this.customRefreshLoadClass.imageSrc);
        Image.width(CommonConstant_1.RefreshLayout.IMAGE_WIDTH);
        Image.height(CommonConstant_1.RefreshLayout.IMAGE_HEIGHT);
        Text.create(this.customRefreshLoadClass.textValue);
        Text.margin({ left: CommonConstant_1.RefreshLayout.TEXT_MARGIN_LEFT,
            bottom: CommonConstant_1.RefreshLayout.TEXT_MARGIN_BOTTOM });
        Text.fontSize(CommonConstant_1.RefreshLayout.TEXT_FONT_SIZE);
        Text.textAlign(TextAlign.Center);
        Text.pop();
        Row.pop();
    }
}
exports["default"] = CustomLayout;


/***/ }),

/***/ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/view/LoadMoreLayout.ets":
/*!**************************************************************************************************************!*\
  !*** ../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/view/LoadMoreLayout.ets ***!
  \**************************************************************************************************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {


var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
let __generate__Id = 0;
function generateId() {
    return "LoadMoreLayout_" + ++__generate__Id;
}
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
const CustomRefreshLoadLayout_1 = __importDefault(__webpack_require__(/*! ./CustomRefreshLoadLayout */ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/view/CustomRefreshLoadLayout.ets"));
const NewsData_1 = __webpack_require__(/*! ../common/bean/NewsData */ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/common/bean/NewsData.ets");
class LoadMoreLayout extends View {
    constructor(compilerAssignedUniqueChildId, parent, params) {
        super(compilerAssignedUniqueChildId, parent);
        this.__loadMoreLayoutClass = new SynchedPropertyNesedObject(params.loadMoreLayoutClass, this, "loadMoreLayoutClass");
        this.updateWithValueParams(params);
    }
    updateWithValueParams(params) {
        this.__loadMoreLayoutClass.set(params.loadMoreLayoutClass);
    }
    aboutToBeDeleted() {
        this.__loadMoreLayoutClass.aboutToBeDeleted();
        SubscriberManager.Get().delete(this.id());
    }
    get loadMoreLayoutClass() {
        return this.__loadMoreLayoutClass.get();
    }
    render() {
        Column.create();
        If.create();
        if (this.loadMoreLayoutClass.isVisible) {
            If.branchId(0);
            let earlierCreatedChild_1 = (this && this.findChildById) ? this.findChildById("1") : undefined;
            if (earlierCreatedChild_1 == undefined) {
                View.create(new CustomRefreshLoadLayout_1.default("1", this, {
                    customRefreshLoadClass: new NewsData_1.CustomRefreshLoadLayoutClass(this.loadMoreLayoutClass.isVisible, this.loadMoreLayoutClass.imageSrc, this.loadMoreLayoutClass.textValue, this.loadMoreLayoutClass.heightValue)
                }));
            }
            else {
                earlierCreatedChild_1.updateWithValueParams({
                    customRefreshLoadClass: new NewsData_1.CustomRefreshLoadLayoutClass(this.loadMoreLayoutClass.isVisible, this.loadMoreLayoutClass.imageSrc, this.loadMoreLayoutClass.textValue, this.loadMoreLayoutClass.heightValue)
                });
                View.create(earlierCreatedChild_1);
            }
        }
        else {
            If.branchId(1);
            let earlierCreatedChild_2 = (this && this.findChildById) ? this.findChildById("2") : undefined;
            if (earlierCreatedChild_2 == undefined) {
                View.create(new CustomRefreshLoadLayout_1.default("2", this, {
                    customRefreshLoadClass: new NewsData_1.CustomRefreshLoadLayoutClass(this.loadMoreLayoutClass.isVisible, this.loadMoreLayoutClass.imageSrc, this.loadMoreLayoutClass.textValue, 0)
                }));
            }
            else {
                earlierCreatedChild_2.updateWithValueParams({
                    customRefreshLoadClass: new NewsData_1.CustomRefreshLoadLayoutClass(this.loadMoreLayoutClass.isVisible, this.loadMoreLayoutClass.imageSrc, this.loadMoreLayoutClass.textValue, 0)
                });
                View.create(earlierCreatedChild_2);
            }
        }
        If.pop();
        Column.pop();
    }
}
exports["default"] = LoadMoreLayout;


/***/ }),

/***/ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/view/NewsItem.ets":
/*!********************************************************************************************************!*\
  !*** ../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/view/NewsItem.ets ***!
  \********************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {


Object.defineProperty(exports, "__esModule", ({ value: true }));
let __generate__Id = 0;
function generateId() {
    return "NewsItem_" + ++__generate__Id;
}
__webpack_require__(/*! ../common/constant/CommonConstant */ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/common/constant/CommonConstant.ets");
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
__webpack_require__(/*! ../common/bean/NewsData */ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/common/bean/NewsData.ets");
const CommonConstant_1 = __webpack_require__(/*! ../common/constant/CommonConstant */ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/common/constant/CommonConstant.ets");
class NewsItem extends View {
    constructor(compilerAssignedUniqueChildId, parent, params) {
        super(compilerAssignedUniqueChildId, parent);
        this.newsData = undefined;
        this.updateWithValueParams(params);
    }
    updateWithValueParams(params) {
        if (params.newsData !== undefined) {
            this.newsData = params.newsData;
        }
    }
    aboutToBeDeleted() {
        SubscriberManager.Get().delete(this.id());
    }
    render() {
        Column.create();
        Column.alignItems(HorizontalAlign.Start);
        Row.create();
        Image.create({ "id": 16777245, "type": 20000, params: [], "bundleName": "com.example.newsdataarkts", "moduleName": "entry" });
        Image.width(CommonConstant_1.NewsTitle.IMAGE_WIDTH);
        Image.height(CommonConstant_1.NewsTitle.IMAGE_HEIGHT);
        Image.margin({
            top: CommonConstant_1.NewsTitle.IMAGE_MARGIN_TOP,
            left: CommonConstant_1.NewsTitle.IMAGE_MARGIN_LEFT
        });
        Text.create(this.newsData.title);
        Text.fontSize(CommonConstant_1.NewsTitle.TEXT_FONT_SIZE);
        Text.fontColor({ "id": 16777232, "type": 10001, params: [], "bundleName": "com.example.newsdataarkts", "moduleName": "entry" });
        Text.height(CommonConstant_1.NewsTitle.TEXT_HEIGHT);
        Text.width(CommonConstant_1.NewsTitle.TEXT_WIDTH);
        Text.maxLines(CommonConstant_1.NewsTitle.TEXT_MAX_LINES);
        Text.margin({ left: CommonConstant_1.NewsTitle.TEXT_MARGIN_LEFT, top: CommonConstant_1.NewsTitle.TEXT_MARGIN_TOP });
        Text.textOverflow({ overflow: TextOverflow.Ellipsis });
        Text.fontWeight(CommonConstant_1.NewsTitle.TEXT_FONT_WEIGHT);
        Text.pop();
        Row.pop();
        Text.create(this.newsData.content);
        Text.fontSize(CommonConstant_1.NewsContent.FONT_SIZE);
        Text.fontColor({ "id": 16777232, "type": 10001, params: [], "bundleName": "com.example.newsdataarkts", "moduleName": "entry" });
        Text.height(CommonConstant_1.NewsContent.HEIGHT);
        Text.width(CommonConstant_1.NewsContent.WIDTH);
        Text.maxLines(CommonConstant_1.NewsContent.MAX_LINES);
        Text.margin({ left: CommonConstant_1.NewsContent.MARGIN_LEFT, top: CommonConstant_1.NewsContent.MARGIN_TOP });
        Text.textOverflow({ overflow: TextOverflow.Ellipsis });
        Text.pop();
        Grid.create();
        Grid.aspectRatio(CommonConstant_1.NewsGrid.ASPECT_RATIO);
        Grid.columnsTemplate('1fr '.repeat(this.newsData.imagesUrl.length));
        Grid.columnsGap(CommonConstant_1.NewsGrid.COLUMNS_GAP);
        Grid.rowsTemplate(CommonConstant_1.NewsGrid.ROWS_TEMPLATE);
        Grid.width(CommonConstant_1.NewsGrid.WIDTH);
        Grid.height(CommonConstant_1.NewsGrid.HEIGHT);
        Grid.margin({ left: CommonConstant_1.NewsGrid.MARGIN_LEFT, top: CommonConstant_1.NewsGrid.MARGIN_TOP,
            right: CommonConstant_1.NewsGrid.MARGIN_RIGHT });
        ForEach.create("1", this, ObservedObject.GetRawObject(this.newsData.imagesUrl), itemImg => {
            GridItem.create();
            Image.create(itemImg.url);
            Image.objectFit(ImageFit.Cover);
            Image.borderRadius(CommonConstant_1.NewsGrid.IMAGE_BORDER_RADIUS);
            GridItem.pop();
        }, itemImg => this.newsData.imagesUrl.indexOf(itemImg.id).toString());
        ForEach.pop();
        Grid.pop();
        Text.create(this.newsData.source);
        Text.fontSize(CommonConstant_1.NewsSource.FONT_SIZE);
        Text.fontColor({ "id": 16777234, "type": 10001, params: [], "bundleName": "com.example.newsdataarkts", "moduleName": "entry" });
        Text.height(CommonConstant_1.NewsSource.HEIGHT);
        Text.width(CommonConstant_1.NewsSource.WIDTH);
        Text.maxLines(CommonConstant_1.NewsSource.MAX_LINES);
        Text.margin({ left: CommonConstant_1.NewsSource.MARGIN_LEFT, top: CommonConstant_1.NewsSource.MARGIN_TOP });
        Text.textOverflow({ overflow: TextOverflow.None });
        Text.pop();
        Column.pop();
    }
}
exports["default"] = NewsItem;


/***/ }),

/***/ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/view/RefreshLayout.ets":
/*!*************************************************************************************************************!*\
  !*** ../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/view/RefreshLayout.ets ***!
  \*************************************************************************************************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {


var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
let __generate__Id = 0;
function generateId() {
    return "RefreshLayout_" + ++__generate__Id;
}
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
const CustomRefreshLoadLayout_1 = __importDefault(__webpack_require__(/*! ./CustomRefreshLoadLayout */ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/view/CustomRefreshLoadLayout.ets"));
const NewsData_1 = __webpack_require__(/*! ../common/bean/NewsData */ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/common/bean/NewsData.ets");
class RefreshLayout extends View {
    constructor(compilerAssignedUniqueChildId, parent, params) {
        super(compilerAssignedUniqueChildId, parent);
        this.__refreshLayoutClass = new SynchedPropertyNesedObject(params.refreshLayoutClass, this, "refreshLayoutClass");
        this.updateWithValueParams(params);
    }
    updateWithValueParams(params) {
        this.__refreshLayoutClass.set(params.refreshLayoutClass);
    }
    aboutToBeDeleted() {
        this.__refreshLayoutClass.aboutToBeDeleted();
        SubscriberManager.Get().delete(this.id());
    }
    get refreshLayoutClass() {
        return this.__refreshLayoutClass.get();
    }
    render() {
        Column.create();
        If.create();
        if (this.refreshLayoutClass.isVisible) {
            If.branchId(0);
            let earlierCreatedChild_1 = (this && this.findChildById) ? this.findChildById("1") : undefined;
            if (earlierCreatedChild_1 == undefined) {
                View.create(new CustomRefreshLoadLayout_1.default("1", this, { customRefreshLoadClass: new NewsData_1.CustomRefreshLoadLayoutClass(this.refreshLayoutClass.isVisible, this.refreshLayoutClass.imageSrc, this.refreshLayoutClass.textValue, this.refreshLayoutClass.heightValue) }));
            }
            else {
                earlierCreatedChild_1.updateWithValueParams({
                    customRefreshLoadClass: new NewsData_1.CustomRefreshLoadLayoutClass(this.refreshLayoutClass.isVisible, this.refreshLayoutClass.imageSrc, this.refreshLayoutClass.textValue, this.refreshLayoutClass.heightValue)
                });
                View.create(earlierCreatedChild_1);
            }
        }
        else {
            If.branchId(1);
            let earlierCreatedChild_2 = (this && this.findChildById) ? this.findChildById("2") : undefined;
            if (earlierCreatedChild_2 == undefined) {
                View.create(new CustomRefreshLoadLayout_1.default("2", this, {
                    customRefreshLoadClass: new NewsData_1.CustomRefreshLoadLayoutClass(this.refreshLayoutClass.isVisible, this.refreshLayoutClass.imageSrc, this.refreshLayoutClass.textValue, 0)
                }));
            }
            else {
                earlierCreatedChild_2.updateWithValueParams({
                    customRefreshLoadClass: new NewsData_1.CustomRefreshLoadLayoutClass(this.refreshLayoutClass.isVisible, this.refreshLayoutClass.imageSrc, this.refreshLayoutClass.textValue, 0)
                });
                View.create(earlierCreatedChild_2);
            }
        }
        If.pop();
        Column.pop();
    }
}
exports["default"] = RefreshLayout;


/***/ }),

/***/ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/view/TabBar.ets":
/*!******************************************************************************************************!*\
  !*** ../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/view/TabBar.ets ***!
  \******************************************************************************************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {


var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
let __generate__Id = 0;
function generateId() {
    return "TabBar_" + ++__generate__Id;
}
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
const newslist_1 = __importDefault(__webpack_require__(/*! ../view/newslist */ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/view/newslist.ets"));
const CommonConstant_1 = __webpack_require__(/*! ../common/constant/CommonConstant */ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/common/constant/CommonConstant.ets");
const DataUtils_1 = __webpack_require__(/*! ../common/utils/DataUtils */ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/common/utils/DataUtils.ets");
class TabBar extends View {
    constructor(compilerAssignedUniqueChildId, parent, params) {
        super(compilerAssignedUniqueChildId, parent);
        this.__tabBarArray = new ObservedPropertyObject(CommonConstant_1.TabBars.DEFAULT_NEWS_TYPES, this, "tabBarArray");
        this.__currentIndex = new ObservedPropertySimple(0, this, "currentIndex");
        this.__currentPage = new ObservedPropertySimple(1, this, "currentPage");
        this.updateWithValueParams(params);
    }
    updateWithValueParams(params) {
        if (params.tabBarArray !== undefined) {
            this.tabBarArray = params.tabBarArray;
        }
        if (params.currentIndex !== undefined) {
            this.currentIndex = params.currentIndex;
        }
        if (params.currentPage !== undefined) {
            this.currentPage = params.currentPage;
        }
    }
    aboutToBeDeleted() {
        this.__tabBarArray.aboutToBeDeleted();
        this.__currentIndex.aboutToBeDeleted();
        this.__currentPage.aboutToBeDeleted();
        SubscriberManager.Get().delete(this.id());
    }
    get tabBarArray() {
        return this.__tabBarArray.get();
    }
    set tabBarArray(newValue) {
        this.__tabBarArray.set(newValue);
    }
    get currentIndex() {
        return this.__currentIndex.get();
    }
    set currentIndex(newValue) {
        this.__currentIndex.set(newValue);
    }
    get currentPage() {
        return this.__currentPage.get();
    }
    set currentPage(newValue) {
        this.__currentPage.set(newValue);
    }
    TabBuilder(index, parent = undefined) {
        Column.create();
        Text.create(this.tabBarArray[index].name);
        Text.height(CommonConstant_1.FULL_HEIGHT);
        Text.padding({ left: CommonConstant_1.TabBars.HORIZONTAL_PADDING, right: CommonConstant_1.TabBars.HORIZONTAL_PADDING });
        Text.fontSize(this.currentIndex === index ? CommonConstant_1.TabBars.SELECT_TEXT_FONT_SIZE : CommonConstant_1.TabBars.UN_SELECT_TEXT_FONT_SIZE);
        Text.fontWeight(this.currentIndex === index ? CommonConstant_1.TabBars.SELECT_TEXT_FONT_WEIGHT : CommonConstant_1.TabBars.UN_SELECT_TEXT_FONT_WEIGHT);
        Text.fontColor({ "id": 16777235, "type": 10001, params: [], "bundleName": "com.example.newsdataarkts", "moduleName": "entry" });
        Text.pop();
        Column.pop();
    }
    aboutToAppear() {
        // 请求新闻类别
        DataUtils_1.loadNewsTypes({
            onSuccess: (value) => this.tabBarArray = value,
            onFail: () => this.tabBarArray = CommonConstant_1.TabBars.DEFAULT_NEWS_TYPES
        });
    }
    render() {
        Tabs.create();
        Tabs.barHeight(CommonConstant_1.TabBars.BAR_HEIGHT);
        Tabs.barMode(BarMode.Scrollable);
        Tabs.barWidth(CommonConstant_1.TabBars.BAR_WIDTH);
        Tabs.onChange((index) => {
            this.currentIndex = index;
            this.currentPage = 1;
        });
        Tabs.vertical(false);
        ForEach.create("2", this, ObservedObject.GetRawObject(this.tabBarArray), tabsItem => {
            TabContent.create();
            TabContent.tabBar({ builder: () => {
                    this.TabBuilder(tabsItem.id);
                } });
            Column.create();
            let earlierCreatedChild_1 = (this && this.findChildById) ? this.findChildById("1") : undefined;
            if (earlierCreatedChild_1 == undefined) {
                View.create(new newslist_1.default("1", this, { currentIndex: this.__currentIndex }));
            }
            else {
                earlierCreatedChild_1.updateWithValueParams({});
                View.create(earlierCreatedChild_1);
            }
            Column.pop();
            TabContent.pop();
        }, item => item.id);
        ForEach.pop();
        Tabs.pop();
    }
}
exports["default"] = TabBar;


/***/ }),

/***/ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/view/newslist.ets":
/*!********************************************************************************************************!*\
  !*** ../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/view/newslist.ets ***!
  \********************************************************************************************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {


var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
let __generate__Id = 0;
function generateId() {
    return "newslist_" + ++__generate__Id;
}
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
const NewsItem_1 = __importDefault(__webpack_require__(/*! ./NewsItem */ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/view/NewsItem.ets"));
const LoadMoreLayout_1 = __importDefault(__webpack_require__(/*! ./LoadMoreLayout */ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/view/LoadMoreLayout.ets"));
const RefreshLayout_1 = __importDefault(__webpack_require__(/*! ./RefreshLayout */ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/view/RefreshLayout.ets"));
const CustomRefreshLoadLayout_1 = __importDefault(__webpack_require__(/*! ./CustomRefreshLoadLayout */ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/view/CustomRefreshLoadLayout.ets"));
const DataUtils_1 = __webpack_require__(/*! ../common/utils/DataUtils */ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/common/utils/DataUtils.ets");
const NewsData_1 = __webpack_require__(/*! ../common/bean/NewsData */ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/common/bean/NewsData.ets");
const PullDownRefresh_1 = __webpack_require__(/*! ../common/utils/PullDownRefresh */ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/common/utils/PullDownRefresh.ets");
const CommonConstant_1 = __webpack_require__(/*! ../common/constant/CommonConstant */ "../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/common/constant/CommonConstant.ets");
class NewsList extends View {
    constructor(compilerAssignedUniqueChildId, parent, params) {
        super(compilerAssignedUniqueChildId, parent);
        this.__currentIndex = new SynchedPropertySimpleTwoWay(params.currentIndex, this, "currentIndex");
        this.__newsData = new ObservedPropertyObject([], this, "newsData");
        this.__currentPage = new ObservedPropertySimple(1, this, "currentPage");
        this.__pageSize = new ObservedPropertySimple(10, this, "pageSize");
        this.__pullDownRefreshText = new ObservedPropertyObject({ "id": 16777224, "type": 10003, params: [], "bundleName": "com.example.newsdataarkts", "moduleName": "entry" }, this, "pullDownRefreshText");
        this.__pullDownRefreshImage = new ObservedPropertyObject({ "id": 16777240, "type": 20000, params: [], "bundleName": "com.example.newsdataarkts", "moduleName": "entry" }, this, "pullDownRefreshImage");
        this.__pullDownRefreshHeight = new ObservedPropertySimple(CommonConstant_1.CUSTOM_LAYOUT_HEIGHT, this, "pullDownRefreshHeight");
        this.__isVisiblePullDown = new ObservedPropertySimple(false, this, "isVisiblePullDown");
        this.__pullUpLoadText = new ObservedPropertyObject({ "id": 16777225, "type": 10003, params: [], "bundleName": "com.example.newsdataarkts", "moduleName": "entry" }, this, "pullUpLoadText");
        this.__pullUpLoadImage = new ObservedPropertyObject({ "id": 16777241, "type": 20000, params: [], "bundleName": "com.example.newsdataarkts", "moduleName": "entry" }, this, "pullUpLoadImage");
        this.__pullUpLoadHeight = new ObservedPropertySimple(CommonConstant_1.CUSTOM_LAYOUT_HEIGHT, this, "pullUpLoadHeight");
        this.__isVisiblePullUpLoad = new ObservedPropertySimple(false, this, "isVisiblePullUpLoad");
        this.startIndex = 0;
        this.endIndex = 0;
        this.__offsetY = new ObservedPropertySimple(0, this, "offsetY");
        this.downY = 0;
        this.lastMoveY = 0;
        this.isRefreshing = false;
        this.isCanRefresh = false;
        this.isPullRefreshOperation = false;
        this.isLoading = false;
        this.isCanLoadMore = false;
        this.__pageState = new ObservedPropertySimple(CommonConstant_1.PageState.Loading, this, "pageState");
        this.declareWatch("currentIndex", this.changeCategory);
        this.updateWithValueParams(params);
    }
    updateWithValueParams(params) {
        if (params.newsData !== undefined) {
            this.newsData = params.newsData;
        }
        if (params.currentPage !== undefined) {
            this.currentPage = params.currentPage;
        }
        if (params.pageSize !== undefined) {
            this.pageSize = params.pageSize;
        }
        if (params.pullDownRefreshText !== undefined) {
            this.pullDownRefreshText = params.pullDownRefreshText;
        }
        if (params.pullDownRefreshImage !== undefined) {
            this.pullDownRefreshImage = params.pullDownRefreshImage;
        }
        if (params.pullDownRefreshHeight !== undefined) {
            this.pullDownRefreshHeight = params.pullDownRefreshHeight;
        }
        if (params.isVisiblePullDown !== undefined) {
            this.isVisiblePullDown = params.isVisiblePullDown;
        }
        if (params.pullUpLoadText !== undefined) {
            this.pullUpLoadText = params.pullUpLoadText;
        }
        if (params.pullUpLoadImage !== undefined) {
            this.pullUpLoadImage = params.pullUpLoadImage;
        }
        if (params.pullUpLoadHeight !== undefined) {
            this.pullUpLoadHeight = params.pullUpLoadHeight;
        }
        if (params.isVisiblePullUpLoad !== undefined) {
            this.isVisiblePullUpLoad = params.isVisiblePullUpLoad;
        }
        if (params.startIndex !== undefined) {
            this.startIndex = params.startIndex;
        }
        if (params.endIndex !== undefined) {
            this.endIndex = params.endIndex;
        }
        if (params.offsetY !== undefined) {
            this.offsetY = params.offsetY;
        }
        if (params.downY !== undefined) {
            this.downY = params.downY;
        }
        if (params.lastMoveY !== undefined) {
            this.lastMoveY = params.lastMoveY;
        }
        if (params.isRefreshing !== undefined) {
            this.isRefreshing = params.isRefreshing;
        }
        if (params.isCanRefresh !== undefined) {
            this.isCanRefresh = params.isCanRefresh;
        }
        if (params.isPullRefreshOperation !== undefined) {
            this.isPullRefreshOperation = params.isPullRefreshOperation;
        }
        if (params.isLoading !== undefined) {
            this.isLoading = params.isLoading;
        }
        if (params.isCanLoadMore !== undefined) {
            this.isCanLoadMore = params.isCanLoadMore;
        }
        if (params.pageState !== undefined) {
            this.pageState = params.pageState;
        }
    }
    aboutToBeDeleted() {
        this.__currentIndex.aboutToBeDeleted();
        this.__newsData.aboutToBeDeleted();
        this.__currentPage.aboutToBeDeleted();
        this.__pageSize.aboutToBeDeleted();
        this.__pullDownRefreshText.aboutToBeDeleted();
        this.__pullDownRefreshImage.aboutToBeDeleted();
        this.__pullDownRefreshHeight.aboutToBeDeleted();
        this.__isVisiblePullDown.aboutToBeDeleted();
        this.__pullUpLoadText.aboutToBeDeleted();
        this.__pullUpLoadImage.aboutToBeDeleted();
        this.__pullUpLoadHeight.aboutToBeDeleted();
        this.__isVisiblePullUpLoad.aboutToBeDeleted();
        this.__offsetY.aboutToBeDeleted();
        this.__pageState.aboutToBeDeleted();
        SubscriberManager.Get().delete(this.id());
    }
    get currentIndex() {
        return this.__currentIndex.get();
    }
    set currentIndex(newValue) {
        this.__currentIndex.set(newValue);
    }
    get newsData() {
        return this.__newsData.get();
    }
    set newsData(newValue) {
        this.__newsData.set(newValue);
    }
    get currentPage() {
        return this.__currentPage.get();
    }
    set currentPage(newValue) {
        this.__currentPage.set(newValue);
    }
    get pageSize() {
        return this.__pageSize.get();
    }
    set pageSize(newValue) {
        this.__pageSize.set(newValue);
    }
    get pullDownRefreshText() {
        return this.__pullDownRefreshText.get();
    }
    set pullDownRefreshText(newValue) {
        this.__pullDownRefreshText.set(newValue);
    }
    get pullDownRefreshImage() {
        return this.__pullDownRefreshImage.get();
    }
    set pullDownRefreshImage(newValue) {
        this.__pullDownRefreshImage.set(newValue);
    }
    get pullDownRefreshHeight() {
        return this.__pullDownRefreshHeight.get();
    }
    set pullDownRefreshHeight(newValue) {
        this.__pullDownRefreshHeight.set(newValue);
    }
    get isVisiblePullDown() {
        return this.__isVisiblePullDown.get();
    }
    set isVisiblePullDown(newValue) {
        this.__isVisiblePullDown.set(newValue);
    }
    get pullUpLoadText() {
        return this.__pullUpLoadText.get();
    }
    set pullUpLoadText(newValue) {
        this.__pullUpLoadText.set(newValue);
    }
    get pullUpLoadImage() {
        return this.__pullUpLoadImage.get();
    }
    set pullUpLoadImage(newValue) {
        this.__pullUpLoadImage.set(newValue);
    }
    get pullUpLoadHeight() {
        return this.__pullUpLoadHeight.get();
    }
    set pullUpLoadHeight(newValue) {
        this.__pullUpLoadHeight.set(newValue);
    }
    get isVisiblePullUpLoad() {
        return this.__isVisiblePullUpLoad.get();
    }
    set isVisiblePullUpLoad(newValue) {
        this.__isVisiblePullUpLoad.set(newValue);
    }
    get offsetY() {
        return this.__offsetY.get();
    }
    set offsetY(newValue) {
        this.__offsetY.set(newValue);
    }
    get pageState() {
        return this.__pageState.get();
    }
    set pageState(newValue) {
        this.__pageState.set(newValue);
    }
    changeCategory() {
        DataUtils_1.getTabData(this.currentPage - 1, this.pageSize, this.currentIndex, {
            onSuccess: (value) => {
                this.pageState = CommonConstant_1.PageState.Success;
                this.newsData = value.newsPageData;
            },
            onFail: () => this.pageState = CommonConstant_1.PageState.Fail
        });
    }
    aboutToAppear() {
        // 请求新闻数据
        this.changeCategory();
    }
    render() {
        Column.create();
        Column.width(CommonConstant_1.FULL_WIDTH);
        Column.height(CommonConstant_1.FULL_HEIGHT);
        Column.justifyContent(FlexAlign.Center);
        Column.onTouch((event) => {
            if (this.pageState === CommonConstant_1.PageState.Success) {
                PullDownRefresh_1.listTouchEvent.call(this, event);
            }
        });
        If.create();
        if (this.pageState === CommonConstant_1.PageState.Loading) {
            If.branchId(0);
            this.LoadingLayout(this);
        }
        else if (this.pageState === CommonConstant_1.PageState.Success) {
            If.branchId(1);
            this.ListLayout(this);
        }
        else {
            If.branchId(2);
            this.FailLayout(this);
        }
        If.pop();
        Column.pop();
    }
    LoadingLayout(parent = undefined) {
        let earlierCreatedChild_1 = (this && this.findChildById) ? (parent ? parent : this).findChildById(generateId()) : undefined;
        if (earlierCreatedChild_1 == undefined) {
            View.create(new CustomRefreshLoadLayout_1.default("newslist_" + __generate__Id, parent ? parent : this, { customRefreshLoadClass: new NewsData_1.CustomRefreshLoadLayoutClass(true, { "id": 16777241, "type": 20000, params: [], "bundleName": "com.example.newsdataarkts", "moduleName": "entry" }, { "id": 16777225, "type": 10003, params: [], "bundleName": "com.example.newsdataarkts", "moduleName": "entry" }, this.pullDownRefreshHeight) }));
        }
        else {
            earlierCreatedChild_1.updateWithValueParams({
                customRefreshLoadClass: new NewsData_1.CustomRefreshLoadLayoutClass(true, { "id": 16777241, "type": 20000, params: [], "bundleName": "com.example.newsdataarkts", "moduleName": "entry" }, { "id": 16777225, "type": 10003, params: [], "bundleName": "com.example.newsdataarkts", "moduleName": "entry" }, this.pullDownRefreshHeight)
            });
            View.create(earlierCreatedChild_1);
        }
    }
    ListLayout(parent = undefined) {
        List.create();
        List.width(CommonConstant_1.NewsListConstant.LIST_WIDTH);
        List.height(CommonConstant_1.FULL_HEIGHT);
        List.margin({ left: CommonConstant_1.NewsListConstant.LIST_MARGIN_LEFT });
        List.backgroundColor({ "id": 16777236, "type": 10001, params: [], "bundleName": "com.example.newsdataarkts", "moduleName": "entry" });
        List.divider({
            color: { "id": 16777231, "type": 10001, params: [], "bundleName": "com.example.newsdataarkts", "moduleName": "entry" },
            strokeWidth: CommonConstant_1.NewsListConstant.LIST_DIVIDER_STROKE_WIDTH,
            endMargin: CommonConstant_1.NewsListConstant.LIST_MARGIN_RIGHT
        });
        List.edgeEffect(EdgeEffect.None);
        List.offset({ x: 0, y: `${this.offsetY}px` });
        List.onScrollIndex((start, end) => {
            // 监听当前列表首位索引
            this.startIndex = start;
            this.endIndex = end;
        });
        ListItem.create();
        let earlierCreatedChild_2 = (this && this.findChildById) ? this.findChildById("2") : undefined;
        if (earlierCreatedChild_2 == undefined) {
            View.create(new RefreshLayout_1.default("2", this, {
                refreshLayoutClass: new NewsData_1.CustomRefreshLoadLayoutClass(this.isVisiblePullDown, this.pullDownRefreshImage, this.pullDownRefreshText, this.pullDownRefreshHeight)
            }));
        }
        else {
            earlierCreatedChild_2.updateWithValueParams({
                refreshLayoutClass: new NewsData_1.CustomRefreshLoadLayoutClass(this.isVisiblePullDown, this.pullDownRefreshImage, this.pullDownRefreshText, this.pullDownRefreshHeight)
            });
            View.create(earlierCreatedChild_2);
        }
        ListItem.pop();
        ForEach.create("4", this, ObservedObject.GetRawObject(this.newsData), item => {
            ListItem.create();
            ListItem.height(CommonConstant_1.NewsListConstant.ITEM_HEIGHT);
            ListItem.backgroundColor({ "id": 16777238, "type": 10001, params: [], "bundleName": "com.example.newsdataarkts", "moduleName": "entry" });
            ListItem.margin({ top: CommonConstant_1.NewsListConstant.ITEM_MARGIN_TOP, right: CommonConstant_1.NewsListConstant.LIST_MARGIN_RIGHT });
            ListItem.borderRadius(CommonConstant_1.NewsListConstant.ITEM_BORDER_RADIUS);
            let earlierCreatedChild_3 = (this && this.findChildById) ? this.findChildById("3") : undefined;
            if (earlierCreatedChild_3 == undefined) {
                View.create(new NewsItem_1.default("3", this, { newsData: item }));
            }
            else {
                earlierCreatedChild_3.updateWithValueParams({
                    newsData: item
                });
                if (!earlierCreatedChild_3.needsUpdate()) {
                    earlierCreatedChild_3.markStatic();
                }
                View.create(earlierCreatedChild_3);
            }
            ListItem.pop();
        }, item => item.id);
        ForEach.pop();
        ListItem.create();
        let earlierCreatedChild_5 = (this && this.findChildById) ? this.findChildById("5") : undefined;
        if (earlierCreatedChild_5 == undefined) {
            View.create(new LoadMoreLayout_1.default("5", this, {
                loadMoreLayoutClass: new NewsData_1.CustomRefreshLoadLayoutClass(this.isVisiblePullUpLoad, this.pullUpLoadImage, this.pullUpLoadText, this.pullUpLoadHeight)
            }));
        }
        else {
            earlierCreatedChild_5.updateWithValueParams({
                loadMoreLayoutClass: new NewsData_1.CustomRefreshLoadLayoutClass(this.isVisiblePullUpLoad, this.pullUpLoadImage, this.pullUpLoadText, this.pullUpLoadHeight)
            });
            View.create(earlierCreatedChild_5);
        }
        ListItem.pop();
        List.pop();
    }
    FailLayout(parent = undefined) {
        Image.create({ "id": 16777246, "type": 20000, params: [], "bundleName": "com.example.newsdataarkts", "moduleName": "entry" });
        Image.height(CommonConstant_1.NewsListConstant.NONE_IMAGE_SIZE);
        Image.width(CommonConstant_1.NewsListConstant.NONE_IMAGE_SIZE);
        Text.create({ "id": 16777222, "type": 10003, params: [], "bundleName": "com.example.newsdataarkts", "moduleName": "entry" });
        Text.opacity(CommonConstant_1.NewsListConstant.NONE_TEXT_opacity);
        Text.fontSize(CommonConstant_1.NewsListConstant.NONE_TEXT_size);
        Text.fontColor({ "id": 16777235, "type": 10001, params: [], "bundleName": "com.example.newsdataarkts", "moduleName": "entry" });
        Text.margin({ top: CommonConstant_1.NewsListConstant.NONE_TEXT_margin });
        Text.pop();
    }
}
exports["default"] = NewsList;


/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		var commonCachedModule = globalThis["__common_module_cache___f397d57662ccc58514719b849a3d374d"] ? globalThis["__common_module_cache___f397d57662ccc58514719b849a3d374d"][moduleId]: null;
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
/******/ 		                if (globalThis["webpackChunk_f397d57662ccc58514719b849a3d374d"]) {
/******/ 		                  const length = globalThis["webpackChunk_f397d57662ccc58514719b849a3d374d"].length;
/******/ 		                  switch (length) {
/******/ 		                    case 1:
/******/ 		                      return globalThis["webpackChunk_f397d57662ccc58514719b849a3d374d"][0][1][moduleId];
/******/ 		                    case 2:
/******/ 		                      return globalThis["webpackChunk_f397d57662ccc58514719b849a3d374d"][0][1][moduleId] ||
/******/ 		                      globalThis["webpackChunk_f397d57662ccc58514719b849a3d374d"][1][1][moduleId];
/******/ 		                  }
/******/ 		                }
/******/ 		                return undefined;
/******/ 		              }
/******/ 		if (globalThis["__common_module_cache___f397d57662ccc58514719b849a3d374d"] && String(moduleId).indexOf("?name=") < 0 && isCommonModue(moduleId)) {
/******/ 		  globalThis["__common_module_cache___f397d57662ccc58514719b849a3d374d"][moduleId] = module;
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
/******/ 	var __webpack_exports__ = __webpack_require__("../../../../../../../codeHub/930/930HarmonyOS/NewsDataArkTS/entry/src/main/ets/pages/Index.ets?entry");
/******/ 	_f397d57662ccc58514719b849a3d374d = __webpack_exports__;
/******/ 	
/******/ })()
;
//# sourceMappingURL=Index.js.map