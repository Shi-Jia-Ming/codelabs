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

import router from '@ohos.router';
import AbilityAccessCtrl, { Permissions } from '@ohos.abilityAccessCtrl';
import AudioData from '../common/bean/AudioData';
import { CommonConstants as Const } from '../common/constants/CommonConstants';
import Logger from '../common/utils/Logger';
import utils from '../common/utils/Utils';
import mediaManager from '../manager/MediaManager';
import PlayManager from '../manager/PlayManager';

import preferences from '@ohos.data.preferences';
import bundleManager from '@ohos.bundle.bundleManager';
import common from '@ohos.app.ability.common';
import promptAction from '@ohos.promptAction';

const TAG = 'MainPage';

@Entry
@Component
struct MainPage {
  @State recordList: Array<AudioData> = [];
  @State curIndex: number = -1;
  @State isChanged: boolean = false;
  @State isPlaying: boolean = false;
  @State @Watch('onPlayCompleted') isCompleted: boolean = false;
  @State @Watch('onTimeChanged') loader: number = 0;
  @State total: number = 0;
  @State time: string = '00:00:00';
  private playModel: PlayManager = new PlayManager();
  private curPlayUri: string = '';


  @State permissionFlag: boolean = false;

  async requestPermissions() {
    const permissions: Array<Permissions> = [
    Const.INTERNET,
    Const.MEDIA_LOCATION,
    Const.READ_MEDIA,
    Const.WRITE_MEDIA,
    Const.MICROPHONE
    ];
    let atManager = AbilityAccessCtrl.createAtManager();
    let context = getContext(this);
    await atManager.requestPermissionsFromUser(context, permissions).then((data) => {
      Logger.info(TAG, `Request permissions succeed, data is: ${data}`);
    }).catch((error: Error) => {
      Logger.error(TAG, `Request permissions failed, error is: ${error}`);
    });
  }

  async checkAccessToken(permission: Permissions) {
    let atManager = AbilityAccessCtrl.createAtManager();
    let grantStatus: AbilityAccessCtrl.GrantStatus;
    let tokenID: number;
    try {
      let bundleInfo: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
      let appInfo: bundleManager.ApplicationInfo = bundleInfo.appInfo;
      tokenID = appInfo.accessTokenId;
    } catch (err) {
      console.error(`getBundleInfoForSelf failed, error: ${err}`);
    }

    try {
      grantStatus = await atManager.checkAccessToken(tokenID!, permission);
    } catch (err) {
      console.error(`checkAccessToken failed, error: ${err}`);
    }
    return grantStatus!;
  }

  async checkPermissions(): Promise<void> {
    const permissions: Array<Permissions> = [
    Const.INTERNET,
    Const.MEDIA_LOCATION,
    Const.READ_MEDIA,
    Const.WRITE_MEDIA,
    Const.MICROPHONE
    ];
    for (let i = 0; i < Const.NUMBER_5; i++) {
      let grantStatus: AbilityAccessCtrl.GrantStatus = await this.checkAccessToken(permissions[i]);
      if (grantStatus !== AbilityAccessCtrl.GrantStatus.PERMISSION_GRANTED) {
        let context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;
        promptAction.showDialog({
          title: Const.TITLE,
          message: Const.MESSAGE
        })
        setTimeout(() => context.terminateSelf(), Const.TIME_1000);
      }
    }
  }

  async getAudioFiles() {
    this.recordList = await mediaManager.query();
    preferences.getPreferences(getContext(this), 'duration').then((obj: preferences.Preferences) => {
      let promise = obj;
      for (let i = 0; i < this.recordList.length; i++) {
        promise.get(this.recordList[i].name, 0, (err, val: preferences.ValueType) => {
          if (!err && val !== 0) {
            this.recordList[i].duration = Number(val);
          }
        })
      }
    })
    Logger.info(TAG, 'recordList query succeed.');
  }

  async aboutToAppear() {
    await this.requestPermissions();
    await this.checkPermissions();
    await this.getAudioFiles();
    this.playModel.init(this);
  }

  async onPageShow() {
    if (this.isChanged) {
      await this.getAudioFiles();
    }
  }

  onTimeChanged() {
    this.time = utils.duration2Time(this.loader);
  }

  onPlayCompleted() {
    if (this.isCompleted) {
      this.isPlaying = false;
    }
  }

