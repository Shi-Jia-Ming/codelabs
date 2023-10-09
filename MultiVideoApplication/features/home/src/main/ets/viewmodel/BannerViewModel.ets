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

import { CommonConstants } from '@ohos/commons';
import { BreakpointType } from '@ohos/commons';
import { HomeConstants } from '../constants/HomeConstants';

export class BannerViewModel {
  private bannerList: Banner[] = [];
  private bannerImgList: BannerImg[] = new BannerImgModel().getBannerImgList();
  private bannerDescriptionList: BannerDescription[] = new BannerDescriptionModel().getBannerDescriptionList();

  constructor() {
    this.bannerList.push(new Banner(this.bannerImgList[3], this.bannerDescriptionList[3]));
    this.bannerList.push(new Banner(this.bannerImgList[0], this.bannerDescriptionList[0]));
    this.bannerList.push(new Banner(this.bannerImgList[1], this.bannerDescriptionList[1]));
    this.bannerList.push(new Banner(this.bannerImgList[2], this.bannerDescriptionList[2]));
    this.bannerList.push(new Banner(this.bannerImgList[3], this.bannerDescriptionList[3]));
  }

  getBannerList(): Banner[] {
    return this.bannerList;
  }
}

class BannerImgModel {
  private BannerImgList: BannerImg[] = [];

  constructor() {
    this.BannerImgList.push(new BannerImg($r('app.media.ic_banner_1'), new BreakpointType(
      $r('app.float.banner_height_sm'), $r('app.float.banner_height_md'), $r('app.float.banner_height_lg'))));
    this.BannerImgList.push(new BannerImg($r('app.media.ic_banner_2'), new BreakpointType(
      $r('app.float.banner_height_sm'), $r('app.float.banner_height_md'), $r('app.float.banner_height_lg'))));
    this.BannerImgList.push(new BannerImg($r('app.media.ic_banner_3'), new BreakpointType(
      $r('app.float.banner_height_sm'), $r('app.float.banner_height_md'), $r('app.float.banner_height_lg'))));
    this.BannerImgList.push(new BannerImg($r('app.media.ic_banner_4'), new BreakpointType(
      $r('app.float.banner_height_sm'), $r('app.float.banner_height_md'), $r('app.float.banner_height_lg'))));
  }

  getBannerImgList(): BannerImg[] {
    return this.BannerImgList;
  }
}

class BannerDescriptionModel {
  private bannerDescriptionList: BannerDescription[] = [];

  constructor() {
    this.bannerDescriptionList.push(
      new BannerDescription(
        new TextInfo(HomeConstants.BANNER_TEXT_1,
          new BreakpointType($r('app.float.banner_text_1_font_sm'), $r('app.float.banner_text_1_font_md'),
            $r('app.float.banner_text_1_font_lg')), CommonConstants.FONT_WEIGHT_500,
          new BreakpointType($r('app.float.banner_text_1_height_sm'), $r('app.float.banner_text_1_height_sm'),
            $r('app.float.banner_text_1_height_sm')),
          new BreakpointType(HomeConstants.BANNER_TEXT_1_MARGIN_SM, HomeConstants.BANNER_TEXT_1_MARGIN_MD,
            HomeConstants.BANNER_TEXT_1_MARGIN_LG), false),
        new TextInfo(HomeConstants.BANNER_TEXT_2,
          new BreakpointType($r('app.float.banner_text_2_font_sm'), $r('app.float.banner_text_2_font_md'),
            $r('app.float.banner_text_2_font_lg')), CommonConstants.FONT_WEIGHT_500,
          new BreakpointType($r('app.float.banner_text_2_height_sm'), $r('app.float.banner_text_2_height_sm'),
            $r('app.float.banner_text_2_height_sm')),
          new BreakpointType(HomeConstants.BANNER_TEXT_2_MARGIN_SM, HomeConstants.BANNER_TEXT_2_MARGIN_MD,
            HomeConstants.BANNER_TEXT_2_MARGIN_LG), false)));
    this.bannerDescriptionList.push(
      new BannerDescription(
        new TextInfo(HomeConstants.BANNER_TEXT_3,
          new BreakpointType($r('app.float.banner_text_3_font_sm'), $r('app.float.banner_text_3_font_md'),
            $r('app.float.banner_text_3_font_lg')), CommonConstants.FONT_WEIGHT_700,
          new BreakpointType($r('app.float.banner_text_3_height_sm'), $r('app.float.banner_text_3_height_sm'),
            $r('app.float.banner_text_3_height_sm')),
          new BreakpointType(HomeConstants.BANNER_TEXT_3_MARGIN_SM, HomeConstants.BANNER_TEXT_3_MARGIN_MD,
            HomeConstants.BANNER_TEXT_3_MARGIN_LG), false),
        new TextInfo(HomeConstants.BANNER_TEXT_4,
          new BreakpointType($r('app.float.banner_text_4_font_sm'), $r('app.float.banner_text_4_font_md'),
            $r('app.float.banner_text_4_font_lg')), FontWeight.Normal,
          new BreakpointType($r('app.float.banner_text_4_height_sm'), $r('app.float.banner_text_4_height_sm'),
            $r('app.float.banner_text_4_height_sm')),
          new BreakpointType(HomeConstants.BANNER_TEXT_4_MARGIN_SM, HomeConstants.BANNER_TEXT_4_MARGIN_MD,
            HomeConstants.BANNER_TEXT_4_MARGIN_LG), false)));
    this.bannerDescriptionList.push(
      new BannerDescription(
        new TextInfo(HomeConstants.BANNER_TEXT_5,
          new BreakpointType($r('app.float.banner_text_5_font_sm'), $r('app.float.banner_text_5_font_md'),
            $r('app.float.banner_text_5_font_lg')), CommonConstants.FONT_WEIGHT_700,
          new BreakpointType($r('app.float.banner_text_5_height_sm'), $r('app.float.banner_text_5_height_sm'),
            $r('app.float.banner_text_5_height_sm')), new BreakpointType('0', '0', '0'), true),
        new TextInfo(HomeConstants.BANNER_TEXT_6,
          new BreakpointType($r('app.float.banner_text_6_font_sm'), $r('app.float.banner_text_6_font_md'),
            $r('app.float.banner_text_6_font_lg')), CommonConstants.FONT_WEIGHT_500,
          new BreakpointType($r('app.float.banner_text_6_height_sm'), $r('app.float.banner_text_6_height_sm'),
            $r('app.float.banner_text_6_height_sm')), new BreakpointType('0', '0', '0'), true)));
    this.bannerDescriptionList.push(
      new BannerDescription(
        new TextInfo(HomeConstants.BANNER_TEXT_7,
          new BreakpointType($r('app.float.banner_text_7_font_sm'), $r('app.float.banner_text_7_font_md'),
            $r('app.float.banner_text_7_font_lg')), CommonConstants.FONT_WEIGHT_700,
          new BreakpointType($r('app.float.banner_text_7_height_sm'), $r('app.float.banner_text_7_height_sm'),
            $r('app.float.banner_text_7_height_sm')), new BreakpointType('0', '0', '0'), true),
        new TextInfo(HomeConstants.BANNER_TEXT_8,
          new BreakpointType($r('app.float.banner_text_8_font_sm'), $r('app.float.banner_text_8_font_md'),
            $r('app.float.banner_text_8_font_lg')), CommonConstants.FONT_WEIGHT_500,
          new BreakpointType($r('app.float.banner_text_8_height_sm'), $r('app.float.banner_text_8_height_sm'),
            $r('app.float.banner_text_8_height_sm')), new BreakpointType('0', '0', '0'), true)));
  }

