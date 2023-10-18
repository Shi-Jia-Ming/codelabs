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

import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import { UserModel } from '@ohos/mine';
import { UserAccount, splashImages, Logger } from '@ohos/common';
import { ACCOUNT_LIST, Constants, BgInfo, UrlParam } from '../constants/LoginConstants';
import { AccountSelectView } from '../components/AccountSelectView';
import { InputAreaView } from '../components/InputAreaView';

const TAG: string = '[LoginPage]';

@Entry
@Component
struct LoginPage {
  @State @Watch('LoadingEffect') isSigning: boolean = false;
  @State account: string = ACCOUNT_LIST[0];
  @State isShow: boolean = false;
  @State signingContent: Resource = $r('app.string.signing_content_1');
  @State curIndex: number = ACCOUNT_LIST.indexOf(this.account);
  @State password: string = Constants.INIT_PASSWORD;
  private userModel: UserModel = UserModel.getInstance();
  private backgroundImg: Resource = this.getBackground();
  private timer: number = 0;

  LoadingEffect(): void {
    if (this.isSigning) {
      this.timer = setTimeout(() => {
        this.signingContent = $r('app.string.signing_content_2');
        this.timer = setTimeout(() => {
          this.signingContent = $r('app.string.signing_content_3');
          this.timer = setTimeout(() => {
            this.signingContent = $r('app.string.signing_content_1');
            this.LoadingEffect();
          }, Constants.SIGNING_CONTEXT_DURATION);
        }, Constants.SIGNING_CONTEXT_DURATION);
      }, Constants.SIGNING_CONTEXT_DURATION);
    }
    else {
      clearTimeout(this.timer);
      this.signingContent = $r('app.string.signing_content_1');
    }
  }

  login(): void {
    if ((this.account.trim() === '') || (this.password.trim() === '')) {
      promptAction.showToast({
        message: $r('app.string.account_password_empty')
      });
      return;
    }
    this.isSigning = true;
    this.userModel.login(this.account, this.password).then((user: UserAccount | null) => {
      this.isSigning = false;
      if (user !== null) {
        AppStorage.setOrCreate('user', user);
        AppStorage.setOrCreate('isLogged', true);
        let context: common.UIAbilityContext = (getContext(this) as common.UIAbilityContext);
        let bundleName: string = context.applicationInfo.name;
        router.replaceUrl({
          url: `@bundle:${bundleName}/topic/ets/pages/ThemeSettingPage`,
          params: {
            firstTopic: true
          } as UrlParam
        });
      } else {
        promptAction.showToast({
          message: $r('app.string.user_exception')
        });
      }
    }).catch((error: BusinessError) => {
      this.isSigning = false;
      Logger.error(TAG, `login failed err=${JSON.stringify(error)}`);
      promptAction.showToast({
        message: $r('app.string.network_error_msg')
      });
    })
  }

  getBackground(): Resource {
    let param: BgInfo = (router.getParams() as Record<string, BgInfo>)[Constants.ROUTER_PARAMETER_BACKGROUND];
    if (Constants.TIME_TYPE_DAY === param.time) {
      return splashImages.day[param.index];
    } else if (Constants.TIME_TYPE_DUSK === param.time) {
      return splashImages.dusk[param.index];
    } else {
      return splashImages.night[param.index];
    }
  }

