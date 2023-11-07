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

import FormExtensionAbility from '@ohos.app.form.FormExtensionAbility';
import FormBindingData from '@ohos.app.form.formBindingData';
import FormProvider from '@ohos.app.form.formProvider';
import Want from '@ohos.app.ability.Want';
import DataRdb from '@ohos.data.relationalStore';
import Logger from '../common/utils/Logger';
import Form from '../common/database/Form';
import DatabaseUtils from '../common/utils/DatabaseUtils';
import DateUtils from '../common/utils/DateUtils';
import ChartDataUtils from '../common/utils/ChartDataUtils';
import SensorData from '../common/database/SensorData';
import CommonConstants from '../common/constants/CommonConstants';
import FormData from '../viewmodel/FormData';

/**
 * Form management of Ability.
 */
export default class EntryFormAbility extends FormExtensionAbility {
  onAddForm(want: Want) {
    let formId: string = want.parameters !== undefined ?
      want.parameters[CommonConstants.FORM_PARAM_IDENTITY_KEY] as string : '';
    let formName: string = want.parameters !== undefined ?
      want.parameters[CommonConstants.FORM_PARAM_NAME_KEY] as string : '';
    let dimensionFlag: number = want.parameters !== undefined ?
      want.parameters[CommonConstants.FORM_PARAM_DIMENSION_KEY] as number : 0;
    DatabaseUtils.createRdbStore(this.context).then((rdbStore: Object | undefined) => {
      // Stores card information.
      let form: Form = new Form();
      form.formId = formId;
      form.formName = formName;
      form.dimension = dimensionFlag;
      DatabaseUtils.addSimulationData(rdbStore as DataRdb.RdbStore);
      DatabaseUtils.insertForm(form, rdbStore as DataRdb.RdbStore);
      getToDaySteps(rdbStore as DataRdb.RdbStore, dimensionFlag, formId);
    }).catch((error: Error) => {
      Logger.error(CommonConstants.ENTRY_FORM_ABILITY_TAG, 'onAddForm rdb error ' + JSON.stringify(error));
    });
    // Refresh every five minutes.
    FormProvider.setFormNextRefreshTime(formId, CommonConstants.FORM_NEXT_REFRESH_TIME, (error, data) => {
      if (error) {
        Logger.error(CommonConstants.ENTRY_FORM_ABILITY_TAG, 'refreshTime, error:' + JSON.stringify(error));
      } else {
        Logger.info(CommonConstants.ENTRY_FORM_ABILITY_TAG, 'refreshTime success ' + JSON.stringify(data));
      }
    });
    let formData: FormData = new FormData();
    formData.percent = 0;
    formData.steps = 0;
    return FormBindingData.createFormBindingData(formData);
  }

  onUpdateForm(formId: string): void {
    this.updateSensorData();
    // Refresh every five minutes.
    FormProvider.setFormNextRefreshTime(formId, CommonConstants.FORM_NEXT_REFRESH_TIME, (error, data) => {
      if (error) {
        Logger.error(CommonConstants.ENTRY_FORM_ABILITY_TAG, 'onUpdate refreshTime error:' + JSON.stringify(error));
      } else {
        Logger.info(CommonConstants.ENTRY_FORM_ABILITY_TAG, 'onUpdate refreshTime success ' + JSON.stringify(data));
      }
    });
  }

  onRemoveForm(formId: string): void {
    //  Deleting card information from the database.
    DatabaseUtils.createRdbStore(this.context).then((rdbStore: Object | undefined) => {
      if (!rdbStore) {
        Logger.error(CommonConstants.ENTRY_FORM_ABILITY_TAG, 'update sensor data rdbStore is null');
        return;
      }
      DatabaseUtils.deleteFormData(formId, rdbStore as DataRdb.RdbStore);
    }).catch((error: Error) => {
      Logger.error(CommonConstants.ENTRY_FORM_ABILITY_TAG, 'onRemoveForm rdb error ' + JSON.stringify(error));
    });
  }


  /**
   * Update Steps.
   */
  updateSensorData() {
    // Get today's steps.
    DatabaseUtils.createRdbStore(this.context).then((rdbStore: Object | undefined) => {
      if (!rdbStore) {
        Logger.error(CommonConstants.ENTRY_FORM_ABILITY_TAG, 'update sensor data rdbStore is null');
        return;
      }
      let getSensorData: Promise<SensorData> =
        DatabaseUtils.getSensorData(rdbStore as DataRdb.RdbStore, DateUtils.getDate(0));
      getSensorData.then((sensorData: SensorData) => {
        let stepValue: number = 0;
        if (sensorData) {
          stepValue = sensorData.stepsValue;
        }
        DatabaseUtils.updateForms(stepValue, rdbStore as DataRdb.RdbStore);
      }).catch((error: Error) => {
        Logger.error(CommonConstants.ENTRY_FORM_ABILITY_TAG, 'updateSensor getSensorData err ' + JSON.stringify(error));
      });
    }).catch((error: Error) => {
      Logger.error(CommonConstants.ENTRY_FORM_ABILITY_TAG, 'updateSensor rdb err ' + JSON.stringify(error));
    });
  }
};

/**
 * Get today's steps.
 *
 * @param {DataRdb.RdbStore} rdbStore RDB database.
 * @param {number} dimensionFlag  Card Specifications.
 * @param {string} formId Form ID.
 */
function getToDaySteps(rdbStore: DataRdb.RdbStore, dimensionFlag: number, formId: string) {
  let getSensorData: Promise<SensorData> = DatabaseUtils.getSensorData(rdbStore, DateUtils.getDate(0));
  getSensorData.then((sensorData: SensorData) => {
    let stepValue: number = 0;
    if (sensorData) {
      stepValue = sensorData.stepsValue;
    }
    getFormData(formId, stepValue, dimensionFlag, rdbStore);
  }).catch((error: Error) => {
    Logger.error(CommonConstants.ENTRY_FORM_ABILITY_TAG, 'getToDaySteps error ' + JSON.stringify(error));
  });
}


/**
 * Get form and update data.
 *
 * @param {formId} formId Form ID.
 * @param {number} stepValue Value of steps.
 * @param {number} dimensionFlag Card Specifications.
 * @param {DataRdb.RdbStore} rdbStore rdbStore RDB database.
 */
function getFormData(formId: string, stepValue: number, dimensionFlag: number, rdbStore: DataRdb.RdbStore) {
  ChartDataUtils.getFormData(formId, stepValue, dimensionFlag, rdbStore)
    .then((formData: FormData) => {
      FormProvider.updateForm(formData.formId, FormBindingData.createFormBindingData(formData));
    }).catch((error: Error) => {
    Logger.error(CommonConstants.ENTRY_FORM_ABILITY_TAG, 'getFormData formData error ' + JSON.stringify(error));
  });
}

