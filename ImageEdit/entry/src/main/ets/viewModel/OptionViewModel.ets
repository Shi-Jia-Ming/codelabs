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

/**
 * Crop type.
 */
export enum CropType {
  ORIGINAL_IMAGE,
  SQUARE,
  BANNER,
  RECTANGLE
}

/**
 * Rotate type
 */
export enum RotateType {
  CLOCKWISE,
  ANTI_CLOCK
}

/**
 * Adjust type.
 */
export enum AdjustId {
  BRIGHTNESS,
  TRANSPARENCY,
  SATURATION
}

/**
 * Main page tab type.
 */
export enum MainTabId {
  CROP,
  ROTATE,
  ADJUST
}

/**
 * RGB color, red,green and blue.
 */
export enum RGBIndex {
  RED,
  GREEN,
  BLUE
}

/**
 * HSV type.
 */
export enum HSVIndex {
  HUE,
  SATURATION,
  VALUE
}

/**
 * Angel range.
 */
export enum AngelRange {
  ANGEL_0_60,
  ANGEL_60_120,
  ANGEL_120_180,
  ANGEL_180_240,
  ANGEL_240_300,
  ANGEL_300_360
}