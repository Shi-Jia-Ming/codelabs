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
import common from '@ohos.app.ability.common';
import { UserAccount } from '@ohos/common';
import { AchievesView } from './AchievesView';
import { CollectedResourceView } from './CollectedResourcesView';
import { ViewedResourceView } from './ViewedResourceView';
import Constants from '../constants/Constants';
import { TabInfo, UserModel } from '../model/UserModel';

export enum ScrollPosition {
  start,
  center,
  end
}

/**
 * Pull to reload offset const value
 */
const START_RELOAD_OFFSET: number = 80;
const GEN_OFFSET_LIMIT: number = 120;
const RELOAD_ANIMATION_DELAY = 1500;

const CURRENT_OFFSET_LIMIT: number = 150;

const LOGIN_PROGRESS_POSITION: number = 100;

/**
 * router params
 */
const LOGIN_ROUTER_PARAMS: string = 'pages/LoginPage';

@Component
export struct MineView {
  @State userModel: UserModel = UserModel.getInstance();
  @State currentIndex: TabInfo = TabInfo.COLLECTED;
  @Provide scrollPosition: ScrollPosition = ScrollPosition.start;
  /**
   * Whether to trigger a refresh, the value is controlled by the scroll example;
   */
  @State isRefresh: boolean = false;
  /**
   * Y-axis drag distance;
   */
  @State offsetY: number = 0;
  /**as
   * To resolve when to trigger scrolling and when to trigger dragging;
   */
  @State canPullDown: boolean = true;
  /**
   * Control the disappear and appear of user image;
   */
  @State @Watch('onCurYChange') currentYOffset: number = 0;
  /**
   * Record user Image position;
   */
  @State userImagePosition: number = 0;
  private outScroller: Scroller = new Scroller();
  private innerScroller: Scroller = new Scroller();
  /**
   * User timer to limit the request count of reload;
   */
  private timer: number = 0;
  /**
   * user image stop position;
   */
  private DEFAULT_USER_IMAGE_POSITION: number = 20;

  onCurYChange(): void {
    if (this.currentYOffset >= CURRENT_OFFSET_LIMIT) {
      this.userImagePosition = 0;
    } else {
      this.userImagePosition = this.DEFAULT_USER_IMAGE_POSITION;
    }
  }

  @Builder
  MineTabs(index: number, barName: Resource) {
    Column() {
      Text(barName)
        .fontColor(index === this.currentIndex ? $r('app.color.theme_blue_color') : $r('app.color.hmos_medium_black'))
        .fontSize($r('app.float.mine_tab_font_size'))
        .margin({ bottom: $r('app.float.mine_tab_margin') })
      Divider()
        .strokeWidth(2)
        .lineCap(LineCapStyle.Round)
        .width($r('app.float.divider_width_32'))
        .color(index === this.currentIndex ? $r('app.color.theme_blue_color') : $r('app.color.hmos_background_color_white'))
    }
  }

  @Builder
  MineRefresh() {
    LoadingProgress()
      .size({
        width: $r('app.float.login_size'),
        height: $r('app.float.login_size') })
      .width(Constants.FULL_SCREEN)
      .color(Color.White)
  }

  @Builder
  MineBackGroundImage() {
    // background Image
    Column() {
      Image($r('app.media.user_background_image'))
        .width(Constants.FULL_SCREEN)
        .height(this.calImageHeight())
        .objectFit(ImageFit.Cover)
    }.width(Constants.FULL_SCREEN).height(Constants.PERCENT_50)
  }

  calImageHeight(): number {
    return (this.offsetY + 150) * 2.5;
  }

  handleGestureEvent(event?: GestureEvent) {
    if (this.canPullDown) {
      if (event !== undefined) {
        this.offsetY = event.offsetY;
      }
      // When offsetY >= reload_offset occur reload action
      if (this.offsetY >= START_RELOAD_OFFSET) {
        if (!this.timer) {
          this.isRefresh = true;
          this.timer = setTimeout(() => {
            this.userModel.reload(this.currentIndex);
            this.isRefresh = false;
            this.timer = 0;
          }, RELOAD_ANIMATION_DELAY)
        }
      }
      // Max offset
      if (this.offsetY >= GEN_OFFSET_LIMIT) {
        this.offsetY = GEN_OFFSET_LIMIT;
      }
    }
  }

