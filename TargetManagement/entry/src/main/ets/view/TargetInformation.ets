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

import { CommonConstants } from '../common/constant/CommonConstant';

@Component
export default struct TargetInformation {
  @Prop latestUpdateDate: string;
  @Prop totalTasksNumber: number;
  @Prop completedTasksNumber: number;

  build() {
    Column() {
      this.TargetItem()
      this.OverallProgress()
    }
    .padding($r('app.float.target_padding'))
    .width(CommonConstants.MAIN_BOARD_WIDTH)
    .height($r('app.float.target_info_height'))
    .backgroundColor(Color.White)
    .borderRadius(CommonConstants.TARGET_BORDER_RADIUS)
  }

  @Builder
  TargetItem() {
    Row() {
      Image($r("app.media.ic_main"))
        .width($r('app.float.target_image_length'))
        .height($r('app.float.target_image_length'))
        .objectFit(ImageFit.Fill)
        .borderRadius(CommonConstants.IMAGE_BORDER_RADIUS)
      Column() {
        Text($r('app.string.target_name'))
          .fontSize($r('app.float.target_name_font'))
          .fontWeight(CommonConstants.FONT_WEIGHT_LARGE)
          .width(CommonConstants.TITLE_WIDTH)
        Text($r('app.string.target_info'))
          .opacityTextStyle()
          .fontSize($r('app.float.target_desc_font'))
          .margin({ top: $r('app.float.title_margin') })
      }
      .margin({ left: CommonConstants.TARGET_MARGIN_LEFT })
      .alignItems(HorizontalAlign.Start)
    }
    .width(CommonConstants.FULL_WIDTH)
  }

  @Builder
  OverallProgress() {
    Row() {
      Column() {
        Text($r('app.string.overall_progress'))
          .fontSize($r('app.float.button_font'))
          .fontColor($r('app.color.title_black_color'))
          .fontWeight(CommonConstants.FONT_WEIGHT)
        Row() {
          Text($r('app.string.latest_updateTime'))
            .opacityTextStyle()
          Text(this.latestUpdateDate)
            .opacityTextStyle()
        }
        .margin({ top: $r('app.float.text_margin') })
      }
      .alignItems(HorizontalAlign.Start)

      Blank()
      Stack() {
        Row() {
          Text(this.completedTasksNumber.toString())
            .fontSize($r('app.float.progress_font'))
            .fontWeight(CommonConstants.FONT_WEIGHT)
            .fontColor($r('app.color.main_blue'))
          Text(`/${this.totalTasksNumber}`)
            .fontSize($r('app.float.progress_font'))
            .fontWeight(CommonConstants.FONT_WEIGHT)
        }

        Progress({
          value: this.completedTasksNumber,
          total: this.totalTasksNumber,
          type: ProgressType.Ring
        })
          .color($r('app.color.main_blue'))
          .style({
            strokeWidth: CommonConstants.STROKE_WIDTH
          })
          .width($r('app.float.progress_length'))
          .height($r('app.float.progress_length'))
      }
    }
    .width(CommonConstants.FULL_WIDTH)
    .height($r('app.float.progress_length'))
    .margin({ top: $r('app.float.progress_margin_top') })
  }
}

/**
 * Custom Transparent Text Styles
 */
@Extend(Text) function opacityTextStyle() {
  .fontSize($r('app.float.text_font'))
  .fontColor($r('app.color.title_black_color'))
  .opacity(CommonConstants.OPACITY)
  .fontWeight(CommonConstants.FONT_WEIGHT)
}