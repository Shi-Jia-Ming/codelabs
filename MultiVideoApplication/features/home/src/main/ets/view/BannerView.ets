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

import { BreakpointConstants, CommonConstants } from '@ohos/commons';
import { BreakpointType } from '@ohos/commons';
import { HomeConstants } from '../constants/HomeConstants';
import { Banner, BannerViewModel } from '../viewmodel/BannerViewModel';

@Component
export struct BannerView {
  @StorageLink('currentBreakpoint') currentBreakpoint: string = BreakpointConstants.BREAKPOINT_LG;
  @Prop currentTopIndex: number = 0;
  @Prop windowWidth: number = 0;
  private bannerImgList: Banner[] = new BannerViewModel().getBannerList();
  private dotIndicatorList: number[] = HomeConstants.DOT_INDICATOR_NUMBER;

  build() {
    Column() {
      // Banner layout.
      Row() {
        Swiper() {
          ForEach(this.bannerImgList, (item: Banner) => {
            Column() {
              Stack() {
                Image(item.getBannerImg().getImgSrc())
                  .objectFit(ImageFit.Fill)
                  .borderRadius($r('app.float.banner_img_border_radius'))
                  .height(CommonConstants.FULL_PERCENT)
                  .width(CommonConstants.FULL_PERCENT)

                Column() {
                  Text(item.getDescription().getFirstText().getDescription())
                    .fontSize(item.getDescription().getFirstText().getFontSize().GetValue(this.currentBreakpoint))
                    .lineHeight(item.getDescription().getFirstText().getLineHeight().GetValue(this.currentBreakpoint))
                    .fontWeight(item.getDescription().getFirstText().getFontWeight())
                    .fontColor(Color.White)
                    .margin({ left: item.getDescription().getFirstText().getLeftPosition() !== null?
                      item.getDescription().getFirstText().getLeftPosition().GetValue(this.currentBreakpoint) : '0' })
                    .letterSpacing(HomeConstants.BANNER_TEXT_LETTER_SPACES[2])
                    .maxLines(1)

                  Text(item.getDescription().getSecondText().getDescription())
                    .fontSize(item.getDescription().getSecondText().getFontSize().GetValue(this.currentBreakpoint))
                    .lineHeight(item.getDescription().getSecondText().getLineHeight().GetValue(this.currentBreakpoint))
                    .fontWeight(item.getDescription().getSecondText().getFontWeight())
                    .fontColor(Color.White)
                    .margin({ left: item.getDescription().getSecondText().getIsCenter() === false ?
                      item.getDescription().getSecondText().getLeftPosition().GetValue(this.currentBreakpoint) : '0' })
                    .letterSpacing(HomeConstants.BANNER_TEXT_LETTER_SPACES[1])
                    .maxLines(1)
                }
                .alignItems(item.getDescription().getFirstText().getIsCenter() === true ? HorizontalAlign.Center :
                  HorizontalAlign.Start)
                .justifyContent(FlexAlign.Center)
                .height(CommonConstants.FULL_PERCENT)
                .width(CommonConstants.FULL_PERCENT)
              }
              .height(item.getBannerImg().getHeight().GetValue(this.currentBreakpoint))
              .width(CommonConstants.FULL_PERCENT)
              // The width and height vary with the container assembly and the aspect ratio remains unchanged.
              .aspectRatio(new BreakpointType(HomeConstants.BANNER_RATIOS[0], HomeConstants.BANNER_RATIOS[1],
                HomeConstants.BANNER_RATIOS[2]).GetValue(this.currentBreakpoint))
            }
          }, (item: Banner, index: number) => index + JSON.stringify(item))
        }
        .index(1)
        .displayCount(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ? 1 : HomeConstants.TWO)
        // Interval between banner images
        .itemSpace(HomeConstants.SWIPER_ITEM_SPACE)
        // Setting the navigation point Style of the swiper.
        .indicator(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ? Indicator.dot()
          .itemWidth($r('app.float.swiper_item_size'))
          .itemHeight($r('app.float.swiper_item_size'))
          .selectedItemWidth($r('app.float.swiper_selected_item_width'))
          .selectedItemHeight($r('app.float.swiper_item_size'))
          .color($r('app.color.swiper_indicator'))
          .selectedColor(Color.White) : false
        )
        .loop(true)
        .width(CommonConstants.FULL_PERCENT)
        .visibility((this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG) && (this.currentTopIndex === 1) ?
          Visibility.None : Visibility.Visible)
        .effectMode(EdgeEffect.None)
        // The sizes of the front and rear banners on the MD and LG devices are different.
        .prevMargin(new BreakpointType($r('app.float.swiper_prev_next_margin_sm'),
          $r('app.float.swiper_prev_next_margin_md'), $r('app.float.swiper_prev_next_margin_lg'))
          .GetValue(this.currentBreakpoint))
        .nextMargin(new BreakpointType($r('app.float.swiper_prev_next_margin_sm'),
          $r('app.float.swiper_prev_next_margin_md'), $r('app.float.swiper_prev_next_margin_lg'))
          .GetValue(this.currentBreakpoint))

        // Switch the tab to switch the banner display effect.
        Row({ space: HomeConstants.BANNER_ROW_SPACE }) {
          BannerText({
            banner: this.bannerImgList[1],
            leftFirstText: HomeConstants.BANNER_TEXT_1_MARGIN_MD,
            leftSecondText: HomeConstants.BANNER_TEXT_2_MARGIN_MD
          })
            .layoutWeight(CommonConstants.FOUR)
            .height(CommonConstants.FULL_PERCENT)

          BannerText({
            banner: this.bannerImgList[2],
            leftFirstText: HomeConstants.BANNER_TEXT_3_MARGIN_MD,
            leftSecondText: HomeConstants.BANNER_TEXT_4_MARGIN_MD
          })
            .layoutWeight(CommonConstants.FOUR)
            .height(CommonConstants.FULL_PERCENT)

          Column() {
            BannerText({
              banner: this.bannerImgList[3],
              leftFirstText: '',
              leftSecondText: ''
            })
              .margin({ bottom: $r('app.float.new_banner_3_margin') })
              .layoutWeight(1)

            BannerText({
              banner: this.bannerImgList[4],
              leftFirstText: '',
              leftSecondText: ''
            })
              .layoutWeight(1)
          }
          .layoutWeight(CommonConstants.THREE)
        }
        .height(this.getBannerNewHeight(this.windowWidth))
        .width(CommonConstants.FULL_PERCENT)
        .visibility((this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG) && (this.currentTopIndex === 1) ?
          Visibility.Visible : Visibility.None)
        .padding({
          left: $r('app.float.banner_padding_sm'),
          right: $r('app.float.banner_padding_sm')
        })
      }
      .width(CommonConstants.FULL_PERCENT)
      .margin({
        top: $r('app.float.banner_margin'),
        bottom: $r('app.float.banner_margin')
      })
      .padding({
        left: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ? $r('app.float.banner_padding_sm') : '0',
        right: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ? $r('app.float.banner_padding_sm') : '0'
      })
      .visibility(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG && this.currentTopIndex === 2 ?
        Visibility.None : Visibility.Visible)

      Row() {
        // Immersive layout.
        Column() {
          Text(HomeConstants.IMMERSIVE_BANNER_TEXT[0])
            .fontSize($r('app.float.immersive_text_1_font'))
            .letterSpacing(HomeConstants.IMMERSIVE_TEXT_LETTER_SPACINGS[0])
            .lineHeight($r('app.float.immersive_text_1_line'))
            .fontWeight(CommonConstants.FONT_WEIGHT_500)
            .fontColor(Color.White)
            .maxLines(1)
            .margin({
              left: HomeConstants.IMMERSIVE_TEXT_LEFT_MARGIN[0],
              bottom: $r('app.float.immersive_text_1_bottom')
            })
          Text(HomeConstants.IMMERSIVE_BANNER_TEXT[1])
            .fontSize($r('app.float.immersive_text_2_font'))
            .letterSpacing(HomeConstants.IMMERSIVE_TEXT_LETTER_SPACINGS[1])
            .lineHeight($r('app.float.immersive_text_2_line'))
            .fontWeight(CommonConstants.FONT_WEIGHT_500)
            .fontColor(Color.White)
            .maxLines(1)
            .margin({ left: HomeConstants.IMMERSIVE_TEXT_LEFT_MARGIN[1] })
        }
        .height(CommonConstants.FULL_PERCENT)
        .width(CommonConstants.FULL_PERCENT)
        .justifyContent(FlexAlign.Center)
      }
      .padding({
        left: $r('app.float.home_content_padding'),
        right: $r('app.float.home_content_padding')
      })
      .height($r('app.float.immersive_banner_height'))
      .width(CommonConstants.FULL_PERCENT)
      .visibility(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG && this.currentTopIndex === 2 ?
        Visibility.Visible : Visibility.None)
    }
    .width(CommonConstants.FULL_PERCENT)
    .padding({ left: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG && this.currentTopIndex === 2 ?
      $r('app.float.side_bar_width') : 0 })
  }

