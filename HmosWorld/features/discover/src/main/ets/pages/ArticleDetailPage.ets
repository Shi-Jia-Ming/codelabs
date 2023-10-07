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
import { InteractiveAreaView } from '../components/InteractiveAreaView';
import { TopNavigationView } from '../components/TopNavigationView';
import { UserModel } from '@ohos/mine';
import { DiscoverModel } from '../model/DiscoverModel';

const eventHub = (getContext(this) as common.UIAbilityContext).eventHub;

@Entry
@Component
struct ArticleDetailPage {
  resourceId: string = (router.getParams() as Record<string, string>)['resourceId'];
  @State webViewController: WebviewController = new webview.WebviewController();
  @State userModel: UserModel = UserModel.getInstance();
  @State discoverModel: DiscoverModel = DiscoverModel.getInstance();
  @State articleDetail: ResourceDetail = this.discoverModel.detailData;
  @State collectedIds: ObservedArray<string> = this.userModel.collectedIds;
  @State likedIds: ObservedArray<string> = this.userModel.likedIds;
  @State showInteractiveArea: boolean = true;

  aboutToAppear() {
    this.discoverModel.getResourceDetail(this.resourceId).then(() => {
      this.articleDetail = this.discoverModel.detailData;
    });
  }

  isCollected(): boolean {
    return this.collectedIds.some((id: string) => id === this.articleDetail.resourceId);
  }

  isLiked(): boolean {
    return this.likedIds.some((id: string) => id === this.articleDetail.resourceId);
  }

  onBackPress() {
    if (this.discoverModel.detailLoadingStatus !== LoadingStatus.SUCCESS) {
      router.back();
      return true;
    }
    if (this.webViewController?.accessBackward()) {
      this.webViewController.backward();
    } else {
      router.back();
    }
    return true;
  }

  build() {
    Column() {
      TopNavigationView({ title: $r('app.string.article') })
      if (this.discoverModel.detailLoadingStatus === LoadingStatus.LOADING) {
        LoadingLayout()
      }
      if (this.discoverModel.detailLoadingStatus === LoadingStatus.FAILED) {
        FailureLayout({ handleReload: () => this.discoverModel.getResourceDetail(this.resourceId) })
      }
      if (this.discoverModel.detailLoadingStatus === LoadingStatus.SUCCESS) {
        Stack({ alignContent: Alignment.Bottom }) {
          Web({ src: this.articleDetail.webUrl, controller: this.webViewController })
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
              console.log('[ArticleDetailPage] onpageEnd')
              this.showInteractiveArea = !this.webViewController.accessBackward();
            })

          if (this.showInteractiveArea) {
            InteractiveAreaView({
              isLiked: this.isLiked(),
              isCollected: this.isCollected(),
              onCollected: () => {
                eventHub.emit(CommonConstants.COLLECTED_EVENT, {
                  resourceId: this.articleDetail.resourceId,
                  resourceType: this.articleDetail.type,
                  actionValue: !this.isCollected()
                });
              },
              onLiked: () => {
                eventHub.emit(CommonConstants.LIKED_EVENT, {
                  resourceId: this.articleDetail.resourceId,
                  resourceType: this.articleDetail.type,
                  actionValue: !this.isLiked()
                });
              }
            })
              .margin({ bottom: $r('app.float.top_navigation_height') })
          }
        }
      }
    }
    .padding({ top: AppStorage.get<number>('statusBarHeight') })
    .width(CommonConstants.FULL_PERCENT)
    .height(CommonConstants.FULL_PERCENT)
  }
}


