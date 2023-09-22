/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import Constants from '../common/constants/Constants';

@Component
export default struct PhotoItem {
  photoArr: Array<Resource> = [];
  @State currentIndex: number = 0;
  private showCount: number = Constants.SHOW_COUNT / Constants.DOUBLE_NUMBER;

  @Builder albumPicBuilder(img: Resource, index: number) {
    Column() {
      Image(img)
        .width(Constants.FULL_PERCENT)
        .height(Constants.FULL_PERCENT)
        .borderRadius($r('app.float.img_border_radius'))
        .opacity(1 - (this.showCount - index - 1) * Constants.ITEM_OPACITY_OFFSET)
    }
    .padding((this.showCount - index - 1) * Constants.PHOTO_ITEM_PADDING)
    .offset({ y: (this.showCount - index - 1) * Constants.PHOTO_ITEM_OFFSET })
    .height(Constants.PHOTO_ITEM_PERCENT)
    .width(Constants.FULL_PERCENT)
  }

  build() {
    Stack({ alignContent: Alignment.Top }) {
      ForEach(Constants.CACHE_IMG_LIST, (image: string, index?: number) => {
        if (index) {
          this.albumPicBuilder(this.photoArr[this.showCount - index - 1], index)
        }
      }, (item: string, index?: number) => JSON.stringify(item) + index)
    }
    .width(Constants.FULL_PERCENT)
    .height(Constants.FULL_PERCENT)
  }
}