  build() {
    Stack({ alignContent: Alignment.Top }) {
      // BackgroundImage view;
      this.MineBackGroundImage()

      Column() {
        // Header include user small image and setting;
        MineHeader({ userImagePosition: this.userImagePosition, currentYOffset: this.currentYOffset })
        // Pull down to show the reload animate;
        PullDownAnimation({ isRefresh: this.isRefresh })

        List({ scroller: this.outScroller }) {
          // user image and information;
          ListItem() {
            UserInfoView()
          }

          // Tabs for user collected 、viewed resource and achievements;
          ListItem() {
            Tabs() {
              TabContent() {
                CollectedResourceView({ innerScroller: this.innerScroller, outerScroller: this.outScroller })
              }
              .tabBar(this.MineTabs(TabInfo.COLLECTED, $r('app.string.my_collected')))
              .backgroundColor($r('app.color.hmos_background_color_white'))

              TabContent() {
                ViewedResourceView({ innerScroller: this.innerScroller, outerScroller: this.outScroller })
              }
              .tabBar(this.MineTabs(TabInfo.VIEWED, $r('app.string.my_viewed')))
              .backgroundColor($r('app.color.hmos_background_color_white'))

              TabContent() {
                AchievesView()
              }
              .tabBar(this.MineTabs(TabInfo.ACHIEVEMENT, $r('app.string.my_achieve')))
              .backgroundColor($r('app.color.hmos_background_color_white'))
            }
            .backgroundColor($r('app.color.hmos_background_color_white'))
            .borderRadius($r('app.float.tabs_border_radius'))
            .vertical(false)
            .barMode(BarMode.Fixed)
            .barWidth($r('app.float.tab_bar_width'))
            .barHeight($r("app.float.tab_bar_height"))
            .height(Constants.FULL_SCREEN)
            .width(Constants.FULL_SCREEN)
            .layoutWeight(1)
            .onChange((index: number) => {
              this.currentIndex = index;
            })
          }
        }
        .translate({ y: this.offsetY })
        .scrollBar(BarState.Off)
        .edgeEffect(EdgeEffect.None)
        .width(Constants.FULL_SCREEN)
        .height(Constants.FULL_SCREEN)
        .layoutWeight(1)
        .onReachStart(() => {
          this.canPullDown = true;
          this.scrollPosition = ScrollPosition.start;
        })
        .onReachEnd(() => {
          this.scrollPosition = ScrollPosition.end;
        })
        .onScroll((yOffset: number) => {
          this.currentYOffset = this.outScroller.currentOffset().yOffset;
          // when out list scrolling, limit the pull down action of list
          if (yOffset > 0) {
            this.canPullDown = false;
          }
          if (!((this.scrollPosition === ScrollPosition.start && yOffset < 0)
            || (this.scrollPosition === ScrollPosition.end && yOffset > 0))) {
            this.scrollPosition = ScrollPosition.center;
          }
        })
        .onScrollFrameBegin((offset: number) => {
          if (this.scrollPosition !== ScrollPosition.end) return { offsetRemain: offset };
          return { offsetRemain: 0 }
        })
        .parallelGesture(
          PanGesture({ direction: PanDirection.Down })
            .onActionUpdate((event?: GestureEvent) => {
              this.handleGestureEvent(event);
            })
            .onActionEnd(() => {
              animateTo({ duration: Constants.DEFAULT_DURATION, curve: Curve.LinearOutSlowIn }, () => {
                this.offsetY = 0;
              })
            })
        )
      }
      .height(Constants.FULL_SCREEN)
    }
  }
}


@Component
struct MineHeader {
  @Prop userImagePosition: number = 0;
  @Prop currentYOffset: number = 0;
  @StorageLink('user') account: UserAccount | null = null;

