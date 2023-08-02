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

import common from '@ohos.app.ability.common';
import { SongItem } from '../bean/SongData';
import { Logger } from './Logger';

export default class SongItemBuilder {
  private context: common.UIAbilityContext = AppStorage.Get('context');
  private realUrl;
  private songItem: SongItem;

  public async build(songItem: SongItem) {
    this.songItem = songItem;
    let rawfileFd = await this.context.createModuleContext('musicList').resourceManager.getRawFd(songItem.src)
      .catch((e) => {
        Logger.error('resourceManager' + JSON.stringify(e));
      })
    this.realUrl = rawfileFd;
    Logger.info('MediaAssetBuilder build realUrl:' + this.realUrl);
    return this.songItem;
  }

  public getRealUrl() {
    return this.realUrl;
  }

  public async release() {
    this.context.resourceManager.closeRawFd(this.songItem.src);
    this.songItem = null;
  }
}