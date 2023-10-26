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

import { TopBarItem } from '../../viewmodel/TopBarItem';
import { initializeOnStartup } from '../../viewmodel/TopBarViewModel';
import { CommonConstants } from '../../common/constants/CommonConstant';

/**
 * TopBar component.
 */
@Component
export struct TopBar {
  // Double binding of index values to achieve linkage effect.
  @Link index: number;
  private tabArray: Array<TopBarItem> = initializeOnStartup();

  build() {
    Row({ space: CommonConstants.SPACE_TOP_BAR }) {
      ForEach(this.tabArray,
        (item: TopBarItem) => {
          Text(item.name)
            .fontSize(this.index === item.id ? CommonConstants.FONT_SIZE_CHECKED : CommonConstants.FONT_SIZE_UNCHECKED)
            .fontColor(Color.Black)
            .textAlign(TextAlign.Center)
            .fontWeight(this.index === item.id ? FontWeight.Bold : FontWeight.Regular)
            .onClick(() => {
              this.index = item.id;
            })
        }, (item: TopBarItem) => JSON.stringify(item))
    }
    .margin({ left: CommonConstants.ADS_LEFT })
    .width(CommonConstants.FULL_WIDTH)
    .height(CommonConstants.TOP_BAR_HEIGHT)
  }
}