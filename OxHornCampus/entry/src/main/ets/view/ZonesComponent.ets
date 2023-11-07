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
import ZonesItem from '../viewmodel/ZonesItem';
import { CommonConstants as Const } from '../common/constants/CommonConstants';
import { ZonesConstants as ZoneConst } from '../common/constants/ZonesConstants';
import ZonesViewModel from '../viewmodel/ZonesViewModel';

@Component
export struct Zones {
  private changedIndex: boolean = true;
  private zonesList: ZonesItem[] = ZonesViewModel.getZonesList();
  @State aheadIndex: number = ZoneConst.HALF_COUNT;
  @State marginBottom: number = 0;

  getImgCoefficients(index?: number): number {
    if (index === undefined) {
      return 0;
    }
    let coefficient = this.aheadIndex - index;
    let tempCoefficient = Math.abs(coefficient);
    if (tempCoefficient <= ZoneConst.HALF_COUNT) {
      return coefficient;
    }
    let dataLength = this.zonesList.length;
    let tempOffset = dataLength - tempCoefficient;
    if (tempOffset <= ZoneConst.HALF_COUNT) {
      if (coefficient > 0) {
        return -tempOffset;
      }
      return tempOffset;
    }
    return 0;
  }

  getOffSetY(index?: number): number {
    if (index === undefined) {
      return 0;
    }
    let offsetIndex = this.getImgCoefficients(index);
    let tempOffset = Math.abs(offsetIndex);
    let offsetY = this.marginBottom / (tempOffset + 1);
    if (tempOffset === 1) {
      offsetY += -offsetIndex * ZoneConst.MAX_OFFSET_Y;
    } else if (tempOffset === ZoneConst.HALF_COUNT) {
      offsetY += -offsetIndex * (ZoneConst.MAX_OFFSET_Y - ZoneConst.OFFSET_COEFFICIENTS);
    }
    return offsetY;
  }

  startAnimation(isUp: boolean): void {
    animateTo({
      duration: Const.SWIPER_DURATION,
    }, () => {
      let dataLength = this.zonesList.length;
      let tempIndex = isUp ? this.aheadIndex + 1 : dataLength + this.aheadIndex - 1;
      this.aheadIndex = tempIndex % dataLength;
      this.marginBottom = 0;
    });
  }

  handlePanGesture(offsetY: number): void {
    if (Math.abs(offsetY) < ZoneConst.MAX_MOVE_OFFSET) {
      this.marginBottom = offsetY;
    } else {
      if (this.changedIndex) {
        return;
      }
      this.changedIndex = true;
      this.startAnimation(offsetY < 0);
    }
  }

  build() {
    Navigation() {
      Stack() {
        ForEach(this.zonesList, (item: ZonesItem, index?: number) => {
          Row() {
            Image(item.thumbnail)
              .objectFit(ImageFit.Cover)
              .borderRadius($r('app.float.common_border_radius'))
              .margin({ bottom: Const.SHADOW_RADIUS })
              .shadow({
                radius: Const.SHADOW_RADIUS,
                color: `rgba(0,0,0,0.3)`,
                offsetY: Const.SHADOW_RADIUS / Const.DOUBLE_NUM
              })
              .opacity(1 - Math.min(ZoneConst.HALF_COUNT,
                Math.abs(this.getImgCoefficients(index))) * ZoneConst.OPACITY_COEFFICIENTS)
              .blur(ZoneConst.OFFSET_COEFFICIENTS * Math.abs(this.getImgCoefficients(index)))
          }
          .width(index !== this.aheadIndex && this.getImgCoefficients(index) === 0
            ? Const.SWIPER_DEFAULT_WIDTH
            : `${ZoneConst.ITEM_WIDTH - ZoneConst.OFFSET_COEFFICIENTS * Math.abs(this.getImgCoefficients(index))}%`)
          .aspectRatio(Const.SWIPER_ASPECT_RATIO)
          .borderRadius($r('app.float.common_border_radius'))
          .offset({ x: 0, y: this.getOffSetY(index) })
          .zIndex(index !== this.aheadIndex && this.getImgCoefficients(index) === 0
            ? 0 : ZoneConst.HALF_COUNT - Math.abs(this.getImgCoefficients(index)))
        }, (item: ZonesItem) => JSON.stringify(item))
      }
      .width(Const.FULL_PERCENT)
      .height(Const.FULL_PERCENT)
      .margin({ top: Const.SHADOW_RADIUS / Const.DOUBLE_NUM })
      .alignContent(Alignment.Center)
      .onClick(() => {
        router.pushUrl({ url: Const.INTRODUCTION_URL, params: { id: this.zonesList[this.aheadIndex].id } });
      })
      .gesture(
        PanGesture({ direction: PanDirection.Vertical })
          .onActionStart((event: GestureEvent | undefined) => {
            if (!event) {
              return;
            }
            this.changedIndex = false;
            this.handlePanGesture(event.offsetY);
          })
          .onActionUpdate((event: GestureEvent | undefined) => {
            if (!event) {
              return;
            }
            this.handlePanGesture(event.offsetY);
          })
          .onActionEnd(() => {
            animateTo({
              duration: Const.SWIPER_DURATION,
            }, () => {
              this.marginBottom = 0;
            });
          })
      )
    }
    .backgroundColor($r('app.color.common_background_color'))
    .title(Const.INTRODUCTION_TITLE)
    .titleMode(NavigationTitleMode.Full)
    .hideBackButton(true)
  }
}