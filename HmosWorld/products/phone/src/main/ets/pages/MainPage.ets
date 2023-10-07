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

import router from '@ohos.router';
import webview from '@ohos.web.webview';
import { ActivityView } from '@ohos/activity';
import { DiscoverView } from '@ohos/discover';
import { LearningView } from '@ohos/learning';
import { ChallengeView } from '@ohos/challenge';
import { Logger } from '@ohos/common';
import { MineView } from '@ohos/mine';
import { AppConstants } from '../constants/AppConstants';
import { CustomTabBar } from '../components/CustomTabBar';
import { TabBarType } from '../model/TabBarModel';

const TAG = '[App]';

@Entry
@Component
struct MainPage {
  @State currentIndex: TabBarType = TabBarType.DISCOVER;
  @State webViewController: webview.WebviewController | null = null;
  @State learnedId: string = '';

  onPageShow() {
    Logger.info(TAG, 'onPageShow');
    if (AppStorage.get<boolean>('isLearned')) {
      AppStorage.delete('isLearned');
      this.learnedId = router.getParams() ? (router.getParams() as Record<string, string>)['learningId'] : '';
      Logger.info(TAG, `learnedId: ${this.learnedId}`);
    }
    if (AppStorage.get<boolean>('shouldUpdate')) {
      let index: number = (router.getParams() as Record<string, number>)['currentIndex'];
      this.currentIndex = index;
      AppStorage.setOrCreate('getHomeResource', true);
    }
  }

  onBackPress() {
    if (this.webViewController?.accessBackward()) {
      this.webViewController.backward();
      return true;
    }
    return false;
  }

  build() {
    Column() {
      Tabs({ index: this.currentIndex }) {
        TabContent() {
          DiscoverView()
        }

        TabContent() {
          LearningView({ learnedId: this.learnedId })
        }

        TabContent() {
          ChallengeView()
        }

        TabContent() {
          ActivityView({ webViewController: $webViewController })
        }

        TabContent() {
          MineView()
        }
      }
      .backgroundColor($r('app.color.common_background_color'))
      .barHeight($r('app.float.tool_bar_height'))
      .height(AppConstants.FULL_PERCENT)
      .barPosition(BarPosition.End)
      .scrollable(false)
      .onChange((index) => {
        this.currentIndex = index;
      })

      CustomTabBar({ currentIndex: $currentIndex })
    }
    .width(AppConstants.FULL_PERCENT)
    .height(AppConstants.FULL_PERCENT)
  }
}