  build() {
    Row() {
      Blank()
      Image($r('app.media.ic_topic'))
        .width($r('app.float.topics_select_width'))
        .height($r('app.float.topics_select_height'))
        .margin({ right: $r('app.float.topic_margin_right'), bottom: $r('app.float.topic_margin_bottom') })
        .onClick(() => {
          const bundleName = (getContext(this) as common.UIAbilityContext).applicationInfo.name;
          router.pushUrl({ url: `@bundle:${bundleName}/topic/ets/pages/ThemeSettingPage` });
        })

      Image($r('app.media.developer_one'))
        .size({ width: $r('app.float.account_image_size'),
          height: $r('app.float.account_image_size') })
        .position({ x: Constants.ACCOUNT_POSITION_X,
          y: this.userImagePosition })
        .borderRadius($r('app.float.user_portrait_border_radius'))
        .opacity(this.currentYOffset >= CURRENT_OFFSET_LIMIT ? Constants.FULL_OPACITY : Constants.NONE_OPACITY)
        .animation({ duration: Constants.SHORT_ANIMATION_DURATION })
    }
    .justifyContent(FlexAlign.Start)
    .margin({ top: $r('app.float.account_padding_top') })
    .height($r('app.float.header_height'))
    .width(Constants.FULL_SCREEN)
  }
}

@Component
struct UserInfoView {
  @StorageLink('isLogged') isLogged: boolean = false;
  @StorageLink('user') account: UserAccount | null = null;

  build() {
    Column() {
      if (this.isLogged === true) {
        Column() {
          Row({ space: Constants.MIDDLE_SPACE }) {
            Image($r('app.media.developer_one'))
              .size({ width: $r('app.float.user_image_size'), height: $r('app.float.user_image_size') })
              .borderRadius($r('app.float.user_image_border_radius'))
              .margin({ bottom: $r('app.float.user_image_padding'), top: $r('app.float.user_image_padding') })

            Column() {
              Text(this.account?.username)
                .fontColor($r('app.color.hmos_color_white'))
                .fontSize($r('app.float.user_account_font_size'))
                .padding({ bottom: $r('app.float.login_account_padding_bottom') })
            }
          }
          .margin({ bottom: $r('app.float.account_margin_bottom') })

          Text(this.account?.description)
            .width(Constants.FULL_SCREEN)
            .fontSize($r('app.float.login_information_font_size'))
            .fontColor($r('app.color.hmos_color_white'))
        }
        .alignItems(HorizontalAlign.Start)
        .padding({ left: $r('app.float.login_account_padding_left') })
      } else {
        Column() {
          Row() {
            Image($r('app.media.user_default'))
              .size({ width: $r('app.float.user_image_size'), height: $r('app.float.user_image_size') })
              .borderRadius($r('app.float.user_image_border_radius'))
              .margin({ bottom: $r('app.float.user_image_padding'), top: $r('app.float.user_image_padding') })

            Text($r('app.string.default_login'))
              .fontColor($r('app.color.hmos_color_white'))
              .fontSize($r('app.float.user_account_font_size'))
              .padding({ bottom: $r('app.float.login_account_padding_bottom') })
              .onClick(() => {
                router.pushUrl({ url: LOGIN_ROUTER_PARAMS })
              })
          }

          Text($r('app.string.default_description'))
            .width(Constants.FULL_SCREEN)
            .fontSize($r('app.float.login_information_font_size'))
            .fontColor($r('app.color.hmos_color_white'))
        }
        .padding({ left: $r('app.float.login_account_padding_left') })
      }
    }
    .width(Constants.FULL_SCREEN)
    .height($r('app.float.user_background_height'))
    .padding({ top: $r('app.float.user_padding_top') })
    .alignItems(HorizontalAlign.Start)
  }
}

@Component
struct PullDownAnimation {
  @Prop isRefresh: boolean = false;

  build() {
    LoadingProgress()
      .size({
        width: $r('app.float.login_size'),
        height: $r('app.float.login_size') })
      .width(Constants.FULL_SCREEN)
      .position({ y: LOGIN_PROGRESS_POSITION })
      .color(Color.White)
      .visibility(this.isRefresh ? Visibility.Visible : Visibility.None)
  }
}


