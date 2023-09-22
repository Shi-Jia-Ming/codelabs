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

import prompt from '@ohos.promptAction';
import media from '@ohos.multimedia.media';
import Logger from '../common/util/Logger';
import { HomeConstants } from '../common/constants/HomeConstants';
import { AvplayerStatus, Events } from '../common/constants/CommonConstants';

export class HomeDialogModel {
  private context;
  private avPlayer: media.AVPlayer | null = null;
  private url: string = '';
  private duration: number = 0;
  private checkFlag: number = 0;
  private isLoading;

  constructor(context) {
    this.context = context;
    this.isLoading = false;
  }

  /**
   * Creates a videoPlayer object.
   */
  createAvPlayer() {
    media.createAVPlayer().then((video: media.AVPlayer) => {
      if (video != null) {
        this.avPlayer = video;
        this.bindState();
        this.url = this.context.src;
        this.avPlayer.url = this.url;
      } else {
        Logger.info(`[HomeDialogModel] createAVPlayer fail`);
      }
    }).catch((err: Error) => {
      this.failureCallback(err);
    });
  }

  bindState() {
    if (this.avPlayer === null) {
      return;
    }
    this.avPlayer.on(Events.STATE_CHANGE, async (state: media.AVPlayerState) => {
      if (this.avPlayer === null) {
        return;
      }
      if (state === AvplayerStatus.INITIALIZED) {
        this.avPlayer.prepare();
      } else if (state === AvplayerStatus.PREPARED) {
        this.duration = this.avPlayer.duration;
        this.checkUrlValidity();
      } else if (state === AvplayerStatus.ERROR) {
        this.avPlayer.reset();
      }
    });
    this.avPlayer.on(Events.ERROR, (error: Error) => {
      this.isLoading = false;
      this.context.linkCheck = $r('app.string.link_check');
      this.context.loadColor = $r('app.color.index_tab_selected_font_color');
      if (this.avPlayer !== null) {
        this.avPlayer.release();
      }
      this.failureCallback(error);
    })
  }

  /**
   * Verifying Network Connections.
   *
   * @param checkFlag Determine whether to verify or add data.
   */
  async checkSrcValidity(checkFlag: number) {
    if (this.isLoading) {
      return;
    }
    this.isLoading = true;
    this.context.linkCheck = $r('app.string.link_checking');
    this.context.loadColor = $r('app.color.index_tab_unselected_font_color');
    this.checkFlag = checkFlag;
    this.createAvPlayer();
  }

  /**
   * Verifying Network Connections.
   */
  checkUrlValidity() {
    this.isLoading = false;
    this.context.linkCheck = $r('app.string.link_check');
    this.context.loadColor = $r('app.color.index_tab_selected_font_color');
    if (this.avPlayer !== null) {
      this.avPlayer.release();
    }
    if (this.duration === HomeConstants.DURATION_TWO) {
      // Failed to verify the link
      this.showPrompt($r('app.string.link_check_fail'));
      this.context.result = false;
    } else if (this.duration === HomeConstants.DURATION_ONE) {
      // The address is incorrect or no network is available
      this.showPrompt($r('app.string.link_check_address_internet'));
      this.context.result = false;
    } else {
      this.duration = 0;
      if (this.checkFlag === 0) {
        this.showPrompt($r('app.string.link_check_success'));
      } else {
        this.context.confirm();
        this.context.controller.close();
      }
    }
  }

  /**
   * This parameter is used to report error information when an error occurs in function invoking.
   *
   * @param error Error information.
   */
  failureCallback(error: Error) {
    Logger.error(`[HomeDialogModel] error happened: ` + JSON.stringify(error));
    this.context.result = false;
    this.showPrompt($r('app.string.link_check_fail'));
  }

  /**
   * Prompt dialog box.
   *
   * @param msg Verification Information.
   */
  showPrompt(msg: Resource) {
    prompt.showToast({
      duration: HomeConstants.DURATION,
      message: msg
    });
  }

  /**
   * Check whether the playback path is empty.
   */
  checkSrcNull(): boolean {
    if (this.isLoading) {
      return false;
    }
    if (this.context.src.trim() === '') {
      prompt.showToast({
        duration: HomeConstants.DURATION,
        message: $r('app.string.place_holder_src')
      });
      return false;
    }
    return true;
  }

  /**
   * Check whether the name is empty.
   */
  checkNameNull(): boolean {
    if (this.isLoading) {
      return false;
    }
    if (this.context.name.trim() === '') {
      prompt.showToast({
        duration: HomeConstants.DURATION,
        message: $r('app.string.place_holder_name')
      });
      return false;
    }
    return true;
  }
}