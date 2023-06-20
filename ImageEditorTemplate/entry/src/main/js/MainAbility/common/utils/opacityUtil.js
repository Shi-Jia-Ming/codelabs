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

import { CommonConstants } from '../constant/commonConstants';
import Logger from './logger';

/**
 * Adjusting image transparency.
 *
 * @param pixelMap Image pixelMap whose transparency needs to be adjusted.
 * @param value Transparency.
 * @returns Image pixelMap after transparency adjustment.
 */
export async function adjustOpacity(pixelMap, value) {
  if (!pixelMap) {
    return;
  }
  pixelMap.opacity(parseInt(value) / CommonConstants.SLIDER_MAX_VALUE).catch(err => {
    Logger.error(`opacity err ${JSON.stringify(err)}`);
  });
  return pixelMap;
}