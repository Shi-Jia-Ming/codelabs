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

import { BreakpointConstants, CommonConstants } from '@ohos/commons';
import { AvPlayerUtil, DeviceScreen, Logger, WindowUtil } from '@ohos/commons';
import router from '@ohos.router';
import { PlayerConstants } from '../constants/PlayerConstants';
import { FooterEpisodes } from '../view/FooterEpisodes';
import { SideEpisodes } from '../view/SideEpisodes';

@Entry
@Component
struct Index {
  @StorageLink('currentBreakpoint') currentBreakpoint: string = BreakpointConstants.BREAKPOINT_LG;
  @StorageLink('currentTime') currentTime: string = CommonConstants.INITIAL_TIME;
  @StorageLink('totalTime') totalTime: string = CommonConstants.INITIAL_TIME;
  @StorageLink('progress') progress: number = 0;
  @StorageLink('fullScreenPlayState') fullScreenPlayState: boolean = true;
  @State isShowingSideBar: boolean = false;
  @State screenWidth: number = DeviceScreen.getDeviceWidth();
  private windowUtil?: WindowUtil;
  private avPlayerUtil: AvPlayerUtil = new AvPlayerUtil();
  private xComponentController: XComponentController = new XComponentController();
  private surfaceId: string = '';

  aboutToAppear() {
    this.windowUtil = WindowUtil.getInstance();
    if (this.windowUtil !== undefined && this.screenWidth < BreakpointConstants.MIDDLE_DEVICE_WIDTH) {
      this.windowUtil.setMainWindowLandscape();
    } else {
      Logger.info(`Full-screen display in portrait mode`);
    }
    this.avPlayerUtil.setStartTime((router.getParams() as Record<string, number>).currentTime);
  }

  aboutToDisappear() {
    this.avPlayerUtil.offTimeUpdate();
    this.avPlayerUtil.release();
    if (this.windowUtil !== undefined && this.screenWidth < BreakpointConstants.MIDDLE_DEVICE_WIDTH) {
      this.windowUtil.setFullScreenBack();
    } else {
      Logger.info(`Normal return in portrait mode`);
    }
  }

