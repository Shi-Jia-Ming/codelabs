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

import TaskItemBean from '../common/bean/TaskItemBean';
import TargetListItem from './TargetListItem';
import { selectAllOrCancel, deleteSelected, isSelectAll, isSelectRows } from '../viewmodel/TaskListViewModel';
import { CommonConstants } from '../common/constant/CommonConstant';

@Component
export default struct TargetList {
  @Consume overAllProgressChanged: boolean;
  @State isEditMode: boolean = false;
  @State selectArray: Array<boolean> = [];
  @State clickIndex: number = CommonConstants.DEFAULT_CLICK_INDEX;
  @State selectAll: boolean = false;
  @Link targetData: Array<TaskItemBean>;
  onAddClick: () => void;

  build() {
    Column() {
      Row() {
        Text($r('app.string.sub_goals'))
          .fontSize($r('app.float.secondary_title'))
          .fontWeight(CommonConstants.FONT_WEIGHT_LARGE)
          .fontColor($r('app.color.title_black_color'))
        Blank()
        if (this.targetData.length > 0) {
          if (this.isEditMode) {
            Text($r('app.string.cancel_button'))
              .operateTextStyle($r('app.color.main_blue'))
              .margin({ left: $r('app.float.operate_button_margin') })
              .onClick(() => {
                this.selectAll = false;
                this.isEditMode = false;
                selectAllOrCancel.call(this, false);
              })
            Text($r('app.string.select_all_button'))
              .operateTextStyle($r('app.color.main_blue'))
              .margin({
                left: $r('app.float.operate_button_margin')
              })
            Checkbox()
              .select(isSelectAll.call(this))
              .selectedColor($r('app.color.main_blue'))
              .width(CommonConstants.CHECKBOX_WIDTH)
              .onClick(() => {
                this.selectAll = !this.selectAll;
                selectAllOrCancel.call(this, this.selectAll);
              })
          } else {
            Text($r('app.string.edit_button'))
              .operateTextStyle($r('app.color.main_blue'))
              .onClick(() => {
                this.isEditMode = true;
                selectAllOrCancel.call(this, false);
              })
          }
        }
      }
      .width(CommonConstants.FULL_WIDTH)
      .height($r('app.float.history_line_height'))
      .padding({
        left: $r('app.float.list_padding'),
        right: $r('app.float.list_padding_right')
      })

      List({ space: CommonConstants.LIST_SPACE }) {
        ForEach(this.targetData, (item: TaskItemBean, index: number) => {
          ListItem() {
            TargetListItem({
              taskItem: item,
              index: index,
              selectArr: $selectArray,
              isEditMode: this.isEditMode,
              clickIndex: $clickIndex
            })
          }
        }, (item, index) => JSON.stringify(item) + index)
      }
      .edgeEffect(EdgeEffect.None)
      .margin({ top: $r('app.float.list_margin_top') })
      .width(CommonConstants.FULL_WIDTH)
      .height(CommonConstants.LIST_HEIGHT)

      Blank()
      if (this.isEditMode) {
        Button($r('app.string.delete_button'))
          .opacity(isSelectRows.call(this) ? CommonConstants.NO_OPACITY : CommonConstants.OPACITY)
          .enabled(isSelectRows.call(this) ? true : false)
          .operateButtonStyle($r('app.color.main_red'))
          .onClick(() => {
            deleteSelected.call(this);
            selectAllOrCancel.call(this, false);
            this.selectAll = false;
          })
      } else {
        Button($r('app.string.add_task'))
          .operateButtonStyle($r('app.color.main_blue'))
          .onClick(() => this.onAddClick())
      }
    }
    .width(CommonConstants.MAIN_BOARD_WIDTH)
    .height(CommonConstants.FULL_HEIGHT)
    .padding({ top: $r('app.float.operate_row_margin') })
  }
}

/**
 * Custom text button style.
 */
@Extend(Text) function operateTextStyle(color: Resource) {
  .fontSize($r('app.float.text_button_font'))
  .fontColor(color)
  .lineHeight($r('app.float.text_line_height'))
  .fontWeight(CommonConstants.FONT_WEIGHT)
}

/**
 * Custom button style.
 */
@Extend(Button) function operateButtonStyle(color: Resource) {
  .width($r('app.float.button_width'))
  .height($r('app.float.button_height'))
  .fontSize($r('app.float.button_font'))
  .fontWeight(CommonConstants.FONT_WEIGHT)
  .fontColor(color)
  .backgroundColor($r('app.color.button_background'))
}