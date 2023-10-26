/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import dataRdb from '@ohos.data.relationalStore';
import FormInfo from '../../../viewmodel/FormInfo';
import { CommonConstants as Const } from '../../constants/CommonConstants';
import RdbUtils from '../Rdb/RdbUtils';
import Logger from '../../utils/Logger';

class FormInfoApi {
  /**
   * Insert formInfo.
   *
   * @param {FormInfo} formInfo Insert form info
   * @param {Function} callback Return processing callback
   */
  public insertData(formInfo: FormInfo, callback: Function): void {
    const valueBucket = generateBucket(formInfo);
    RdbUtils.insert('formInfo', valueBucket).then(result => {
      callback(result);
    });
    Logger.info('FormInfoTable', 'Insert formInfo finished.');
  }

  /**
   * Query form data
   *
   * @param {Function} callback Return processing callback
   */
  public queryFormData(callback: Function): void {
    let predicates = new dataRdb.RdbPredicates(Const.FORM_INFO.tableName ? Const.FORM_INFO.tableName : '');
    RdbUtils.query(predicates).then(resultSet => {
      let count = resultSet.rowCount;
      if (count === 0) {
        callback([]);
      } else {
        resultSet.goToFirstRow();
        let resultArray: Array<FormInfo> = new Array<FormInfo>();
        do {
          let result = new FormInfo();
          result.formId = resultSet.getString(resultSet.getColumnIndex('formId'));
          result.formName = resultSet.getString(resultSet.getColumnIndex('formName'));
          result.formDimension = resultSet.getLong(resultSet.getColumnIndex('formDimension'));
          resultArray.push(result);
        } while (resultSet.goToNextRow());
        resultSet.close();
        callback(resultArray);
      }
    }).catch((error: Error) => {
      Logger.error('FormInfoTable', 'queryFormData error ' + JSON.stringify(error));
    });
  }

  /**
   * Delete form data.
   *
   * @param {string} formId Form ID
   */
  public deleteFormData(formId: string): void {
    let predicates = new dataRdb.RdbPredicates(Const.FORM_INFO.tableName ? Const.FORM_INFO.tableName : '');
    predicates.equalTo('formId', formId);
    RdbUtils.del(predicates).catch((error: Error) => {
      Logger.error('FormInfoTable', 'deleteFormData error ' + JSON.stringify(error));
    });
  }

}

function generateBucket(formInfo: FormInfo): dataRdb.ValuesBucket {
  let valueBucket = {} as dataRdb.ValuesBucket;
  Const.FORM_INFO.columns?.forEach((item: string) => {
    if (item !== 'id') {
      switch (item) {
        case 'formId':
          valueBucket[item] = formInfo.formId;
          break;
        case 'formName':
          valueBucket[item] = formInfo.formName;
          break;
        case 'formDimension':
          valueBucket[item] = formInfo.formDimension;
          break;
        default:
          break;
      }
    }
  });
  return valueBucket;
}

let formInfoApi = new FormInfoApi();

export default formInfoApi as FormInfoApi;