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

import fs from '@ohos.file.fs';
import image from '@ohos.multimedia.image';
import Logger from './LoggerUtil';
import { CommonConstants } from '../common/constant/CommonConstants';

const TAG: string = 'imageEdit_Decode';

/**
 * Async get resource fd.
 *
 * @return file fd.
 */
async function getResourceFd(pageContent: Object) {
  const context = getContext(pageContent);
  const resourceMgr = context.resourceManager;
  let imageBuffer = await resourceMgr.getMediaContent($r('app.media.ic_low'));
  let filePath = context.cacheDir + '/' + CommonConstants.RAW_FILE_NAME;
  let file = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
  fs.writeSync(file.fd, imageBuffer.buffer);
  return file.fd;
}

/**
 * Async create pixel map.
 *
 * @return pixelMa.
 */
export default async function getPixelMap(pageContent: Object) {
  const fd = await getResourceFd(pageContent);
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