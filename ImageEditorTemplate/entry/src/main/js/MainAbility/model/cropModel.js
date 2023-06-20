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

import { CommonConstants } from '../common/constant/commonConstants';

const accuracy = CommonConstants.TEN_DIGIT;

/**
 * The cropping box is the original image size. Obtain the width and height of the cropping box.
 *
 * @param context Caller's context object.
 */
export function cropOriginal(context) {
  if (!context) {
    return;
  }
  context.cropWidth = context.originalImage.width;
  context.cropHeight = context.originalImage.height;
  // The width and height of the cropping frame are the width and height of the image.
  context.cropDrawWidth = context.drawWidth;
  context.cropDrawHeight = context.drawHeight;
}

/**
 * 1:1 cropping: Obtains the width and height of the cropping frame.
 *
 * @param context Caller's context object.
 */
export function cropSquareImage(context) {
  if (!context) {
    return;
  }
  let length = Math.min(context.originalImage.width, context.originalImage.height);
  context.cropWidth = length;
  context.cropHeight = length;
  let drawLength = Math.min(context.drawWidth, context.drawHeight);
  context.cropDrawWidth = drawLength;
  context.cropDrawHeight = drawLength;
}

/**
 * Draw shadows in unselected areas
 *
 * @param context Caller's context object.
 * @param canvasContext Canvas's canvasContext.
 */
export function drawScreenSelection(context, canvasContext) {
  if (!context) {
    return;
  }
  canvasContext.clearRect(0, 0, context.canvasWidth, context.canvasHeight);
  canvasContext.beginPath();
  canvasContext.moveTo(0, 0);
  canvasContext.lineTo(context.canvasWidth, 0);
  canvasContext.lineTo(context.canvasWidth, context.canvasHeight);
  canvasContext.lineTo(0, context.canvasHeight);
  canvasContext.closePath();
  let offsetX = (context.canvasWidth - context.cropDrawWidth) / CommonConstants.HALF;
  let offsetY = (context.canvasHeight - context.cropDrawHeight) / CommonConstants.HALF;
  offsetX = Math.floor(offsetX * accuracy) / accuracy;
  offsetY = Math.floor(offsetY * accuracy) / accuracy;
  canvasContext.moveTo(offsetX + context.cropDrawWidth, offsetY);
  canvasContext.lineTo(offsetX, offsetY);
  canvasContext.lineTo(offsetX, offsetY + context.cropDrawHeight);
  canvasContext.lineTo(offsetX + context.cropDrawWidth, offsetY + context.cropDrawHeight);
  canvasContext.globalAlpha = CommonConstants.UNSELECT_AREA_ALPHA;
  canvasContext.fillStyle = CommonConstants.LINES_COLOR;
  canvasContext.closePath();
  canvasContext.fill();
}

/**
 * 16:9 cropping: Obtains the width and height of the cropping frame.
 *
 * @param context Caller's context object.
 */
export function cropRectangleImage(context) {
  if (!context) {
    return;
  }
  cropImageByRatio(context, CommonConstants.CropRatio.SIXTEEN, CommonConstants.CropRatio.NINE);
}

/**
 * 4:3 cropping: Obtains the width and height of the cropping frame.
 *
 * @param context Caller's context object.
 */
export function cropBannerImage(context) {
  if (!context) {
    return;
  }
  cropImageByRatio(context, CommonConstants.CropRatio.FOUR, CommonConstants.CropRatio.THREE);
}

/**
 * Obtains the crop box based on the input ratio.
 *
 * @param context
 * @param widthPercent
 * @param HighPercent
 */
export function cropImageByRatio(context, widthPercent, HighPercent) {
  if (!context) {
    return;
  }
  // Width and height of the cropping box (the width of the cropping box is the width of the image).
  let tempHeight = context.originalImage.width * HighPercent / widthPercent;
  let fillWidth = tempHeight < context.originalImage.height;
  let tempWidth = context.originalImage.height * widthPercent / HighPercent;
  let fillHeight = tempWidth < context.originalImage.width;
  if (fillWidth) {
    context.cropWidth = context.originalImage.width;
    context.cropHeight = tempHeight;
    context.cropDrawWidth = context.drawWidth;
    context.cropDrawHeight = context.cropDrawWidth * HighPercent / widthPercent;
  } else if (fillHeight) {
    context.cropHeight = context.originalImage.height;
    context.cropWidth = tempWidth;
    context.cropDrawHeight = context.drawHeight;
    context.cropDrawWidth = context.cropDrawHeight * widthPercent / HighPercent;
  } else {
    cropOriginal(context);
  }
}


/**
 * Crop the picture.
 *
 * @param context Caller's context object.
 */
export async function cropDrawImage(context) {
  if (!context) {
    return;
  }
  let imagePixel = context.imagePixelMapAdjust;
  let diffX = (context.originalImage.width - context.cropWidth) / CommonConstants.HALF;
  let diffY = (context.originalImage.height - context.cropHeight) / CommonConstants.HALF;
  // Indicates the x and y coordinates of the upper left corner of the region to be exported.
  context.cropLeft = Math.floor(diffX * accuracy) / accuracy;
  context.cropTop = Math.floor(diffY * accuracy) / accuracy;
  await imagePixel.crop({ x: context.cropLeft, y: context.cropTop,
    size: {
      height: context.cropHeight,
      width: context.cropWidth
    }
  });
  // Width and height of the original image after cropping.
  context.originalImage.width = context.cropWidth;
  context.originalImage.height = context.cropHeight;
  context.imagePixelMapAdjust = imagePixel;
}