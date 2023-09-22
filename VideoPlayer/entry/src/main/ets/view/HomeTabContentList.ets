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
import Logger from '../common/util/Logger';
import { VideoBean } from '../common/bean/VideoBean';
import HomeVideoListModel from '../viewmodel/HomeVideoListModel';
import { HomeConstants } from '../common/constants/HomeConstants';
import { CommonConstants } from '../common/constants/CommonConstants';
import { HomeTabContentListItem } from './HomeTabContentListItem';
import { GlobalContext } from '../common/util/GlobalContext';
import resourceManager from '@ohos.resourceManager';

@Component
export struct HomeTabContentList {
  private currIndex: number = 0;
  @Consume videoList: Array<VideoBean>;
  @State item: VideoBean = new VideoBean('video1', {} as resourceManager.RawFileDescriptor, 'video1.mp4');

  async aboutToAppear() {
    if (this.currIndex === CommonConstants.TYPE_LOCAL) {
      this.videoList = await HomeVideoListModel.getLocalVideo();
    } else {
      let videoInternetList = GlobalContext.getContext().getObject('videoInternetList') as VideoBean[];
      this.videoList = videoInternetList;
    }
  }

  build() {
    Column() {
      List({
        space: HomeConstants.LIST_SPACE,
        initialIndex: HomeConstants.LIST_INITIAL_INDEX
      }) {
        ForEach(this.videoList, (item: VideoBean, index?: number) => {
          ListItem() {
            HomeTabContentListItem({ item: item });
          }.onClick(() => {
            GlobalContext.getContext().setObject('globalVideoList', this.videoList);
            router.pushUrl({
              url: CommonConstants.PAGE,
              params: {
                src: item.src,
                iSrc: item.iSrc,
                index: index,
                type: this.currIndex
              }
            }).catch((err: Error) => {
              Logger.error('[IndexTabLocalList] router error: ' + JSON.stringify(err))
            });
          })
        }, (item: VideoBean) => JSON.stringify(item))
      }
      .backgroundColor(Color.White)
      .borderRadius($r('app.float.list_border_radius'))
    }
    .width(HomeConstants.COLUMN_WIDTH)
    .height(CommonConstants.NINETY_PERCENT)
  }
}