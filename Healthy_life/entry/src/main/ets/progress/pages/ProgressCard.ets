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

let progressStorage = new LocalStorage();

@Entry(progressStorage)
@Component
struct ProgressCard {
  @LocalStorageProp('numerator') numerator: number = 0;
  @LocalStorageProp('denominator') denominator: number = 0;
  @LocalStorageProp('percent') percent: string = '0';

  /*
   * The action type.
   */
  readonly ACTION_TYPE: string = 'router';

  /*
   * The ability name.
   */
  readonly ABILITY_NAME: string = 'EntryAbility';

  /*
   * The with percentage setting.
   */
  readonly FULL_WIDTH_PERCENT: string = '100%';

  /*
   * The height percentage setting.
   */
  readonly FULL_HEIGHT_PERCENT: string = '100%';

  /*
   * The progress layout height percentage setting.
   */
  readonly PROGRESS_LAYOUT_HEIGHT: string = '80%';

  /*
   * The finish results layout percentage setting.
   */
  readonly RESULTS_LAYOUT_HEIGHT: string = '20%';

  /*
   * The percent sign.
   */
  readonly PERCENTAGE: string = '%';

  /*
   * The slashes splicing.
   */
  readonly SLASHES: string = '/';

  /**
   * The progress total to 100.
   */
  readonly PROGRESS_TOTAL: number = 100;

  /**
   * The text slightly bold.
   */
  readonly TEXT_SLIGHTLY_BOLD: number = 500;

  build() {
    Column() {
      Stack() {
        Progress({ value: 0, total: this.PROGRESS_TOTAL, type: ProgressType.Ring })
          .value(Number.parseInt(this.percent))
          .width($r('app.float.progress_component_size'))
          .height($r('app.float.progress_component_size'))
          .backgroundColor($r('app.color.progress_background_color'))
          .style({ strokeWidth: $r('app.float.progress_stroke_width') })
        Row() {
          Text(this.percent)
            .fontSize($r('app.float.percent_text_size'))
            .fontColor(Color.Black)
            .fontWeight(FontWeight.Normal)
          Text(this.PERCENTAGE)
            .fontSize($r('app.float.percent_sign_size'))
            .fontColor(Color.Black)
            .fontWeight(this.TEXT_SLIGHTLY_BOLD)
            .margin({ top: $r('app.float.percent_sign_margin') })
        }
        .justifyContent(FlexAlign.Center)
      }
      .height(this.PROGRESS_LAYOUT_HEIGHT)

      Row() {
        Text(this.numerator.toString())
          .fontColor($r('app.color.numerator_text_color'))
          .fontSize($r('app.float.numerator_text_size'))
          .lineHeight($r('app.float.numerator_line_height'))
          .fontWeight(FontWeight.Normal)
        Text(this.SLASHES + this.denominator)
          .fontColor($r('app.color.denominator_text_color'))
          .fontSize($r('app.float.denominator_text_size'))
          .lineHeight($r('app.float.denominator_line_height'))
          .fontWeight(FontWeight.Normal)
      }
      .height(this.RESULTS_LAYOUT_HEIGHT)
    }
    .backgroundColor($r("app.color.progress_column_color"))
    .width(this.FULL_WIDTH_PERCENT)
    .height(this.FULL_HEIGHT_PERCENT)
    .onClick(() => {
      postCardAction(this, {
        'action': this.ACTION_TYPE,
        'abilityName': this.ABILITY_NAME
      });
    })
  }
}