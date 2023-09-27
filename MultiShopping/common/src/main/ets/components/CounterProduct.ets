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

@Component
export struct CounterProduct {
  @State @Watch('onChange') quantityCount: number = 1;
  @State disabled: boolean = true;
  private count: number = 1;
  private counterMin: number = 1;
  private onNumberChange: (n: number) => void = () => {};

  aboutToAppear() {
    this.quantityCount = this.count;
    if (this.quantityCount === this.counterMin) {
      this.disabled = true;
    }
  }

  onChange() {
    this.disabled = (this.quantityCount === this.counterMin);
  }

  build() {
    Row() {
      Image(this.disabled ? $r('app.media.ic_decrease_disable') : $r('app.media.ic_decrease'))
        .width($r('app.float.vp_twenty_four'))
        .height($r('app.float.vp_twenty_four'))
        .onClick(() => {
          if (this.disabled) {
            return;
          }
          this.quantityCount = Math.max(this.quantityCount - 1, this.counterMin);
          this.onNumberChange(this.quantityCount);
        })
      Text(`${this.quantityCount}`)
        .fontSize($r('app.float.smaller_font_size'))
        .fontColor(Color.Black)
        .textAlign(TextAlign.Center)
        .width($r('app.float.count_text_width'))
        .height($r('app.float.vp_twenty_four'))
      Image($r('app.media.ic_increase'))
        .width($r('app.float.vp_twenty_four'))
        .height($r('app.float.vp_twenty_four'))
        .onClick(() => {
          this.quantityCount = Math.min(this.quantityCount + 1, Number.MAX_VALUE);
          this.onNumberChange(this.quantityCount);
        })
    }
    .width($r('app.float.count_width'))
    .height($r('app.float.vp_twenty_four'))
  }
}
