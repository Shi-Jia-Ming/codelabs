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

import { StyleConstants, BreakpointConstants, BreakPointType, CommonDataSource } from '@ohos/common';
import { swiperImage, classifyTitle, productData, ProductDataModel, aspectRatio } from '../viewmodel/NewProductData';

@Component
export struct NewProduct {
  @StorageProp('currentBreakpoint') currentBreakpoint: string = 'sm';
  @State titleIndex: number = 0;

  @Builder CustomSwiper() {
    Swiper() {
      ForEach(swiperImage, (item: Resource) => {
        Image(item)
          .width(StyleConstants.FULL_WIDTH)
          .aspectRatio(StyleConstants.IMAGE_ASPECT_RATIO)
          .borderRadius($r('app.float.vp_sixteen'))
          .backgroundColor(Color.White)
      }, item => JSON.stringify(item))
    }
    .indicatorStyle({
      color: $r('app.color.twenty_alpha_black'),
      selectedColor: $r('app.color.sixty_alpha_black'),
      right: $r('app.float.vp_twenty_four')
    })
    .autoPlay(true)
    .itemSpace(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ? 0 : StyleConstants.ITEM_SPACE)
    .width(StyleConstants.FULL_WIDTH)
    .indicator(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM)
    .displayCount(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ? StyleConstants.DISPLAY_THREE :
      (this.currentBreakpoint === BreakpointConstants.BREAKPOINT_MD ?
      StyleConstants.DISPLAY_TWO : StyleConstants.DISPLAY_ONE))
  }

  @Builder ClassifyTitle() {
    Flex({
      justifyContent: FlexAlign.SpaceAround,
      alignItems: ItemAlign.Center
    }) {
      ForEach(classifyTitle, (item: Resource, index: number) => {
        Text(item)
          .fontSize($r('app.float.middle_font_size'))
          .opacity(this.titleIndex === index ? StyleConstants.FULL_OPACITY : StyleConstants.EIGHTY_OPACITY)
          .fontWeight(this.titleIndex === index ? StyleConstants.FONT_WEIGHT_SEVEN : StyleConstants.FONT_WEIGHT_FOUR)
          .fontColor(Color.Black)
          .onClick(() => {
            this.titleIndex = index;
          })
      }, item => JSON.stringify(item))
      Row() {
        Image($r('app.media.ic_product_split'))
          .width($r('app.float.vp_eighteen'))
          .height($r('app.float.vp_sixteen'))
          .margin({
            left: $r('app.float.vp_two'),
            right: $r('app.float.vp_two')
          })
        Text($r('app.string.title_bar_classification'))
          .fontSize($r('app.float.middle_font_size'))
          .fontColor(Color.Black)
          .opacity(this.titleIndex === classifyTitle.length + 1 ?
            StyleConstants.FULL_OPACITY : StyleConstants.EIGHTY_OPACITY)
          .fontWeight(this.titleIndex === classifyTitle.length + 1 ?
            StyleConstants.FONT_WEIGHT_SEVEN : StyleConstants.FONT_WEIGHT_FOUR)
      }.onClick(() => {
        this.titleIndex = classifyTitle.length + 1;
      })
    }
    .height($r('app.float.classify_title_height'))
    .width(StyleConstants.FULL_WIDTH)
    .margin({
      bottom: $r('app.float.vp_sixteen'),
      top: $r('app.float.vp_sixteen'),
    })
  }

  @Builder ProductList() {
    List({ space: StyleConstants.TWELVE_SPACE }) {
      LazyForEach(new CommonDataSource<ProductDataModel>(productData), (item: ProductDataModel) => {
        ListItem() {
          Column() {
            Image($rawfile(item.img))
              .width(StyleConstants.FULL_WIDTH)
              .aspectRatio(new BreakPointType({
                sm: aspectRatio.sm,
                md: aspectRatio.md,
                lg: aspectRatio.lg
              }).getValue(this.currentBreakpoint))
              .objectFit(ImageFit.Fill)
            Column(){
              if (item.comment) {
                Text(item.comment)
                  .fontSize($r('app.float.smaller_font_size'))
                  .border({
                    width: $r('app.float.vp_one'),
                    color: $r('app.color.three_alpha_black'),
                    radius: $r('app.float.vp_fourteen')
                  })
                  .height($r('app.float.comment_text_height'))
                  .padding({
                    left: $r('app.float.vp_eight'),
                    right: $r('app.float.vp_eight')
                  })
                  .margin({
                    left: $r('app.float.vp_eight'),
                    top: $r('app.float.vp_eight')
                  })
              }
              Text(item.des)
                .fontSize($r('app.float.small_font_size'))
                .margin({
                  top: $r('app.float.vp_eight'),
                  bottom: $r('app.float.vp_eight'),
                  left: $r('app.float.vp_eight')
                })
              Row() {
                Image($r('app.media.ic_person'))
                  .width($r('app.float.vp_twenty'))
                  .height($r('app.float.vp_twenty'))
                Text(item.user)
                  .fontSize($r('app.float.small_font_size'))
                  .margin({ left: $r('app.float.vp_eight') })
              }
              .margin({
                left: $r('app.float.vp_ten'),
                bottom: $r('app.float.vp_ten')
              })
            }
            .width(StyleConstants.FULL_WIDTH)
            .backgroundColor(Color.White)
            .alignItems(HorizontalAlign.Start)
            .justifyContent(FlexAlign.Start)
            .borderRadius({ bottomLeft: $r('app.float.vp_eight'), bottomRight: $r('app.float.vp_eight') })
          }
          .borderRadius($r('app.float.vp_eight'))
        }
        .margin({
          left: $r('app.float.vp_six'),
          right: $r('app.float.vp_six')
        })
      }, item => JSON.stringify(item))
    }
    .lanes(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ?
      StyleConstants.DISPLAY_TWO : StyleConstants.DISPLAY_THREE)
    .padding({ left: $r('app.float.vp_twelve'), right: $r('app.float.vp_twelve') })
  }

  build() {
    Scroll() {
      Column() {
        this.CustomSwiper()
        this.ClassifyTitle()
        this.ProductList()
      }
    }
    .scrollBar(BarState.Off)
  }
}
