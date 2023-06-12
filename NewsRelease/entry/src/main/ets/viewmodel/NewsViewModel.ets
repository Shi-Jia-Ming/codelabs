/*
 *  Copyright (c) 2023 Huawei Device Co., Ltd.
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *  http://www.apache.org/licenses/LICENSE-2.0
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

import { NewsData } from '../common/bean/NewsData';
import Constants from '../common/constants/Constants';
import { httpRequestGet, httpRequestPost } from '../common/utils/HttpUtil';
import Logger from '../common/utils/Logger';

class NewsViewModel {
  /**
   * Get news type list from server.
   *
   * @return NewsData[] newsDataList
   */
  getNewsList(currentPage: number, pageSize: number): Promise<NewsData[]> {
    return new Promise(async (resolve, reject) => {
      let url = `${Constants.SERVER}/${Constants.GET_NEWS_LIST}`;
      url += '?currentPage=' + currentPage + '&pageSize=' + pageSize;
      httpRequestGet(url).then((data) => {
        if (data.code === Constants.SERVER_CODE_SUCCESS) {
          resolve(data.data);
        } else {
          Logger.error('getNewsList failed', JSON.stringify(data));
          reject($r('app.string.page_none_msg'));
        }
      }).catch((err) => {
        Logger.error('getNewsList failed', JSON.stringify(err));
        reject($r('app.string.http_error_message'));
      });
    });
  }

  /**
   * Upload news data.
   *
   * @param newsData
   * @returns NewsData[] newsDataList
   */
  uploadNews(newsData: NewsData): Promise<NewsData[]> {
    return new Promise((resolve, reject) => {
      let url = `${Constants.SERVER}/${Constants.UPLOAD_NEWS}`;
      httpRequestPost(url, newsData).then((result) => {
        if (result && result.code === Constants.SERVER_CODE_SUCCESS) {
          resolve(result.data);
        } else {
          reject($r('app.string.upload_error_message'));
        }
      }).catch((err) => {
        Logger.error('uploadNews failed', JSON.stringify(err));
        reject($r('app.string.upload_error_message'));
      });
    });
  }
}

let newsViewModel = new NewsViewModel();

export default newsViewModel as NewsViewModel;