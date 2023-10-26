/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import CommonConstants from '../common/constants/CommonConstants';
import ChatData from '../viewmodel/ChatData';
import { ItemDirection } from '../viewmodel/ItemDirection';

/**
 * Set view model, providing page display data.
 */
export class SetViewModel {
  chatArr: Array<ChatData> = [];

  initChatData(): Array<ChatData> {
    if (this.chatArr.length === 0) {
      this.chatArr = new Array();
      let chatData = new ChatData();
      chatData.itemDirection = ItemDirection.RIGHT;
      chatData.content = $r('app.string.set_chat_content1');
      this.chatArr.push(chatData);
      chatData = new ChatData();
      chatData.itemDirection = ItemDirection.LEFT;
      chatData.content = $r('app.string.set_chat_content2');
      this.chatArr.push(chatData);
      chatData = new ChatData();
      chatData.itemDirection = ItemDirection.RIGHT;
      chatData.content = $r('app.string.set_chat_content3');
      this.chatArr.push(chatData);
      chatData = new ChatData();
      chatData.itemDirection = ItemDirection.LEFT;
      chatData.content = $r('app.string.set_chat_content4');
      this.chatArr.push(chatData);
    }
    return this.chatArr;
  }

  getTextByFontSize(fontSize: number) {
    let fontSizeText: Resource | string = '';
    switch (fontSize) {
      case CommonConstants.SET_SIZE_SMALL:
        fontSizeText = $r('app.string.set_size_small');
        break;
      case CommonConstants.SET_SIZE_NORMAL:
        fontSizeText = $r("app.string.set_size_normal");
        break;
      case CommonConstants.SET_SIZE_LARGE:
        fontSizeText = $r("app.string.set_size_large");
        break;
      case CommonConstants.SET_SIZE_EXTRA_LARGE:
        fontSizeText = $r("app.string.set_size_extra_large");
        break;
      case CommonConstants.SET_SIZE_HUGE:
        fontSizeText = $r("app.string.set_size_huge");
        break;
      default:
        fontSizeText = $r("app.string.set_size_normal");
    }
    return fontSizeText;
  }
}

export default new SetViewModel();