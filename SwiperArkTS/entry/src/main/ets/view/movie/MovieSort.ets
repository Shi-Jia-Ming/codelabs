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

import { PictureItem } from '../../viewmodel/PictureItem';
import { initializePictures } from '../../viewmodel/PictureViewModel';
import { PictureType } from '../../common/constants/PictureConstants';
import { PictureView } from '../common/PictureView';
import { CommonConstants } from '../../common/constants/CommonConstant';

/**
 * Movie sort.
 */
@Component
export struct MovieSort {
  @State photos: Array<PictureItem> = initializePictures(PictureType.LATEST);

  build() {
    Column() {
      Text($r('app.string.lately'))
        .width(CommonConstants.WIDTH_SORT)
        .margin({ top: CommonConstants.MARGIN_TOP_SORT, bottom: CommonConstants.MARGIN_BOTTOM_SORT })
        .fontSize(CommonConstants.FONT_SIZE_SORT_TITLE)
        .fontWeight(CommonConstants.FONT_WEIGHT_NORMAL)
        .fontColor($r('app.color.font_black'))

      Grid() {
        ForEach(this.photos, (item: PictureItem) => {
          GridItem() {
            PictureView({ photos: item })
          }
        }, (item: PictureItem) => JSON.stringify(item))
      }
      .columnsTemplate(CommonConstants.THREE_COLUMNS)
      .rowsTemplate(CommonConstants.THREE_ROWS)
      .columnsGap(CommonConstants.GAP_COLUMNS)
      .rowsGap(CommonConstants.GAP_COLUMNS)
      .width(CommonConstants.PAGE_WIDTH)
      .height(CommonConstants.WIDTH_MOVIE_SORT)
      .margin({ bottom: CommonConstants.MARGIN_BOTTOM_GRID })
    }
  }
}