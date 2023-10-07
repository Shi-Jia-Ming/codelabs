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

export class MapElement {
  id: number = 0;
  tag: string = '';
  zone: Resource = $r('app.media.img_placeholder');
  icon: ResourceStr = '';
  iconPositionX: number = 0;
  iconPositionY: number = 0;
  textColor: string = '';
}

export const mapElementData: MapElement[] = [
  {
    id: 0,
    tag: 'F',
    zone: $r('app.string.area_name_f'),
    icon: $r('app.media.icon_f'),
    iconPositionX: 1280,
    iconPositionY: 1330,
    textColor: '#FA9855'
  },
  {
    id: 1,
    tag: 'G',
    zone: $r('app.string.area_name_g'),
    icon: $r('app.media.icon_g'),
    iconPositionX: 2079,
    iconPositionY: 988,
    textColor: '#2F6BFF'
  },
  {
    id: 2,
    tag: 'H',
    zone: $r('app.string.area_name_h'),
    icon: $r('app.media.icon_h'),
    iconPositionX: 1971,
    iconPositionY: 458,
    textColor: '#2F6BFF'
  },
  {
    id: 3,
    tag: 'J',
    zone: $r('app.string.area_name_j'),
    icon: $r('app.media.icon_j'),
    iconPositionX: 1553,
    iconPositionY: 165,
    textColor: '#2F6BFF'
  },
  {
    id: 4,
    tag: 'K',
    zone: $r('app.string.area_name_k'),
    icon: $r('app.media.icon_k'),
    iconPositionX: 511,
    iconPositionY: 400,
    textColor: '#FA9855'
  },
  {
    id: 5,
    tag: 'L',
    zone: $r('app.string.area_name_l'),
    icon: $r('app.media.icon_l'),
    iconPositionX: 822,
    iconPositionY: 974,
    textColor: '#E84026'
  }
];
