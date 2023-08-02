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
import formProvider from '@ohos.app.form.formProvider';
import formBindingData from '@ohos.app.form.formBindingData';
import SongItemBuilder from './SongItemBuilder';
import { AudioPlayerState, MusicPlayMode } from '../viewmodel/MusicData';
import { SongItem } from '../bean/SongData';
import { PreferencesUtil } from './PreferencesUtil';
import { CardData } from '../bean/CardData';
import { BackgroundUtil } from './BackgroundUtil';
import { MediaTools } from './MediaTools';
import { SongConstants } from '@ohos/constantsCommon';
import { Logger } from './Logger';
import { MusicList } from '../viewmodel/MusicList';

const TAG = 'MediaService';

export class MediaService {
  private context: common.UIAbilityContext = AppStorage.Get('context');
  public avPlayer: media.AVPlayer;
  private songItemBuilder: SongItemBuilder;
  private songItem: SongItem;
  private playMode: MusicPlayMode = MusicPlayMode.ORDER;
  private state: AudioPlayerState = AudioPlayerState.IDLE;
  private isFirst: boolean = true;
  private isPrepared: boolean = false;
  private musicIndex: number = 0;
  private songList: SongItem[] = MusicList;
  private formIds: string[];
  private isCurrent: boolean= true;

  constructor() {
    this.songItemBuilder = new SongItemBuilder();
    this.initAudioPlayer();
  }

  public static getInstance(): MediaService {
    let mediaService: MediaService = AppStorage.Get('mediaService');
    if (!mediaService) {
      mediaService = new MediaService();
      AppStorage.SetOrCreate('mediaService', mediaService);
    }
    return mediaService;
  }

  private initAudioPlayer() {
    media.createAVPlayer().then(async avPlayer => {
      if (avPlayer !== null) {
        this.avPlayer = avPlayer;
        this.setAVPlayerCallback();
      }
    }, error => Logger.error(TAG, 'this avPlayer: ', `error happened,error Name is ${JSON.stringify(error)}`))
      .catch(error => Logger.error(TAG, 'this avPlayer: ', `catch error happened,error Name is ${JSON.stringify(error)}`))
  }

  private setAVPlayerCallback() {
    this.avPlayer.on('seekDone', (seekDoneTime) => {
      this.isCurrent = true;
      Logger.info(TAG, `AVPlayer seek succeeded, seek time is ${seekDoneTime}`);
    });

    this.avPlayer.on('error', (err) => {
      Logger.error(TAG, `Invoke avPlayer failed, code is ${err.code}, message is ${err.message}`);
      this.avPlayer.reset();
    });

    this.avPlayer.on('timeUpdate', (updateTime) => {
      if (this.isCurrent) {
        AppStorage.SetOrCreate('currentTime', MediaTools.msToCountdownTime(updateTime));
        AppStorage.SetOrCreate<number>('progress', updateTime);
      }
    });

    this.avPlayer.on("stateChange", async (state) => {
      switch (state) {
        case 'idle':
          Logger.info(TAG, 'AVPlayer state idle called.');
          this.state = AudioPlayerState.IDLE;
          this.songItem = await this.songItemBuilder.build(this.songList[this.musicIndex]);
          this.avPlayer.fdSrc = this.songItemBuilder.getRealUrl();
          Logger.info(TAG, 'loadAsset avPlayer.url:' + this.avPlayer.fdSrc);
          break;
        case 'initialized':
          Logger.info(TAG, 'AVPlayer state initialized called.');
          this.state = AudioPlayerState.INITIALIZED;
          this.avPlayer.prepare().then(() => {
            Logger.info(TAG, 'AVPlayer prepare succeeded.');
          }, (err) => {
            Logger.error(TAG, `Invoke prepare failed, code is ${err.code}, message is ${err.message}`);
          });
          break;
        case 'prepared':
          Logger.info(TAG, 'AVPlayer state prepared called.');
          this.state = AudioPlayerState.PREPARED;
          this.isPrepared = true;
          AppStorage.SetOrCreate('totalTime', MediaTools.msToCountdownTime(this.getDuration()));
          AppStorage.SetOrCreate('progressMax', this.getDuration());
          this.avPlayer.play();
          Logger.info(TAG, 'AVPlayer prepared succeeded.');
          break;
        case 'playing':
          Logger.info(TAG, 'AVPlayer state playing called.');
          this.state = AudioPlayerState.PLAY;
          break;
        case 'paused':
          Logger.info(TAG, 'AVPlayer state paused called.');
          this.state = AudioPlayerState.PAUSE;
          break;
        case 'completed':
          Logger.info(TAG, 'AVPlayer state completed called.');
          this.state = AudioPlayerState.COMPLETED;
          this.playNextAuto(false);
          break;
        case 'stopped':
          Logger.info(TAG, 'AVPlayer state stopped called.');
          this.state = AudioPlayerState.STOP;
          this.avPlayer.reset();
          break;
        case 'released':
          Logger.info(TAG, 'AVPlayer state released called.');
          this.state = AudioPlayerState.RELEASED;
          break;
        default:
          Logger.info(TAG, 'AVPlayer state unknown called.');
          this.state = AudioPlayerState.UNKNOWN;
          break;
      }
      this.updateCardData();
      this.updateIsPlay(this.state == AudioPlayerState.PLAY);
    })
  }

