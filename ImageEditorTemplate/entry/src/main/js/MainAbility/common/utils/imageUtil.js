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

import image from '@ohos.multimedia.image';
import resourceManager from '@ohos.resourceManager';
import fs from '@ohos.file.fs';
import mediaLibrary from '@ohos.multimedia.mediaLibrary';
import { CommonConstants } from '../constant/commonConstants';

/**
 * Obtains the image FD.
 *
 * @param imageName ImageName.
 * @returns Image fd.
 */
export async function getImageFd(imageName) {
  let mResourceManager = await resourceManager.getResourceManager();
  let rawImageDescriptor = await mResourceManager.getRawFd(imageName);
  let fd = rawImageDescriptor?.fd;
  return fd;
}

/**
 * Obtains the image pixelMap based on the FD.
 *
 * @returns Image pixelMap object.
 */
export async function getImagePixelMap(fd) {
  let imageSource = image.createImageSource(fd);
  if (!imageSource) {
    return;
  }
  let pixelMap = await imageSource.createPixelMap({
    editable: true,
    desiredPixelFormat: CommonConstants.PIXEL_FORMAT
  });
  return pixelMap;
}

/**
 * Generate an image based on the input pixelMap.
 *
 * @param pixelMap PixelMap of image.
 */
export async function packImage(pixelMap) {
  const newPixelMap = pixelMap;
  // Packing image.
  const imagePackerApi = image.createImagePacker();
  const packOptions = {
    format: CommonConstants.ENCODE_FORMAT,
    quality: CommonConstants.ENCODE_QUALITY
  };
  const imageData = await imagePackerApi.packing(newPixelMap, packOptions);
  const media = mediaLibrary.getMediaLibrary();
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