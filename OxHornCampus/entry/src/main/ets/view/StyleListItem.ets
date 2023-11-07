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

import ZonesItem from '../viewmodel/ZonesItem';
import { CommonConstants as Const } from '../common/constants/CommonConstants';
import ImageAnimation from '../view/ImageAnimate';

@Component
export default struct StyleListItem {
  @Consume('introductionData') introductionData: ZonesItem;

  build() {
    Column() {
      ForEach(this.introductionData.content, (item: ResourceStr) => {
        Text(item)
          .width(Const.CONTENT_WIDTH_PERCENT)
          .fontSize($r('app.float.font_size_normal'))
          .margin({ bottom: $r('app.float.content_margin_bottom') })
      }, (item: ResourceStr) => JSON.stringify(item))
      Column() {
        ImageAnimation()
      }
      .width(Const.CONTENT_WIDTH_PERCENT)
      .height(Const.IMAGE_CONTAINER_HEIGHT)
      .margin({
        top: $r('app.float.content_container_margin_top'),
        bottom: $r('app.float.content_container_margin_bottom') })
      .justifyContent(FlexAlign.Center)
    }
    .width(Const.FULL_SIZE)
    .alignItems(HorizontalAlign.Center)
    .height($r('app.float.fixed_item_height'))
  }
}