  /**
   * Play music by index.
   *
   * @param musicIndex
   */
  async loadAssent(musicIndex: number) {
    if (musicIndex >= this.songList.length) {
      Logger.error(TAG, `current musicIndex ${musicIndex}`);
      return;
    }
    BackgroundUtil.startContinuousTask(this.context);
    this.updateMusicIndex(musicIndex);
    if (this.isFirst) {
      this.isFirst = false;
      this.songItem = await this.songItemBuilder.build(this.songList[this.musicIndex]);
      this.avPlayer.fdSrc = this.songItemBuilder.getRealUrl();
    } else {
      await this.stop();
      if (this.songItem === null || this.songItem.src !== this.songList[this.musicIndex].src) {
        await this.reset();
      }
    }
  }

  /**
   * Get whether the music is played for the first.
   *
   * @returns isFirst
   */
  public getFirst() {
    return this.isFirst;
  }

  /**
   * Set music play mode.
   *
   * @param playMode
   */
  public setPlayModel(playMode: MusicPlayMode) {
    this.playMode = playMode;
    Logger.info(TAG, 'setPlayModel mode: ' + this.playMode);
  }

  /**
   * Get music play mode.
   *
   * @returns playMode.
   */
  public getPlayMode() {
    return this.playMode;
  }

  private updateIsPlay(isPlay: boolean) {
    AppStorage.SetOrCreate<boolean>('isPlay', isPlay);
  }

  /**
   * Seek play music.
   *
   * @param ms.
   */
  public seek(ms: number) {
    if (this.isPrepared && this.state != AudioPlayerState.ERROR) {
      let seekMode = this.getCurrentTime() < ms ? 0 : 1;
      let realTime = (ms <= 0 ? 0 : (ms >= this.getDuration() ? this.getDuration() : ms));
      this.isCurrent = false;
      this.avPlayer.seek(realTime, seekMode);
    }
  }

  private getCurrentTime() {
    if (this.isPrepared) {
      return this.avPlayer.currentTime;
    }
    return 0;
  }

  private getDuration() {
    if (this.isPrepared) {
      return this.avPlayer.duration;
    }
    return 0;
  }

  private start(seekMs?: number) {
    Logger.info(TAG, 'AVPlayer play() isPrepared:' + this.isPrepared + ', state:' + this.state + '，seek:' + seekMs);
    this.avPlayer.prepare().then(() => {
    }).catch((error) => {
      Logger.error(TAG, `start error ${JSON.stringify(error)}`)
      this.state = AudioPlayerState.ERROR;
      this.updateIsPlay(false);
      this.isPrepared = false;
    });
  }

  /**
   * Play music.
   */
  public async play() {
    Logger.info(TAG, 'AVPlayer play() isPrepared:' + this.isPrepared + ', state:' + this.state);
    BackgroundUtil.startContinuousTask(this.context);
    if (!this.isPrepared) {
      this.start(0);
    } else {
      this.avPlayer.play().then(() => {
        Logger.info(TAG, 'progressTime play() current time:' + this.getCurrentTime());
        this.seek(this.getCurrentTime());
        this.updateIsPlay(true);
        this.state = AudioPlayerState.PLAY;
      })
    }
  }

  /**
   * Pause music.
   */
  public pause() {
    Logger.info(TAG, 'AVPlayer pause() isPrepared:' + this.isPrepared + ', state:' + this.state);
    if (this.isPrepared && this.state == AudioPlayerState.PLAY) {
      this.avPlayer.pause().then(() => {
        this.state = AudioPlayerState.PAUSE;
        this.updateIsPlay(false);
      });
    }
  }

  /**
   * Play next music.
   *
   * @param isFromControl
   */
  public playNextAuto(isFromControl: boolean) {
    Logger.info(TAG, 'playNextAuto mode:' + this.playMode);
    switch (this.playMode) {
      case MusicPlayMode.SINGLE_CYCLE:
        if (isFromControl) {
          this.playNext();
        } else {
          this.avPlayer.play();
        }
        break;
      case MusicPlayMode.ORDER:
        this.playNext();
        break;
      case MusicPlayMode.RANDOM:
        this.playRandom();
        break;
      default:
        break;
    }
  }

  private playNext() {
    Logger.info(TAG, 'playNext Index:' + this.musicIndex + ', length-1:' + (this.songList.length - 1));
    if (this.musicIndex === this.songList.length - 1) {
      this.loadAssent(0);
    } else {
      this.loadAssent(this.musicIndex + 1);
    }
  }

