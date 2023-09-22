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

import router from '@ohos.router';
import { PictureItem } from '../../common/bean/PictureItem';
import { CommonConstants } from '../../common/constants/CommonConstant';

/**
 * Picture component.
 */
@Component
export struct PictureView {
  private photos: PictureItem = new PictureItem();

  build() {
    Column() {
      Image(this.photos.image).borderRadius(CommonConstants.BORDER_RADIUS)
        .height(CommonConstants.WIDTH_PICTURE)
        .onClick(() => {
          router.pushUrl({ url: CommonConstants.PLAY_PAGE });
        })

      Text(this.photos.name).width(CommonConstants.PAGE_WIDTH)
        .fontSize(CommonConstants.FONT_SIZE_PHOTO_NAME)
        .fontWeight(CommonConstants.FONT_WEIGHT_NORMAL)
        .margin({ top: CommonConstants.TOP_NAME })

      Text(this.photos.description)
        .width(CommonConstants.PAGE_WIDTH)
        .fontSize(CommonConstants.FONT_SIZE_DESCRIPTION)
        .fontWeight(CommonConstants.FONT_WEIGHT_LIGHT)
        .opacity($r('app.float.opacity_light'))
        .margin({ top: CommonConstants.TOP_DESCRIPTION, bottom: CommonConstants.BOTTOM_TEXT })
    }
    .height(CommonConstants.FULL_HEIGHT)
  }
}