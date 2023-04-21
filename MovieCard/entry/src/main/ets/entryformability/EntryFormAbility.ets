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
import FormExtensionAbility from '@ohos.app.form.FormExtensionAbility';
import formBindingData from '@ohos.app.form.formBindingData';
import formProvider from '@ohos.app.form.formProvider';
import Want from '@ohos.app.ability.Want';
import CommonConstants from '../common/constants/CommonConstants';
import FormBean from '../common/bean/FormBean';
import CommonUtils from '../common/utils/CommonUtils';
import MovieDataBean from '../common/bean/MovieDataBean';
import Logger from '../common/utils/Logger';

/**
 * Form management of Ability.
 */
export default class EntryFormAbility extends FormExtensionAbility {
  onAddForm(want: Want) {
    let formId: string = want.parameters[CommonConstants.IDENTITY_KEY] as string;
    let formName: string = want.parameters[CommonConstants.NAME_KEY] as string;
    let dimensionFlag: number = want.parameters[CommonConstants.DIMENSION_KEY] as number;
    CommonUtils.createRdbStore(this.context).then((rdbStore: relationalStore.RdbStore) => {
      let form: FormBean = new FormBean();
      form.formId = formId;
      form.formName = formName;
      form.dimension = dimensionFlag;
      CommonUtils.insertForm(form, rdbStore);
    }).catch((error) => {
      Logger.error(CommonConstants.TAG_FORM_ABILITY, 'onAddForm create rdb error ' + JSON.stringify(error));
    });

    // Refresh every five minutes.
    formProvider.setFormNextRefreshTime(formId, CommonConstants.FIVE_MINUTES, (error, data) => {
      if (error) {
        Logger.error(CommonConstants.TAG_FORM_ABILITY, 'setRefreshTime error ' + JSON.stringify(error));
      } else {
        Logger.info(CommonConstants.TAG_FORM_ABILITY, 'setRefreshTime success ' + JSON.stringify(data));
      }
    });
    let listData: MovieDataBean[] = CommonUtils.getListData();
    let formData = CommonUtils.getFormData(listData);
    return formBindingData.createFormBindingData(formData);
  }

  onUpdateForm(formId: string) {
    CommonUtils.createRdbStore(this.context).then((rdbStore: relationalStore.RdbStore) => {
      CommonUtils.updateMovieCardData(rdbStore);
    }).catch((error) => {
      Logger.error(CommonConstants.TAG_FORM_ABILITY, 'onUpdateForm create rdb error ' + JSON.stringify(error));
    });
    // Refresh every five minutes.
    formProvider.setFormNextRefreshTime(formId, CommonConstants.FIVE_MINUTES, (error, data) => {
      if (error) {
        Logger.error(CommonConstants.TAG_FORM_ABILITY, 'update setTime error' + JSON.stringify(error));
      } else {
        Logger.info(CommonConstants.TAG_FORM_ABILITY, 'update setTime success ' + JSON.stringify(data));
      }
    });
  }

  onRemoveForm(formId: string) {
    // Deleting card information from the database.
    CommonUtils.createRdbStore(this.context).then((rdbStore: relationalStore.RdbStore) => {
      CommonUtils.deleteFormData(formId, rdbStore);
    }).catch((error) => {
      Logger.error(CommonConstants.TAG_FORM_ABILITY, 'removeForm create rdb error ' + JSON.stringify(error));
    });
  }
};