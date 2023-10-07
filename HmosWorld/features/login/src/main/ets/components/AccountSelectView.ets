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

import { ACCOUNT_LIST, Constants } from '../constants/LoginConstants';

@Component
export struct AccountSelectView {
  @Link account: string;
  @Link isShow: boolean;
  @State curIndex: number = ACCOUNT_LIST.indexOf(this.account);

  build() {
    Column() {
      List() {
        ForEach(ACCOUNT_LIST, (item: string, index?: number) => {
          if (index !== undefined) {
            ListItem() {
              Column() {
                Text(item)
                  .fontSize($r('app.float.account_list_font_size'))
                  .fontWeight(FontWeight.Normal)
                  .height($r('app.float.account_list_font_height'))
                  .width(Constants.FULL_SCREEN)
                if (index !== ACCOUNT_LIST.length - 1) {
                  Row() {
                    Line()
                      .height($r('app.float.line_height'))
                      .width(Constants.FULL_SCREEN)
                      .backgroundColor($r('app.color.account_line_background_color'))
                  }
                }
              }
              .padding({
                left: $r('app.float.account_list_padding_left'),
                right: $r('app.float.account_list_padding_left')
              })
              .justifyContent(FlexAlign.Start)
              .backgroundColor(this.curIndex === index ? $r('app.color.selected_account_background_color') : Color.White)
              .borderRadius($r('app.float.show_list_border_radius'))
              .onClick(() => {
                this.account = item;
                this.isShow = false;
              })
              .transition(
                TransitionEffect.OPACITY
                  .animation({
                    duration: Constants.ACCOUNT_LIST_ANIMATION_DURATION,
                    curve: Curve.Ease
                  })
                  .combine(TransitionEffect.translate({ y: Constants.ACCOUNT_LIST_TRANSLATE_Y }))
              )
            }
          }
        }, (item: string) => JSON.stringify(item))
      }
      .scrollBar(BarState.Off)
    }
    .borderRadius($r('app.float.show_list_border_radius'))
    .width($r('app.float.account_list_width'))
    .backgroundColor(Color.White)
    .padding($r('app.float.account_list_padding'))
    .offset({
      x: $r('app.float.account_list_offset_x'),
      y: $r('app.float.account_list_offset_y')
    })
    .transition(
      TransitionEffect.OPACITY
        .animation({
          duration: Constants.ACCOUNT_LIST_ANIMATION_DURATION,
          curve: Curve.Ease
        })
        .combine(TransitionEffect.translate({ y: Constants.ACCOUNT_LIST_TRANSLATE_Y }))
    )
  }
}