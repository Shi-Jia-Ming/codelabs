/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License,Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { BreakPointType, EmptyComponent, StyleConstants, CommonDataSource } from '@ohos/common';
import { PersonalConstants } from '../constants/PersonalConstants';
import { LiveDataModel } from '../viewmodel/PersonalData';

/**
 * Component of live list.
 */
@Component
export struct LiveList {
  @StorageProp('currentBreakpoint') currentBreakpoint: string = 'md';
  @Prop count: number = 0;
  private liveList: LiveDataModel[] = [];

  build() {
    if (this.liveList.length > 0) {
      List({ space: StyleConstants.TWELVE_SPACE }) {
        LazyForEach(new CommonDataSource<LiveDataModel>(this.liveList), (item: LiveDataModel) => {
          ListItem() {
            this.LiveItem(item)
          }
          .margin({ left: $r('app.float.vp_six'), right: $r('app.float.vp_six') })
        }, (item: LiveDataModel) => JSON.stringify(item))
      }
      .margin({ left: $r('app.float.commodity_list_margin'), right: $r('app.float.commodity_list_margin') })
      .lanes(this.count)
    } else {
      EmptyComponent({ outerHeight: StyleConstants.FIFTY_HEIGHT })
    }
  }

  @Builder LiveItem(liveItem: LiveDataModel) {
    Column() {
      Stack({ alignContent: Alignment.TopStart }) {
        Image($rawfile(liveItem.previewIcon))
          .width(StyleConstants.FULL_WIDTH)
          .objectFit(ImageFit.Fill)
          .aspectRatio(new BreakPointType({
            sm: PersonalConstants.ASPECT_RATIO_SM,
            md: PersonalConstants.ASPECT_RATIO_MD,
            lg: PersonalConstants.ASPECT_RATIO_LG
          }).getValue(this.currentBreakpoint))
          .borderRadius($r('app.float.vp_sixteen'))
        Text(liveItem.watchDesc)
          .fontSize($r('app.float.micro_font_size'))
          .fontColor(Color.White)
          .backgroundColor($r('app.color.forty_alpha_black'))
          .borderRadius($r('app.float.vp_eight'))
          .height($r('app.float.vp_sixteen'))
          .padding({
            right: $r('app.float.vp_eight'),
            left: $r('app.float.vp_twenty')
          })
          .margin({
            top: $r('app.float.vp_eight'),
            left: $r('app.float.live_desc_margin_left')
          })
        Text(liveItem.living ? $r('app.string.living') : $r('app.string.not_living'))
          .fontSize($r('app.float.micro_font_size'))
          .fontColor(Color.White)
          .backgroundColor(liveItem.living ? Color.Red : $r("app.color.forty_alpha_black"))
          .borderRadius($r('app.float.vp_eight'))
          .height($r('app.float.vp_sixteen'))
          .padding({
            right: $r('app.float.vp_eight'),
            left: $r('app.float.vp_eight')
          })
          .margin({
            top: $r('app.float.vp_eight'),
            left: $r('app.float.vp_eight')
          })
      }
      .width(StyleConstants.FULL_WIDTH)

      Row() {
        Image($rawfile(liveItem.liverIcon))
          .objectFit(ImageFit.Contain)
          .width($r('app.float.vp_twenty_four'))
          .height($r('app.float.vp_twenty_four'))
          .margin({ left: $r('app.float.vp_four') })
        Column() {
          Text(liveItem.liverName)
            .fontSize($r('app.float.small_font_size'))
            .fontWeight(StyleConstants.FONT_WEIGHT_FIVE)
            .fontColor(Color.Black)
            .margin({ bottom: $r('app.float.vp_four') })

          Text(liveItem.liverDesc)
            .fontSize($r('app.float.smaller_font_size'))
            .fontWeight(StyleConstants.FONT_WEIGHT_FOUR)
            .fontColor(Color.Black)
        }
        .alignItems(HorizontalAlign.Start)
        .width(StyleConstants.FULL_WIDTH)
        .margin({
          top: $r('app.float.vp_eight'),
          left: $r('app.float.vp_eight'),
          bottom: $r('app.float.vp_twelve')
        })
      }
      .backgroundColor(Color.White)
      .width(StyleConstants.FULL_WIDTH)
      .alignItems(VerticalAlign.Center)
      .width(StyleConstants.FULL_WIDTH)
    }
    .borderRadius($r('app.float.vp_sixteen'))
  }
}