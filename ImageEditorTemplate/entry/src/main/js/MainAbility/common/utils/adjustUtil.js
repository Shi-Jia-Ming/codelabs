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

/**
 * Adjust the picture saturation.
 *
 * @param bufferArray Saturation data to be converted.
 * @param last Last saturation value.
 * @param cur Current saturation value.
 * @returns Converted buffer data.
 */
export function adjustSaturation(bufferArray, last, cur) {
  return execColorInfo(bufferArray, last, cur, CommonConstants.HSVIndex.SATURATION);
}

/**
 * Adjusting the picture brightness.
 *
 * @param bufferArray Data for which luminance needs to be converted.
 * @param last Last luminance value.
 * @param cur Current luminance value.
 * @returns Converted buffer data.
 */
export function adjustImageValue(bufferArray, last, cur) {
  return execColorInfo(bufferArray, last, cur, CommonConstants.HSVIndex.VALUE);
}

/**
 * Get color buffer.
 *
 * @param bufferArray Data for which luminance needs to be converted.
 * @param last Last value.
 * @param cur Current Value.
 * @param hsvIndex Conversion Type.
 * @returns
 */
export function execColorInfo(bufferArray, last, cur, hsvIndex) {
  if (!bufferArray) {
    return;
  }
  const newBufferArr = bufferArray;
  let colorInfo = new Uint8Array(newBufferArr);
  for (let i = 0; i < colorInfo?.length; i += CommonConstants.PIXEL_STEP) {
    const hsv = rgb2hsv(colorInfo[i + CommonConstants.RGBIndex.RED], colorInfo[i + CommonConstants.RGBIndex.GREEN], colorInfo[i + CommonConstants.RGBIndex.BLUE]);
    let rate = cur / last;
    hsv[hsvIndex] *= rate;
    const rgb = hsv2rgb(hsv[CommonConstants.HSVIndex.HUE], hsv[CommonConstants.HSVIndex.SATURATION], hsv[CommonConstants.HSVIndex.VALUE]);
    colorInfo[i + CommonConstants.RGBIndex.RED] = rgb[CommonConstants.RGBIndex.RED];
    colorInfo[i + CommonConstants.RGBIndex.GREEN] = rgb[CommonConstants.RGBIndex.GREEN];
    colorInfo[i + CommonConstants.RGBIndex.BLUE] = rgb[CommonConstants.RGBIndex.BLUE];
  }
  return newBufferArr;
}

/**
 * Color transform.
 *
 * @param rgbValue Value of rbg.
 * @returns Converted rgbR.
 */
function colorTransform(rgbValue) {
  return Number((rgbValue / CommonConstants.COLOR_LEVEL_MAX).toFixed(CommonConstants.DECIMAL_TWO));
}

/**
 * RGB transform to HSV.
 *
 * @param red 0- 255.
 * @param green 0- 255.
 * @param blue 0- 255.
 * @return h (0 - 360) s(0 - 100) v (0 - 100).
 */
function rgb2hsv(red, green, blue) {
  let hsvH = 0, hsvS = 0, hsvV = 0;
  const rgbR = colorTransform(red);
  const rgbG = colorTransform(green);
  const rgbB = colorTransform(blue);
  const maxValue = Math.max(rgbR, Math.max(rgbG, rgbB));
  const minValue = Math.min(rgbR, Math.min(rgbG, rgbB));
  hsvV = maxValue * CommonConstants.CONVERT_INT;
  if (maxValue === 0) {
    hsvS = 0;
  } else {
    hsvS = Number((1 - minValue / maxValue).toFixed(CommonConstants.DECIMAL_TWO)) * CommonConstants.CONVERT_INT;
  }
  if (maxValue === minValue) {
    hsvH = 0;
  }
  if (maxValue === rgbR && rgbG >= rgbB) {
    hsvH = Math.floor(CommonConstants.ANGLE_60 * ((rgbG - rgbB) / (maxValue - minValue)));
  }
  if (maxValue === rgbR && rgbG < rgbB) {
    hsvH = Math.floor(CommonConstants.ANGLE_60 * ((rgbG - rgbB) / (maxValue - minValue)) + CommonConstants.ANGLE_360);
  }
  if (maxValue === rgbG) {
    hsvH = Math.floor(CommonConstants.ANGLE_60 * ((rgbB - rgbR) / (maxValue - minValue)) + CommonConstants.ANGLE_120);
  }
  if (maxValue === rgbB) {
    hsvH = Math.floor(CommonConstants.ANGLE_60 * ((rgbR - rgbG) / (maxValue - minValue)) + CommonConstants.ANGLE_240);
  }
  return [hsvH, hsvS, hsvV];
}

