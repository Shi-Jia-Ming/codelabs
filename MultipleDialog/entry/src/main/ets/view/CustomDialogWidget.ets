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

import Logger from '../common/utils/Logger';
import HobbyBean from '../common/bean/HobbyBean';
import CommonUtils from '../common/utils/CommonUtils';
import CommonConstants from '../common/constants/CommonConstants';

@CustomDialog
export default struct CustomDialogWidget {
  @State hobbyBeans: HobbyBean[] = [];
  @Link hobbies: string;
  private controller: CustomDialogController;

  aboutToAppear() {
    let context: Context = getContext(this);
    if (CommonUtils.isEmpty(context) || CommonUtils.isEmpty(context.resourceManager)) {
      Logger.error(CommonConstants.TAG_CUSTOM, 'context or resourceManager is null');
      return;
    }
    let manager = context.resourceManager;
    manager.getStringArrayValue($r('app.strarray.hobbies_data').id, (error, hobbyArray) => {
      if (!CommonUtils.isEmpty(error)) {
        Logger.error(CommonConstants.TAG_CUSTOM, 'error = ' + JSON.stringify(error));
      } else {
        hobbyArray.forEach((hobbyItem: string) => {
          let hobbyBean = new HobbyBean();
          hobbyBean.label = hobbyItem;
          hobbyBean.isChecked = false;
          this.hobbyBeans.push(hobbyBean);
        });
      }
    });
  }

  /**
   * Set hobbies value
   *
   * @param {HobbyBean[]} hobby bean array
   */
  setHobbiesValue(hobbyBeans: HobbyBean[]) {
    if (CommonUtils.isEmptyArr(hobbyBeans)) {
      Logger.error(CommonConstants.TAG_HOME, 'hobbyBeans length is 0');
      return;
    }
    let hobbiesText: string = '';
    hobbiesText = hobbyBeans.filter((isCheckItem: HobbyBean) => isCheckItem?.isChecked)
      .map((checkedItem: HobbyBean) => {
        return checkedItem.label;
      })
      .join(CommonConstants.COMMA);
    if (hobbiesText.length > 0) {
      this.hobbies = hobbiesText;
    }
  }

  build() {
    Column() {
      Text($r('app.string.text_title_hobbies'))
        .fontColor($r('app.color.custom_color'))
        .fontSize($r('app.float.title_hobbies_size'))
        .lineHeight($r('app.float.title_line_height'))
        .fontWeight(CommonConstants.BIGGER)
        .alignSelf(ItemAlign.Start)
        .margin({ left: $r('app.float.title_left_distance') })
      List() {
        ForEach(this.hobbyBeans, (itemHobby: HobbyBean) => {
          ListItem() {
            Row() {
              Text(itemHobby.label)
                .fontSize($r('app.float.label_size'))
                .fontColor($r('app.color.custom_color'))
                .layoutWeight(CommonConstants.WEIGHT_ONE)
                .textAlign(TextAlign.Start)
                .fontWeight(CommonConstants.BIGGER)
                .margin({ left: $r('app.float.label_left_distance') })
              Toggle({ type: ToggleType.Checkbox, isOn: false })
                .onChange((isCheck) => {
                  itemHobby.isChecked = isCheck;
                })
                .width($r('app.float.toggle_size'))
                .height($r('app.float.toggle_size'))
                .margin({ right: $r('app.float.toggle_right_distance') })
            }
            .height($r('app.float.options_height'))
            .margin({
              top: $r('app.float.options_top_distance'),
              bottom: $r('app.float.options_bottom_distance')
            })
          }
        }, itemHobby => itemHobby.label)
      }
      .margin({
        top: $r('app.float.list_top_distance'),
        bottom: $r('app.float.list_bottom_distance')
      })
      .divider({
        strokeWidth: $r('app.float.divider_height'),
        color: $r('app.color.divider_color')
      })
      .listDirection(Axis.Vertical)
      .edgeEffect(EdgeEffect.None)
      .width(CommonConstants.FULL_WIDTH)
      .height($r('app.float.options_list_height'))

      Row() {
        Button($r('app.string.cancel_button'))
          .dialogButtonStyle()
          .onClick(() => {
            this.controller.close();
          })
        Blank()
          .backgroundColor($r('app.color.custom_blank_color'))
          .width($r('app.float.blank_width'))
          .opacity($r('app.float.blank_opacity'))
          .height($r('app.float.blank_height'))
        Button($r('app.string.definite_button'))
          .dialogButtonStyle()
          .onClick(() => {
            this.setHobbiesValue(this.hobbyBeans);
            this.controller.close();
          })
      }
    }
    .width(CommonConstants.COMMON_DIALOG_WIDTH)
    .padding({
      top: $r('app.float.dialog_top_distance'),
      bottom: $r('app.float.dialog_bottom_distance')
    })
    .borderRadius($r('app.float.dialog_radius'))
    .backgroundColor(Color.White)
  }
}

@Extend(Button) function dialogButtonStyle() {
  .fontSize($r('app.float.button_text_size'))
  .fontColor($r('app.color.custom_button_color'))
  .layoutWeight(CommonConstants.WEIGHT_ONE)
  .backgroundColor(Color.White)
  .width(CommonConstants.FULL_WIDTH)
  .height($r('app.float.button_height'))
}