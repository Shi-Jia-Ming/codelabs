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

import { CommonConstants } from '../constant/CommonConstant';

/**
 * Obtaining and formatting the current system time.
 */
export default function getCurrentTime(): string {
  let date = new Date();
  let year = date.getFullYear();
  let month = date.getMonth() + CommonConstants.PLUS_ONE;
  let day = date.getDate();
  let hours = date.getHours();
  let minutes = date.getMinutes().toString();
  if (Number.parseInt(minutes) < CommonConstants.TEN) {
    minutes = `0${minutes}`;
  }
  let second = date.getSeconds().toString();
  if (Number.parseInt(second) < CommonConstants.TEN) {
    second = `0${second}`;
  }
  return `${year}/${month}/${day} ${hours}:${minutes}:${second}`;
}