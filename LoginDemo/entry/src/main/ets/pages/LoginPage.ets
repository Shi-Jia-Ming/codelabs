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

import CommonConstants from '../common/constants/CommonConstants';
import StyleConstants from '../common/constants/StyleConstants';
import CommonUtils from '../common/utils/CommonUtils';
import MultipleDevicesUtils from '../common/utils/MultipleDevicesUtils';

/**
 * The login page consists of two components.
 * LoginTitle and LoginBottom, which can be invoked by directly referencing the control.
 */
@Entry
@Component
struct LoginPage {
  @StorageProp('currentDeviceSize') currentDeviceSize: string = CommonConstants.SM;

  onPageShow() {
    MultipleDevicesUtils.register();
  }

  build() {
    GridRow({
      columns: {
        sm: StyleConstants.COLUMNS_SM,
        md: StyleConstants.COLUMNS_MD,
        lg: StyleConstants.COLUMNS_LG
      },
      gutter: {
        x: StyleConstants.GRID_GUTTER
      }
    }) {
      GridCol({
        span: {
          sm: StyleConstants.SPAN_SM,
          md: StyleConstants.SPAN_MD,
          lg: StyleConstants.SPAN_LG
        }, offset: {
          md: StyleConstants.OFFSET_MD,
          lg: StyleConstants.OFFSET_LG
        }
      }) {
        Column() {
          // Title component
          LoginTitle()
          // Bottom component
          LoginBottom()
        }
      }
    }
    .backgroundColor($r('app.color.background'))
  }
}

@Preview
@Component
struct LoginTitle {
  build() {
    Column() {
      Image($r('app.media.icon'))
        .width($r('app.float.logo_image_size'))
        .height($r('app.float.logo_image_size'))
        .margin({ bottom: $r('app.float.logo_margin_bottom') })
      Text($r('app.string.login_page'))
        .fontSize($r('app.float.common_text_size'))
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.title_text_color'))
      Text($r('app.string.login_more'))
        .fontSize($r('app.float.normal_text_size'))
        .fontColor($r('app.color.more_text_color'))
        .margin({
          top: $r('app.float.more_margin_top'),
          bottom: $r('app.float.more_margin_bottom')
        })
    }
    .backgroundColor($r('app.color.background'))
    .justifyContent(FlexAlign.Center)
    .width(StyleConstants.FULL_PARENT)
    .height(StyleConstants.LOGIN_LOGO_HEIGHT)
  }
}

@Preview
@Component
struct LoginBottom {
  @State account: string = '';
  @State password: string = '';

  build() {
    Column() {
      Column() {
        TextInput({ placeholder: $r('app.string.account') })
          .maxLength(StyleConstants.INPUT_ACCOUNT_LENGTH)
          .type(InputType.Number)
          .inputStyle()
          .onChange((value: string) => {
            this.account = value;
          })

        Line()
          .width(StyleConstants.FULL_PARENT)
          .height($r('app.float.line_height'))
          .margin({
            left: $r('app.float.line_margin_left'),
            right: $r('app.float.line_margin_right')
          })
          .backgroundColor($r('app.color.line_color'))

        TextInput({ placeholder: $r('app.string.password') })
          .maxLength(StyleConstants.INPUT_PASSWORD_LENGTH)
          .type(InputType.Password)
          .inputStyle()
          .onChange((value: string) => {
            this.password = value;
          })
      }
      .backgroundColor(Color.White)
      .borderRadius($r('app.float.login_input_radius'))

      Row() {
        Text($r('app.string.message_login'))
          .blueTextStyle()
          .onClick(() => {
            CommonUtils.showToastContent($r('app.string.incomplete_toast'));
          })
        Text($r('app.string.forgot_password'))
          .blueTextStyle()
          .onClick(() => {
            CommonUtils.showToastContent($r('app.string.incomplete_toast'));
          })
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width(StyleConstants.FULL_PARENT)
      .margin({ top: $r('app.float.forgot_margin_top') })
      .padding({
        left: $r('app.float.forgot_padding_left'),
        right: $r('app.float.forgot_padding_right')
      })

      Button($r('app.string.login'))
        .id(CommonConstants.LOGIN_BUTTON_ID)
        .width(StyleConstants.FULL_PARENT)
        .height($r('app.float.login_button_height'))
        .fontSize($r('app.float.normal_text_size'))
        .fontWeight(FontWeight.Medium)
        .backgroundColor($r('app.color.login_button_color'))
        .margin({
          top: $r('app.float.login_button_top'),
          bottom: $r('app.float.login_button_bottom')
        })
        .onClick(() => {
          CommonUtils.loginArkTS(this.account, this.password);
        })
      Text($r('app.string.register_account'))
        .fontColor($r('app.color.blue_text_color'))
        .fontSize($r('app.float.normal_text_size'))
        .fontWeight(FontWeight.Medium)
        .onClick(() => {
          CommonUtils.showToastContent($r('app.string.incomplete_toast'));
        })
    }
    .padding({
      left: $r('app.float.login_button_left'),
      right: $r('app.float.login_button_right'),
    })
    .backgroundColor($r('app.color.background'))
    .height(StyleConstants.LOGIN_BOTTOM_HEIGHT)
  }
}

@Extend(TextInput) function inputStyle() {
  .placeholderColor($r('app.color.placeholder_color'))
  .height($r('app.float.login_input_height'))
  .fontSize($r('app.float.normal_text_size'))
  .backgroundColor(Color.White)
  .margin({ top: $r('app.float.input_margin_top') })
  .padding({ left: StyleConstants.INPUT_PADDING_LEFT })
}

@Extend(Text) function blueTextStyle() {
  .fontColor($r('app.color.blue_text_color'))
  .fontSize($r('app.float.small_text_size'))
  .fontWeight(FontWeight.Medium)
}