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

import ZonesItem from '../entity/ZonesItem';
import { ChallengeConstants as Const } from '../constants/ChallengeConstants';
import DesignStyleSwiper from './DesignStyleSwiper';

@Component
export default struct StyleListItem {
  @Consume('introductionData') introductionData: ZonesItem;

  build() {
    Column() {
      ForEach(this.introductionData.content, (item: string) => {
        Text(item)
          .width(Const.FULL_PERCENT)
          .fontSize($r('app.float.font_size_normal'))
          .margin({ bottom: $r('app.float.content_margin_bottom') })
      }, (item: ResourceStr) => JSON.stringify(item))
      Column() {
        DesignStyleSwiper()
      }
      .margin({
        top: $r('app.float.content_container_margin_top'),
        bottom: $r('app.float.content_margin_bottom') })
    }
    .width(Const.FULL_PERCENT)
    .padding($r('app.float.guide_padding'))
  }
}