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

import { CommonEventBean } from '../common/bean/CommonEventBean';
import { CommonConstants } from '../common/constants/CommonConst';
import CommonEventUtil from '../common/utils/CommonEventUtil';
import MainPageViewModel from '../viewmodel/MainPageViewModel';
import promptAction from '@ohos.promptAction';

@Component
export default struct CommonEventListComponent {
  @State commonEventData: CommonEventBean[] = MainPageViewModel.getCommonEventData();
  @State toastMsg: Resource = $r('app.string.initial_empty');

  @Builder navigationTitle() {
    Column() {
      Text($r('app.string.system_common_event'))
        .width(CommonConstants.FULL_SCREEN_WIDTH)
        .fontColor($r('app.color.normal_black'))
        .fontSize($r('app.float.main_title_font_size'))
        .fontWeight(CommonConstants.FONT_WEIGHT_500)
    }
    .width(CommonConstants.FULL_SCREEN_WIDTH)
    .height($r('app.float.nav_height'))
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Navigation() {
      Column() {
        ForEach(this.commonEventData, (item: CommonEventBean, index: number) => {
          Column() {
            Row() {
              Row() {
                Image(item.isSubscribe ? item.onIcon : item.offIcon)
                  .width($r('app.float.icon_width'))
                  .height($r('app.float.icon_height'))
                  .objectFit(ImageFit.Contain)
                Text(item.title)
                  .fontSize($r('app.float.unit_title_font_size'))
                  .fontColor(item.isSubscribe ? $r('app.color.unit_title_check') : $r('app.color.unit_title_uncheck'))
                  .fontWeight(CommonConstants.FONT_WEIGHT_500)
                  .margin({ left: $r('app.float.unit_title_lm') })
              }

              Button(item.buttonTitle, { type: ButtonType.Capsule })
                .height($r('app.float.sub_button_height'))
                .fontSize($r('app.float.sub_btn_font_size'))
                .fontColor(item.isSubscribe ? $r('app.color.sub_color_check') : $r('app.color.sub_color_uncheck'))
                .backgroundColor(item.isSubscribe ? $r('app.color.sub_bgColor_check')
                                                  : $r('app.color.sub_bgColor_uncheck'))
                .fontWeight(CommonConstants.FONT_WEIGHT_500)
                .onClick(() => {
                  this.subscribeEvent(item, index);
                })
            }
            .width(CommonConstants.FULL_SCREEN_WIDTH)
            .padding({ bottom: $r('app.float.unit_bottom_padding'), top: $r('app.float.unit_top_padding') })
            .justifyContent(FlexAlign.SpaceBetween)

            if (item.isSubscribe) {
              Row() {
                Text(item.name)
                  .fontSize($r('app.float.item_name_font_size'))
                  .fontColor($r('app.color.item_name'))
                  .fontWeight(CommonConstants.FONT_WEIGHT_500)
                Text(item.state)
                  .fontSize($r('app.float.item_state_font_size'))
                  .fontColor($r('app.color.item_state'))
                  .fontWeight(CommonConstants.FONT_WEIGHT_500)
              }
              .height($r('app.float.sub_unit_height'))
              .width(CommonConstants.FULL_SCREEN_WIDTH)
              .padding({ top: $r('app.float.sub_unit_top_padding') })
              .justifyContent(FlexAlign.SpaceBetween)
            }
          }
          .width(CommonConstants.FULL_SCREEN_WIDTH)
          .backgroundImage(item.isSubscribe ? $r('app.media.ic_unit_bg') : '')
          .backgroundImageSize(ImageSize.Cover)
          .backgroundColor(item.isSubscribe ? '' : $r('app.color.full_unit_bg'))
          .borderRadius($r('app.float.full_border_radius'))
          .padding({ left: $r('app.float.full_padding_left'), right: $r('app.float.full_padding_right') })
          .margin({ top: $r('app.float.full_margin_top') })
        }, item => JSON.stringify(item))
      }
      .width(CommonConstants.FULL_SCREEN_WIDTH)
      .height(CommonConstants.FULL_SCREEN_HEIGHT)
      .justifyContent(FlexAlign.Start)
      .padding({ left: $r('app.float.container_padding_left'), right: $r('app.float.container_padding_right') })
    }
    .title(this.navigationTitle)
    .titleMode(NavigationTitleMode.Mini)
    .hideBackButton(true)
  }

  subscribeEvent(item: CommonEventBean, index: number): void {
    if (item.isSubscribe === false) {
      CommonEventUtil.subscribe(item, (commonEvent: CommonEventBean, toast?: Resource) => {
        this.commonEventData[index] = commonEvent;
        this.commonEventData = this.commonEventData.splice(0);
        if (commonEvent.changeState === false) {
          this.toastMsg = toast;
          this.showToast(this.toastMsg);
        }
      });
      return;
    }
    if (item.subscriber !== null) {
      CommonEventUtil.unsubscribe(item, (commonEvent: CommonEventBean, toast: Resource) => {
        this.toastMsg = toast;
        this.commonEventData[index] = commonEvent;
        this.commonEventData = this.commonEventData.splice(0);
        this.showToast(this.toastMsg);
      });
    }

  }

  showToast(toast: Resource): void {
    promptAction.showToast({
      message: toast,
      duration: CommonConstants.AUTO_CLOSE_TIME,
      bottom: CommonConstants.TOAST_BOTTOM
    });
  }
}