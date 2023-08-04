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
import ZonesItem from '../common/bean/ZonesItem';
import { CommonConstants as Const } from '../common/constants/CommonConstants';
import { DeviceScreen } from '../common/utils/DeviceScreen';
import { Animation } from '../common/utils/Animation';
import BuildListItem from '../view/BuildListItem';
import StyleListItem from '../view/StyleListItem';
import SubTitleItem from '../view/SubTitleItem';
import zonesViewModel from '../viewmodel/ZonesViewModel';
import SwiperListItem from '../view/SwiperListItem'

@Entry
@Component
struct IntroductionPage {
  @State zoneList: ZonesItem[] = zonesViewModel.getZonesList();
  @Provide('introductionData') introductionData: ZonesItem = zonesViewModel.getZonesList()[0];
  @State currentZoneId: number = router.getParams()['id'];
  @State screenHeight: number = 0;
  @State listPosition: number = Const.LIST_POSITION_BEGIN;
  @State imageHeight: number = Const.FULL_PERCENT_NUMBER;
  @State arrowIconOpacity: number = Const.OPACITY_MAX;
  @State isShowReplay: Array<boolean> = [];
  @State currentListIndex: number = Const.LIST_POSITION_BEGIN;
  @State offsetSum: number = 0;
  private scrollerForList: Scroller = new Scroller();
  @State scaleIcon: Array<number> = [Const.OPACITY_MAX, Const.OPACITY_MIN,
  Const.OPACITY_MIN];
  @State iconTitle: string = Const.ICON_SUBTITLE_ARRAY[0];
  @State isReachStart: boolean = false;
  @State geographicPicType: string = Const.GEOGRAPHY_LIGHT;
  @State buildingType: string = Const.BUILDING_TEXT;
  @State homeIconOpacity: number = Const.OPACITY_MIN;

  @Builder TitleIcon($$: {
    src: Resource,
    scale: number
  }) {
    Column() {
      Image($$.src)
        .width($r('app.float.title_icon_width'))
        .height($r('app.float.title_icon_height'))
        .scale({ x: $$.scale })
        .opacity($$.scale)
        .animation({
          duration: Const.TITLE_ICON_ANIMATION_DURATION,
          curve: Curve.EaseOut
        })
    }
  }
  
  @Builder StickyHeader() {
    Column() {
      Image(this.introductionData.subPicBottom)
        .height($r('app.float.picture_bottom_height'))
        .objectFit(ImageFit.Fill)
        .width(Const.FULL_SIZE)
        .backgroundColor(this.introductionData.backgroundColor)

      Stack({ alignContent: Alignment.Bottom }) {
        Image(this.introductionData.titleIcon)
          .height($r('app.float.introduction_title_icon_height'))
          .width($r('app.float.introduction_title_icon_width'))
          .margin({ bottom: $r('app.float.title_icon_margin_bottom') })

        this.TitleIcon({ src: $r('app.media.ic_design_style'), scale: this.scaleIcon[0] })
        this.TitleIcon({ src: $r('app.media.ic_building'), scale: this.scaleIcon[1] })
        this.TitleIcon({ src: $r("app.media.ic_geography_icon"), scale: this.scaleIcon[2] })
      }
      .width(Const.FULL_SIZE)
      .height($r('app.float.stack_container_height'))

      Text(this.iconTitle)
        .fontSize($r('app.float.font_size_smaller'))
        .height($r('app.float.font_height_smaller'))
        .fontColor($r('app.color.font_color_black'))
        .opacity(Const.FONT_COLOR_OPACITY_NORMAL)
        .margin({ bottom: $r('app.float.icon_title_margin_bottom') })
        .fontWeight(FontWeight.Bold)
    }
    .width(Const.FULL_SIZE)
    .backgroundColor($r('app.color.introduction_page_color'))
    .height(Const.STICKY_HEIGHT)
    .alignItems(HorizontalAlign.Center)
  }

  @Builder StickyFooter() {
    Column()
      .height($r('app.float.introduction_page_padding_bottom'))
  }

