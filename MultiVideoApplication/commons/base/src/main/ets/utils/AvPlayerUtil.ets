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

import media from '@ohos.multimedia.media';
import common from '@ohos.app.ability.common';
import resourceManager from '@ohos.resourceManager';
import { BusinessError } from '@ohos.base';
import Logger from './Logger';
import { CommonConstants } from '../constants/CommonConstants';

export class AvPlayerUtil {
  private avPlayer?: media.AVPlayer;
  private context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;
  private url: resourceManager.RawFileDescriptor | null = null;
  private playState: boolean = true;
  private surfaceId: string = '';
  private sliderBegin: number = 0;
  private startTime: number = 0;

  async createAvPlayer(surfaceId: string, isFullScreen: boolean): Promise<void> {
    if (this.avPlayer === undefined || this.avPlayer.state === CommonConstants.AV_PLAYER_RELEASE_STATE) {
      this.avPlayer = await media.createAVPlayer();
      this.surfaceId = surfaceId;
      Logger.info('Created AvPlayer successfully.');
      // Entering idle state.
      this.url = await this.context.createModuleContext(CommonConstants.VIDEO_DETAIL_HSP_NAME).resourceManager
        .getRawFd(CommonConstants.PRODUCT_VIDEO_NAME);
      this.avPlayer.fdSrc = this.url;
      this.setAVPlayerCallback(isFullScreen);
    } else {
      Logger.info(`AvPlayer has been created`);
    }
  }

  setAVPlayerCallback(isFullScreen: boolean): void {
    if (this.avPlayer === undefined) {
      Logger.error(`AvPlayer is undefined`);
      return;
    }
    this.avPlayer.on(`error`, (err) => {
      Logger.error(`Invoke avPlayer failed, code is ${err.code}, message is ${err.message}`);
      if (this.avPlayer === undefined) {
        Logger.error(`AvPlayer is undefined`);
        return;
      }
      this.avPlayer.reset();
    });
    this.onTimeUpdate();
    this.setStateChange(isFullScreen);
  }

  onTimeUpdate(): void {
    if (this.avPlayer === undefined) {
      Logger.error(`AvPlayer is undefined`);
      return;
    }
    this.avPlayer.on('timeUpdate', (updateTime: number) => {
      if (this.avPlayer === undefined) {
        Logger.error(`AvPlayer is undefined`);
        return;
      }
      AppStorage.setOrCreate<string>(CommonConstants.AV_PLAYER_CURRENT_TIME, this.formatTime(updateTime));
      AppStorage.setOrCreate<number>(CommonConstants.AV_PLAYER_PROGRESS, updateTime / this.avPlayer.duration *
      CommonConstants.PROGRESS_HUNDRED);
    });
  }

  offTimeUpdate(): void {
    if (this.avPlayer === undefined) {
      Logger.error(`AvPlayer is undefined`);
      return;
    }
    this.avPlayer.off('timeUpdate');
  }

