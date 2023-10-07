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
import window from '@ohos.window';
import { Logger } from '@ohos/common';
import ZonesItem from '../entity/ZonesItem';
import { ChallengeConstants as Const } from '../constants/ChallengeConstants';
import { ICON_SUBTITLE_ARRAY, IconSubtitle } from '../model/IconSubtitleData';
import BuildListItem from '../components/BuildListItem';
import StyleListItem from '../components/StyleListItem';
import SwiperListItem from '../components/SwiperListItem';
import SubTitleItem from '../components/SubTitleItem';
import ZonesModel from '../model/ZonesModel';
import ChallengeItem from '../components/ChallengeItem';
import LocationItem from '../components/LocationItem';

const TAG: string = '[ZonesIntroductionPage]';
const MAX_IMG_RATIO: number = 0.15;

@Entry
@Component
struct IntroductionPage {
  private scroller: Scroller = new Scroller();
  @State currentZoneId: number = (router.getParams() as Record<string, number>)['id'];
  @State deviceHeight: number = 0;
  @State imageHeight: number = this.deviceHeight;
  @State imageMinHeight: number = 0;
  @State arrowIconOpacity: number = 1;
  @State isReachStart: boolean = false;
  @State currentStyleIndex: number = 0;
  @Provide('introductionData') introductionData: ZonesItem = ZonesModel.getZonesList()[this.currentZoneId];
  @State topImgOffset: number = 0;
  @State locationImgScale: number = 0;

  getRatios(): number[] {
    let ratio: number = 0;
    let arr: number[] = [0];
    while (ratio < 1) {
      ratio += 0.01;
      arr.push(ratio);
    }
    return arr;
  }

  @Builder
  StyleTitle(item: IconSubtitle, index: number) {
    Column() {
      Image(item.icon)
        .width($r('app.float.title_icon_width'))
        .aspectRatio(1)
        .objectFit(ImageFit.Contain)
      Text(item.title)
        .fontSize($r('app.float.small_font_size'))
        .fontColor($r('app.color.train_interval'))
        .margin({ top: $r('app.float.title_style_margin'), bottom: $r('app.float.title_style_margin') })
        .fontWeight(FontWeight.Medium)
      Text(item.enTitle)
        .fontSize($r('app.float.font_size_smaller'))
        .fontColor($r('app.color.train_interval'))
        .margin({ bottom: $r('app.float.icon_title_margin_bottom') })
        .fontWeight(FontWeight.Bold)
    }
    .margin({ top: $r('app.float.style_margin_top') })
    .scale({ x: this.currentStyleIndex === index ? 1 : 0 })
    .opacity(this.currentStyleIndex === index ? 1 : 0)
    .animation({
      duration: Const.TITLE_ICON_ANIMATION_DURATION,
      curve: Curve.EaseOut
    })
  }

  @Builder
  StickyHeader() {
    Column() {
      Image(this.introductionData.subPicBottom)
        .width(Const.FULL_PERCENT)
        .aspectRatio(Const.HEAD_IMG_ASPECT)
        .objectFit(ImageFit.Fill)
        .backgroundColor(this.introductionData.backgroundColor)

      Image(this.introductionData.titleIcon)
        .margin({ top: $r('app.float.navigation_margin') })
        .width($r('app.float.introduction_title_icon_width'))
        .height($r('app.float.introduction_title_icon_height'))
      Stack() {
        ForEach(ICON_SUBTITLE_ARRAY, (item: IconSubtitle, index?: number) => {
          if (index !== undefined) {
            this.StyleTitle(item, index)
          }
        })
      }
    }
    .backgroundColor($r('app.color.common_background_color'))
    .alignItems(HorizontalAlign.Center)
  }

