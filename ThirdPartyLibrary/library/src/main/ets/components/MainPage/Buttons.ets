/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import ButtonViewModel from '../../viewmodel/ButtonsViewModel';

@Component
export struct Buttons {
  @Prop buttonText: string = '';
  @Prop stateEffect: boolean = false;
  @Prop buttonShape: string = '';
  @Prop buttonType: string = '';
  @Prop fontColor: string = '';

  build() {
    Row() {
      Column() {
        Button({
          type: ButtonViewModel.fetchType(this.buttonShape),
          stateEffect: this.stateEffect
        }) {
          Text(this.buttonText)
            .fontSize($r('app.float.default_16'))
            .fontColor(this.fontColor || $r('app.color.white'))
        }
        .width($r('app.float.default_90'))
        .height($r('app.float.default_35'))
        .backgroundColor(ButtonViewModel.fetchBackgroundColor(this.buttonType))
      }
    }
  }
}
