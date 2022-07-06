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

import dataStorage from '@ohos.data.storage';
import featureAbility from '@ohos.ability.featureAbility';
import Logger from './Logger'

let TAG = '[DataUtils]'

export class ChangeFontSize {
  changeTextSize: string

  constructor(changeTextSize: string) {
    this.changeTextSize = changeTextSize
  }
}

export async function saveDefaultSize(defaultFontSize: string) {
  var context = featureAbility.getContext()
  var path = await context.getFilesDir()
  let storage = dataStorage.getStorageSync(path + '/mystery')
  storage.has('changeTextSize', function (err, isExist) {
    Logger.info(TAG,"storage has changeTextSize is " + isExist)
    if (!isExist) {
      Logger.info(TAG,"saveSize do not has exit...")
      let promise = storage.put("changeTextSize", defaultFontSize)
      storage.flush()
      promise.then(() => {
        Logger.info(TAG,"Put the value successfully. ")
      }).catch((err) => {
        Logger.info(TAG,"Put the value failed with err: " + err)
      })
    }
  })
}

export async function saveChangeSize(changeTextSize: string) {
    var context = featureAbility.getContext()
    var path = await context.getFilesDir()
    let storage = dataStorage.getStorageSync(path + '/mystery')
    let promise = storage.put("changeTextSize", JSON.stringify(changeTextSize))
    storage.flush()
    promise.then(() => {
      Logger.info(TAG,"save changeTextSize successfully." + changeTextSize)
    }).catch((err) => {
      Logger.info(TAG,"save changeTextSize failed with err: " + err)
    })
  }