  build() {
    Column() {
      Stack() {
        Column() {
          Text($r('app.string.EntryAbility_label'))
            .width(Const.FULL_SIZE)
            .height($r('app.float.title_height'))
            .fontSize($r('app.float.title_font_size'))
            .padding({ left: $r('app.float.title_padding'), right: $r('app.float.title_padding') })
            .margin({ top: $r('app.float.title_margin_top'), bottom: $r('app.float.title_margin_bottom') })

          List() {
            ForEach(this.recordList, (item: AudioData, index?: number) => {
              ListItem() {
                Column() {
                  Row() {
                    Column() {
                      Text(item.name)
                        .fontSize($r('app.float.audio_title_font_size'))
                        .width(Const.FULL_SIZE)
                        .height($r('app.float.audio_title_height'))
                        .margin({ top: $r('app.float.audio_title_margin_top'), bottom: $r('app.float.audio_title_margin_bottom')})
                      Text(utils.timestamp2Time(item.time))
                        .fontSize($r('app.float.audio_time_font_size'))
                        .width(Const.FULL_SIZE)
                        .height($r('app.float.audio_time_height'))
                        .margin({ bottom: $r('app.float.audio_time_margin') })
                    }
                    .width($r('app.float.audio_data_width'))

                    Row() {
                      Image(index === this.curIndex ?
                        (this.isPlaying ? $r('app.media.ic_pause') : $r('app.media.ic_play')) : $r('app.media.ic_play'))
                        .width($r('app.float.audio_little_icon_size'))
                        .height($r('app.float.audio_little_icon_size'))
                        .onClick(() => {
                          this.curIndex = this.recordList.indexOf(item);
                          if (!this.isPlaying) {
                            if (this.curPlayUri === '' || this.curPlayUri === item.uri) {
                              this.curPlayUri = item.uri;
                              this.playModel.play(this.curPlayUri);
                            } else {
                              this.loader = 0;
                              this.time = '00:00:00';
                              this.curPlayUri = item.uri;
                              this.playModel.play(this.curPlayUri, true);
                            }
                            this.isCompleted = false;
                            this.isPlaying = true;
                          } else {
                            this.playModel.pause();
                            if (this.curPlayUri === item.uri) {
                              this.isPlaying = false;
                            } else {
                              this.loader = 0;
                              this.time = '00:00:00';
                              this.curPlayUri = item.uri;
                              this.playModel.play(this.curPlayUri, true);
                            }
                          }
                        })
                    }
                    .width($r('app.float.audio_play_row_width'))
                    .height($r('app.float.audio_play_row_height'))
                    .justifyContent(FlexAlign.End)
                  }
                  .width(Const.FULL_SIZE)
                  .justifyContent(FlexAlign.SpaceBetween)

                  if (index === this.curIndex) {
                    Column() {
                      Progress({ value: this.loader / Const.TIME_1000, total: this.total / Const.TIME_1000 })
                        .height($r('app.float.progress_height'))
                        .margin({ top: $r('app.float.progress_margin'), bottom: $r('app.float.progress_margin') })
                        .width(Const.FULL_SIZE)
                    }
                    .width(Const.FULL_SIZE)
                    .height($r('app.float.progress_column_height'))

                    Row() {
                      Text(this.time)
                        .fontSize($r('app.float.progress_time_font_size'))

                      Text(utils.duration2Time(this.total))
                        .fontSize($r('app.float.progress_time_font_size'))
                    }
                    .width(Const.FULL_SIZE)
                    .height($r('app.float.progress_row_height'))
                    .margin({ bottom: $r('app.float.progress_row_margin') })
                    .justifyContent(FlexAlign.SpaceBetween)
                  }
                }
                .width(Const.FULL_SIZE)
                .height(Const.FULL_SIZE)
              }
              .width(Const.FULL_SIZE)
              .height(index === this.curIndex ? $r('app.float.audio_item_height_open') : $r('app.float.audio_item_height'))
              .borderRadius($r('app.float.audio_item_border_radius'))
              .backgroundColor(Color.White)
              .padding({
                top: $r('app.float.audio_item_padding_top'),
                bottom: $r('app.float.audio_item_padding_top'),
                left: $r('app.float.audio_item_padding_left'),
                right: $r('app.float.audio_item_padding_left')
              })
              .margin({ bottom: $r('app.float.audio_item_margin_bottom') })
              .onClick(() => {
                this.playModel.pause();
                this.isPlaying = false;
                router.pushUrl({
                  url: 'pages/PlayPage',
                  params: {
                    name: item.name,
                    uri: item.uri,
                    duration: item.duration
                  }
                });
              })
            }, (item: AudioData) => JSON.stringify(item))
          }
          .width(Const.FULL_SIZE)
          .height(Const.FULL_SIZE)
          .padding({ left: $r('app.float.audio_list_padding'), right: $r('app.float.audio_list_padding') })
          .layoutWeight(1)
        }
        .width(Const.FULL_SIZE)
        .height(Const.FULL_SIZE)

        Button() {
          Image($r('app.media.ic_record'))
        }
        .width($r('app.float.button_size'))
        .height($r('app.float.button_size'))
        .markAnchor({ x: $r('app.float.button_mark_anchor'), y: 0 })
        .position({ x: Const.POSITION_X, y: Const.POSITION_Y})
        .backgroundColor($r('app.color.background_color'))
        .onClick(() => {
          this.playModel.pause();
          this.isPlaying = false;
          router.pushUrl({ url: 'pages/RecordPage' });
          this.isChanged = true;
        })
      }
      .width(Const.FULL_SIZE)
      .height(Const.FULL_SIZE)
      .backgroundColor($r('app.color.background_color'))
    }
  }
}