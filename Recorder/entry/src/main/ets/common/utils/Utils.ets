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

import { CommonConstants as Const } from '../constants/CommonConstants';

export default class Utils {
  /**
   * Convert timestamp to time.
   * @param timestamp
   * @returns time
   */
  static timestamp2Time(timestamp: number): string {
    let date = new Date(timestamp * Const.TIME_1000);
    let year = date.getFullYear() + Const.STRING_SLASH;
    let month = (date.getMonth() + 1 < Const.TIME_10
      ? Const.STRING_0 + (date.getMonth() + 1) : date.getMonth() + 1) + Const.STRING_SLASH;
    let day = date.getDate() < Const.TIME_10 ? Const.STRING_0 + date.getDate() : date.getDate();
    return year + month + day;
  }

  /**
   * Convert duration to time.
   * @param duration
   * @returns time
   */
  static duration2Time(duration: number): string {
    let temp = Math.floor(duration / Const.TIME_1000);
    let second = temp % Const.TIME_60 < Const.TIME_10
      ? Const.STRING_0 + temp % Const.TIME_60 : (temp % Const.TIME_60).toString();
    let minute = (Math.floor(temp / Const.TIME_60) % Const.TIME_60 < Const.TIME_10
      ? Const.STRING_0 + Math.floor(temp / Const.TIME_60) % Const.TIME_60
      : (Math.floor(temp / Const.TIME_60) % Const.TIME_60).toString()) + Const.STRING_COLON;
    let hour = (Math.floor(temp / Const.TIME_60 / Const.TIME_60) < Const.TIME_10
      ? Const.STRING_0 + Math.floor(temp / Const.TIME_60 / Const.TIME_60)
      : (Math.floor(temp / Const.TIME_60 / Const.TIME_60)).toString()) + Const.STRING_COLON;
    return hour + minute + second;
  }

  /**
   * Update time slider.
   * @param time
   * @param index
   * @returns time
   */
  static updateSlider(time: number, index: number): string {
    let result = time + index - Const.NUMBER_2;
    if (result < 0) {
      return '';
    }
    if (result % Const.TIME_60 < Const.TIME_10) {
      return Const.STRING_0 + Math.floor(result / Const.TIME_60) + Const.STRING_COLON_0 + (result % Const.TIME_60);
    }
    if (result % Const.TIME_60 >= Const.TIME_10) {
      return Const.STRING_0 + Math.floor(result / Const.TIME_60) + Const.STRING_COLON + (result % Const.TIME_60);
    }
    return '';
  }

  /**
   * Update time.
   * @param millisecond
   * @returns time
   */
  static updateTime(millisecond: number): string {
    /*
    if (millisecond < 0) {
      return '00:00:00'
    }*/
    let hour = Math.floor((millisecond / Const.TIME_60000 / Const.TIME_60));
    let minute = Math.floor((millisecond / Const.TIME_60000 - hour * Const.TIME_60));
    let second = Math.floor((millisecond / Const.TIME_1000 - hour * Const.TIME_3600 - minute * Const.TIME_60));
    let hourStr = '' + hour;
    let minuteStr = '' + minute;
    let secondStr = '' + second;
    if (hour < Const.TIME_10) {
      hourStr = Const.STRING_0 + hour;
    }
    if (minute < Const.TIME_10) {
      minuteStr = Const.STRING_0 + minute;
    }
    if (second < Const.TIME_10) {
      secondStr = Const.STRING_0 + second;
    }
    return hourStr + Const.STRING_COLON + minuteStr + Const.STRING_COLON + secondStr;
  }

}

/**
 * Get time string.
 * @param timeIndex
 * @param index
 * @returns time
 */
export function getTimeString(timeIndex: number, index: number): string {
  let result = timeIndex + index - Const.NUMBER_3;
  if (result < 0) {
    return '';
  }
  if (result % Const.TIME_60 < Const.TIME_10) {
    return Const.STRING_0 + Math.floor(result / Const.TIME_60) + Const.STRING_COLON_0 + (result % Const.TIME_60);
  }
  if (result % Const.TIME_60 >= Const.TIME_10) {
    return Const.STRING_0 + Math.floor(result / Const.TIME_60) + Const.STRING_COLON + (result % Const.TIME_60);
  }
  return '';
}

/**
 * Update time.
 * @param millisecond
 * @returns time
 */
export function updateTime(millisecond: number): string {
  if (millisecond < 0) {
    return Const.STRING_TIME;
  }
  let hour = Math.floor((millisecond / Const.TIME_60000 / Const.TIME_60));
  let minute = Math.floor((millisecond / Const.TIME_60000 - hour * Const.TIME_60));
  let second = Math.floor((millisecond / Const.TIME_1000 - hour * Const.TIME_3600 - minute * Const.TIME_60));
  let hourStr = '' + hour;
  let minuteStr = '' + minute;
  let secondStr = '' + second;
  if (hour < Const.TIME_10) {
    hourStr = Const.STRING_0 + hour;
  }
  if (minute < Const.TIME_10) {
    minuteStr = Const.STRING_0 + minute;
  }
  if (second < Const.TIME_10) {
    secondStr = Const.STRING_0 + second;
  }
  return hourStr + Const.STRING_COLON + minuteStr + Const.STRING_COLON + secondStr;
}

/**
 * Update times.
 * @param millisecond
 * @returns time
 */
export function updateTimes(millisecond: number): string {
  let minute = Math.floor((millisecond / Const.TIME_60000));
  let second = Math.floor(((millisecond - (minute * Const.TIME_60000)) / Const.TIME_1000));
  let minuteStr = '' + minute;
  let secondStr = '' + second;
  if (minute < Const.TIME_10) {
    minuteStr = Const.STRING_0 + minute;
  }
  if (second < Const.TIME_10) {
    secondStr = Const.STRING_0 + second;
  }
  return minuteStr + Const.STRING_COLON + secondStr;
}
