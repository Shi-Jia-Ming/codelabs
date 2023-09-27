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

import router from '@ohos.router';
import CommonConstants from '../common/constants/CommonConstants';
import Logger from '../common/utils/Logger';
import WindowModel from '../model/WindowModel';

@Extend(TextInput)
function inputStyle() {
  .placeholderColor($r('app.color.placeholder_color'))
  .backgroundColor(($r('app.color.start_window_background')))
  .height($r('app.float.login_input_height'))
  .fontSize($r('app.float.big_text_size'))
  .padding({
    left: $r('app.float.input_padding'),
    right: $r('app.float.input_padding')
  })
}

@Extend(Text)
function blueTextStyle() {
  .fontColor($r('app.color.login_blue_text_color'))
  .fontSize($r('app.float.small_text_size'))
  .fontWeight(FontWeight.Medium)
  .margin({
    left: $r('app.float.forgot_margin'),
    right: $r('app.float.forgot_margin')
  })
}

/**
 * Login page.
 */
@Entry
@Component
struct LoginPage {
  @State account: string = '';
  @State password: string = '';
  @State isShadow: boolean = false;
  private windowModel: WindowModel = WindowModel.getInstance();

  aboutToAppear() {
    getContext(this).eventHub.on(CommonConstants.HOME_PAGE_ACTION, () => {
      router.replaceUrl({
        url: CommonConstants.HOME_PAGE_URL
      }).catch((err: Error) => {
        Logger.error(`pushUrl failed, message:${err.message}`);
      });
    });
  }

  build() {
    Stack({ alignContent: Alignment.Top }) {
      Column() {
        Image($r('app.media.ic_logo'))
          .width($r('app.float.logo_image_size'))
          .height($r('app.float.logo_image_size'))
          .margin({
            top: $r('app.float.logo_margin_top'),
            bottom: $r('app.float.logo_margin_bottom')
          })
        Text($r('app.string.login_page'))
          .fontSize($r('app.float.page_title_text_size'))
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.title_text_color'))
        Text($r('app.string.login_more'))
          .fontSize($r('app.float.normal_text_size'))
          .fontColor($r('app.color.login_more_text_color'))
          .margin({
            bottom: $r('app.float.login_more_margin_bottom'),
            top: $r('app.float.login_more_margin_top')
          })

        Column() {
          TextInput({ placeholder: $r('app.string.account') })
            .maxLength(CommonConstants.INPUT_ACCOUNT_LENGTH)
            .inputStyle()
            .onChange((value: string) => {
              this.account = value;
            })
          Line()
            .width(CommonConstants.FULL_PARENT)
            .height($r('app.float.line_height'))
            .backgroundColor($r('app.color.line_color'))
            .margin({
              left: $r('app.float.line_margin'),
              right: $r('app.float.line_margin')
            })
          TextInput({ placeholder: $r('app.string.password') })
            .maxLength(CommonConstants.INPUT_PASSWORD_LENGTH)
            .type(InputType.Password)
            .inputStyle()
            .onChange((value: string) => {
              this.password = value;
            })
        }
        .padding({
          top: $r('app.float.background_text_margin'),
          bottom: $r('app.float.background_text_margin')
        })
        .width(CommonConstants.FULL_PARENT)
        .backgroundColor($r('app.color.start_window_background'))
        .borderRadius($r('app.float.background_border_radius'))

        Row() {
          Text($r('app.string.message_login')).blueTextStyle()
          Text($r('app.string.forgot_password')).blueTextStyle()
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width(CommonConstants.FULL_PARENT)
        .margin({ top: $r('app.float.forgot_margin_top') })

        Blank()
        Button($r('app.string.verify'), { type: ButtonType.Capsule })
          .width(CommonConstants.BUTTON_WIDTH)
          .height($r('app.float.login_button_height'))
          .fontSize($r('app.float.normal_text_size'))
          .fontWeight(FontWeight.Medium)
          .enabled(isLoginClickable(this.account, this.password))
          .backgroundColor(isLoginClickable(this.account, this.password) ? $r('app.color.login_button_color') : $r('app.color.login_button_disable'))
          .fontColor(isLoginClickable(this.account, this.password) ? Color.White : $r('app.color.login_font_disable'))
          .margin({
            top: $r('app.float.login_button_margin_top'),
            bottom: $r('app.float.login_button_margin_bottom')
          })
          .onClick(() => {
            this.windowModel.createSubWindow();
            this.isShadow = true;
          })
        Text($r('app.string.register_account'))
          .fontColor($r('app.color.login_blue_text_color'))
          .fontSize($r('app.float.normal_text_size'))
          .fontWeight(FontWeight.Medium)
          .margin({ bottom: $r('app.float.login_register_margin_bottom') })
      }
      .backgroundColor($r('app.color.background'))
      .height(CommonConstants.FULL_PARENT)
      .width(CommonConstants.FULL_PARENT)
      .padding({
        left: $r('app.float.login_padding'),
        right: $r('app.float.login_padding'),
        bottom: $r('app.float.login_page_padding_bottom')
      })

      if (this.isShadow) {
        Rect()
          .width(CommonConstants.FULL_PARENT)
          .height(CommonConstants.FULL_PARENT)
          .fillOpacity($r('app.float.login_background_opacity'))
          .fill($r('app.color.title_text_color'))
      }
    }
  }
}

/**
 * Calculate login button clickable by the input of username and password.
 *
 * @param account Login username.
 * @param password Login password.
 *
 * @return {boolean} isLoginButtonClickable.
 */
function isLoginClickable(account: string, password: string): boolean {
  return account !== '' && password !== '';
}