  build() {
    Row() {
      Column() {
        Stack({ alignContent: Alignment.Center }) {
          Row() {
            XComponent({
              id: PlayerConstants.X_COMPONENT_ID,
              type: XComponentType.SURFACE,
              controller: this.xComponentController
            })
              .onLoad(() => {
                this.xComponentController.setXComponentSurfaceSize({ surfaceWidth:
                  CommonConstants.X_COMPONENT_SURFACE_WIDTH, surfaceHeight: CommonConstants.X_COMPONENT_SURFACE_HEIGHT
                  });
                this.surfaceId = this.xComponentController.getXComponentSurfaceId();
                this.avPlayerUtil.createAvPlayer(this.surfaceId, true);
              })
              .width(CommonConstants.FULL_PERCENT)
              .height(CommonConstants.FULL_PERCENT)
              .aspectRatio(CommonConstants.VIDEO_ASPECT_RATIO)
          }
          .width(CommonConstants.FULL_PERCENT)
          .height(CommonConstants.FULL_PERCENT)
          .onClick(() => {
            if (this.isShowingSideBar === true) {
              this.isShowingSideBar = false;
            }
          })

          Column() {
            Row() {
              TimeText({ time: $currentTime })
                .margin({
                  left: $r('app.float.current_time_left'),
                  right: $r('app.float.current_time_right')
                })

              Slider({ min: 0, max: CommonConstants.PROGRESS_HUNDRED, step: 1, value: this.progress })
                .onChange((value: number, mode: SliderChangeMode) => {
                  this.avPlayerUtil.sliderChange(value, mode);
                })
                .layoutWeight(1)

              TimeText({ time: $totalTime })
                .margin({
                  left: $r('app.float.total_time_left'),
                  right: $r('app.float.total_time_right')
                })
            }
            .width(CommonConstants.FULL_PERCENT)
            .height($r('app.float.time_row_height'))
            .alignItems(VerticalAlign.Center)

            Row() {
              Row() {
                Image(this.fullScreenPlayState === true ? $r('app.media.ic_public_pause') :
                  $r('app.media.ic_public_play'))
                  .height($r('app.float.icon_size'))
                  .width($r('app.float.icon_size'))
                  .margin({ left: $r('app.float.icon_margin') })
                  .onClick(() => {
                    this.avPlayerUtil.playerStateControl();
                  })
                ImgIcon({ img: $r('app.media.ic_public_play_next') })
                ImgIcon({ img: $r('app.media.ic_public_view_list_white') })
              }
              .margin({
                top: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ? '0' : $r('app.float.icon_row_top'),
                bottom: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ?
                  $r('app.float.icon_row_bottom_sm') : $r('app.float.icon_row_bottom')
              })

              Blank()

              Row() {
                TextButton({ content: PlayerConstants.PLAYER_TEXT_LIST[0] })
                  .onClick(() => {
                    this.isShowingSideBar = !this.isShowingSideBar;
                  })
                TextButton({ content: PlayerConstants.PLAYER_TEXT_LIST[2] })
                TextButton({ content: PlayerConstants.PLAYER_TEXT_LIST[3] })
              }
              .margin({
                top: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ? $r('app.float.button_row_top_sm') :
                  $r('app.float.button_row_top'),
                bottom: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ?
                  $r('app.float.button_row_bottom_sm') : $r('app.float.button_row_bottom')
              })
            }
            .height($r('app.float.icon_button_row_height'))
            .width(CommonConstants.FULL_PERCENT)
          }
          .height(CommonConstants.FULL_PERCENT)
          .width(CommonConstants.FULL_PERCENT)
          .justifyContent(FlexAlign.End)
          .visibility(this.isShowingSideBar === true ? Visibility.None : Visibility.Visible)

          Image($r('app.media.ic_public_back'))
            .height($r('app.float.icon_size'))
            .width($r('app.float.icon_size'))
            .position({
              x: $r('app.float.back_position_x'),
              y: $r('app.float.back_position_y')
            })
            .fillColor(Color.White)
            .onClick(() => {
              router.back({
                url: PlayerConstants.VIDEO_DETAIL_URL,
                params: {
                  currentTime: this.avPlayerUtil.getCurrentTime()
                }
              });
            })
            .visibility(this.isShowingSideBar === true ? Visibility.None : Visibility.Visible)
        }
        .height(CommonConstants.FULL_PERCENT)
        .width(CommonConstants.FULL_PERCENT)
        .layoutWeight(1)

        FooterEpisodes({ screenWidth: $screenWidth, isShowingSideBar: $isShowingSideBar })
      }
      .layoutWeight(3)

      SideEpisodes({ screenWidth: $screenWidth, isShowingSideBar: $isShowingSideBar })
    }
    .justifyContent(FlexAlign.Start)
    .backgroundColor(Color.Black)
    .height(CommonConstants.FULL_PERCENT)
    .width(CommonConstants.FULL_PERCENT)
  }
}

@Component
struct ImgIcon {
  private img?: Resource;

  build() {
    Image(this.img !== undefined ? this.img : '')
      .height($r('app.float.icon_size'))
      .width($r('app.float.icon_size'))
      .margin({ left: $r('app.float.icon_margin') })
  }
}

@Component
struct TextButton {
  private content: string = '';

  build() {
    Text(this.content)
      .fontSize($r('app.float.button_text_font'))
      .fontWeight(FontWeight.Normal)
      .fontColor(Color.White)
      .margin({ right: $r('app.float.button_text_margin') })
  }
}

@Component
struct TimeText {
  @Link time: string;

  build() {
    Text(this.time)
      .fontSize($r('app.float.time_font'))
      .fontColor(Color.White)
      .lineHeight($r('app.float.time_text_line'))
      .width($r('app.float.time_text_width'))
  }
}