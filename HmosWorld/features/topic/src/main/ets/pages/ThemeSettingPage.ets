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

import preferences from '@ohos.data.preferences';
import router from '@ohos.router';
import common from '@ohos.app.ability.common';
import { FailureLayout, LoadingLayout, LoadingStatus, Topic } from '@ohos/common';
import { ThemeConstants } from '../constants/ThemeConstants';
import { TopicItem } from '../components/TopicItemView';
import { TopicModel } from '../model/TopicModel';

@Entry
@Component
struct ThemeSettingPage {
  @State topicModel: TopicModel = TopicModel.getInstance();
  @State firstTopic: boolean = !!((router.getParams()) as Record<string, boolean>)?.['firstTopic'];

  onPageShow() {
    this.topicModel.getTopics();
  }

  @Builder
  TitleBuilder() {
    Row() {
      if (!this.firstTopic) {
        Image($r('app.media.ic_back'))
          .size({
            width: $r('app.float.topic_back_size'),
            height: $r('app.float.topic_back_size')
          })
          .onClick(() => {
            router.back();
          })
      }
      Column() {
        Text($r('app.string.preference_title'))
          .fontFamily($r('app.string.topic_title_main_family'))
          .fontColor($r('app.color.title_color'))
          .fontSize($r('app.float.topic_main_font'))
        Text($r('app.string.preference_subtitle'))
          .fontFamily($r('app.string.topic_title_family'))
          .fontColor($r('app.color.title_color'))
          .fontSize($r('app.float.topic_sub_font'))
          .opacity(ThemeConstants.TITLE_SUB_OPACITY)
          .margin({ top: $r('app.float.topic_title_margin') })
      }
      .padding({ left: this.firstTopic ? 0 : $r('app.float.topic_title_padding') })
      .alignItems(HorizontalAlign.Start)
      .width(ThemeConstants.FULL_SIZE)
    }
    .padding({
      bottom: $r('app.float.topic_icon_size'),
      left: $r('app.float.topic_left_padding'),
      top: AppStorage.get<number>('statusBarHeight')
    })
  }

  @Builder
  TopicTypeBuilder(index: number) {
    Row() {
      Text(index === 0 ? $r('app.string.feed') : $r('app.string.topic'))
        .fontFamily($r('app.string.topic_title_main_family'))
        .fontSize($r('app.float.topic_type_font'))
        .fontColor($r('app.color.title_color'))
    }
    .width(ThemeConstants.FULL_SIZE)
    .height($r('app.float.topic_back_size'))
    .padding({ left: $r('app.float.topic_left_padding') })
  }

  jump(): void {
    if (this.firstTopic) {
      preferences.getPreferences(getContext(this), 'myStore').then((result: preferences.Preferences) => {
        result.put('ThemeIsSet', true);
        result.flush();
      });
    }
    const bundleName = (getContext(this) as common.UIAbilityContext).applicationInfo.name;
    const url = `@bundle:${bundleName}/phone/ets/pages/MainPage`;
    AppStorage.setOrCreate<boolean>('shouldUpdate', true);
    AppStorage.setOrCreate('getHomeResource', false);
    if (this.firstTopic) {
      router.replaceUrl({ url, params: { currentIndex: 0 } });
    } else {
      router.back({ url, params: { currentIndex: 0 } });
    }
  }

  build() {
    Stack() {
      Image($r('app.media.ic_bg_theme'))
        .width(ThemeConstants.FULL_SIZE)
        .height(ThemeConstants.FULL_SIZE)
      Column() {
        this.TitleBuilder()
        if (this.topicModel.loadingStatus === LoadingStatus.LOADING) {
          LoadingLayout();
        }
        if (this.topicModel.loadingStatus === LoadingStatus.FAILED) {
          FailureLayout({ handleReload: () => this.topicModel.getTopics() })
        }
        if (this.topicModel.loadingStatus === LoadingStatus.SUCCESS) {
          ForEach([0, 1], (index: number) => {
            this.TopicTypeBuilder(index)
            GridRow({ columns: ThemeConstants.GRID_ROW_COLUMNS,
              gutter: { x: ThemeConstants.GRID_ROW_X, y: ThemeConstants.GRID_ROW_Y } }) {
              ForEach(index === 0 ? this.topicModel.feedList : this.topicModel.topicList, (item: Topic) => {
                GridCol() {
                  TopicItem({ item })
                }
              })
            }
            .padding({
              top: $r('app.float.topic_icon_size'),
              bottom: $r('app.float.topic_bottom_padding')
            })
          })
          Blank()
          Button($r('app.string.complete'), {
            type: ButtonType.Capsule,
            stateEffect: this.topicModel.followCheck
          })
            .width($r('app.float.button_width'))
            .height($r('app.float.ListItemGroup_padding'))
            .backgroundColor($r('app.color.btn_bg'))
            .borderRadius($r('app.float.topic_icon_size'))
            .enabled(this.topicModel.followCheck)
            .onClick(() => this.jump())
            .margin($r('app.float.topic_back_size'))
        }
      }
      .width(ThemeConstants.FULL_SIZE)
      .height(ThemeConstants.FULL_SIZE)
      .zIndex(ThemeConstants.Z_INDEX_TWO)
    }
  }
}