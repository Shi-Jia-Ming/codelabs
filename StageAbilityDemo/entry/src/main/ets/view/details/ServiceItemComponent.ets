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

import { AppFontSize, AppFontWeight, PERCENTAGE_100 } from '../../common/constants/Constants';
import { GoodsServiceItem } from '../../common/constants/DetailsConstants';

@Component
export default struct ServiceItemComponent {
  serviceName: string;
  description: string;
  isShowActionMore: boolean;

  build() {
    Row() {
      Column() {
        Text(this.serviceName??'')
          .maxLines(GoodsServiceItem.MAX_LINES)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .textCase(TextCase.UpperCase)
          .fontSize(AppFontSize.SMALL)
          .fontColor($r('app.color.text'))
          .fontWeight(AppFontWeight.BOLDER)

      }
      .width(GoodsServiceItem.LAYOUT_WEIGHT_LEFT)
      .alignItems(HorizontalAlign.Start)

      Row() {
        Image($rawfile('detail/detail_services.png'))
          .objectFit(ImageFit.Contain)
          .height(GoodsServiceItem.IMAGE_SIZE_SERVICE)
          .width(GoodsServiceItem.IMAGE_SIZE_SERVICE)
          .margin({ right: GoodsServiceItem.MARGIN_RIGHT_IMAGE })
        Text(this.description??'')
          .maxLines(GoodsServiceItem.MAX_LINES)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .textCase(TextCase.UpperCase)
          .fontSize(AppFontSize.SMALL)
          .fontColor($r('app.color.text'))
          .fontWeight(AppFontWeight.BOLDER)

      }
      .justifyContent(FlexAlign.Start)
      .width(GoodsServiceItem.LAYOUT_WEIGHT_CENTER)

      Row() {
        if (this.isShowActionMore) {
          Image($rawfile('detail/detail_pick_up_more.png'))
            .objectFit(ImageFit.Contain)
            .height(GoodsServiceItem.IMAGE_SIZE_MORE)
            .width(GoodsServiceItem.IMAGE_SIZE_MORE)
        } else {
          Row() {
          }
          .height(GoodsServiceItem.IMAGE_SIZE_MORE)
          .width(GoodsServiceItem.IMAGE_SIZE_MORE)
        }
      }
      .width(GoodsServiceItem.LAYOUT_WEIGHT_RIGHT)
      .justifyContent(FlexAlign.End)
    }
    .width(PERCENTAGE_100)
  }
}