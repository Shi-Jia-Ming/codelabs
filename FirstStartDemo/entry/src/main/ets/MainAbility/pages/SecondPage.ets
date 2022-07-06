/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

@Entry
@Component
struct SecondPage {
  @State jumpFlag: boolean = false
  private id: number

  onPageShow() {
    this.jumpFlag = false
    var that = this
    this.id = setTimeout(function () {
      if (!that.jumpFlag) {
        router.replace({ url: 'pages/ThirdPage' })
      }
    }, 3000);
  }

  onPageHide() {
    clearTimeout(this.id)
  }

  build() {
    Row() {
      Column() {
        Image($r('app.media.picture2')).onClick(() => {
          this.jumpFlag = true
          router.push({ url: 'pages/WebPage', params: { source: 'ad' } })
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}
