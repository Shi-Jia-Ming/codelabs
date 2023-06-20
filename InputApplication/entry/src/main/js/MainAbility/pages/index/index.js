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

import prompt from '@ohos.prompt';
import CommonConstants from '../../common/constant/commonConstants';

export default {
  data: {
    urls: {},
    user: '',
    email: '',
    date: '',
    height: '',
    genderObj: [],
    genderTemp: 0,
    gender: 0,
    hobbiesOjb: [],
    hobbiesTemp: [],
    hobbies: []
  },

  /**
   * Initialize data.
   */
  onInit() {
    this.genderObj.push(this.$t('strings.gender_male'));
    this.genderObj.push(this.$t('strings.gender_female'));
    this.hobbiesOjb.push(this.$t('strings.hobby_swim'));
    this.hobbiesOjb.push(this.$t('strings.hobby_fitness'));
    this.hobbiesOjb.push(this.$t('strings.hobby_soccer'));
    this.hobbiesOjb.push(this.$t('strings.hobby_basketball'));
    this.hobbiesOjb.push(this.$t('strings.hobby_reading_book'));
    this.hobbiesTemp.push(this.$t('strings.hobby_swim'));
    this.hobbiesTemp.push(this.$t('strings.hobby_fitness'));
    this.hobbies.push(this.$t('strings.hobby_swim'));
    this.hobbies.push(this.$t('strings.hobby_fitness'));
    this.urls = JSON.parse(JSON.stringify(CommonConstants.ICON));
  },

  /**
   * Gender selection dialog box.
   */
  openGender() {
    this.$element('genderDialog').show();
  },

  /**
   * Gender option button switch.
   *
   * @param event Current Object.
   */
  onRadioChange(event) {
    if (event.checked) {
      this.genderTemp = 0;
    } else {
      this.genderTemp = 1;
    }
  },

  /**
   * Close the gender selection dialog box.
   */
  closeGender() {
    this.$element('genderDialog').close();
  },

  /**
   * Set the gender and close the gender selection dialog box.
   */
  confirmGender() {
    this.gender = this.genderTemp;
    this.closeGender();
  },

  /**
   * Pop-up box for selecting hobbies.
   */
  openHobby() {
    this.$element('hobbyDialog').show();
  },

  /**
   * Close the hobby selection dialog box.
   */
  closeHobby() {
    this.$element('hobbyDialog').close();
  },

  /**
   * Set a hobby and close the hobby selection dialog box.
   */
  confirmHobby() {
    let that = this;
    let copyHobbies = Object.create(Object.getPrototypeOf(this.hobbiesTemp));
    Object.getOwnPropertyNames(this.hobbiesTemp).forEach((items) => {
      let item = Object.getOwnPropertyDescriptor(that.hobbiesTemp, items);
      Object.defineProperty(copyHobbies, items, item);
    })
    this.hobbies = copyHobbies;
    this.closeHobby();
  },

  /**
   * Set form input content.
   *
   * @param event Contents entered in the input box.
   */
  inputChange(event) {
    let idName = event.target.id;
    if (idName === CommonConstants.USER) {
      this.user = event.value;
    } else if (idName === CommonConstants.EMAIL) {
      this.email = event.value;
    } else if (idName === CommonConstants.DATE) {
      this.date = event.value;
    } else if (idName === CommonConstants.HEIGHT) {
      this.height = event.value;
    }
  },

  /**
   * Checkbox Change.
   *
   * @param event Value of the check box.
   */
  checkboxOnChange(event) {
    let currentVal = event.currentTarget.attr.value;
    if (event.checked) {
      this.hobbiesTemp.push(currentVal);
    } else {
      this.hobbiesTemp = this.hobbiesTemp.filter(item => {
        return item !== currentVal;
      });
    }
  },

  /**
   * Form submission validation.
   */
  buttonClick() {
    if (this.user === '') {
      this.showPrompt(this.$t('strings.user_check_null'));
      return;
    }
    if (this.email === '') {
      this.showPrompt(this.$t('strings.email_check_null'));
      return;
    }
    if (this.hobbies.length === 0) {
      this.showPrompt(this.$t('strings.hobby_check_null'));
      return;
    }
    if ((this.date !== '') && (!this.checkDateInput(this.date))) {
      this.showPrompt(this.$t('strings.date_not_format'));
      return;
    }
    if ((this.height !== '') && (!this.checkHeight(this.height))) {
      this.showPrompt(this.$t('strings.height_not_format'));
      return;
    }
    this.showPrompt(this.$t('strings.success'));
  },

  /**
   * Translate the selected text.
   *
   * @param event Selected Objects.
   */
  translate(event) {
    this.showPrompt(event.value);
  },

  /**
   * Pop-up box.
   *
   * @param msg Dialog box information.
   */
  showPrompt(msg) {
    prompt.showToast({
      message: msg,
      duration: CommonConstants.DURATION
    });
  },

  /**
   * Check whether the date is in the yyyy-mm-dd format.
   *
   * @param val Current Date.
   * @returns Test result.
   */
  checkDateInput(val) {
    let regExp = new RegExp('^(?:(?!0000)[0-9]{4}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:0[13-9]|1[0-2])-' +
      '(?:29|30)|(?:0[13578]|1[02])-31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|' +
      '[2468][048]|[13579][26])00)-02-29)$');
    return regExp.test(val);
  },

  /**
   * Check whether the height is correct.
   *
   * @param val Current height value.
   * @returns Test result.
   */
  checkHeight (val) {
    let regExp = new RegExp('^[0-9]+(.[0-9]{2})?$');
    return regExp.test(val)
  }
}
