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

import { CommonConstants } from '../common/constants/CommonConstants';

@Component
export struct CurrentSituation {
  @Prop currentSteps: string = '';
  @Prop startPosition: string = '';
  @Prop currentLocation: string = '';

  @Styles descriptionTextStyle(){
    .width($r('app.float.description_text_width'))
    .height($r('app.float.description_text_height'))
  }
  @Styles displayTextStyle(){
    .width($r('app.float.display_text_width'))
    .height($r('app.float.display_text_height'))
  }

  build() {
    Row() {
      Column() {
        Text($r('app.string.walking_data'))
          .width(CommonConstants.FULL_WIDTH)
          .height($r('app.float.walling_height'))
          .fontSize($r('app.float.walling_text_font'))
          .fontColor($r('app.color.step_text_font'))
          .fontWeight(CommonConstants.SMALL_FONT_WEIGHT)
          .textAlign(TextAlign.Start)
          .margin({
            top: $r('app.float.walling_margin_top'),
            bottom: $r('app.float.walling_margin_bottom'),
            left: $r('app.float.walling_margin_left')
          })

        Row() {
          Text($r('app.string.current_steps'))
            .descriptionTextStyle()
            .fontSize($r('app.float.current_steps_font'))
            .fontColor($r('app.color.steps_text_font'))
            .fontWeight(CommonConstants.BIG_FONT_WEIGHT)
            .textAlign(TextAlign.Start)

          Text($r('app.string.step', this.currentSteps))
            .displayTextStyle()
            .fontSize($r('app.float.record_steps_font'))
            .fontColor($r('app.color.step_text_font'))
            .fontWeight(CommonConstants.BIG_FONT_WEIGHT)
            .textAlign(TextAlign.Start)
        }
        .width(CommonConstants.FULL_WIDTH)
        .height($r('app.float.current_row_height'))
        .margin({
          top: $r('app.float.current_margin_top'),
          bottom: $r('app.float.current_margin_bottom'),
          left: $r('app.float.current_margin_left')
        })

        Divider()
          .vertical(false)
          .color($r('app.color.divider'))
          .strokeWidth(CommonConstants.DIVIDER_STROKE_WIDTH)
          .margin({
            left: $r('app.float.divider_margin_left'),
            right: $r('app.float.divider_margin_right')
          })

        Row() {
          Text($r('app.string.start_position'))
            .descriptionTextStyle()
            .fontSize($r('app.float.start_position_font'))
            .fontColor($r('app.color.steps_text_font'))
            .fontWeight(CommonConstants.BIG_FONT_WEIGHT)
            .textAlign(TextAlign.Start)

          Text(this.startPosition)
            .displayTextStyle()
            .fontSize($r('app.float.position_font_size'))
            .fontColor($r('app.color.step_text_font'))
            .fontWeight(CommonConstants.BIG_FONT_WEIGHT)
            .textAlign(TextAlign.Start)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .maxLines(CommonConstants.MAX_LINE)
        }
        .width(CommonConstants.FULL_WIDTH)
        .height($r('app.float.start_position_height'))
        .margin({
          top: $r('app.float.position_margin_top'),
          bottom: $r('app.float.position_margin_bottom'),
          left: $r('app.float.position_margin_left')
        })

        Divider()
          .vertical(false)
          .color($r('app.color.divider'))
          .strokeWidth(CommonConstants.DIVIDER_STROKE_WIDTH)
          .margin({
            left: $r('app.float.divider_margin_left'),
            right: $r('app.float.divider_margin_right')
          })

        Row() {
          Text($r('app.string.current_location'))
            .descriptionTextStyle()
            .fontSize($r('app.float.location_font_size'))
            .fontColor($r('app.color.steps_text_font'))
            .fontWeight(CommonConstants.BIG_FONT_WEIGHT)
            .textAlign(TextAlign.Start)

          Text(this.currentLocation)
            .displayTextStyle()
            .fontSize($r('app.float.current_font_size'))
            .fontColor($r('app.color.step_text_font'))
            .fontWeight(CommonConstants.BIG_FONT_WEIGHT)
            .textAlign(TextAlign.Start)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .maxLines(CommonConstants.MAX_LINE)
        }
        .width(CommonConstants.FULL_WIDTH)
        .height($r('app.float.current_location_height'))
        .margin({
          top: $r('app.float.location_margin_top'),
          bottom: $r('app.float.location_margin_bottom'),
          left: $r('app.float.location_margin_left')
        })
      }
      .width(CommonConstants.SITUATION_WIDTH)
      .borderRadius($r('app.float.situation_border_radius'))
      .backgroundColor(Color.White)
    }
    .width(CommonConstants.FULL_WIDTH)
    .height($r('app.float.current_situation_height'))
    .margin({ top: $r('app.float.situation_margin_top') })
    .justifyContent(FlexAlign.Center)
  }
}