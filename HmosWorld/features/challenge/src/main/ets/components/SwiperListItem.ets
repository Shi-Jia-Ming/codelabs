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

import ZonesItem from '../entity/ZonesItem';
import { ChallengeConstants as Const } from '../constants/ChallengeConstants';
import ZonesModel from '../model/ZonesModel';

const MAX_OPACITY = 0.9;

@Component
export default struct SwiperListItem {
  @Prop imageHeight: number = 0;
  @Prop currentZoneId: number = 0;
  @Prop arrowIconOpacity: number = 0;
  @Consume('introductionData') introductionData: ZonesItem;

  /**
   *  Get the introduction by currentZoneId.
   */
  getIntroductionData(): void {
    this.introductionData = ZonesModel.getZonesList().filter((item) => item.id === this.currentZoneId)[0];
  }

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Swiper() {
        ForEach(ZonesModel.getZonesList(), (item: ZonesItem) => {
          Image(item.swiperPic)
            .width(Const.FULL_PERCENT)
            .height(this.imageHeight)
            .objectFit(ImageFit.Cover)
        }, (item: ZonesItem) => JSON.stringify(item))
      }
      .index(this.currentZoneId)
      .indicator(this.arrowIconOpacity > MAX_OPACITY ? Indicator.dot()
        .bottom($r('app.float.swiper_indicator_margin_bottom')) : false)
      .loop(true)
      .cachedCount(Const.IMAGE_SWIPER_CACHE_COUNT)
      .curve(Curve.EaseOut)
      .disableSwipe(this.arrowIconOpacity < MAX_OPACITY)
      .onChange((index: number) => {
        this.currentZoneId = index;
        this.getIntroductionData();
      })

      Column() {
        Text(this.introductionData.title)
          .fontSize($r('app.float.zone_title_size'))
          .fontWeight(FontWeight.Bold)
          .fontColor($r('app.color.white'))
          .margin({
            top: $r('app.float.normal_margin'),
            bottom: $r('app.float.arrow_down_margin')
          })
        Image($r('app.media.ic_arrow_down'))
          .height($r('app.float.arrow_down_height'))
          .width($r('app.float.arrow_down_width'))
      }
      .width(Const.FULL_PERCENT)
      .margin({ bottom: $r('app.float.arrow_down_margin') })
      .opacity(this.arrowIconOpacity)
      .animation({
        duration: Const.ANIMATION_DURATION_NORMAL,
        curve: Curve.EaseOut,
      })
    }
  }
}