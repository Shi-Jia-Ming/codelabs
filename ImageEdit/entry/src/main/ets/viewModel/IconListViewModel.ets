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
export class IconStatus {
  normal: Resource;
  chosen: Resource;

  constructor(normal: Resource, chosen: Resource) {
    this.normal = normal;
    this.chosen = chosen;
  }
}

/**
 * Bottom menu icon.
 */
export const menuIconList: Array<IconStatus> = [
  new IconStatus($r('app.media.ic_crop'), $r('app.media.ic_crop_filled')),
  new IconStatus($r('app.media.ic_rotate'), $r('app.media.ic_rotate_filled')),
  new IconStatus($r('app.media.ic_adjust'), $r('app.media.ic_adjust_filled'))
]

/**
 * Crop icon.
 */
export const cropIconChangeList: Array<IconStatus> = [
  new IconStatus($r('app.media.ic_original'),$r('app.media.ic_original_filled') ),
  new IconStatus($r('app.media.ic_one2one'), $r('app.media.ic_one2one_filled')),
  new IconStatus($r('app.media.ic_four2three'), $r('app.media.ic_four2three_filled')),
  new IconStatus($r('app.media.ic_sixteen2nine'), $r('app.media.ic_sixteen2nine_filled'))
]

/**
 * Adjust icon.
 */
export const adjustIconList: Array<IconStatus> = [
  new IconStatus($r('app.media.ic_brightness'), $r('app.media.ic_brightness_filled')),
  new IconStatus($r('app.media.ic_transparency'), $r('app.media.ic_transparency_filled')),
  new IconStatus($r('app.media.ic_saturation'), $r('app.media.ic_saturation_filled'))
]

