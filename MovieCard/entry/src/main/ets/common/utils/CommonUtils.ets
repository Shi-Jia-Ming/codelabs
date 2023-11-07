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

import relationalStore from '@ohos.data.relationalStore';
import formProvider from '@ohos.app.form.formProvider';
import formBindingData from '@ohos.app.form.formBindingData';
import FormItem from '../../viewmodel/FormItem';
import CommonConstants from '../constants/CommonConstants';
import MovieData from '../../viewmodel/MovieData';
import Logger from './Logger';
import { MOVIE_LIST_DATA, STARRING_DATA, STILLS_DATA } from '../datasource/MovieListData';
import { GlobalContext } from './GlobalContext';
import FormData from '../../viewmodel/FormData';

/**
 * Movie data common class.
 */
export class CommonUtils {
  /**
   * Create rdb store.
   *
   * @param {context} Context
   * @return {rdbStore} return rdbStore RDB database
   */
  async createRdbStore(context: Context) {
    let rdbStore = GlobalContext.getContext().getObject('rdbStore') as relationalStore.RdbStore;
    if (this.isEmpty(rdbStore)) {
      rdbStore = await relationalStore.getRdbStore(context, CommonConstants.STORE_CONFIG);
      if (!this.isEmpty(rdbStore)) {
        rdbStore.executeSql(CommonConstants.CREATE_TABLE_FORM).catch((error: Error) => {
          Logger.error(CommonConstants.TAG_COMMON_UTILS, 'executeSql error ' + JSON.stringify(error));
        });
        GlobalContext.getContext().setObject('rdbStore', rdbStore);
      }
    }
    return rdbStore;
  }

  /**
   * Insert form data.
   *
   * @param {FormItem} form Form entity
   * @param {relationalStore.RdbStore} rdbStore RDB database
   * @return {Promise<number>} return the row ID if the operation is successful. return -1 otherwise.
   */
  insertForm(form: FormItem, rdbStore: relationalStore.RdbStore) {
    if ((this.isEmpty(rdbStore)) || (this.isEmpty(form))) {
      Logger.error(CommonConstants.TAG_COMMON_UTILS, 'insertForm rdbStore or form is null');
      return;
    }
    rdbStore.insert(CommonConstants.TABLE_NAME, form.toValuesBucket()).catch((error: Error) => {
      Logger.error(CommonConstants.TAG_COMMON_UTILS, 'insertForm error ' + JSON.stringify(error));
    });
  }

  /**
   * Update movie data show in to the card.
   *
   * @param {relationalStore.RdbStore} rdbStore RDB database
   */
  updateMovieCardData(rdbStore: relationalStore.RdbStore) {
    if (this.isEmpty(rdbStore)) {
      Logger.error(CommonConstants.TAG_COMMON_UTILS, 'rdbStore is null');
      return;
    }
    let predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(CommonConstants.TABLE_NAME);
    rdbStore.query(predicates).then((resultSet: relationalStore.ResultSet) => {
      if (resultSet.rowCount <= 0) {
        Logger.error(CommonConstants.TAG_COMMON_UTILS, 'updateCardMovieData rowCount <= 0');
        return;
      }
      let listData: MovieData[] = this.getListData();
      resultSet.goToFirstRow();
      do {
        let formData = this.getFormData(listData);
        let formId: string = resultSet.getString(resultSet.getColumnIndex(CommonConstants.FORM_ID));
        formProvider.updateForm(formId, formBindingData.createFormBindingData(formData))
          .catch((error: Error) => {
            Logger.error(CommonConstants.TAG_COMMON_UTILS, 'updateForm error ' + JSON.stringify(error));
          });
      } while (resultSet.goToNextRow());
      resultSet.close();
    }).catch((error: Error) => {
      Logger.error(CommonConstants.TAG_COMMON_UTILS, 'updateCardMovieData error ' + JSON.stringify(error));
    });
  }

