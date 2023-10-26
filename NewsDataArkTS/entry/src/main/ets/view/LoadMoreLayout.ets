/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { CustomRefreshLoadLayoutClass } from '../viewmodel/NewsViewModel';
import CustomRefreshLoadLayout from './CustomRefreshLoadLayout';

/**
 * The load more layout component.
 */
@Component
export default struct LoadMoreLayout {
  @ObjectLink loadMoreLayoutClass: CustomRefreshLoadLayoutClass;

  build() {
    Column() {
      if (this.loadMoreLayoutClass.isVisible) {
        CustomRefreshLoadLayout({
          customRefreshLoadClass: new CustomRefreshLoadLayoutClass(this.loadMoreLayoutClass.isVisible,
            this.loadMoreLayoutClass.imageSrc, this.loadMoreLayoutClass.textValue, this.loadMoreLayoutClass.heightValue)
        })
      } else {
        CustomRefreshLoadLayout({
          customRefreshLoadClass: new CustomRefreshLoadLayoutClass(this.loadMoreLayoutClass.isVisible,
            this.loadMoreLayoutClass.imageSrc, this.loadMoreLayoutClass.textValue, 0)
        })
      }
    }
  }
}