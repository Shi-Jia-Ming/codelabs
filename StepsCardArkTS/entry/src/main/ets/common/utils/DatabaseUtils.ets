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

import I18n from '@ohos.i18n';
import DataRdb from '@ohos.data.relationalStore';
import Notification from '@ohos.notificationManager';
import FormProvider from '@ohos.app.form.formProvider';
import FormBindingData from '@ohos.app.form.formBindingData';
import Form from '../database/Form';
import SensorData from '../database/SensorData';
import DateUtils from './DateUtils';
import ChartPoint from '../bean/ChartPoint';
import ChartDataUtils from '../utils/ChartDataUtils';
import CommonConstants from '../constants/CommonConstants';
import FormData from '../bean/FormData';
import Logger from '../utils/Logger';

/**
 * Database operation tool class.
 */
export class DatabaseUtils {
  /**
   * Create rdb store
   *
   * @param {context} Context
   * @return {globalThis.rdbStore} return rdbStore RDB database
   */
  async createRdbStore(context: Context) {
    if (!globalThis.rdbStore) {
      await DataRdb.getRdbStore(context, CommonConstants.RDB_STORE_CONFIG)
        .then((rdbStore: DataRdb.RdbStore) => {
          if (rdbStore) {
            rdbStore.executeSql(CommonConstants.CREATE_TABLE_FORM).catch((error) => {
              Logger.error(CommonConstants.DATABASE_TAG, 'executeSql Form error ' + JSON.stringify(error));
            });
            rdbStore.executeSql(CommonConstants.CREATE_TABLE_SENSOR_DATA).catch((error) => {
              Logger.error(CommonConstants.DATABASE_TAG, 'executeSql Sensor error ' + JSON.stringify(error));
            });
            globalThis.rdbStore = rdbStore;
          }
        }).catch((error) => {
          Logger.error(CommonConstants.DATABASE_TAG, 'createRdbStore error ' + JSON.stringify(error));
        });
    }
    return globalThis.rdbStore;
  }

  /**
   * Insert form data.
   *
   * @param {Form} form Form entity.
   * @param {DataRdb.RdbStore} rdbStore RDB database.
   * @return Return the operation information.
   */
  insertForm(form: Form, rdbStore: DataRdb.RdbStore) {
    rdbStore.insert(CommonConstants.TABLE_FORM, form.toValuesBucket()).catch((error) => {
      Logger.error(CommonConstants.DATABASE_TAG, 'insertForm error ' + JSON.stringify(error));
    });
  }

  /**
   * Insert steps to database.
   *
   * @param {number} stepsValue Value of steps.
   * @param {DataRdb.RdbStore} rdbStore RDB database.
   */
  async insertValues(stepsValue: number, rdbStore: DataRdb.RdbStore) {
    let now: string = DateUtils.getDate(0);
    let sensorData: SensorData = new SensorData();
    sensorData.date = now;
    sensorData.stepsValue = stepsValue;
    // Check whether there is data today.
    let todayData: SensorData = await this.getSensorData(rdbStore, now);
    if (todayData === undefined) {
      rdbStore.insert(CommonConstants.TABLE_SENSOR, sensorData.toValuesBucket());
    } else {
      todayData.stepsValue = sensorData.stepsValue;
      let predicates: DataRdb.RdbPredicates = new DataRdb.RdbPredicates(CommonConstants.TABLE_SENSOR);
      predicates.equalTo(CommonConstants.FIELD_DATE_NAME, now);
      rdbStore.update(todayData.toValuesBucket(), predicates).catch((error) => {
        Logger.error(CommonConstants.DATABASE_TAG, 'insertValues update error ' + JSON.stringify(error));
      });
    }
  }

