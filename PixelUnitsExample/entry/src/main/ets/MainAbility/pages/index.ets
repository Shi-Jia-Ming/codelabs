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
import { AppFontSize } from '../../common/AppFontConfig'
import { AppColor } from '../../common/AppColorConfig'
import router from '@ohos.router'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World！'
  build() {

    Row() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

        TextButton({ content: '像素介绍', onclick: () => {
          router.push({ url: "pages/pixelUnitsPage", })
        } })
        Row().width('100%').height(20)
        TextButton({ content: '像素转换', onclick: () => {
          router.push({ url: "pages/pixelConversionPage" })
        } })
      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor(AppColor.Background)
  }
}

@Component
struct TextButton {
  @Prop content: string
  onclick: (onclick?: ClickEvent) => void

  build() {
    Button(this.content, { type: ButtonType.Normal, stateEffect: false })
      .fontSize(AppFontSize.Title)
      .fontColor(AppColor.Title)
      .backgroundColor(AppColor.Background1)
      .borderColor('#dadadb')
      .borderWidth(0.5)
      .borderRadius(9)
      .onClick(this.onclick)
      .height('6%')
      .width('90%')

  }
}