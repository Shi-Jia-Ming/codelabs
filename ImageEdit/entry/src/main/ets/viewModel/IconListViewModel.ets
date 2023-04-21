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
 * Icon status.
 */
export interface IconStatus {
  normal: Resource,
  chosen: Resource
}

/**
 * Bottom menu icon.
 */
export const menuIconList: Array<IconStatus> = [
  {
    normal: $r('app.media.ic_crop'),
    chosen: $r('app.media.ic_crop_filled')
  },
  {
    normal: $r('app.media.ic_rotate'),
    chosen: $r('app.media.ic_rotate_filled')
  },
  {
    normal: $r('app.media.ic_adjust'),
    chosen: $r('app.media.ic_adjust_filled')
  }
]

/**
 * Crop icon.
 */
export const cropIconChangeList: Array<IconStatus> = [
  {
    normal: $r('app.media.ic_original'),
    chosen: $r('app.media.ic_original_filled'),
  },
  {
    normal: $r('app.media.ic_one2one'),
    chosen: $r('app.media.ic_one2one_filled')
  },
  {
    normal: $r('app.media.ic_four2three'),
    chosen: $r('app.media.ic_four2three_filled')
  },
  {
    normal: $r('app.media.ic_sixteen2nine'),
    chosen: $r('app.media.ic_sixteen2nine_filled')
  }
]

/**
 * Adjust icon.
 */
export const adjustIconList: Array<IconStatus> = [
  {
    normal: $r('app.media.ic_brightness'),
    chosen: $r('app.media.ic_brightness_filled')
  },
  {
    normal: $r('app.media.ic_transparency'),
    chosen: $r('app.media.ic_transparency_filled')
  },
  {
    normal: $r('app.media.ic_saturation'),
    chosen: $r('app.media.ic_saturation_filled')
  }
]