  build() {
    Stack() {
      Image(this.backgroundImg)
        .height(Constants.FULL_SCREEN)
        .width(Constants.FULL_SCREEN)
        .syncLoad(true)

      GridRow({
        columns: {
          sm: Constants.COLUMN_SM,
          md: Constants.COLUMN_MD,
          lg: Constants.COLUMN_LG
        }
      }) {
        GridCol({
          span: {
            sm: Constants.SPAN_SM,
            md: Constants.SPAN_MD,
            lg: Constants.SPAN_LG
          },
          offset: {
            sm: Constants.OFFSET_SM,
            md: Constants.OFFSET_MD,
            lg: Constants.OFFSET_LG
          }
        }) {
          Column() {
            Image($r('app.media.ic_portrait'))
              .height($r('app.float.portrait_height'))
              .width($r('app.float.portrait_width'))
              .opacity(Constants.PORTRAIT_OPACITY)
              .margin({ top: $r('app.float.portrait_margin_top') })
            Text($r('app.string.account'))
              .fontColor($r('app.color.color_white'))
              .fontSize($r('app.float.account_text_size'))
              .margin({ top: $r('app.float.account_margin_top') })
              .fontWeight(Constants.LOGIN_TITLE_FONT_WEIGHT)
              .height($r('app.float.account_height'))
            Text($r('app.string.account_description'))
              .fontColor($r('app.color.description_font_color'))
              .fontSize($r('app.float.login_context_font_size'))
              .fontWeight(FontWeight.Normal)
              .height($r('app.float.login_context_height'))

            Stack() {
              InputAreaView({
                account: this.account,
                password: this.password,
                isShow: this.isShow,
                curIndex: this.curIndex
              })

              Row() {
                Button({
                  type: ButtonType.Normal,
                  stateEffect: true
                }) {
                  Row() {
                    if (!this.isSigning) {
                      Text($r('app.string.login_button'))
                        .fontSize($r('app.float.login_text_font_size'))
                        .fontWeight(FontWeight.Bold)
                        .fontColor($r('app.color.button_background_color'))
                        .margin({
                          left: $r('app.float.login_text_border_left'),
                          right: $r('app.float.login_text_border_right')
                        })
                    } else {
                      Row() {
                        Text(this.signingContent)
                          .fontSize($r('app.float.login_text_font_size'))
                          .fontWeight(FontWeight.Bold)
                          .fontColor($r('app.color.button_background_color'))
                          .textAlign(TextAlign.Start)
                          .margin({ left: $r('app.float.signing_margin_left') })
                      }
                      .justifyContent(FlexAlign.Start)
                      .alignItems(VerticalAlign.Center)
                      .width($r('app.float.signing_row_width'))
                    }
                  }
                  .justifyContent(FlexAlign.Center)
                  .alignItems(VerticalAlign.Center)
                }
                .borderRadius($r('app.float.button_border_radius'))
                .width(Constants.FULL_SCREEN)
                .backgroundColor($r('app.color.color_white'))
                .height($r('app.float.button_height'))
                .onClick(() => {
                  this.login();
                })
              }
              .margin({ top: $r('app.float.button_margin_top') })
              .padding({
                left: $r('app.float.line_padding_left_right'),
                right: $r('app.float.line_padding_left_right')
              })
            }
            .alignContent(Alignment.Top)
            .height($r('app.float.login_area_height'))

            Blank()

            Row() {
              Text($r('app.string.privacy_statement'))
                .grayTextStyle()

              Text($r('app.string.verification_code_login'))
                .grayTextStyle()
            }
            .width(Constants.FULL_SCREEN)
            .margin({ bottom: $r('app.float.bottom_row_margin_bottom') })
          }
          .width(Constants.FULL_SCREEN)
          .height(Constants.FULL_SCREEN)
          .padding({
            left: $r('app.float.page_padding'),
            right: $r('app.float.page_padding')
          })
        }
      }
      .backgroundColor($r('app.color.tab_bar_color'))

      if (this.isShow) {
        Column() {
          AccountSelectView({
            account: this.account,
            isShow: this.isShow
          })
        }
        .width(Constants.FULL_SCREEN)
        .height(Constants.FULL_SCREEN)
        .onClick(() => {
          this.isShow = !this.isShow;
          this.curIndex = ACCOUNT_LIST.indexOf(this.account);
        })
      }
    }
    .backgroundImageSize(ImageSize.Cover)
    .width(Constants.FULL_SCREEN)
    .height(Constants.FULL_SCREEN)
  }
}

@Extend(Text)
function grayTextStyle() {
  .fontSize($r('app.float.normal_text_size'))
  .fontColor($r('app.color.input_background_color'))
  .layoutWeight(1)
  .textAlign(TextAlign.Center)
}