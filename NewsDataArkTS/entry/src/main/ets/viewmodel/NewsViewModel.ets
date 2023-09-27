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

import { CommonConstant as Const } from '../common/constant/CommonConstant';
import { NewsData } from '../common/bean/NewsData';
import NewsTypeBean from '../common/bean/NewsTypeBean';
import { httpRequestGet } from '../common/utils/HttpUtil';
import Logger from '../common/utils/Logger';
import ResponseResult from '../common/bean/ResponseResult';

class NewsViewModel {
  /**
   * Get news type list from server.
   *
   * @return NewsTypeBean[] newsTypeList
   */
  getNewsTypeList(): Promise<NewsTypeBean[]> {
    return new Promise((resolve: Function) => {
      let url = `${Const.SERVER}/${Const.GET_NEWS_TYPE}`;
      httpRequestGet(url).then((data: ResponseResult) => {
        if (data.code === Const.SERVER_CODE_SUCCESS) {
          resolve(data.data);
        } else {
          resolve(Const.TabBars_DEFAULT_NEWS_TYPES);
        }
      }).catch(() => {
        resolve(Const.TabBars_DEFAULT_NEWS_TYPES);
      });
    });
  }

  /**
   * Get default news type list.
   *
   * @return NewsTypeBean[] newsTypeList
   */
  getDefaultTypeList(): NewsTypeBean[] {
    return Const.TabBars_DEFAULT_NEWS_TYPES;
  }

  /**
   * Get news type list from server.
   *
   * @return NewsData[] newsDataList
   */
  getNewsList(currentPage: number, pageSize: number, path: string): Promise<NewsData[]> {
    return new Promise(async (resolve: Function, reject: Function) => {
      let url = `${Const.SERVER}/${path}`;
      url += '?currentPage=' + currentPage + '&pageSize=' + pageSize;
      httpRequestGet(url).then((data: ResponseResult) => {
        if (data.code === Const.SERVER_CODE_SUCCESS) {
          resolve(data.data);
        } else {
          Logger.error('getNewsList failed', JSON.stringify(data));
          reject($r('app.string.page_none_msg'));
        }
      }).catch((err: Error) => {
        Logger.error('getNewsList failed', JSON.stringify(err));
        reject($r('app.string.http_error_message'));
      });
    });
  }
}

let newsViewModel = new NewsViewModel();

export default newsViewModel as NewsViewModel;