/**
 *  HSV to RGB conversion formula:
 *  When 0 <= H <= 360, 0 <= S <= 1 and 0 <= V <= 1:
 *  C = V * S
 *  X = C * (1 - Math.abs((H / 60) mod 2 - 1))
 *  m = V - C
 *                   | (C, X ,0),  0 <= H < 60
 *                   | (X, C, 0),  60 <= H < 120
 *                   | (0, C, X),  120 <= H < 180
 *  (R', G', B') =   | (0, X, C),  180 <= H < 240
 *                   | (X, 0, C),  240 <= H < 300
 *                   | (C, 0, X),  300 <= H < 360
 *
 *  (R, G, B) = ((R' + m) * 255, (G' + m) * 255, (B' + m) * 255)
 *
 * @param hue hue 0 ~ 360.
 * @param saturation saturation 0 ~ 100.
 * @param value value 0 ~ 100.
 * @return rgb value.
 */
function hsv2rgb(hue, saturation, value) {
  let rgbR = 0, rgbG = 0, rgbB = 0;
  if (saturation === 0) {
    rgbR = rgbG = rgbB = Math.round((value * CommonConstants.COLOR_LEVEL_MAX) / CommonConstants.CONVERT_INT);
    return { rgbR, rgbG, rgbB };
  }
  const cxmC = (value * saturation) / (CommonConstants.CONVERT_INT * CommonConstants.CONVERT_INT);
  const cxmX = cxmC * (1 - Math.abs((hue / CommonConstants.ANGLE_60) % CommonConstants.MOD_2 - 1));
  const cxmM = (value - cxmC * CommonConstants.CONVERT_INT) / CommonConstants.CONVERT_INT;
  const hsvHRange = Math.floor(hue / CommonConstants.ANGLE_60);
  switch (hsvHRange) {
    case CommonConstants.AngelRange.ANGEL_0_60:
      rgbR = (cxmC + cxmM) * CommonConstants.COLOR_LEVEL_MAX;
      rgbG = (cxmX + cxmM) * CommonConstants.COLOR_LEVEL_MAX;
      rgbB = (0 + cxmM) * CommonConstants.COLOR_LEVEL_MAX;
      break;
    case CommonConstants.AngelRange.ANGEL_60_120:
      rgbR = (cxmX + cxmM) * CommonConstants.COLOR_LEVEL_MAX;
      rgbG = (cxmC + cxmM) * CommonConstants.COLOR_LEVEL_MAX;
      rgbB = (0 + cxmM) * CommonConstants.COLOR_LEVEL_MAX;
      break;
    case CommonConstants.AngelRange.ANGEL_120_180:
      rgbR = (0 + cxmM) * CommonConstants.COLOR_LEVEL_MAX;
      rgbG = (cxmC + cxmM) * CommonConstants.COLOR_LEVEL_MAX;
      rgbB = (cxmX + cxmM) * CommonConstants.COLOR_LEVEL_MAX;
      break;
    case CommonConstants.AngelRange.ANGEL_180_240:
      rgbR = (0 + cxmM) * CommonConstants.COLOR_LEVEL_MAX;
      rgbG = (cxmX + cxmM) * CommonConstants.COLOR_LEVEL_MAX;
      rgbB = (cxmC + cxmM) * CommonConstants.COLOR_LEVEL_MAX;
      break;
    case CommonConstants.AngelRange.ANGEL_240_300:
      rgbR = (cxmX + cxmM) * CommonConstants.COLOR_LEVEL_MAX;
      rgbG = (0 + cxmM) * CommonConstants.COLOR_LEVEL_MAX;
      rgbB = (cxmC + cxmM) * CommonConstants.COLOR_LEVEL_MAX;
      break;
    case CommonConstants.AngelRange.ANGEL_300_360:
      rgbR = (cxmC + cxmM) * CommonConstants.COLOR_LEVEL_MAX;
      rgbG = (0 + cxmM) * CommonConstants.COLOR_LEVEL_MAX;
      rgbB = (cxmX + cxmM) * CommonConstants.COLOR_LEVEL_MAX;
      break;
    default:
      break;
  }
  return [
    Math.round(rgbR),
    Math.round(rgbG),
    Math.round(rgbB)
  ];
}