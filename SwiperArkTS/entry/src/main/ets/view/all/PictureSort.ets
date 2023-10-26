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
import { PictureView } from '../common/PictureView';
import { PictureType } from '../../common/constants/PictureConstants';
import { CommonConstants } from '../../common/constants/CommonConstant';

/**
 * text style.
 *
 * @param fontSize Font size.
 * @param fontWeight Font weight.
 */
@Extend(Text)
function textStyle(fontSize: number, fontWeight: number) {
  .fontSize(fontSize)
  .fontWeight(fontWeight)
  .fontColor($r('app.color.font_black'))
}

/**
 * Picture sort.
 */
@Component
export struct PictureSort {
  @State photos: Array<PictureItem> = [];
  @State private sortName: Resource = $r('app.string.recently');
  private initType: string = '';

  aboutToAppear() {
    if (PictureType.RECENTLY === this.initType) {
      this.sortName = $r('app.string.recently');
      this.photos = initializePictures(PictureType.RECENTLY);
    } else {
      this.sortName = $r('app.string.photo');
      this.photos = initializePictures(PictureType.PHOTO);
    }
  }

  build() {
    Column() {
      Row() {
        Text(this.sortName)
          .width(CommonConstants.WIDTH_SORT_NAME)
          .textStyle(CommonConstants.FONT_SIZE_SORT_TITLE, CommonConstants.FONT_WEIGHT_NORMAL)
        Text($r('app.string.more'))
          .layoutWeight(CommonConstants.LAYOUT_WEIGHT)
          .textAlign(TextAlign.End)
          .textStyle(CommonConstants.FONT_SIZE_PHOTO_NAME, CommonConstants.FONT_WEIGHT_LIGHT)
          .lineHeight(CommonConstants.LINE_HEIGHT_MORE)
          .opacity($r('app.float.opacity_light'))
      }
      .width(CommonConstants.WIDTH_SORT)
      .margin({ top: CommonConstants.MARGIN_TOP_SORT, bottom: CommonConstants.MARGIN_BOTTOM_SORT })

      Grid() {
        ForEach(this.photos, (item: PictureItem) => {
          GridItem() {
            PictureView({ photos: item })
          }
        }, (item: PictureItem) => JSON.stringify(item))
      }
      .columnsTemplate(CommonConstants.TWO_COLUMNS)
      .rowsTemplate(CommonConstants.TWO_ROWS)
      .columnsGap(CommonConstants.GAP_COLUMNS)
      .rowsGap(CommonConstants.GAP_COLUMNS)
      .width(CommonConstants.PAGE_WIDTH)
      .height(CommonConstants.HEIGHT_GRID)
      .margin({ bottom: CommonConstants.MARGIN_BOTTOM_GRID })
    }
  }
}