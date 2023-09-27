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

import { StyleConstants } from '../common/constants/StyleConstants';
import { BreakpointConstants } from '../common/constants/BreakpointConstants';
import { GridConstants } from '../common/constants/GridConstants';
import { BreakpointType } from '../common/utils/BreakpointSystem';
import { optionList } from '../viewmodel/SongListData';
import { OptionItem } from '../viewmodel/SongListData';
import { ContentConstants } from '../common/constants/ContentConstants';

@Component
export struct AlbumComponent {
  @State imgHeight: number = 0;
  @Link currentBreakpoint: string;

  @Builder
  CoverImage() {
    Stack({ alignContent: Alignment.BottomStart }) {
      Image($r('app.media.ic_album'))
        .width(StyleConstants.FULL_WIDTH)
        .aspectRatio(ContentConstants.ASPECT_RATIO_ALBUM_COVER)
        .borderRadius($r('app.float.album_cover_border_radius'))
        .onAreaChange((oldArea: Area, newArea: Area) => {
          this.imgHeight = newArea.height as number;
        })
      Text($r('app.string.collection_num'))
        .letterSpacing(ContentConstants.LETTER_SPACING)
        .fontColor(Color.White)
        .fontSize(new BreakpointType({
          sm: $r('app.float.collection_font_sm'),
          md: $r('app.float.collection_font_md'),
          lg: $r('app.float.collection_font_lg')
        }).getValue(this.currentBreakpoint))
        .translate({
          x: StyleConstants.TRANSLATE_X,
          y: StyleConstants.TRANSLATE_Y
        })
    }
    .width(StyleConstants.FULL_WIDTH)
    .height(StyleConstants.FULL_HEIGHT)
    .aspectRatio(ContentConstants.ASPECT_RATIO_ALBUM_COVER)
  }

  @Builder
  CoverIntroduction() {
    Column() {
      Text($r('app.string.list_name'))
        .opacity($r('app.float.album_name_opacity'))
        .fontWeight(ContentConstants.ALBUM_FONT_WEIGHT)
        .fontColor($r('app.color.album_name_introduction'))
        .fontSize(new BreakpointType({
          sm: $r('app.float.list_font_sm'),
          md: $r('app.float.list_font_md'),
          lg: $r('app.float.list_font_lg')
        }).getValue(this.currentBreakpoint))
        .margin({ bottom: $r('app.float.album_name_margin') })

      Text($r('app.string.playlist_Introduction'))
        .opacity($r('app.float.introduction_opacity'))
        .width(StyleConstants.FULL_WIDTH)
        .fontWeight(ContentConstants.INTRODUCTION_FONT_WEIGHT)
        .fontColor($r('app.color.album_name_introduction'))
        .fontSize(new BreakpointType({
          sm: $r('app.float.introduction_font_sm'),
          md: $r('app.float.introduction_font_md'),
          lg: $r('app.float.introduction_font_lg')
        }).getValue(this.currentBreakpoint))
    }
    .width(StyleConstants.FULL_WIDTH)
    .height(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ?
    this.imgHeight : $r('app.float.introduction_height'))
    .alignItems(HorizontalAlign.Start)
    .justifyContent(FlexAlign.Center)
    .padding({
      left: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ? $r('app.float.introduction_padding') : 0
    })
    .margin({
      top: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ? 0 : $r('app.float.introduction_margin_top'),
      bottom: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ?
        0 : $r('app.float.introduction_margin_bottom')
    })
  }

  @Builder
  CoverOptions() {
    Row() {
      ForEach(optionList, (item: OptionItem) => {
        Column({ space: ContentConstants.COVER_OPTION_SPACE }) {
          Image(item.image)
            .height($r('app.float.option_image_size'))
            .width($r('app.float.option_image_size'))
          Text(item.text)
            .fontColor($r('app.color.album_name_introduction'))
            .fontSize(new BreakpointType({
              sm: $r('app.float.option_font_sm'),
              md: $r('app.float.option_font_md'),
              lg: $r('app.float.option_font_lg')
            }).getValue(this.currentBreakpoint))
        }
        .onClick(item.action ? item.action : () => {})
      }, (item: OptionItem, index?: number) => index + JSON.stringify(item))
    }
    .height($r('app.float.option_area_height'))
    .width(StyleConstants.FULL_WIDTH)
    .padding({
      left: $r('app.float.options_padding'),
      right: $r('app.float.options_padding')
    })
    .justifyContent(FlexAlign.SpaceBetween)
  }

  build() {
    Column() {
      GridRow() {
        GridCol({
          span: {
            sm: GridConstants.SPAN_FOUR,
            md: GridConstants.SPAN_TWELVE,
            lg: GridConstants.SPAN_TWELVE
          }
        }) {
          this.CoverImage()
        }

        GridCol({
          span: {
            sm: GridConstants.SPAN_EIGHT,
            md: GridConstants.SPAN_TWELVE,
            lg: GridConstants.SPAN_TWELVE
          }
        }) {
          this.CoverIntroduction()
        }

        GridCol({
          span: {
            sm: GridConstants.SPAN_TWELVE,
            md: GridConstants.SPAN_TWELVE,
            lg: GridConstants.SPAN_TWELVE
          }
        }) {
          this.CoverOptions()
        }
        .padding({
          top: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ? $r('app.float.option_margin') : 0,
          bottom: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ? $r('app.float.option_margin') : 0
        })
      }
      .padding({
        top: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ?
        $r('app.float.cover_padding_top_sm') : $r('app.float.cover_padding_top_other'),
        left: new BreakpointType({
          sm: $r('app.float.album_padding_sm'),
          md: $r('app.float.album_padding_md'),
          lg: $r('app.float.album_padding_lg')
        }).getValue(this.currentBreakpoint),
        right: new BreakpointType({
          sm: $r('app.float.album_padding_sm'),
          md: $r('app.float.album_padding_md'),
          lg: $r('app.float.album_padding_lg')
        }).getValue(this.currentBreakpoint)
      })
    }
    .margin({
      left: new BreakpointType({
        sm: $r('app.float.music_list_cover_margin_sm'),
        md: $r('app.float.music_list_cover_margin_md'),
        lg: $r('app.float.music_list_cover_margin_lg')
      }).getValue(this.currentBreakpoint),
      right: new BreakpointType({
        sm: $r('app.float.music_list_cover_margin_sm'),
        md: $r('app.float.music_list_cover_margin_md'),
        lg: $r('app.float.music_list_cover_margin_lg')
      }).getValue(this.currentBreakpoint)
    })
  }
}