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

import { LearningResource, LoadingStatus, ObservedArray } from '@ohos/common';
import { UserModel } from '../model/UserModel';
import { LoadingView } from './LoadingView';
import { NoneContentView } from './NoneContentView';
import { ResourceListView } from './ResourceListView';

@Component
export struct CollectedResourceView {
  @State userModel: UserModel = UserModel.getInstance();
  @State @Watch('onContentChange') userCollectedResources: ObservedArray<LearningResource> = this.userModel.userCollectedResources;
  @State collectedCounts: number = this.userCollectedResources.length;
  innerScroller?: Scroller;
  outerScroller?: Scroller;

  aboutToAppear() {
    this.userModel.getCollectedResources();
  }

  onContentChange(): void {
    this.collectedCounts = this.userCollectedResources.length;
  }

  build() {
    if (this.userModel.loadingCollectedStatus === LoadingStatus.LOADING) {
      LoadingView()
    } else if (this.collectedCounts === 0) {
      NoneContentView({ imgSrc: $r('app.media.ic_empty_collected'), description: $r('app.string.to_collected') })
    } else {
      ResourceListView({
        contents: this.userCollectedResources,
        scrollerForScroll: this.outerScroller,
        scrollerForList: this.innerScroller
      })
    }
  }
}