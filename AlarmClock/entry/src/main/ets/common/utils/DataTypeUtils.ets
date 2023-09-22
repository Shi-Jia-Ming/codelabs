/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

/**
 * Data type utils.
 */
export default class DataTypeUtils {
  /**
   * return obj is null.
   *
   * @return boolean.
   */
  static isNull(obj: Object): boolean {
    return (typeof obj === 'undefined' || obj == null || obj === '');
  }

  /**
   * return new deep copy object from obj.
   *
   * @return type in obj.
   */
  static deepCopy(obj: number[]) {
    let newObj: number[] = [];
    for (let i = 0; i < obj.length; i++) {
      newObj[i] = JSON.parse(JSON.stringify(obj[i]));
    }
    return newObj;
  }
}