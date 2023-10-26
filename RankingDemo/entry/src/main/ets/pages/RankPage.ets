/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import prompt from '@ohos.promptAction';
import { RankViewModel } from '../viewmodel/RankViewModel';
import { RankData } from '../viewmodel/RankData';
import { ListHeaderComponent } from '../view/ListHeaderComponent';
import { TitleComponent } from '../view/TitleComponent';
import { ListItemComponent } from '../view/ListItemComponent';
import { APP_EXIT_INTERVAL, Style, TIME, TITLE, WEIGHT } from '../common/constants/Constants';

let rankModel: RankViewModel = new RankViewModel();

@Entry
@Component
struct RankPage {
  @State dataSource1: RankData[] = [];
  @State dataSource2: RankData[] = [];
  // The State is used to decide whether to switch the data of RankList.
  @State isSwitchDataSource: boolean = true;
  // It will record the time of clicking back button of system navigation.
  private clickBackTimeRecord: number = 0;

  aboutToAppear() {
    this.dataSource1 = rankModel.loadRankDataSource1();
    this.dataSource2 = rankModel.loadRankDataSource2();
  }

  onBackPress() {
    if (this.isShowToast()) {
      prompt.showToast({
        message: $r('app.string.prompt_text'),
        duration: TIME
      });
      this.clickBackTimeRecord = new Date().getTime();
      return true;
    }
    return false;
  }

  isShowToast(): boolean {
    return new Date().getTime() - this.clickBackTimeRecord > APP_EXIT_INTERVAL;
  }

  build() {
    Column() {
      // Title component in the top.
      TitleComponent({ isRefreshData: $isSwitchDataSource, title: TITLE })
      // The head style of List component.
      ListHeaderComponent({
        paddingValue: {
          left: Style.RANK_PADDING,
          right: Style.RANK_PADDING
        },
        widthValue: Style.CONTENT_WIDTH
      })
        .margin({
          top: Style.HEADER_MARGIN_TOP,
          bottom: Style.HEADER_MARGIN_BOTTOM
        })
      // The style of List component.
      this.RankList(Style.CONTENT_WIDTH)
    }
    .backgroundColor($r('app.color.background'))
    .height(WEIGHT)
    .width(WEIGHT)
  }

  @Builder RankList(widthValue: Length) {
    Column() {
      List() {
        ForEach(this.isSwitchDataSource ? this.dataSource1 : this.dataSource2,
          (item: RankData, index?: number) => {
            ListItem() {
              ListItemComponent({ index: (Number(index) + 1), name: item.name, vote: item.vote,
                isSwitchDataSource: this.isSwitchDataSource
              })
            }
          }, (item: RankData) => JSON.stringify(item))
      }
      .width(WEIGHT)
      .height(Style.LIST_HEIGHT)
      .divider({ strokeWidth: Style.STROKE_WIDTH })
    }
    .padding({
      left: Style.RANK_PADDING,
      right: Style.RANK_PADDING
    })
    .borderRadius(Style.BORDER_RADIUS)
    .width(widthValue)
    .alignItems(HorizontalAlign.Center)
    .backgroundColor(Color.White)
  }
}

