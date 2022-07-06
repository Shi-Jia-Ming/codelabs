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
import router from '@system.router'

@Entry
@Component
struct Index {
  build() {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      ButtonX({ text: '常见轮播图的实现', path: 'pages/PageBanner' })
      ButtonX({ text: '底部导航栏切换', path: 'pages/PageTab' })
      ButtonX({ text: '视频滑动切换', path: 'pages/PageVideo' })
    }.width('100%').backgroundColor(0xF0EFF4)
  }
}

@Component
struct ButtonX {
  private text: string
  private path: string

  build() {
    Button(this.text, { type: ButtonType.Normal, stateEffect: true })
      .borderRadius(10)
      .margin({ bottom: 50 })
      .backgroundColor(0xFFFFFF)
      .fontColor(0x343536)
      .fontSize(20)
      .width(240)
      .height(30)
      .onClick(() => {
        router.push({ uri: this.path })
      })
  }
}



