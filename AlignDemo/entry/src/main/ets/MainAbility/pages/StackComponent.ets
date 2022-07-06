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
// 入口组件
@Entry
@Component
struct StackComponent {
  @Provide currentAlignContent: Alignment = Alignment.Center
  @Provide message: string = 'center'
  @Provide textAl: TextAlign = TextAlign.Center

  build() {
    Column({ space: 10 }) {
      // Stack中元素对齐方式布局
      Stack({ alignContent: this.currentAlignContent }) {
        Text(this.message)
          .width('100%')
          .height('80%')
          .textAlign(this.textAl)
          .align(Alignment.End)
          .fontSize(16)
          .backgroundColor(0xFFE4C4)
        Text(this.message)
          .fontSize(16)
          .width('80%')
          .height('60%')
          .textAlign(this.textAl)
          .align(this.currentAlignContent)
          .backgroundColor(0xFFBBE3)
      }
      .borderWidth(1)
      .width('100%')
      .height('70%')

      staAlignContentAttribute()
      Text("BACK")
        .width('20%')
        .height(40)
        .fontSize(20)
        .border({ radius: 20 })
        .textAlign(TextAlign.Center)
        .align(Alignment.Center)
        .fontColor(Color.White)
        .backgroundColor(Color.Blue)
        .onClick(() => {
          router.back();
        })
    }
    .padding(5)
  }
}

//AlignItems属性
@Component
struct staAlignContentAttribute {
  @Consume currentAlignContent: Alignment
  @Consume message: string
  @Consume textAl: TextAlign

  build() {
    Column() {
      Text("对齐方式")
        .fontSize(20)
      Flex({ justifyContent: FlexAlign.SpaceBetween }) {

        Text("TopStart")
          .onClick(() => {
            this.currentAlignContent = Alignment.TopStart
            this.message = "TopStart"
            this.textAl = TextAlign.Start
          })
          .fontSize(16)
          .borderColor(Color.Grey)
          .borderStyle(BorderStyle.Solid)
          .borderWidth(1)
          .borderRadius(10)
          .textAlign(TextAlign.Center)
          .align(Alignment.Center)
          .padding(5)
          .backgroundColor(this.currentAlignContent == Alignment.TopStart ? Color.Orange : '')


        Text("TopEnd")
          .onClick(() => {
            this.currentAlignContent = Alignment.TopEnd
            this.message = "TopEnd"
            this.textAl = TextAlign.End
          })
          .fontSize(16)
          .borderColor(Color.Grey)
          .borderStyle(BorderStyle.Solid)
          .borderWidth(1)
          .borderRadius(10)
          .textAlign(TextAlign.Center)
          .align(Alignment.Center)
          .padding(5)
          .backgroundColor(this.currentAlignContent == Alignment.TopEnd ? Color.Orange : '')

        Text("BottomStart")
          .onClick(() => {
            this.currentAlignContent = Alignment.BottomStart
            this.message = "BottomStart"
            this.textAl = TextAlign.Start
          })
          .fontSize(16)
          .borderColor(Color.Grey)
          .borderStyle(BorderStyle.Solid)
          .borderWidth(1)
          .borderRadius(10)
          .textAlign(TextAlign.Center)
          .align(Alignment.Center)
          .padding(5)
          .backgroundColor(this.currentAlignContent == Alignment.BottomStart ? Color.Orange : '')

        Text("BottomEnd")
          .onClick(() => {
            this.currentAlignContent = Alignment.BottomEnd
            this.message = "BottomEnd"
            this.textAl = TextAlign.End
          })
          .fontSize(16)
          .borderColor(Color.Grey)
          .borderStyle(BorderStyle.Solid)
          .borderWidth(1)
          .borderRadius(10)
          .textAlign(TextAlign.Center)
          .align(Alignment.Center)
          .padding(5)
          .backgroundColor(this.currentAlignContent == Alignment.BottomEnd ? Color.Orange : '')

      }
      .padding(5)


    }
    .width('100%')

  }
}