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

import NewsTypeBean from '../common/bean/NewsTypeBean'
import Constants from '../common/constants/Constants';
import { httpRequestGet } from '../common/utils/HttpUtil';

const DEFAULT_NEWS_TYPES: NewsTypeBean[] = [
  { id: 0, name: $r('app.string.tab_all') },
  { id: 1, name: $r('app.string.tab_domestic') },
  { id: 2, name: $r('app.string.tab_international') },
  { id: 3, name: $r('app.string.tab_fun') },
  { id: 4, name: $r('app.string.tab_military') },
  { id: 5, name: $r('app.string.tab_sports') },
  { id: 6, name: $r('app.string.tab_science') }
];

class NewsTypeViewModel {
  /**
   * Get news type list from server.
   *
   * @return NewsTypeBean[] newsTypeList
   */
  getNewsTypeList(): Promise<NewsTypeBean[]> {
    return new Promise((resolve) => {
      let url = `${Constants.SERVER}/${Constants.GET_NEWS_TYPE}`;
      httpRequestGet(url).then((data) => {
        if (data.code === Constants.SERVER_CODE_SUCCESS) {
          resolve(data.data);
        } else {
          resolve(DEFAULT_NEWS_TYPES);
        }
      }).catch(() => {
        resolve(DEFAULT_NEWS_TYPES);
      });
    });
  }

  /**
   * Get default news type list.
   *
   * @return NewsTypeBean[] newsTypeList
   */
  getDefaultTypeList(): NewsTypeBean[] {
    return DEFAULT_NEWS_TYPES;
  }
}

let newsTypeViewModel = new NewsTypeViewModel();

export default newsTypeViewModel as NewsTypeViewModel;