  getBannerDescriptionList(): BannerDescription[] {
    return this.bannerDescriptionList;
  }
}

export class Banner {
  /**
   * Img of the banner.
   */
  private bannerImg: BannerImg;

  /**
   * Description of the banner.
   */
  private description: BannerDescription;

  constructor(bannerImg: BannerImg, description: BannerDescription) {
    this.bannerImg = bannerImg;
    this.description = description;
  }

  getBannerImg(): BannerImg {
    return this.bannerImg;
  }

  getDescription(): BannerDescription {
    return this.description;
  }
}

class BannerDescription {
  /**
   * First text in banner.
   */
  private firstText: TextInfo;

  /**
   * Second text in banner.
   */
  private secondText: TextInfo;

  constructor(firstText: TextInfo, secondText: TextInfo) {
    this.firstText = firstText;
    this.secondText = secondText;
  }

  getFirstText(): TextInfo {
    return this.firstText;
  }

  getSecondText(): TextInfo {
    return this.secondText;
  }
}

class TextInfo {
  /**
   * Text description.
   */
  private description: string;

  /**
   * Font size of text.
   */
  private fontSize: BreakpointType<Resource>;

  /**
   * Font weight of text.
   */
  private fontWeight: number;

  /**
   * Line height of text.
   */
  private lineHeight: BreakpointType<Resource>;

  /**
   * Left position for text.
   */
  private leftPosition: BreakpointType<string>;

  /**
   * Whether text is center.
   */
  private isCenter: boolean;

  constructor(description: string, fontSize: BreakpointType<Resource>, fontWeight: number,
              lineHeight: BreakpointType<Resource>, leftPosition: BreakpointType<string>, isCenter: boolean) {
    this.description = description;
    this.fontSize = fontSize;
    this.fontWeight = fontWeight;
    this.lineHeight = lineHeight;
    this.leftPosition = leftPosition;
    this.isCenter = isCenter;
  }

  getDescription(): string {
    return this.description;
  }

  getFontSize(): BreakpointType<Resource> {
    return this.fontSize;
  }

  getFontWeight(): number {
    return this.fontWeight;
  }

  getLineHeight(): BreakpointType<Resource> {
    return this.lineHeight;
  }

  getLeftPosition(): BreakpointType<string> {
    return this.leftPosition;
  }

  getIsCenter(): boolean {
    return this.isCenter;
  }
}

class BannerImg {
  /**
   * Image src of the banner.
   */
  private imgSrc: Resource;

  /**
   * Height of the banner.
   */
  private height: BreakpointType<Resource>;

  constructor(imgSrc: Resource, height: BreakpointType<Resource>) {
    this.imgSrc = imgSrc;
    this.height = height;
  }

  getImgSrc(): Resource {
    return this.imgSrc;
  }

  getHeight(): BreakpointType<Resource> {
    return this.height;
  }
}