  pageTransition(){
    PageTransitionEnter({duration: Const.SHARED_DURATION})
      .slide(SlideEffect.Bottom)
      .scale({
        x: 0,
        y: 0,
        z: 0,
        centerX: Const.HALF_PERCENT,
        centerY: Const.HALF_PERCENT
      })
    PageTransitionExit({delay: Const.SWIPER_DURATION})
      .slide(SlideEffect.Bottom)
      .scale({
        x: 0,
        y: 0,
        z: 0,
        centerX: Const.HALF_PERCENT,
        centerY: Const.HALF_PERCENT
      })
  }
  build() {
    Column() {
      Stack({ alignContent: Alignment.Bottom }) {
        Column() {
          List({ scroller: this.scrollerForList }) {
            ListItem() {
              SwiperListItem({
                imageHeight: this.imageHeight,
                currentZoneId: this.currentZoneId,
                arrowIconOpacity: this.arrowIconOpacity
              })
            }

            ListItem() {
              SubTitleItem()
            }

            ListItemGroup({ header: this.StickyHeader(), footer: this.StickyFooter() }) {
              ListItem() {
                StyleListItem()
              }

              ListItem() {
                BuildListItem({ type: this.buildingType })
              }

              ListItem() {
                BuildListItem({ type: this.geographicPicType })
              }
            }
          }
          .width(Const.FULL_SIZE)
          .height(Const.FULL_SIZE)
          .edgeEffect(EdgeEffect.None)
          .scrollBar(BarState.Off)
          .sticky(StickyStyle.Header)
          .onReachStart(() => {
            this.resetParameters();
          })
          .onScrollIndex((start) => {
            this.currentListIndex = start;
          })
          .onReachEnd(() => {
            this.listPosition = Const.LIST_POSITION_END;
          })
          .onScroll(() => {
            this.startAnimation();
          })
          .onScrollFrameBegin((offset: number, state: ScrollState) => {
            let realOffset = Animation.controlImageScale.call(this, offset, state);
            return { offsetRemain: realOffset };
          })
        }
        .height(Const.FULL_SIZE)

        Image($r('app.media.ic_up_icon'))
          .height($r('app.float.page_icon_size'))
          .aspectRatio(1)
          .margin({ bottom: $r('app.float.up_icon_margin_bottom'), left: $r('app.float.page_icon_margin_vertical') })
          .onClick(() => {
            this.scrollToTop();
          })
          .opacity(1 - this.arrowIconOpacity)

        Image($r('app.media.ic_home_back'))
          .height($r('app.float.page_icon_size'))
          .aspectRatio(1)
          .margin({
            right: $r('app.float.page_icon_margin_vertical'),
            bottom: this.screenHeight - Const.HOME_ICON_MARGIN_TOP
          })
          .onClick(() => {
            router.back();
          })
          // .opacity(this.homeIconOpacity)

      }
      .backgroundColor($r('app.color.introduction_page_color'))
      .height(Const.FULL_SIZE)
    }
    .height(Const.FULL_SIZE)
  }

  aboutToAppear() {
    this.getIntroductionData();
    this.screenHeight = DeviceScreen.getDeviceHeight();
  }

  /**
   * Get the introduction by currentZoneId.
   */
  getIntroductionData() {
    this.introductionData = this.zoneList.filter((item) => item.id === this.currentZoneId)[0];
  }

  /**
   * Reset all parameters if the list arrive begin by animation.
   */
  resetParameters() {
    this.listPosition = Const.LIST_POSITION_BEGIN;
    if (this.listPosition === Const.LIST_POSITION_BEGIN && this.isReachStart) {
      this.imageHeight = Const.FULL_PERCENT_NUMBER;
      this.arrowIconOpacity = Const.OPACITY_MAX;
    }
    this.isReachStart = false;
  }

  /**
   * Start animation when scroll the list.
   */
  startAnimation() {
    Animation.changeTitleIcon.apply(this);
  }

  /**
   * Click the up arrow scroll to the beginning.
   */
  scrollToTop() {
    if (this.listPosition !== Const.LIST_POSITION_BEGIN) {
      this.scrollerForList.scrollTo({
        xOffset: 0,
        yOffset: Const.SCROLL_UP_TOP_THRESHOLD,
        animation: {
          duration: this.offsetSum / Const.OFFSET_DIVIDE_RATIO,
          curve: Curve.Linear,
        }
      })
      this.isReachStart = true;
    } else {
      this.imageHeight = Const.FULL_PERCENT_NUMBER;
      this.arrowIconOpacity = Const.OPACITY_MAX;
    }
  }
}