  /**
   * Update card.
   *
   * @param {number} stepValue Number of steps to be updated.
   * @param {DataRdb.RdbStore} rdbStore RDB database.
   */
  updateForms(stepValue: number, rdbStore: DataRdb.RdbStore) {
    let predicates: DataRdb.RdbPredicates = new DataRdb.RdbPredicates(CommonConstants.TABLE_FORM);
    rdbStore.query(predicates).then((resultSet: DataRdb.ResultSet) => {
      if (resultSet.rowCount <= 0) {
        Logger.error(CommonConstants.DATABASE_TAG, 'updateForms rowCount <= 0');
        return;
      }
      // Query the first line.
      resultSet.goToFirstRow();
      do {
        let formId: string = resultSet.getString(resultSet.getColumnIndex(CommonConstants.FIELD_FORM_ID));
        let dimension: number = resultSet.getLong(resultSet.getColumnIndex(CommonConstants.FIELD_DIMENSION));
        ChartDataUtils.getFormData(formId, stepValue, dimension, rdbStore).then((formData: FormData) => {
          // Update multiple cards.
          FormProvider.updateForm(formData.formId, FormBindingData.createFormBindingData(formData))
            .catch((error) => {
              Logger.error(CommonConstants.DATABASE_TAG, 'updateForm error ' + JSON.stringify(error));
            });
        }).catch((error) => {
          Logger.error(CommonConstants.DATABASE_TAG, 'updateForms getFormData error ' + JSON.stringify(error));
        });
      } while (resultSet.goToNextRow());
      resultSet.close();
    }).catch((error) => {
      Logger.error(CommonConstants.DATABASE_TAG, 'updateForms query error ' + JSON.stringify(error));
    });
  }

  /**
   * Get sensor data.
   *
   * @param {DataRdb.RdbStore} rdbStore RDB database.
   * @param {string} date Step time.
   */
  async getSensorData(rdbStore: DataRdb.RdbStore, date: string) {
    let formPredicates: DataRdb.RdbPredicates = new DataRdb.RdbPredicates(CommonConstants.TABLE_SENSOR);
    formPredicates.equalTo(CommonConstants.FIELD_DATE_NAME, date);
    let sensorData: SensorData;
    await rdbStore.query(formPredicates).then((resultSet: DataRdb.ResultSet) => {
      if (resultSet.rowCount <= 0) {
        Logger.error(CommonConstants.DATABASE_TAG, 'getSensorData rowCount <=0');
        return;
      }
      resultSet.goToFirstRow();
      let date: string = resultSet.getString(resultSet.getColumnIndex(CommonConstants.FIELD_DATE_NAME));
      let stepsValue: number = resultSet.getLong(resultSet.getColumnIndex(CommonConstants.FIELD_STEPS_NAME));
      resultSet.close();
      sensorData = new SensorData();
      sensorData.date = date;
      sensorData.stepsValue = stepsValue;
    }).catch((err) => {
      Logger.error(CommonConstants.DATABASE_TAG, 'Get Sensor Data, err: ' + JSON.stringify(err));
    });
    return sensorData;
  }

  /**
   * Delete form data.
   *
   * @param {string} formId Form ID.
   * @param {DataRdb.RdbStore} rdbStore RDB database.
   */
  deleteFormData(formId: string, rdbStore: DataRdb.RdbStore) {
    let predicates: DataRdb.RdbPredicates = new DataRdb.RdbPredicates(CommonConstants.TABLE_FORM);
    predicates.equalTo(CommonConstants.FIELD_FORM_ID, formId);
    rdbStore.delete(predicates).catch((error) => {
      Logger.error(CommonConstants.DATABASE_TAG, 'deleteFormData delete error ' + JSON.stringify(error));
    });
  }

  /**
   * Get the steps value of the last three days.
   *
   * @param {Array<ChartPoint>} results.
   */
  async getLastThreeDaysValue(rdbStore: DataRdb.RdbStore) {
    let results: Array<ChartPoint> = new Array<ChartPoint>();
    let index = CommonConstants.THE_FIRST_THREE_DAYS;
    while (index > 0) {
      let predicates: DataRdb.RdbPredicates = new DataRdb.RdbPredicates(CommonConstants.TABLE_SENSOR);
      predicates.equalTo(CommonConstants.FIELD_DATE_NAME, DateUtils.getDate(index));
      await rdbStore.query(predicates).then((resultSet: DataRdb.ResultSet) => {
        resultSet.goToFirstRow();
        if (resultSet.rowCount === 0) {
          results.push(ChartDataUtils.getChartPoint(0));
        } else {
          let stepsValue: number = resultSet.getLong(resultSet.getColumnIndex(CommonConstants.FIELD_STEPS_NAME));
          results.push(ChartDataUtils.getChartPoint(stepsValue));
        }
        resultSet.close();
      }).catch((err) => {
        Logger.error(CommonConstants.DATABASE_TAG, 'getLastThreeDaysValue err: ' + JSON.stringify(err));
      });
      index--;
    }
    return results;
  }

