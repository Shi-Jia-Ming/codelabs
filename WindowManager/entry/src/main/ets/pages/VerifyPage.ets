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
import VerifyItem from '../common/bean/VerifyItem';
import WindowViewModel from '../viewmodel/WindowViewModel';

@Extend(Text)
function promptTextStyle() {
  .fontSize($r('app.float.small_text_size'))
  .width(CommonConstants.FULL_PARENT)
  .padding({
    left: $r('app.float.verify_padding'),
    right: $r('app.float.verify_padding')
  })
}

/**
 * Verify page in sub window.
 */
@Entry
@Component
struct VerifyPage {
  @State isInputWrong: boolean = false;
  @State verifyItem: VerifyItem = new VerifyItem($r('app.media.ic_verity_character1'), 'XYZK');
  @State inputText: string = '';
  private imageId: number = 0;
  private verifyMap: Map<number, VerifyItem> = new Map();

  aboutToAppear() {
    this.verifyMap = WindowViewModel.getVerifyMap();
    this.updateVerifyItem();
  }

  updateVerifyItem() {
    let verifyItemNew: VerifyItem | undefined = this.verifyMap.get(this.imageId);
    if (verifyItemNew !== undefined) {
      this.verifyItem = verifyItemNew;
    }
  }

  build() {
    Column() {
      Column() {
        Row() {
          Image(this.verifyItem.image)
            .height($r('app.float.verify_image_height'))
            .width($r('app.float.verify_image_width'))
          Text($r('app.string.change_one'))
            .fontColor($r('app.color.login_blue_text_color'))
            .fontSize($r('app.float.big_text_size'))
            .width($r('app.float.verify_hints_width'))
            .textAlign(TextAlign.Center)
            .onClick(() => {
              this.imageId = (this.imageId + 1) % 2;
              this.updateVerifyItem();
            })
        }
        .padding({
          left: $r('app.float.verify_padding'),
          top: $r('app.float.verify_padding'),
          right: $r('app.float.verify_hints_padding')
        })
        .width(CommonConstants.FULL_PARENT)
        .justifyContent(FlexAlign.SpaceBetween)

        TextInput({ placeholder: $r('app.string.verify_input_placeholder'), text: this.inputText })
          .placeholderColor($r('app.color.placeholder_color'))
          .fontSize($r('app.float.big_text_size'))
          .height($r('app.float.login_button_height'))
          .margin({
            left: $r('app.float.verify_padding'),
            right: $r('app.float.verify_padding'),
            top: $r('app.float.verify_text_input_margin'),
            bottom: $r('app.float.verify_text_input_margin')
          })
          .onChange((value: string) => {
            this.inputText = value;
          })
        if (this.isInputWrong) {
          Text($r('app.string.verify_wrong_hints'))
            .fontColor($r('app.color.verify_wrong_hints_color'))
            .promptTextStyle()
        } else {
          Text($r('app.string.verify_hints'))
            .fontColor($r('app.color.placeholder_color'))
            .promptTextStyle()
        }
        Text($r('app.string.verify_ok'))
          .fontSize($r('app.float.big_text_size'))
          .fontColor($r('app.color.login_blue_text_color'))
          .margin({
            top: $r('app.float.verify_ok_margin'),
            bottom: $r('app.float.verify_ok_margin')
          })
          .onClick(() => {
            let verifyText: string = this.verifyItem.characters;
            if (this.inputText.toLowerCase() === verifyText.toLowerCase()) {
              router.replaceUrl({
                url: CommonConstants.SUCCESS_PAGE_URL
              }).catch((err: Error) => {
                Logger.error(`pushUrl failed, message:${err.message}`);
              });
            } else {
              this.isInputWrong = true;
              this.inputText = '';
              this.imageId = (this.imageId + 1) % 2;
              this.updateVerifyItem();
            }
          })
      }
      .backgroundColor(Color.White)
      .height(CommonConstants.FULL_PARENT)
      .borderRadius($r('app.float.verify_ok_margin'))
    }
    .padding({ bottom: $r('app.float.verify_bottom_padding') })
    .height(CommonConstants.FULL_PARENT)
  }
}