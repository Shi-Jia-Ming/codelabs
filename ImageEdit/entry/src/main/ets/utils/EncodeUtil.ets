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

import mediaLibrary from '@ohos.multimedia.mediaLibrary';
import fs from '@ohos.file.fs';
import image from '@ohos.multimedia.image';
import Logger from './LoggerUtil';
import { CommonConstants } from '../common/constant/CommonConstants';

const TAG: string = 'imageEdit_Encode';

/**
 * Pack the image.
 *
 * @param pixelMap.
 */
export async function encode(component: Object, pixelMap: PixelMap) {
  const newPixelMap = pixelMap;
  // Packing image.
  const imagePackerApi = image.createImagePacker();
  const packOptions: image.PackingOption = {
    format: CommonConstants.ENCODE_FORMAT,
    quality: CommonConstants.ENCODE_QUALITY
  }
  const imageData = await imagePackerApi.packing(newPixelMap, packOptions);
  Logger.info(TAG, `imageData's length is ${imageData.byteLength}`);
  // Get album's path.
  const context = getContext(component);
  const media = mediaLibrary.getMediaLibrary(context);
  const publicPath = await media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_IMAGE);
  const currentTime = new Date().getTime();
  // Create image asset.
  const imageAssetInfo = await media.createAsset(
    mediaLibrary.MediaType.IMAGE,
    `${CommonConstants.IMAGE_PREFIX}_${currentTime}${CommonConstants.IMAGE_FORMAT}`,
    publicPath
  );
  const imageFd = await imageAssetInfo.open(CommonConstants.ENCODE_FILE_PERMISSION);
  await fs.write(imageFd, imageData);
  // Image resource release.
  await imageAssetInfo.close(imageFd);
  imagePackerApi.release();
  await media.release();
}