  setStateChange(isFullScreen: boolean): void {
    if (this.avPlayer === undefined) {
      Logger.error(`AvPlayer is undefined`);
      return;
    }
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
          this.avPlayer.videoScaleType = media.VideoScaleType.VIDEO_SCALE_TYPE_FIT;
          Logger.info('AVPlayer state prepared called.');
          this.seekToStart();
          this.avPlayer.play();
          AppStorage.setOrCreate<string>(CommonConstants.AV_PLAYER_TOTAL_TIME, this.formatTime(this.avPlayer.duration));
          break;
        case CommonConstants.AV_PLAYER_PLAYING_STATE:
          Logger.info('AVPlayer state playing called.');
          this.playState = true;
          if (isFullScreen) {
            AppStorage.setOrCreate<boolean>('fullScreenPlayState', this.playState);
          }
          this.seekToStart();
          break;
        case CommonConstants.AV_PLAYER_PAUSED_STATE:
          Logger.info('AVPlayer state paused called.');
          this.playState = false;
          if (isFullScreen) {
            AppStorage.setOrCreate<boolean>('fullScreenPlayState', this.playState);
          }
          this.seekToStart();
          break;
        case CommonConstants.AV_PLAYER_COMPLETED_STATE:
          Logger.info('AVPlayer state completed called.');
          this.playState = false;
          if (isFullScreen) {
            AppStorage.setOrCreate<boolean>('fullScreenPlayState', this.playState);
          }
          this.avPlayer.stop();
          break;
        case CommonConstants.AV_PLAYER_STOPPED_STATE:
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

  setStartTime(startTime: number): void {
    this.startTime = startTime;
  }

  seekToStart(): void {
    if (this.startTime != 0 && this.avPlayer !== undefined) {
      this.avPlayer.seek(this.startTime);
      this.startTime = 0;
    } else {
      Logger.info(`Video is played from the beginning`);
    }
  }

  release(): void {
    if (this.avPlayer !== undefined && this.avPlayer.state !== CommonConstants.AV_PLAYER_RELEASE_STATE) {
      this.avPlayer.release();
    } else {
      Logger.info(`AvPlayer release failed`);
    }
  }

  sliderChange(value: number, mode: SliderChangeMode): void {
    let seekType: media.SeekMode = value > this.sliderBegin ? media.SeekMode.SEEK_PREV_SYNC :
      media.SeekMode.SEEK_NEXT_SYNC;
    if (this.avPlayer === undefined) {
      Logger.error(`AvPlayer is undefined`);
      return;
    }
    switch (mode) {
      case SliderChangeMode.Begin:
        this.sliderBegin = value;
        this.avPlayer.pause();
        break;
      case SliderChangeMode.Moving:
        this.avPlayer.seek(value / CommonConstants.PROGRESS_HUNDRED * this.avPlayer.duration, seekType);
        break;
      case SliderChangeMode.End:
        this.avPlayer.play();
        break;
      case SliderChangeMode.Click:
        this.avPlayer.seek(this.sliderBegin / CommonConstants.PROGRESS_HUNDRED * this.avPlayer.duration, seekType);
        break;
      default:
        break;
    }
  }

  playerStateControl(): void {
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
  }

  play(): void {
    if (this.avPlayer !== undefined && this.playState === false) {
      this.avPlayer.play();
    } else {
      Logger.info(`AvPlayer play failed`);
    }
  }

  pause(): void {
    if (this.avPlayer !== undefined && this.playState === true) {
      this.avPlayer.pause();
    } else {
      Logger.info(`AvPlayer pause failed`);
    }
  }

  getCurrentTime(): number | void {
    if (this.avPlayer === undefined) {
      Logger.error(`AvPlayer is undefined`);
      return;
    }
    return this.avPlayer.currentTime;
  }

  formatTime(duration: number): string {
    let totalSecond: number = Math.round(duration / CommonConstants.PROGRESS_THOUSAND);
    let hourNum: number = Math.floor(totalSecond / CommonConstants.SECOND_IN_HOUR);
    let minNum: number = Math.floor((totalSecond % CommonConstants.SECOND_IN_HOUR) / CommonConstants.SECOND_IN_MINUTE);
    let secNum: number = (totalSecond % CommonConstants.SECOND_IN_HOUR) % CommonConstants.SECOND_IN_MINUTE;
    return this.formatUnitTime(hourNum) + CommonConstants.COLON + this.formatUnitTime(minNum) + CommonConstants.COLON +
      this.formatUnitTime(secNum);
  }

  formatUnitTime(time: number): string {
    if (time >= CommonConstants.ONE && time < CommonConstants.TEN) {
      let zero: string = CommonConstants.TIME_PREFIX;
      return zero.concat(time.toString());
    } else if (time >= CommonConstants.ZERO && time < CommonConstants.ONE) {
      return CommonConstants.EMPTY_TIME;
    }
    return time.toString();
  }
}