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

import NewsTypeModel from './NewsTypeModel'
import ResponseResult from './ResponseResult';
import Constants from '../common/constants/Constants';
import { httpRequestGet } from '../common/utils/HttpUtil';

const DEFAULT_NEWS_TYPES: NewsTypeModel[] = [
  new NewsTypeModel(0, $r('app.string.tab_all')),
  new NewsTypeModel(1, $r('app.string.tab_domestic')),
  new NewsTypeModel(2, $r('app.string.tab_international')),
  new NewsTypeModel(3, $r('app.string.tab_fun')),
  new NewsTypeModel(4, $r('app.string.tab_military')),l
  new NewsTypeModel(5, $r('app.string.tab_sports')),
  new NewsTypeModel(6, $r('app.string.tab_science'))
];

class NewsTypeViewModel {
  /**
   * Get news type list from server.
   *
   * @return NewsTypeModel[] newsTypeList
   */
  getNewsTypeList(): Promise<NewsTypeModel[]> {
    return new Promise((resolve: Function) => {
      let url = `${Constants.SERVER}/${Constants.GET_NEWS_TYPE}`;
      httpRequestGet(url).then((data: ResponseResult) => {
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
   * @return NewsTypeModel[] newsTypeList
   */
  getDefaultTypeList(): NewsTypeModel[] {
    return DEFAULT_NEWS_TYPES;
  }
}

let newsTypeViewModel = new NewsTypeViewModel();

export default newsTypeViewModel as NewsTypeViewModel;