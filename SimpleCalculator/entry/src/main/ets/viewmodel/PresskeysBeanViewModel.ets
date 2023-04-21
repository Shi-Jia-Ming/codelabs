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

import { PressKeysBean } from '../common/bean/PressKeysBean';

export class PressKeysBeanViewModel {

  /**
   * Key array data.
   */
  getPressKeys(): Array<Array<PressKeysBean>>{
    return [
      [
        {
          flag: 0,
          width: '32vp',
          height: '32vp',
          value: 'clean',
          source: $r('app.media.ic_clean')
        },
        {
          flag: 1,
          width: '19vp',
          height: '43vp',
          value: '7'
        },
        {
          flag: 1,
          width: '19vp',
          height: '43vp',
          value: '4'
        },
        {
          flag: 1,
          width: '19vp',
          height: '43vp',
          value: '1'
        },
        {
          flag: 1,
          width: '25vp',
          height: '43vp',
          value: '%'
        }
      ],
      [
        {
          flag: 0,
          width: '32vp',
          height: '32vp',
          value: 'div',
          source: $r('app.media.ic_div')
        },
        {
          flag: 1,
          width: '19vp',
          height: '43vp',
          value: '8'
        },
        {
          flag: 1,
          width: '19vp',
          height: '43vp',
          value: '5'
        },
        {
          flag: 1,
          width: '19vp',
          height: '43vp',
          value: '2'
        },
        {
          flag: 1,
          width: '19vp',
          height: '43vp',
          value: '0'
        }
      ],
      [
        {
          flag: 0,
          width: '32vp',
          height: '32vp',
          value: 'mul',
          source: $r('app.media.ic_mul')
        },
        {
          flag: 1,
          width: '19vp',
          height: '43vp',
          value: '9'
        },
        {
          flag: 1,
          width: '19vp',
          height: '43vp',
          value: '6'
        },
        {
          flag: 1,
          width: '19vp',
          height: '43vp',
          value: '3'
        },
        {
          flag: 1,
          width: '19vp',
          height: '43vp',
          value: '.'
        }
      ],
      [
        {
          flag: 0,
          width: '30.48vp',
          height: '20vp',
          value: 'del',
          source: $r('app.media.ic_del')
        },
        {
          flag: 0,
          width: '24vp',
          height: '24vp',
          value: 'min',
          source: $r('app.media.ic_min')
        },
        {
          flag: 0,
          width: '32vp',
          height: '32vp',
          value: 'add',
          source: $r('app.media.ic_add')
        },
        {
          flag: 0,
          width: '32vp',
          height: '32vp',
          value: 'equ',
          source: $r('app.media.ic_equ')
        }
      ]
    ];
  }
}

let keysModel = new PressKeysBeanViewModel();
export default keysModel as PressKeysBeanViewModel;