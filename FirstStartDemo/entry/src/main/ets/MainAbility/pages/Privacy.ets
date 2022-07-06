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

import router from '@ohos.router'

@Entry
@Component
struct privacy {
  @State message: string = 'Hello World'
  scroller: Scroller = new Scroller()

  build() {
    Row() {
      Column() {
        Text('隐私政策')
          .fontSize(24)
          .margin({ top: 10, bottom: 10 })
          .textAlign(TextAlign.Center)

          .margin({ bottom: 10 })
        Scroll(this.scroller) {
          Text('隐私协议弹隐私协议隐私协议隐私协议隐私协议隐私协议隐私协议隐私协议隐私协议隐私协议隐私协议弹' +
          '隐私协议隐私协议隐私协议隐私协议隐私协议隐私协议隐私协议隐私协议隐私协议隐私协议隐私协议隐私协议' +
          '隐私协议隐私协议隐私协议隐私协议隐私协议隐私协议隐私协议隐私协议隐私协议隐私协议隐私协议隐私协议' +
          '隐私协议隐私协议隐私协议隐私协议隐私协议隐私协议隐私协议隐私协议隐私协议隐私协议隐私协议隐私协议' +
          '隐私协议隐私协议隐私协议隐私协议隐私协议隐私协议隐私协议隐私协议隐私协议隐私协议隐私协议隐私协议隐'
          )
            .fontSize(16)
            .margin({ left: 20, right: 20 })
        }.scrollable(ScrollDirection.Vertical)
        .scrollBar(BarState.On)
        .onScroll((xOffset: number, yOffset: number) => {
          this.scroller.scrollTo({ xOffset: xOffset, yOffset: this.scroller.currentOffset().yOffset + yOffset })
        })

        Button('返回')
          .onClick(() => {
            router.back()
          })
      }
    }
    .height('100%')
  }
}