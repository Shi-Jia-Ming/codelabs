/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { HORIZONTAL_VIDEOS } from '../viewmodel/VideoData';
import {
  MARGIN_FONT_SIZE,
  STRING_PERCENT,
  SECOND_PAGE,
  NET
} from '../common/constants/CommonConstants';

/**
 * The modules in index
 */
@Component
export struct VideoModule {
  private moduleName: string;

  build() {
    Column() {
      Flex({ direction: FlexDirection.Row }) {
        Text(this.moduleName)
          .fontSize(MARGIN_FONT_SIZE.THIRD_MARGIN)
          .fontWeight(FontWeight.Bolder)
      }
      .margin({ left: STRING_PERCENT.INDEX_SWIPER_LEFT_RIGHT_MARGIN,
        bottom: MARGIN_FONT_SIZE.FIRST_MARGIN,
        top: MARGIN_FONT_SIZE.FIRST_MARGIN })

      List({ space: MARGIN_FONT_SIZE.FIRST_MARGIN }) {
        ForEach(HORIZONTAL_VIDEOS, item => {
          ListItem() {
            HorizontalItem({
              imageSrc: item.image,
              source: NET,
              videoName: item.name
            })
          }
        }, item => JSON.stringify(item))
      }
      .listDirection(Axis.Horizontal)
    }
    .margin({
      left: STRING_PERCENT.INDEX_SWIPER_LEFT_RIGHT_MARGIN,
      right: STRING_PERCENT.INDEX_SWIPER_LEFT_RIGHT_MARGIN
    })
    .height(STRING_PERCENT.INDEX_MODULE_HEIGHT_PERCENT)
    .width(STRING_PERCENT.INDEX_COMPONENT_WITH_PERCENT)
    .justifyContent(FlexAlign.Center)
    .borderRadius(MARGIN_FONT_SIZE.FOURTH_MARGIN)
    .borderStyle(BorderStyle.Solid)
    .borderColor(Color.White)
    .backgroundColor($r('app.color.white'))
  }
}

@Component
struct HorizontalItem {
  private imageSrc: Resource;
  private source: string;
  private videoName: string;

  build() {
    Column() {
      Image(this.imageSrc)
        .width(MARGIN_FONT_SIZE.SEVENTH_MARGIN)
        .height(MARGIN_FONT_SIZE.SIXTH_MARGIN)
        .onClick(() => {
          router.pushUrl({
            url: SECOND_PAGE,
            params: { source: this.source }
          });
        })
      Text(this.videoName)
        .margin({ top: MARGIN_FONT_SIZE.FIRST_MARGIN })
        .textAlign(TextAlign.Center)
        .fontSize(MARGIN_FONT_SIZE.SECOND_MARGIN)
    }
    .justifyContent(FlexAlign.Center)
  }
}