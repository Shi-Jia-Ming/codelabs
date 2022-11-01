/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
class CommonConstants {
  /**
   * Duration of prompt.
   */
  DURATION: number = 3000;

  /**
   * The fruit name tag.
   */
  FRUIT_FLAG: number = 0;

  /**
   * The fruit number tag.
   */
  NUMBER_FLAG: number = 1;

  /**
   * The tag is used to print log.
   */
  TAG = '[PreferenceModel]';

  /**
   * The key value of the data store.
   */
  KEY_NAME = 'fruit';

  /**
   * The name of the data store.
   */
  PREFERENCES_NAME = 'fruit.db';
}

export default new CommonConstants();