  /**
   * Get movie a random number.
   *
   * @return {movieRandom} return a random number
   */
  getRandomInt(randomNumber: number): number {
    let roundNumber: number = Math.round(Math.random() * CommonConstants.MULTIPLY_TEN);
    if (roundNumber === randomNumber) {
      roundNumber = this.getRandomInt(randomNumber);
    }
    return roundNumber;
  }

  /**
   * Delete form data.
   *
   * @param {string} formId Form ID
   * @param {relationalStore.RdbStore} rdbStore RDB database
   */
  deleteFormData(formId: string, rdbStore: relationalStore.RdbStore) {
    if (this.isEmpty(rdbStore)) {
      Logger.error(CommonConstants.TAG_COMMON_UTILS, 'rdbStore is null');
      return;
    }
    let predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(CommonConstants.TABLE_NAME);
    predicates.equalTo(CommonConstants.FORM_ID, formId);
    rdbStore.delete(predicates).catch((error: Error) => {
      Logger.error(CommonConstants.TAG_COMMON_UTILS, 'deleteFormData error ' + JSON.stringify(error));
    });
  }

  /**
   * Get Movie data list.
   *
   * @return {listMovieData} return list movie data
   */
  getListData(): MovieData[] {
    let listMovieData = GlobalContext.getContext().getObject('listMovieData') as MovieData[];
    if (this.isEmptyArr(listMovieData)) {
      listMovieData = MOVIE_LIST_DATA;
      GlobalContext.getContext().setObject('listMovieData', listMovieData);
    }
    return listMovieData;
  }

  /**
   * Get form data used to assign values to cards.
   *
   * @return {formData} return form data
   */
  getFormData(listData: MovieData[]): object {
    if (this.isEmptyArr(listData)) {
      Logger.error(CommonConstants.TAG_COMMON_UTILS, 'getFormData listData is empty');
      return [];
    }
    let oneRandom: number = this.getRandomInt(listData.length);
    let twoRandom: number = this.getRandomInt(oneRandom);
    let topMovie: MovieData = listData[oneRandom];
    let bottomMovie: MovieData = listData[twoRandom];
    let formData = {
      topIndex: topMovie.sort,
      topMovieImage: topMovie.cardImage,
      topTitle: topMovie.title,
      topDescribe: topMovie.describe,
      bottomIndex: bottomMovie.sort,
      bottomMovieImage: bottomMovie.cardImage,
      bottomTitle: bottomMovie.title,
      bottomDescribe: bottomMovie.describe
    } as FormData;
    return formData;
  }

  /**
   * Start timer
   */
  startTimer() {
    let intervalId = GlobalContext.getContext().getObject('intervalId') as number;
    if (this.isEmpty(intervalId)) {
      intervalId = setInterval(() => {
        let rdbStore = GlobalContext.getContext().getObject('rdbStore') as relationalStore.RdbStore;
        this.updateMovieCardData(rdbStore);
      }, CommonConstants.INTERVAL_DELAY_TIME);
    }
    GlobalContext.getContext().setObject('intervalId', intervalId)
  }

  /**
   * Get starring data.
   *
   * @return {starring} return starring Resource.
   */
  getStarringData(): Resource[] {
    let starring: Resource[] = [];
    STARRING_DATA.forEach((starringItem: Resource) => {
      starring.push(starringItem);
    });
    return starring;
  }

  /**
   * Get stills data.
   *
   * @return {stills} return stills Resource.
   */
  getStillsData(): Resource[] {
    let stills: Resource[] = [];
    STILLS_DATA.forEach((stillsItem: Resource) => {
      stills.push(stillsItem);
    });
    return stills;
  }

  /**
   * Check obj is empty.
   *
   * @param {object} obj
   * @return {boolean} true(empty)
   */
  isEmpty(obj: object | string | number): boolean {
    return (obj === undefined || obj === null || obj === '');
  }

  /**
   * Check array is empty.
   *
   * @param {Array}array
   * @return {boolean} true(empty)
   */
  isEmptyArr(array: MovieData[]): boolean {
    return (this.isEmpty(array) || array.length === 0);
  }
}

export default new CommonUtils();