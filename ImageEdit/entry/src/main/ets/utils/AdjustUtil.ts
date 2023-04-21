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

import { CommonConstants } from '../common/constant/CommonConstants';
import { RGBIndex, HSVIndex, AngelRange } from '../viewModel/OptionViewModel';

/**
 * Saturation adjust.
 *
 * @param pixelMap.
 * @param value saturation's value.
 * @return arrayBuffer.
 */
export function adjustSaturation(bufferArray: ArrayBuffer, last: number, cur: number) {
  return execColorInfo(bufferArray, last, cur, HSVIndex.SATURATION);
}

/**
 * Image brightness adjust.
 *
 * @param pixelMap.
 * @param value image's brigtness.
 * @return arrayBuffer.
 */
export function adjustImageValue(bufferArray: ArrayBuffer, last: number, cur: number) {
  return execColorInfo(bufferArray, last, cur, HSVIndex.VALUE);
}

/**
 * Exec color transform.
 *
 * @param bufferArray.
 * @param last.
 * @param cur.
 * @param hsvIndex.
 * @return arrayBuffer.
 */
export function execColorInfo(bufferArray: ArrayBuffer, last: number, cur: number, hsvIndex: number) {
  if (!bufferArray) {
    return;
  }
  const newBufferArr = bufferArray;
  let colorInfo = new Uint8Array(newBufferArr);
  for (let i = 0; i < colorInfo?.length; i += CommonConstants.PIXEL_STEP) {
    const hsv = rgb2hsv(colorInfo[i + RGBIndex.RED], colorInfo[i + RGBIndex.GREEN], colorInfo[i + RGBIndex.BLUE]);
    let rate = cur / last;
    hsv[hsvIndex] *= rate;
    const rgb = hsv2rgb(hsv[HSVIndex.HUE], hsv[HSVIndex.SATURATION], hsv[HSVIndex.VALUE]);
    colorInfo[i + RGBIndex.RED] = rgb[RGBIndex.RED];
    colorInfo[i + RGBIndex.GREEN] = rgb[RGBIndex.GREEN];
    colorInfo[i + RGBIndex.BLUE] = rgb[RGBIndex.BLUE];
  }
  return newBufferArr;
}

/**
 * Color transform.
 *
 * @param rgbValue 0 - 255.
 * @return 0 - 1.
 */
function colorTransform(rgbValue: number) {
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
function rgb2hsv(red: number, green: number, blue: number) {
  let h: number = 0, s: number = 0, v: number = 0;
  const R: number = colorTransform(red);
  const G: number = colorTransform(green);
  const B: number = colorTransform(blue);
  const maxValue = Math.max(R, Math.max(G, B));
  const minValue = Math.min(R, Math.min(G, B));
  v = maxValue * CommonConstants.CONVERT_INT;
  if (maxValue === 0) {
    s = 0;
  } else {
    s = Number((1 - minValue / maxValue).toFixed(CommonConstants.DECIMAL_TWO)) * CommonConstants.CONVERT_INT;
  }
  if (maxValue === minValue) {
    h = 0;
  }
  if (maxValue === R && G >= B) {
    h = Math.floor(CommonConstants.ANGLE_60 * ((G - B) / (maxValue - minValue)));
  }
  if (maxValue === R && G < B) {
    h = Math.floor(CommonConstants.ANGLE_60 * ((G - B) / (maxValue - minValue)) + CommonConstants.ANGLE_360);
  }
  if (maxValue === G) {
    h = Math.floor(CommonConstants.ANGLE_60 * ((B - R) / (maxValue - minValue)) + CommonConstants.ANGLE_120);
  }
  if (maxValue === B) {
    h = Math.floor(CommonConstants.ANGLE_60 * ((R - G) / (maxValue - minValue)) + CommonConstants.ANGLE_240);
  }
  return [h, s, v];
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
 * @param h hue 0 ~ 360.
 * @param s saturation 0 ~ 100.
 * @param v value 0 ~ 100.
 * @return rgb value.
 */
function hsv2rgb(h: number, s: number, v: number) {
  let R: number = 0, G: number = 0, B: number = 0;
  if (s === 0) {
    R = G = B = Math.round((v * CommonConstants.COLOR_LEVEL_MAX) / CommonConstants.CONVERT_INT);
    return { R, G, B };
  }
  const C = (v * s) / (CommonConstants.CONVERT_INT * CommonConstants.CONVERT_INT);
  const X = C * (1 - Math.abs((h / CommonConstants.ANGLE_60) % CommonConstants.MOD_2 - 1));
  const M = (v - C * CommonConstants.CONVERT_INT) / CommonConstants.CONVERT_INT;
  const HRange = Math.floor(h / CommonConstants.ANGLE_60);
  switch (HRange) {
    case AngelRange.ANGEL_0_60:
      R = (C + M) * CommonConstants.COLOR_LEVEL_MAX;
      G = (X + M) * CommonConstants.COLOR_LEVEL_MAX;
      B = (0 + M) * CommonConstants.COLOR_LEVEL_MAX;
      break;
    case AngelRange.ANGEL_60_120:
      R = (X + M) * CommonConstants.COLOR_LEVEL_MAX;
      G = (C + M) * CommonConstants.COLOR_LEVEL_MAX;
      B = (0 + M) * CommonConstants.COLOR_LEVEL_MAX;
      break;
    case AngelRange.ANGEL_120_180:
      R = (0 + M) * CommonConstants.COLOR_LEVEL_MAX;
      G = (C + M) * CommonConstants.COLOR_LEVEL_MAX;
      B = (X + M) * CommonConstants.COLOR_LEVEL_MAX;
      break;
    case AngelRange.ANGEL_180_240:
      R = (0 + M) * CommonConstants.COLOR_LEVEL_MAX;
      G = (X + M) * CommonConstants.COLOR_LEVEL_MAX;
      B = (C + M) * CommonConstants.COLOR_LEVEL_MAX;
      break;
    case AngelRange.ANGEL_240_300:
      R = (X + M) * CommonConstants.COLOR_LEVEL_MAX;
      G = (0 + M) * CommonConstants.COLOR_LEVEL_MAX;
      B = (C + M) * CommonConstants.COLOR_LEVEL_MAX;
      break;
    case AngelRange.ANGEL_300_360:
      R = (C + M) * CommonConstants.COLOR_LEVEL_MAX;
      G = (0 + M) * CommonConstants.COLOR_LEVEL_MAX;
      B = (X + M) * CommonConstants.COLOR_LEVEL_MAX;
      break;
    default:
      break;
  }
  return [
    Math.round(R),
    Math.round(G),
    Math.round(B)
  ];
}