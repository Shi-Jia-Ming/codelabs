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
import notification from '@ohos.notificationManager';
import wantAgent, { WantAgent } from '@ohos.app.ability.wantAgent';
import promptAction from '@ohos.promptAction';
import { createWantAgent, publishNotification, openNotificationPermission } from '../common/utils/NotificationUtil';
import { getStringByRes } from '../common/utils/ResourseUtil';
import Logger from '../common/utils/Logger';
import CommonConstants, { DOWNLOAD_STATUS } from '../common/constants/CommonConstants';

@Entry
@Component
struct MainPage {
  @State downloadStatus: number = DOWNLOAD_STATUS.INITIAL;
  @State downloadProgress: number = 0;
  private context = getContext(this) as common.UIAbilityContext;
  private isSupport: boolean = true;
  private notificationTitle: string = '';
  private wantAgentObj: WantAgent = new Object();
  private interval: number = -1;

  aboutToAppear() {
    openNotificationPermission();
    let bundleName = this.context.abilityInfo.bundleName;
    let abilityName = this.context.abilityInfo.name;
    createWantAgent(bundleName, abilityName).then(want => {
      this.wantAgentObj = want;
    }).catch((err: Error) => {
      Logger.error(`getWantAgent fail, err: ${JSON.stringify(err)}`);
    });
    notification.isSupportTemplate('downloadTemplate').then(isSupport => {
      if (!isSupport) {
        promptAction.showToast({
          message: $r('app.string.invalid_button_toast')
        })
      }
      this.isSupport = isSupport;
    });
  }

  onBackPress() {
    this.cancel();
  }

  build() {
    Column() {
      Text($r('app.string.title'))
        .fontSize($r('app.float.title_font_size'))
        .fontWeight(CommonConstants.FONT_WEIGHT_LAGER)
        .width(CommonConstants.TITLE_WIDTH)
        .textAlign(TextAlign.Start)
        .margin({
          top: $r('app.float.title_margin_top'),
          bottom: $r('app.float.title_margin_top')
        })
      Row() {
        Column() {
          Image($r('app.media.ic_image'))
            .objectFit(ImageFit.Fill)
            .width($r('app.float.card_image_length'))
            .height($r('app.float.card_image_length'))
        }
        .layoutWeight(CommonConstants.IMAGE_WEIGHT)
        .height(CommonConstants.FULL_LENGTH)
        .alignItems(HorizontalAlign.Start)

        Column() {
          Row() {
            Text(CommonConstants.DOWNLOAD_FILE)
              .fontSize($r('app.float.name_font_size'))
              .textAlign(TextAlign.Center)
              .fontWeight(CommonConstants.FONT_WEIGHT_LAGER)
              .lineHeight($r('app.float.name_font_height'))
            Text(`${this.downloadProgress}%`)
              .fontSize($r('app.float.normal_font_size'))
              .lineHeight($r('app.float.name_font_height'))
              .opacity(CommonConstants.FONT_OPACITY)
          }
          .justifyContent(FlexAlign.SpaceBetween)
          .width(CommonConstants.FULL_LENGTH)

          Progress({
            value: this.downloadProgress,
            total: CommonConstants.PROGRESS_TOTAL
          })
            .width(CommonConstants.FULL_LENGTH)
          Row() {
            Text(CommonConstants.FILE_SIZE)
              .fontSize($r('app.float.normal_font_size'))
              .lineHeight($r('app.float.name_font_height'))
              .opacity(CommonConstants.FONT_OPACITY)
            if (this.downloadStatus === DOWNLOAD_STATUS.INITIAL) {
              this.customButton($r('app.string.button_download'), (): Promise<void> => this.start())
            } else if (this.downloadStatus === DOWNLOAD_STATUS.DOWNLOADING) {
              Row() {
                this.cancelButton()
                this.customButton($r('app.string.button_pause'), (): Promise<void> => this.pause())
              }
            } else if (this.downloadStatus === DOWNLOAD_STATUS.PAUSE) {
              Row() {
                this.cancelButton()
                this.customButton($r('app.string.button_resume'), (): Promise<void> => this.resume())
              }
            } else {
              this.customButton($r('app.string.button_finish'), (): void => this.open())
            }
          }
          .width(CommonConstants.FULL_LENGTH)
          .justifyContent(FlexAlign.SpaceBetween)
        }
        .layoutWeight(CommonConstants.CARD_CONTENT_WEIGHT)
        .height(CommonConstants.FULL_LENGTH)
        .justifyContent(FlexAlign.SpaceBetween)
      }
      .width(CommonConstants.CARD_WIDTH)
      .height($r('app.float.card_height'))
      .backgroundColor(Color.White)
      .borderRadius($r('app.float.card_border_radius'))
      .justifyContent(FlexAlign.SpaceBetween)
      .padding($r('app.float.card_padding'))
    }
    .width(CommonConstants.FULL_LENGTH)
    .height(CommonConstants.FULL_LENGTH)
    .backgroundColor($r('app.color.index_background_color'))
  }

