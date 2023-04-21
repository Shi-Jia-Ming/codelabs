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

import promptAction from '@ohos.promptAction';
import {
  SERVER,
  GET_NEWS_TYPE,
  GET_NEWS_LIST,
  GET_TAB_DATA_CURRENT_PAGE,
  SERVER_CODE_SUCCESS,
  LOCAL_DATA,
  DEFAULT_SERVER
} from '../constant/CommonConstant';
import { httpRequestGet } from '../utils/HttpUtil';

/**
 * Initiate request for tab data.
 *
 * @param currentPage The current page number.
 * @param pageSize The number of current pages.
 * @param currentIndex The current index.
 * @param callback The function callback.
 */
export async function getTabData(currentPage: number, pageSize: number, currentIndex: number, callback) {
  currentPage = currentPage + GET_TAB_DATA_CURRENT_PAGE;
  let newsPageData = [];
  if (SERVER === DEFAULT_SERVER) {
    newsPageData = LOCAL_DATA;
    callback.onSuccess({ currentPage, newsPageData });
    return;
  }
  if (currentPage > pageSize) {
    promptAction.showToast({ message: $r('app.string.prompt_message') });
    currentPage = currentPage - GET_TAB_DATA_CURRENT_PAGE;
  }
  let url = `${SERVER}/${GET_NEWS_LIST}`;
  let params = { 'currentPage': currentPage, 'pageSize': pageSize, 'currentIndex': currentIndex };
  let data = await httpRequestGet(url, params);
  if (data.code === SERVER_CODE_SUCCESS) {
    newsPageData = data.data.pageData;
    callback.onSuccess({ currentPage, newsPageData });
  } else {
    callback.onFail(data.msg);
  }
}

/**
 * Initiate request news type.
 *
 * @param callback The function callback.
 */
export async function loadNewsTypes(callback) {
  let tabBars = [];
  let url = `${SERVER}/${GET_NEWS_TYPE}`;
  let data = await httpRequestGet(url, null);
  if (data.code === SERVER_CODE_SUCCESS) {
    tabBars = data.data;
    callback.onSuccess(tabBars);
  } else {
    callback.onFail(data.msg);
  }
}