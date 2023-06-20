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

/**
 * Common constants for all features.
 */
export default class CommonConstants {
  /**
   * User name tag.
   */
  static USER = 'user';

  /**
   * Mailbox Label.
   */
  static EMAIL = 'email';

  /**
   * Date of Birth Label.
   */
  static DATE = 'date';

  /**
   * Height Tag.
   */
  static HEIGHT = 'height';

  /**
   * Prompt dialog box display duration (ms).
   */
  static DURATION = 3000;

  /**
   * Icon of the text box.
   */
  static ICON = {
    required: '/common/images/ic_required.png',
    user: '/common/images/ic_user.png',
    email: '/common/images/ic_email.png',
    date: '/common/images/ic_date.png',
    height: '/common/images/ic_height.png',
    gender: '/common/images/ic_gender.png',
    hobby: '/common/images/ic_hobbies.png',
    spinner: '/common/images/ic_spinner.png'
  }
}