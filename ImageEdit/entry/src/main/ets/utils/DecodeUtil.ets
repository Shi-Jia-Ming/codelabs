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

import image from '@ohos.multimedia.image';
import Logger from './LoggerUtil';
import { CommonConstants } from '../common/constant/CommonConstants';

const TAG: string = 'imageEdit_Decode';

/**
 * Async get resource fd.
 *
 * @return file fd.
 */
async function getResourceFd() {
  const resourceMgr = getContext(this).resourceManager;
  let pictureFd: number = 0;
  const descriptor = await resourceMgr.getRawFd(CommonConstants.RAW_FILE_NAME);
  pictureFd = descriptor?.fd;
  Logger.info(TAG, `file's fd is ${pictureFd}`);
  return pictureFd;
}

/**
 * Async create pixel map.
 *
 * @return pixelMa.
 */
export default async function getPixelMap() {
  const fd = await getResourceFd();
  const imageSourceApi = image.createImageSource(fd);
  if (!imageSourceApi) {
    Logger.error(TAG, 'imageSourceAPI created failed!');
    return;
  }
  const pixelMap = await imageSourceApi.createPixelMap({
    editable: true
  });
  return pixelMap;
}