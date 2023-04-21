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
import FormBean from '../bean/FormBean';
import CommonConstants from '../constants/CommonConstants';
import MovieDataBean from '../bean/MovieDataBean';
import Logger from './Logger';
import { MOVIE_LIST_DATA, STARRING_DATA, STILLS_DATA } from '../datasource/MovieListData';

/**
 * Movie data common class.
 */
export class CommonUtils {
  /**
   * Create rdb store.
   *
   * @param {context} Context
   * @return {globalThis.rdbStore} return rdbStore RDB database
   */
  async createRdbStore(context: Context) {
    if (this.isEmpty(globalThis.rdbStore)) {
      await relationalStore.getRdbStore(context, CommonConstants.STORE_CONFIG)
        .then((rdbStore: relationalStore.RdbStore) => {
          if (!this.isEmpty(rdbStore)) {
            rdbStore.executeSql(CommonConstants.CREATE_TABLE_FORM).catch((error) => {
              Logger.error(CommonConstants.TAG_COMMON_UTILS, 'executeSql error ' + JSON.stringify(error));
            });
            globalThis.rdbStore = rdbStore;
          }
        }).catch((error) => {
          Logger.error(CommonConstants.TAG_COMMON_UTILS, 'createRdbStore error ' + JSON.stringify(error));
        });
    }
    return globalThis.rdbStore;
  }

  /**
   * Insert form data.
   *
   * @param {FormBean} form Form entity
   * @param {relationalStore.RdbStore} rdbStore RDB database
   * @return {Promise<number>} return the row ID if the operation is successful. return -1 otherwise.
   */
  insertForm(form: FormBean, rdbStore: relationalStore.RdbStore) {
    if ((this.isEmpty(rdbStore)) || (this.isEmpty(form))) {
      Logger.error(CommonConstants.TAG_COMMON_UTILS, 'insertForm rdbStore or form is null');
      return;
    }
    rdbStore.insert(CommonConstants.TABLE_NAME, form.toValuesBucket()).catch((error) => {
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
      let listData: MovieDataBean[] = this.getListData();
      resultSet.goToFirstRow();
      do {
        let formData = this.getFormData(listData);
        let formId: string = resultSet.getString(resultSet.getColumnIndex(CommonConstants.FORM_ID));
        formProvider.updateForm(formId, formBindingData.createFormBindingData(formData))
          .catch((error) => {
            Logger.error(CommonConstants.TAG_COMMON_UTILS, 'updateForm error ' + JSON.stringify(error));
          });
      } while (resultSet.goToNextRow());
      resultSet.close();
    }).catch((error) => {
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
    rdbStore.delete(predicates).catch((error) => {
      Logger.error(CommonConstants.TAG_COMMON_UTILS, 'deleteFormData error ' + JSON.stringify(error));
    });
  }

  /**
   * Get Movie data list.
   *
   * @return {listMovieData} return list movie data
   */
  getListData(): MovieDataBean[] {
    if (this.isEmptyArr(globalThis.listMovieData)) {
      let listMovieData: MovieDataBean[] = [];
      MOVIE_LIST_DATA.forEach((itemMovie) => {
        let movieItem: MovieDataBean = {
          sort: itemMovie.sort,
          isShowSort: itemMovie.isShowSort,
          sortImage: itemMovie.sortImage,
          title: itemMovie.title,
          describe: itemMovie.describe,
          movieImage: itemMovie.movieImage,
          cardImage: itemMovie.cardImage,
          stars: itemMovie.stars,
          rating: itemMovie.rating,
          introduction: itemMovie.introduction,
        };
        listMovieData.push(movieItem);
      });
      globalThis.listMovieData = listMovieData;
    }
    return globalThis.listMovieData;
  }

  /**
   * Get form data used to assign values to cards.
   *
   * @return {formData} return form data
   */
  getFormData(listData: MovieDataBean[]): object {
    if (this.isEmptyArr(listData)) {
      Logger.error(CommonConstants.TAG_COMMON_UTILS, 'getFormData listData is empty');
      return;
    }
    let oneRandom: number = this.getRandomInt(listData.length);
    let twoRandom: number = this.getRandomInt(oneRandom);
    let topMovie: MovieDataBean = listData[oneRandom];
    let bottomMovie: MovieDataBean = listData[twoRandom];
    let formData = {
      topIndex: topMovie.sort,
      topMovieImage: topMovie.cardImage,
      topTitle: topMovie.title,
      topDescribe: topMovie.describe,
      bottomIndex: bottomMovie.sort,
      bottomMovieImage: bottomMovie.cardImage,
      bottomTitle: bottomMovie.title,
      bottomDescribe: bottomMovie.describe
    };
    return formData;
  }

  /**
   * Start timer
   */
  startTimer() {
    if (this.isEmpty(globalThis.intervalId)) {
      globalThis.intervalId = setInterval(() => {
        this.updateMovieCardData(globalThis.rdbStore);
      }, CommonConstants.INTERVAL_DELAY_TIME);
    }
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
  isEmpty(obj): boolean {
    return (obj === undefined || obj === null || obj === '');
  }

  /**
   * Check array is empty.
   *
   * @param {Array}array
   * @return {boolean} true(empty)
   */
  isEmptyArr(array): boolean {
    return (this.isEmpty(array) || array.length === 0);
  }
}

export default new CommonUtils();