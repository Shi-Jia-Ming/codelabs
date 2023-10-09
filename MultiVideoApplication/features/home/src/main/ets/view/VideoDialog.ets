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

import resourceManager from '@ohos.resourceManager';
import common from '@ohos.app.ability.common';
import media from '@ohos.multimedia.media';
import { BreakpointConstants, CommonConstants } from '@ohos/commons';
import { BreakpointType, Logger } from '@ohos/commons';
import { BusinessError } from '@ohos.base';
import { HomeConstants } from '../constants/HomeConstants';

@CustomDialog
export struct VideoDialog {
  @StorageLink('currentBreakpoint') currentBreakpoint: string = BreakpointConstants.BREAKPOINT_LG;
  private xComponentController: XComponentController = new XComponentController();
  private surfaceId: string = '';
  private avPlayer?: media.AVPlayer;
  private context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;
  private url?: resourceManager.RawFileDescriptor;
  private playState: boolean = true;
  private controller?: CustomDialogController;

  aboutToAppear() {
    this.createAvPlayer();
  }

  aboutToDisappear() {
    if (this.avPlayer === undefined) {
      Logger.error(`AvPlayer is undefined`);
      return;
    }
    this.avPlayer.release();
  }

  build() {
    Column() {
      Column() {
        XComponent({
          id: '',
          type: HomeConstants.X_COMPONENT_TYPE,
          controller: this.xComponentController
        })
          .borderRadius($r('app.float.x_component_radius'))
          .onLoad(() => {
            this.xComponentController.setXComponentSurfaceSize({ surfaceWidth:
              CommonConstants.X_COMPONENT_SURFACE_WIDTH, surfaceHeight: CommonConstants.X_COMPONENT_SURFACE_HEIGHT });
            this.surfaceId = this.xComponentController.getXComponentSurfaceId();
          })
          .width(CommonConstants.FULL_PERCENT)
          .height(CommonConstants.FULL_PERCENT)
      }
      .margin({ bottom: $r('app.float.dialog_col_margin') })
      .height(new BreakpointType($r('app.float.dialog_col_height_sm'), $r('app.float.dialog_col_height_md'),
        $r('app.float.dialog_col_height_lg')).GetValue(this.currentBreakpoint))
      .width(new BreakpointType($r('app.float.dialog_col_width_sm'), $r('app.float.dialog_col_width_md'),
        $r('app.float.dialog_col_width_lg')).GetValue(this.currentBreakpoint))
      .aspectRatio(HomeConstants.VIDEO_DIALOG_ASPECT_RATIO)
      .onClick(() => {
        if (this.avPlayer === undefined) {
          Logger.error(`AvPlayer is undefined`);
          return;
        }
        if (this.avPlayer.state === CommonConstants.AV_PLAYER_STOPPED_STATE) {
          this.avPlayer.prepare();
          return;
        }
        if (this.playState === false) {
          this.avPlayer.play();
        } else {
          this.avPlayer.pause();
        }
      })

      Column() {
        this.MenuItem($r('app.media.ic_public_view_list'), HomeConstants.VIDEO_DIALOG_OPTIONS[0])
        this.MenuItem($r('app.media.ic_public_highlights'), HomeConstants.VIDEO_DIALOG_OPTIONS[1])
        this.MenuItem($r('app.media.ic_public_favor'), HomeConstants.VIDEO_DIALOG_OPTIONS[2])
      }
      .borderRadius($r('app.float.dialog_text_radius'))
      .backgroundColor(Color.White)
      .width(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ? $r('app.float.dialog_text_col_width_lg') :
        $r('app.float.dialog_text_col_width'))
      .padding({
        left: $r('app.float.dialog_text_col_padding'),
        right: $r('app.float.dialog_text_col_padding')
      })
    }
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  MenuItem(img: Resource, text: string) {
    Row() {
      Image(img)
        .width($r('app.float.dialog_icon_size'))
        .height($r('app.float.dialog_icon_size'))
        .margin({ right: $r('app.float.dialog_icon_margin') })
      Text(text)
        .layoutWeight(1)
        .fontSize($r('app.float.dialog_text_font'))
        .fontWeight(FontWeight.Normal)
    }
    .height($r('app.float.dialog_menu_row_height'))
  }

  async createAvPlayer(): Promise<void> {
    this.avPlayer = await media.createAVPlayer();
    // Entering the idle state.
    this.url = await this.context.createModuleContext(CommonConstants.VIDEO_DETAIL_HSP_NAME).resourceManager
      .getRawFd(CommonConstants.PRODUCT_VIDEO_NAME);
    this.avPlayer.fdSrc = this.url;
    this.setAVPlayerCallback();
    // Initialize the playback status.
    this.playState = false;
  }

  // Registering the avplayer callback function.
  setAVPlayerCallback(): void {
    if (this.avPlayer === undefined) {
      Logger.error(`AvPlayer is undefined`);
      return;
    }
    this.avPlayer.on('error', (err: BusinessError) => {
      Logger.error(`Invoke avPlayer failed, code is ${err.code}, message is ${err.message}`);
      if (this.avPlayer === undefined) {
        Logger.error(`AvPlayer is undefined`);
        return;
      }
      this.avPlayer.reset();
    });

    // Callback function for state machine changes.
    this.avPlayer.on('stateChange', async (state: media.AVPlayerState) => {
      if (this.avPlayer === undefined) {
        Logger.error(`AvPlayer is undefined`);
        return;
      }
      switch (state) {
        case CommonConstants.AV_PLAYER_IDLE_STATE:
          this.url = await this.context.createModuleContext(CommonConstants.VIDEO_DETAIL_HSP_NAME).resourceManager
            .getRawFd(CommonConstants.PRODUCT_VIDEO_NAME);
          this.avPlayer.fdSrc = this.url;
          Logger.info('AVPlayer state idle called.');
          break;
        case CommonConstants.AV_PLAYER_INITIALIZED_STATE:
          // This status is reported after the AVPlayer sets the playback source.
          Logger.info('AVPlayer initialized called.');
          this.avPlayer.surfaceId = this.surfaceId;
          this.avPlayer.prepare().then(() => {
            Logger.info('AVPlayer prepare succeeded.');
          }, (err: BusinessError) => {
            Logger.error(`Invoke prepare failed, code is ${err.code}, message is ${err.message}`);
            if (this.avPlayer === undefined) {
              Logger.error(`AvPlayer is undefined`);
              return;
            }
            this.avPlayer.reset();
          });
          break;
        case CommonConstants.AV_PLAYER_PREPARED_STATE:
          // Report the state machine after the prepare interface is successfully invoked.
          this.avPlayer.videoScaleType = media.VideoScaleType.VIDEO_SCALE_TYPE_FIT;
          Logger.info('AVPlayer state prepared called.');
          this.avPlayer.play();
          break;
        case CommonConstants.AV_PLAYER_PLAYING_STATE:
          // Trigger the state machine to report after the play interface is successfully invoked.
          Logger.info('AVPlayer state playing called.');
          this.playState = true;
          break;
        case CommonConstants.AV_PLAYER_PAUSED_STATE:
          // Trigger the state machine to report after the pause function is successfully invoked.
          Logger.info('AVPlayer state paused called.');
          this.playState = false;
          break;
        case CommonConstants.AV_PLAYER_COMPLETED_STATE:
          // Trigger the state machine to report after the playback ends.
          Logger.info('AVPlayer state completed called.');
          this.avPlayer.stop();
          break;
        case CommonConstants.AV_PLAYER_STOPPED_STATE:
          // Trigger the state machine to report after the stop interface is successfully invoked.
          Logger.info('AVPlayer state stopped called.');
          break;
        case CommonConstants.AV_PLAYER_RELEASE_STATE:
          Logger.info('AVPlayer state released called.');
          break;
        case CommonConstants.AV_PLAYER_ERROR_STATE:
          Logger.error('AVPlayer state error called.');
          break;
        default:
          Logger.info('AVPlayer state unknown called.');
          break;
      }
    })
  }
}