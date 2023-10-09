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

import webview from '@ohos.web.webview';
import common from '@ohos.app.ability.common';
import {
  CommonConstants,
  FailureLayout,
  LoadingLayout,
  LoadingStatus,
  ObservedArray,
  ResourceDetail
} from '@ohos/common';
import { UserModel } from '@ohos/mine';
import { DiscoverModel } from '../model/DiscoverModel';
import { TopNavigationView } from './TopNavigationView';
import { InteractiveAreaView } from './InteractiveAreaView';

const eventHub: common.EventHub = (getContext(this) as common.UIAbilityContext).eventHub;

@Component
export struct FeedDetailView {
  onBackClick?: () => void;
  @Prop resourceId: string = '';
  @Link webViewController: WebviewController;
  @State userModel: UserModel = UserModel.getInstance();
  @State discoverModel: DiscoverModel = DiscoverModel.getInstance();
  @State feedDetail: ResourceDetail = new ResourceDetail();
  @State collectedIds: ObservedArray<string> = this.userModel.collectedIds;
  @State likedIds: ObservedArray<string> = this.userModel.likedIds;
  @State showInteractiveArea: boolean = true;

  aboutToAppear() {
    this.webViewController = new webview.WebviewController();
    this.discoverModel.getResourceDetail(this.resourceId).then(() => {
      this.feedDetail = this.discoverModel.detailData;
      this.webViewController.loadUrl(this.feedDetail.webUrl);
    });
  }

  isCollected(): boolean {
    return this.collectedIds.some((id: string) => id === this.feedDetail.resourceId);
  }

  isLiked(): boolean {
    return this.likedIds.some((id: string) => id === this.feedDetail.resourceId);
  }

  build() {
    Column() {
      TopNavigationView({ title: $r('app.string.feed'), onBackClick: this.onBackClick })
      Stack({ alignContent: Alignment.Bottom }) {
        Web({ src: this.feedDetail.webUrl, controller: this.webViewController })
          .darkMode(WebDarkMode.Auto)
          .zoomAccess(true)
          .fileAccess(true)
          .mixedMode(MixedMode.All)
          .cacheMode(CacheMode.None)
          .javaScriptAccess(true)
          .domStorageAccess(true)
          .margin({
            left: $r('app.float.detail_page_margin'),
            right: $r('app.float.detail_page_margin')
          })
          .onPageEnd(() => {
            if (this.webViewController.accessBackward()) {
              this.showInteractiveArea = false;
            } else {
              this.showInteractiveArea = true;
            }
          })

        if (this.showInteractiveArea && this.discoverModel.detailLoadingStatus === LoadingStatus.SUCCESS) {
          InteractiveAreaView({
            isLiked: this.isLiked(),
            isCollected: this.isCollected(),
            onCollected: () => {
              eventHub.emit(CommonConstants.COLLECTED_EVENT, {
                resourceId: this.feedDetail.resourceId,
                resourceType: this.feedDetail.type,
                actionValue: !this.isCollected()
              })
            },
            onLiked: () => {
              eventHub.emit(CommonConstants.LIKED_EVENT, {
                resourceId: this.feedDetail.resourceId,
                resourceType: this.feedDetail.type,
                actionValue: !this.isLiked()
              })
            }
          })
        }
        if (this.discoverModel.detailLoadingStatus === LoadingStatus.LOADING) {
          LoadingLayout()
        }
        if (this.discoverModel.detailLoadingStatus === LoadingStatus.FAILED) {
          FailureLayout({ handleReload: () => this.discoverModel.getResourceDetail(this.resourceId) })
        }
      }
      .layoutWeight(1)
    }
    .padding({ top: AppStorage.get<number>('statusBarHeight') })
    .width(CommonConstants.FULL_PERCENT)
    .height(CommonConstants.FULL_PERCENT)
  }
}