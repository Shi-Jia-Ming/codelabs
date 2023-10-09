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

import curves from '@ohos.curves';
import ZonesItem from '../entity/ZonesItem';
import { ChallengeConstants as Const } from '../constants/ChallengeConstants';

@Component
export struct ImageViewDialog {
  private deviceWidth: number = vp2px(AppStorage.get('deviceWidth') as number);
  private deviceHeight: number = vp2px(AppStorage.get('deviceHeight') as number);
  private imgWidth: number = 0;
  private imgHeight: number = 0;
  private displayHeight: number = 0;
  private preOffsetX: number = 0;
  private preOffsetY: number = 0;
  private curScale: number = 1;
  @Consume('introductionData') introductionData: ZonesItem;
  @State isGesture: boolean = false;
  @State imgScale: number = 1;
  @State imgOffsetX: number = 0;
  @State imgOffsetY: number = 0;
  @Link isPresent: boolean;
  @Link currentIndex: number;

  /**
   * Detect boundary to keep the image in window.
   */
  detectBoundary(): void {
    let maxOffsetX = this.imgScale * this.deviceWidth / 2 - this.deviceWidth / 2;
    if (vp2px(this.imgOffsetX) > (maxOffsetX)) {
      this.imgOffsetX = px2vp(maxOffsetX);
    }
    if (vp2px(this.imgOffsetX) < -(maxOffsetX)) {
      this.imgOffsetX = -px2vp(maxOffsetX);
    }
    let maxOffsetY = this.imgScale * this.displayHeight / 2 - this.deviceHeight / 2;
    if (this.imgScale * this.displayHeight >= this.deviceHeight) {
      if (vp2px(this.imgOffsetY) > (maxOffsetY)) {
        this.imgOffsetY = px2vp(maxOffsetY);
      }
      if (vp2px(this.imgOffsetY) < -(maxOffsetY)) {
        this.imgOffsetY = -px2vp(maxOffsetY);
      }
    } else {
      this.imgOffsetY = 0;
    }
  }

  /**
   * Limit scale to keep the image clear.
   */
  limitScale(isReset: boolean): void {
    if (this.imgScale < 1) {
      this.imgScale = 1;
      this.curScale = 1;
      if (isReset) {
        this.imgOffsetX = 0;
        this.imgOffsetY = 0;
      }
      this.isGesture = false;
    } else if (this.imgScale > Const.MAX_SCALE) {
      this.imgScale = Const.MAX_SCALE;
      this.curScale = Const.MAX_SCALE;
    } else {
      this.curScale = this.imgScale;
    }
  }

  build() {
    Stack() {
      Swiper() {
        ForEach(this.introductionData.imageList, (item: Resource, index?: number) => {
          Column() {
            Blank()
              .onClick(() => {
                animateTo({ duration: Const.SWIPER_DURATION }, () => {
                  this.isPresent = !this.isPresent;
                });
              })
            Image(item)
              .width(Const.FULL_PERCENT)
              .syncLoad(true)
              .objectFit(ImageFit.Contain)
              .gesture(
                PinchGesture()
                  .onActionStart(() => {
                    this.isGesture = true;
                  })
                  .onActionUpdate((event?: GestureEvent) => {
                    if (event) {
                      this.imgScale = this.curScale * event.scale;
                    }
                  })
                  .onActionEnd(() => {
                    this.limitScale(false);
                  })
              )
              .geometryTransition(index === this.currentIndex && !this.isGesture ? 'share_' + index : '')
            Blank()
              .onClick(() => {
                animateTo({ duration: Const.SWIPER_DURATION }, () => {
                  this.isPresent = !this.isPresent;
                });
              })
          }
          .width(Const.FULL_PERCENT)
          .height(Const.FULL_PERCENT)
          .justifyContent(FlexAlign.Center)
        })
      }
      .width(Const.FULL_PERCENT)
      .height(Const.FULL_PERCENT)
      .loop(false)
      .indicator(Indicator.dot().color(Color.Gray).bottom($r('app.float.indicator_bottom')))
      .index(this.currentIndex)
      .onChange((index: number) => {
        this.currentIndex = index;
      })
      .visibility(this.isGesture ? Visibility.Hidden : Visibility.Visible)

      Row() {
        Image(this.introductionData.imageList[this.currentIndex])
          .transition(TransitionEffect.OPACITY.animation({
            curve: curves.springMotion(Const.SPRING_RESPONSE, Const.DAMPING_FRACTION)
          }))
          .geometryTransition(this.isGesture ? 'share_' + this.currentIndex : '')
          .objectFit(ImageFit.Contain)
          .scale({ x: this.imgScale, y: this.imgScale })
          .translate({ x: this.imgOffsetX, y: this.imgOffsetY })
          .onComplete((event) => {
            if (event) {
              this.imgWidth = event.width;
              this.imgHeight = event.height;
              this.displayHeight = this.deviceWidth * this.imgHeight / this.imgWidth;
            }
          })
      }
      .gesture(
        PinchGesture()
          .onActionUpdate((event?: GestureEvent) => {
            if (event) {
              this.imgScale = this.curScale * event.scale;
            }
          })
          .onActionEnd(() => {
            this.detectBoundary();
            this.limitScale(true);
          })
      )
      .gesture(
        PanGesture()
          .onActionStart(() => {
            this.preOffsetX = this.imgOffsetX;
            this.preOffsetY = this.imgOffsetY;
          })
          .onActionUpdate((event?: GestureEvent) => {
            if (event) {
              this.imgOffsetX = this.preOffsetX + event.offsetX;
              this.imgOffsetY = this.preOffsetY + event.offsetY;
            }
          })
          .onActionEnd(() => {
            this.detectBoundary();
          })
      )
      .visibility(this.isGesture ? Visibility.Visible : Visibility.Hidden)
    }
  }
}