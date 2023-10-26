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

import RefreshLoadingClass from '../viewmodel/RefreshLoadingClass';
import Constants from '../common/constants/Constants';

/**
 * The load more layout component.
 */
@Component
export default struct LoadMoreLayout {
  @ObjectLink loadMoreLayoutClass: RefreshLoadingClass;

  build() {
    Row() {
      Image(this.loadMoreLayoutClass.imageSrc)
        .width($r('app.float.refresh_img_size'))
        .height($r('app.float.refresh_img_size'))

      Text(this.loadMoreLayoutClass.textValue)
        .margin({ left: $r('app.float.normal_padding') })
        .fontSize($r('app.float.title_font'))
        .textAlign(TextAlign.Center)
    }
    .clip(true)
    .width(Constants.FULL_PERCENT)
    .justifyContent(FlexAlign.Center)
    .height(this.loadMoreLayoutClass.heightValue)
  }
}