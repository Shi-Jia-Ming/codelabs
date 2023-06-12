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

import { Logger } from './Logger';
import { StyleConstants } from '../constants/StyleConstants';

/**
 * Format date.
 *
 * @param timestamp time
 * @param format = "yyyy-mm-dd"
 * @returns res
 */
export function formatDate(timestamp, format = 'yyyy-mm-dd') {
  let res = "";
  try {
    const date = new Date(timestamp);
    const opt = {
      "y+": date.getFullYear().toString(),
      "m+": (date.getMonth() + 1).toString(),
      "d+": date.getDate().toString(),
      "H+": date.getHours().toString(),
      "M+": date.getMinutes().toString(),
      "S+": date.getSeconds().toString(),
    };
    for (let key in opt) {
      const reg = new RegExp(key);
      let ret = reg.exec(format);
      if (ret) {
        format = format.replace(
          reg, ret.length === 1 ? opt[key] : opt[key].padStart(ret.length, "0")
        );
      }
    }
    res = format;
  } catch (error) {
    Logger.error("ERROR formatDate" + error);
  }
  return res;
}

/**
 * Get id.
 *
 * @returns id
 */
export function getID() {
  const date = Date.now()
  const arr = `${date}`.split('')
  arr.sort(() => (Math.random() - StyleConstants.HALF_ONE) > 0 ? 1 : StyleConstants.MINUS_ONE)

  return arr.join('')
}