  /**
   * Play previous music.
   */
  public playPrevious() {
    switch (this.playMode) {
      case MusicPlayMode.RANDOM:
        this.playRandom();
        break;
      case MusicPlayMode.ORDER:
      case MusicPlayMode.SINGLE_CYCLE:
        if (this.musicIndex === 0) {
          this.updateMusicIndex(this.songList.length - 1);
        } else {
          this.updateMusicIndex(this.musicIndex - 1);
        }
        Logger.info(TAG, 'setLastIndex:' + this.musicIndex);
        this.loadAssent(this.musicIndex);
        break;
    }
  }

  private playRandom() {
    let num = Math.round(Math.random() * (this.songList.length - 1));
    if (this.musicIndex === num) {
      this.playRandom();
    } else {
      this.updateMusicIndex(num);
      this.loadAssent(num);
    }
    Logger.info(TAG, 'play Random:' + this.musicIndex);
  }

  /**
   * Stop music
   */
  public async stop() {
    Logger.info(TAG, 'stop()');
    if (this.isPrepared) {
      await this.avPlayer.stop();
      this.updateIsPlay(false);
      this.state = AudioPlayerState.PAUSE;
    }
  }

  private async reset() {
    Logger.info(TAG, 'reset()');
    await this.songItemBuilder.release();
    await this.avPlayer.reset();
    this.isPrepared = false;
  }

  /**
   * release avPlayer.
   */
  public release() {
    this.updateIsPlay(false);
    this.stop();
    this.reset();
    this.avPlayer.release();
    this.state = AudioPlayerState.IDLE;
    BackgroundUtil.stopContinuousTask(this.context);
  }

  private updateMusicIndex(musicIndex: number) {
    Logger.info(TAG, 'updateMusicIndex ===> ' + musicIndex);
    AppStorage.SetOrCreate('selectIndex', musicIndex);
    if (this.musicIndex != musicIndex) {
      this.musicIndex = musicIndex;
    }
  }

  /**
   * Update card data.
   */
  public async updateCardData() {
    try {
      PreferencesUtil.getInstance().removePreferencesFromCache(this.context);
      this.formIds = await PreferencesUtil.getInstance().getFormIds(this.context);
      if (this.formIds === null || this.formIds === undefined) {
        Logger.error(TAG, 'WANG formIds is null');
        return;
      }

      let cardSongList: Array<SongItem> = [];
      if (this.musicIndex + SongConstants.ADD_INDEX_ONE === this.songList.length) {
        cardSongList = this.songList.slice(SongConstants.SLICE_START_ZERO, SongConstants.SLICE_END_THREE);
      } else if (this.musicIndex + SongConstants.ADD_INDEX_TWO === this.songList.length) {
        cardSongList.push(this.songList[this.songList.length - 1]);
        cardSongList.push(this.songList[0]);
        cardSongList.push(this.songList[1]);
      } else if (this.musicIndex + SongConstants.ADD_INDEX_THREE === this.songList.length) {
        cardSongList = this.songList.slice(this.songList.length - SongConstants.SLICE_INDEX_TWO,
          this.songList.length);
        cardSongList.push(this.songList[0]);
      } else {
        cardSongList = this.songList.slice(this.musicIndex + SongConstants.SLICE_INDEX_ONE,
          this.musicIndex + SongConstants.SLICE_INDEX_FOUR);
      }
      let formData: CardData = {
        'isPlay': this.state === AudioPlayerState.PLAY,
        'musicName': this.songList[this.musicIndex].title,
        'musicCover': this.songList[this.musicIndex].label,
        'musicSinger': this.songList[this.musicIndex].singer,
        'cardSongList': cardSongList
      }
      let formInfo = formBindingData.createFormBindingData(formData);

      this.formIds.forEach(formId => {
        formProvider.updateForm(formId, formInfo).then(() => {
          Logger.info(TAG, 'WANG updateForm data succeed' + ', formId:' + formId);
        }).catch((error) => {
          Logger.error(TAG, 'updateForm err:' + JSON.stringify(error));
          if (error.code === SongConstants.ID_NO_EXIT) {
            PreferencesUtil.getInstance().removeFormId(this.context, formId);
          }
        })
      })
    } catch (e) {
      Logger.error(TAG, 'updateCardData err:' + JSON.stringify(e));
    }
  }

  /**
   * Update card data on destroy.
   */
  public async updateOnDestroy() {
    if (this.formIds === null || this.formIds === undefined) {
      Logger.error(TAG, 'formIds is null');
      return;
    }
    let formData = {
      'isPlay': false
    }
    let formInfo = formBindingData.createFormBindingData(formData);
    this.formIds.forEach(async formId => {
      await formProvider.updateForm(formId, formInfo);
    })
  }
}