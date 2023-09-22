/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import display from '@ohos.display';
import RefreshComponent from '../view/RefreshComponent';
import { RefreshHeaderStyle, RefreshState, RefreshConstants } from '../common/constants/RefreshConstants';
import CommonConstants from '../common/constants/CommonConstants';
import DimensionUtil from '../common/utils/DimensionUtil';
import { GlobalContext } from '../common/utils/GlobalContext';

/**
 * File Management Entry.
 */
@Component
export default struct FileManagerIndex {
  @Provide(RefreshConstants.REFRESH_STATE_TAG) state: number = RefreshState.REFRESHING;
  private deviceDisplay: display.Display = GlobalContext.getContext().getObject('display') as display.Display;

  @Builder
  ContentBody() {
    Image($r('app.media.bg_content'))
      .width(CommonConstants.FULL_LENGTH)
      .height(DimensionUtil.getVp($r('app.float.content_height')))
      .objectFit(ImageFit.Fill)
  }

  build() {
    Stack({ alignContent: Alignment.Top }) {
      Text($r('app.string.file_index_title'))
        .backgroundColor(Color.White)
        .width(CommonConstants.FULL_LENGTH)
        .height(DimensionUtil.getVp($r('app.float.file_index_title_height')))
        .fontSize(DimensionUtil.getFp($r('app.float.file_index_title_size')))
        .fontWeight(FontWeight.Regular)
        .padding({ left: DimensionUtil.getVp($r('app.float.file_index_title_padding')) })
        .zIndex(CommonConstants.FILE_MANAGER_Z_INDEX)
      RefreshComponent({
        headerStyle: RefreshHeaderStyle.CLOUD,
        itemLayout: (): void => this.ContentBody(),
        displayHeight: (
          px2vp(this.deviceDisplay.height) - DimensionUtil.getVp($r('app.float.file_index_title_height'))),
        onRefresh: () => {
          setTimeout(() => {
            this.state = RefreshState.COMPLETE;
          }, CommonConstants.REFRESH_DEFAULT_TIMEOUT);
        }
      })
        .width(CommonConstants.FULL_LENGTH)
        .margin({ top: DimensionUtil.getVp($r('app.float.file_index_title_height')) })
    }
    .height(CommonConstants.FULL_LENGTH)
  }
}