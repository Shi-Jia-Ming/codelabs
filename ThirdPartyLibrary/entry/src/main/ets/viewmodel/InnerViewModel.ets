/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { ButtonList } from './ButtonList';

class InnerViewModel {
  getButtonListData() {
    let ButtonListData: Array<ButtonList> = [];
    for (let i = 0; i < BUTTON_LIST.length; i++) {
      let ButtonListItem = new ButtonList();
      ButtonListItem = BUTTON_LIST[i];
      ButtonListData.push(ButtonListItem);
    }
    return ButtonListData;
  }
}

const BUTTON_LIST: ButtonList[] = [
  {
    title: '普通按钮',
    subtitle: '用于一般界面操作',
    backgroundImage: '',
    buttonText: '普通按钮',
    buttonShape: 'capsule',
    buttonType: '',
    stateEffect: true,
    fontColor: ''
  },
  {
    title: '强调按钮',
    subtitle: '在界面上很突出，用于强调当前操作',
    backgroundImage: '',
    buttonText: '强调按钮',
    buttonShape: 'capsule',
    buttonType: 'info',
    stateEffect: true,
    fontColor: '#409eff'
  },
  {
    title: '文本按钮',
    subtitle: '文本按钮为纯文本按钮，点击执行操作',
    backgroundImage: '',
    buttonText: '文本按钮',
    buttonShape: 'capsule',
    buttonType: 'none',
    stateEffect: true,
    fontColor: '#409eff'
  }
];

let innerViewModel = new InnerViewModel();

export default innerViewModel as InnerViewModel