  build() {
    Column() {
      Stack({ alignContent: Alignment.Bottom }) {
        Column() {
          List({ scroller: this.scroller }) {
            ListItem() {
              SwiperListItem({
                imageHeight: this.imageHeight,
                arrowIconOpacity: this.arrowIconOpacity,
                currentZoneId: this.currentZoneId
              })
            }

            ListItem() {
              SubTitleItem({ topImgOffset: this.topImgOffset })
            }

            ListItemGroup({ header: this.StickyHeader() }) {
              ListItem() {
                StyleListItem()
              }
              .onVisibleAreaChange(this.getRatios(), (isVisible: boolean, currentRatio: number) => {
                Logger.info(TAG, 'StyleListItem isVisible: ' + isVisible + ', currentRatio:' + currentRatio);
                if (currentRatio <= Const.HALF_NUMBER) {
                  this.topImgOffset = Math.ceil(currentRatio * Const.IMG_COEFFICIENT);
                }
              })

              ListItem() {
                BuildListItem({ buildingImgRatio: Math.min(this.locationImgScale, MAX_IMG_RATIO) })
              }

              ListItem() {
                Column() {
                  LocationItem({ imgScale: this.locationImgScale })
                  ChallengeItem()
                }
                .onVisibleAreaChange(this.getRatios(), (isVisible: boolean, currentRatio: number) => {
                  this.locationImgScale = currentRatio;
                  this.handleVisibleAreaChange(isVisible, currentRatio);
                })
              }
            }
            .margin({ top: $r('app.float.intro_margin_top') })
          }
          .width(Const.FULL_PERCENT)
          .height(Const.FULL_PERCENT)
          .edgeEffect(EdgeEffect.None)
          .scrollBar(BarState.Off)
          .sticky(StickyStyle.Header)
          .onScrollFrameBegin((offset: number) => {
            return { offsetRemain: this.handleScrollFrame(offset) };
          })
        }
        .height(Const.FULL_PERCENT)

        Image($r('app.media.ic_up_icon'))
          .height($r('app.float.page_icon_size'))
          .aspectRatio(1)
          .opacity(1 - this.arrowIconOpacity)
          .margin({ bottom: $r('app.float.up_icon_margin_bottom'), left: $r('app.float.page_icon_margin_vertical') })
          .onClick(() => {
            this.scrollToTop();
          })
        Image($r('app.media.ic_home_back'))
          .height($r('app.float.page_icon_size'))
          .aspectRatio(1)
          .opacity(1 - this.arrowIconOpacity)
          .margin({
            right: $r('app.float.page_icon_margin_vertical'),
            bottom: this.deviceHeight - Const.HOME_ICON_MARGIN_TOP
          })
          .onClick(() => router.back())
      }
      .backgroundColor($r('app.color.common_background_color'))
      .height(Const.FULL_PERCENT)
    }
    .height(Const.FULL_PERCENT)
  }

  aboutToAppear() {
    window.getLastWindow(getContext(this)).then((data: window.Window) => {
      let properties = data.getWindowProperties();
      this.deviceHeight = px2vp(properties.windowRect.height);
      this.imageHeight = this.deviceHeight;
      this.imageMinHeight = Math.floor(px2vp(properties.windowRect.width) * Const.IMG_ASPECT_RATIO);
    });
  }

  handleVisibleAreaChange(isVisible: boolean, currentRatio: number) {
    Logger.info('StyleListItem isVisible: ' + isVisible + ', currentRatio:' + currentRatio);
    if (isVisible) {
      this.currentStyleIndex = currentRatio > 0.8 ? 2 : 1;
    } else {
      this.currentStyleIndex = currentRatio > 0.2 ? 1 : 0;
    }
  }

  handleScrollFrame(offset: number): number {
    let tempImgHeight: number = Math.ceil(this.imageHeight - offset);
    let yOffset: number = this.scroller.currentOffset().yOffset;
    Logger.info(TAG, 'yOffset： ' + offset + '   Height： ' + (this.deviceHeight - this.imageMinHeight));
    if (yOffset > 0) {
      Logger.info(TAG, 'unHandle Image');
      this.imageHeight = this.imageMinHeight;
      return offset;
    }
    if (tempImgHeight >= this.imageMinHeight && tempImgHeight <= this.deviceHeight) {
      Logger.info(TAG, 'scale Image');
      this.imageHeight = tempImgHeight;
      this.arrowIconOpacity = (this.imageHeight - this.imageMinHeight) / (this.deviceHeight - this.imageMinHeight);
      return 0;
    }
    if (tempImgHeight < this.imageMinHeight) {
      Logger.info(TAG, 'min Image');
      this.imageHeight = this.imageMinHeight;
      return (this.imageMinHeight - tempImgHeight);
    }
    if (tempImgHeight > this.deviceHeight) {
      Logger.info(TAG, 'max Image');
      this.imageHeight = this.deviceHeight;
      return (this.deviceHeight - tempImgHeight);
    }
    return offset;
  }

  /**
   * Click the up arrow scroll to the beginning.
   */
  scrollToTop() {
    this.scroller.scrollTo({
      xOffset: 0,
      yOffset: 0,
      animation: {
        duration: Const.IMAGE_ANIMATION_DURATION,
        curve: Curve.Linear,
      }
    });
    animateTo({
      duration: Const.IMAGE_ANIMATION_DURATION,
    }, () => {
      this.arrowIconOpacity = 1;
      this.imageHeight = this.deviceHeight;
      this.currentStyleIndex = 0;
    });
  }
}