  /**
   * Send Notifications
   *
   * @param {string} stepsValue Steps displayed.
   */
  async sendNotifications(stepsValue: string) {
    let notificationBarTitle: string;
    let Language: string = I18n.System.getSystemLanguage();
    if (Language.match(CommonConstants.CHINESE_LANGUAGE)) {
      notificationBarTitle = CommonConstants.NOTIFICATIONS_TITLE_GONE_TODAY_ZH
      + stepsValue + CommonConstants.NOTIFICATIONS_TITLE_STEPS_ZH;
    } else {
      notificationBarTitle = CommonConstants.NOTIFICATIONS_TITLE_GONE_TODAY_EN
      + stepsValue + CommonConstants.NOTIFICATIONS_TITLE_STEPS_EN;
    }
    // Construct the notificationRequest object.
    let notificationRequest = {
      id: CommonConstants.NOTIFICATIONS_ID,
      content: {
        contentType: Notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
        normal: {
          title: notificationBarTitle,
          text: ''
        }
      }
    };
    Notification.publish(notificationRequest).then(() => {
      Logger.info(CommonConstants.DATABASE_TAG, 'publish promise success req.id : ' + notificationRequest.id);
    }).catch((err) => {
      Logger.error(CommonConstants.DATABASE_TAG, 'publish promise failed because ' + JSON.stringify(err));
    });
  }

  /**
   * Add simulation data.
   *
   * @param {DataRdb.RdbStore} rdbStore RDB database.
   */
  addSimulationData(rdbStore: DataRdb.RdbStore) {
    if (!rdbStore) {
      Logger.error(CommonConstants.DATABASE_TAG, 'addSimulationData rdbStore is undefined');
      return;
    }
    // Add the simulation data of yesterday.
    let yesterday: SensorData = new SensorData();
    yesterday.date = DateUtils.getDate(CommonConstants.YESTERDAY);
    yesterday.stepsValue = CommonConstants.SIMULATION_YESTERDAY_VALUE;
    rdbStore.insert(CommonConstants.TABLE_SENSOR, yesterday.toValuesBucket()).catch((error) => {
      Logger.error(CommonConstants.DATABASE_TAG, 'yesterday insert error ' + JSON.stringify(error));
    });
    // Add the simulation data of the day before yesterday.
    let beforeYesterday: SensorData = new SensorData();
    beforeYesterday.date = DateUtils.getDate(CommonConstants.BEFORE_YESTERDAY)
    beforeYesterday.stepsValue = CommonConstants.SIMULATION_BEFORE_YESTERDAY_VALUE;
    rdbStore.insert(CommonConstants.TABLE_SENSOR, beforeYesterday.toValuesBucket()).catch((error) => {
      Logger.error(CommonConstants.DATABASE_TAG, 'beforeYesterday insert error ' + JSON.stringify(error));
    });
    // Add the simulation data of three days ago.
    let threeDaysAgo: SensorData = new SensorData();
    threeDaysAgo.date = DateUtils.getDate(CommonConstants.THREE_DAYS_AGO);
    threeDaysAgo.stepsValue = CommonConstants.SIMULATION_THREE_DAYS_AGO_VALUE;
    rdbStore.insert(CommonConstants.TABLE_SENSOR, threeDaysAgo.toValuesBucket()).catch((error) => {
      Logger.error(CommonConstants.DATABASE_TAG, 'threeDaysAgo insert error ' + JSON.stringify(error));
    });
  }
}

export default new DatabaseUtils();