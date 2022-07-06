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

@Component
export struct PageA {
  @Consume counts: number // 数字提示，@Provide、@Consume配合实现组件与子组件、子组件与子组件的数据同步

  build() {
    Column() {
      Text('第一张页面')
        .fontSize(20)
        .fontColor(0x453354)
        .margin(20)

      Row() {
        Text('未读 +1')
          .onClick(() => {
            this.counts++
          })
          .fontSize(16)
          .fontColor(0x4169E1)
          .margin({ right: 10 })
        Text('未读 -1')
          .onClick(() => {
            if (this.counts >= 0) {
              this.counts--
            }
          })
          .fontSize(16)
          .fontColor(0x4169E1)
          .margin({ left: 10 })
      }.margin({ top: 50 }).align(Alignment.Center)


    }.backgroundColor(0xF0EFF4)
  }
}