  getBannerNewHeight(windowWidth: number): string {
    // Obtain the window width and subtract the blank parts on both sides.
    let result: number = px2vp(windowWidth) - HomeConstants.VIDEO_GRID_MARGIN - HomeConstants.LG_SIDEBAR_WIDTH;
    // Calculate the width of a single image based on the percent.
    result = (result - HomeConstants.VIDEO_GRID_ITEM_SPACE * 2) * CommonConstants.FOUR / HomeConstants.ELEVEN;
    // Calculate the total height of the grid layout.
    return result / HomeConstants.NEW_BANNER_ASPECT_RATIO + HomeConstants.HEIGHT_UNIT;
  }
}

@Component
struct BannerText {
  private banner: Banner = new BannerViewModel().getBannerList()[0];
  private currentBreakpoint: string = BreakpointConstants.BREAKPOINT_LG;
  private leftFirstText: string = '';
  private leftSecondText: string = '';

  build() {
    Stack() {
      Image(this.banner.getBannerImg().getImgSrc())
        .width(CommonConstants.FULL_PERCENT)
        .height(CommonConstants.FULL_PERCENT)
        .objectFit(ImageFit.Fill)
        .borderRadius($r('app.float.banner_img_border_radius'))

      Column() {
        Text(this.banner.getDescription().getFirstText().getDescription())
          .fontSize(this.banner.getDescription().getFirstText().getFontSize().GetValue(this.currentBreakpoint))
          .fontWeight(this.banner.getDescription().getFirstText().getFontWeight())
          .lineHeight(this.banner.getDescription().getFirstText().getLineHeight().GetValue(this.currentBreakpoint))
          .fontColor(Color.White)
          .letterSpacing(HomeConstants.BANNER_TEXT_LETTER_SPACES[2])
          .maxLines(1)
          .margin({ left: this.banner.getDescription().getFirstText().getIsCenter() === true ? 0 : this.leftFirstText })

        Text(this.banner.getDescription().getSecondText().getDescription())
          .fontSize(this.banner.getDescription().getSecondText().getFontSize().GetValue(this.currentBreakpoint))
          .fontWeight(this.banner.getDescription().getSecondText().getFontWeight())
          .lineHeight(this.banner.getDescription().getSecondText().getLineHeight().GetValue(this.currentBreakpoint))
          .fontColor(Color.White)
          .letterSpacing(HomeConstants.BANNER_TEXT_LETTER_SPACES[1])
          .maxLines(1)
          .margin({ left: this.banner.getDescription().getSecondText().getIsCenter() === true ? 0 :
            this.leftSecondText })
      }
      .alignItems(this.banner.getDescription().getFirstText().getIsCenter() === true ? HorizontalAlign.Center :
        HorizontalAlign.Start)
      .width(CommonConstants.FULL_PERCENT)
    }
  }
}