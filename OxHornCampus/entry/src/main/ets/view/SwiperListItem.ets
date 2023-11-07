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

import ZonesItem from '../viewmodel/ZonesItem';
import { CommonConstants as Const } from '../common/constants/CommonConstants';
import zonesViewModel from '../viewmodel/ZonesViewModel';

@Component
export default struct SwiperListItem {
  private swiperController: SwiperController = new SwiperController();
  @State zoneList: ZonesItem[] = zonesViewModel.getZonesList();
  @Prop imageHeight: number = 0;
  @Prop currentZoneId: number = 0;
  @Prop arrowIconOpacity: number = 0;
  @Consume('introductionData') introductionData: ZonesItem;

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Swiper(this.swiperController) {
        ForEach(this.zoneList, (item: ZonesItem) => {
          Image(item.swiperPic)
            .width(Const.FULL_SIZE)
            .height(this.imageHeight + '%')
            .objectFit(ImageFit.Cover)
            .sharedTransition(item.id.toString(), {
              duration: Const.TRANSITION_DURATION,
              curve: Curve.Smooth,
              delay: 0
            })
        }, (item: ZonesItem) => JSON.stringify(item))
      }
      .index(this.currentZoneId)
      .indicator(this.imageHeight < Const.FULL_PERCENT_NUMBER ? false : true)
      .loop(true)
      .cachedCount(Const.IMAGE_SWIPER_CACHE_COUNT)
      .curve(Curve.EaseOut)
      .disableSwipe(this.imageHeight < Const.FULL_PERCENT_NUMBER ? true : false)
      .indicatorStyle({
        bottom: $r('app.float.swiper_indicator_margin_bottom')
      })
      .onChange((index: number) => {
        this.currentZoneId = index;
        this.getIntroductionData();
      })
      .index(this.currentZoneId)
      .indicator(this.imageHeight < Const.FULL_PERCENT_NUMBER ? false : true)
      .loop(true)
      .cachedCount(Const.IMAGE_SWIPER_CACHE_COUNT)
      .curve(Curve.EaseOut)
      .disableSwipe(this.imageHeight < Const.FULL_PERCENT_NUMBER ? true : false)
      .indicatorStyle({
        bottom: $r('app.float.swiper_indicator_margin_bottom')
      })
      .onChange((index: number) => {
        this.currentZoneId = index;
        this.getIntroductionData();
      })

      Text(this.introductionData.title)
        .fontSize($r('app.float.font_size_largest'))
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.font_color_white'))
        .opacity(this.arrowIconOpacity)
        .width(Const.FULL_SIZE)
        .textAlign(TextAlign.Center)
        .height($r('app.float.zone_name_container_height'))
        .margin({ bottom: $r('app.float.zone_name_margin_bottom') })
        .animation({
          duration: Const.ANIMATION_DURATION_NORMAL,
          curve: Curve.EaseOut,
        })
      Image($r('app.media.ic_arrow_down'))
        .height($r('app.float.arrow_down_height'))
        .width($r('app.float.arrow_down_width'))
        .margin({ bottom: $r('app.float.arrow_down_margin_bottom') })
        .opacity(this.arrowIconOpacity)
        .animation({
          duration: Const.ANIMATION_DURATION_NORMAL,
          curve: Curve.EaseOut,
        })
    }
  }

  // Get the introduction by currentZoneId.
  getIntroductionData() {
    this.introductionData = this.zoneList.filter((item) => item.id === this.currentZoneId)[0];
  }
}