  /**
   * Start the timer and send notification.
   */
  download() {
    this.interval = setInterval(async () => {
      if (this.downloadProgress === CommonConstants.PROGRESS_TOTAL) {
        this.notificationTitle = await getStringByRes($r('app.string.notification_title_finish'), this);
        this.downloadStatus = DOWNLOAD_STATUS.FINISHED;
        clearInterval(this.interval);
      } else {
        this.downloadProgress += CommonConstants.PROGRESS_SPEED;
      }
      if (this.isSupport) {
        publishNotification(this.downloadProgress, this.notificationTitle, this.wantAgentObj);
      }
    }, CommonConstants.UPDATE_FREQUENCY);
  }

  /**
   * Click to download.
   */
  async start() {
    this.notificationTitle = await getStringByRes($r('app.string.notification_title_download'), this);
    this.downloadStatus = DOWNLOAD_STATUS.DOWNLOADING;
    this.downloadProgress = 0;
    this.download();
  }

  /**
   * Click pause.
   */
  async pause() {
    this.notificationTitle = await getStringByRes($r('app.string.notification_title_pause'), this);
    clearInterval(this.interval);
    this.downloadStatus = DOWNLOAD_STATUS.PAUSE;
    if (this.isSupport) {
      publishNotification(this.downloadProgress, this.notificationTitle, this.wantAgentObj);
    }
  }

  /**
   * Click resume.
   */
  async resume() {
    this.notificationTitle = await getStringByRes($r('app.string.notification_title_download'), this);
    this.download();
    this.downloadStatus = DOWNLOAD_STATUS.DOWNLOADING;
  }

  /**
   * Click cancel.
   */
  async cancel() {
    this.downloadProgress = 0;
    clearInterval(this.interval);
    this.downloadStatus = DOWNLOAD_STATUS.INITIAL;
    notification.cancel(CommonConstants.NOTIFICATION_ID);
  }

  /**
   * Open file
   */
  open() {
    promptAction.showToast({
      message: $r('app.string.invalid_button_toast')
    })
  }

  @Builder
  customButton(textResource: Resource, click: Function = () => {
  }) {
    Button(textResource)
      .backgroundColor($r('app.color.button_color'))
      .buttonStyle()
      .onClick(() => {
        click();
      })
  }

  @Builder
  cancelButton() {
    Button($r('app.string.button_cancel'))
      .buttonStyle()
      .backgroundColor($r('app.color.cancel_button_color'))
      .fontColor($r('app.color.button_color'))
      .margin({ right: $r('app.float.button_margin') })
      .onClick(() => {
        this.cancel();
      })
  }
}

@Extend(Button)
function buttonStyle() {
  .constraintSize({ minWidth: $r('app.float.button_width') })
  .height($r('app.float.button_height'))
  .borderRadius($r('app.float.button_border_radius'))
  .fontSize($r('app.float.button_font_size'))
}