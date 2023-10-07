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

import { ArticleSkeletonView, CommonConstants } from '@ohos/common';
import Constants, { SkeletonData, SkeType } from '../constants/Constants';

@Preview
@Component
export struct LoadingView {
  @State columnBgColor: Color = Color.Gray;
  @State listOpacity: number = 1;

  startAnimation(): void {
    animateTo(CommonConstants.SKELETON_ANIMATION, () => {
      this.listOpacity = CommonConstants.HALF_OPACITY;
    });
  }

  build() {
    Column({ space: Constants.MIDDLE_SPACE }) {
      ForEach(SkeletonData, (item: SkeType) => {
        ArticleSkeletonView({ isMine: item.isMine, isFeed: item.isFeed })
      })
    }
    .padding({ left: $r('app.float.mine_page_padding'), right: $r('app.float.mine_page_padding') })
    .height(Constants.FULL_SCREEN)
    .margin({ top: $r('app.float.regular_margin') })
    .opacity(this.listOpacity)
    .onAppear(() => {
      this.startAnimation();
    })
  }
}