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
struct RowComponent {
  @Provide currentJustifyContent: FlexAlign = FlexAlign.Start
  @Provide currentAlignItems: VerticalAlign = VerticalAlign.Top
  @Provide currentAlignContent: FlexAlign = FlexAlign.Start

  build() {
    Column({ space: 10 }) {
      // 设置主轴对齐方式组件
      RowJustifyContentAttribute()
      // 设置交叉轴对齐方式组件
      RowAlignItemsAttribute()
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
    .width('100%')
    .height('100%')
    .padding(10)
  }
}


@Component
struct RowJustifyContentAttribute {
  @State list: number[]= [1, 2, 3, 4, 5, 6, 7]
  @Consume currentJustifyContent: FlexAlign
  @Consume currentAlignItems: VerticalAlign

  build() {
    Column() {
      // Row中元素对齐方式布局
      Row() {
        ForEach(this.list, (item) => {
          Text(item.toString())
            .fontSize(28)
            .width(40)
            .height(40)
            .textAlign(TextAlign.Center)
            .backgroundColor(0xF9CF93)
            .borderColor(Color.White)
            .borderWidth(1)
        }, item => item)
      }
      .alignItems(this.currentAlignItems)
      .justifyContent(this.currentJustifyContent)
      .padding(5)
      .width('100%')
      .height('60%')
      .backgroundColor(0xFAEEE0)
      .margin({ top: 10 })

      Text("主轴的对齐方式")
        .fontSize(20)
        .margin({ top: 20 })
      Flex({ justifyContent: FlexAlign.SpaceBetween }) {
        Text("Start")
          .onClick(() => {
            this.currentJustifyContent = FlexAlign.Start
          })
          .fontSize(16)
          .borderColor(Color.Grey)
          .borderStyle(BorderStyle.Solid)
          .borderWidth(1)
          .borderRadius(10)
          .textAlign(TextAlign.Center)
          .align(Alignment.Center)
          .padding(5)
          .backgroundColor(this.currentJustifyContent == FlexAlign.Start ? Color.Orange : '')

        Text("Center")
          .onClick(() => {
            this.currentJustifyContent = FlexAlign.Center
          })
          .fontSize(16)
          .borderColor(Color.Grey)
          .borderStyle(BorderStyle.Solid)
          .borderWidth(1)
          .borderRadius(10)
          .textAlign(TextAlign.Center)
          .align(Alignment.Center)
          .padding(5)
          .backgroundColor(this.currentJustifyContent == FlexAlign.Center ? Color.Orange : '')

        Text("End")
          .onClick(() => {
            this.currentJustifyContent = FlexAlign.End
          })
          .fontSize(16)
          .borderColor(Color.Grey)
          .borderStyle(BorderStyle.Solid)
          .borderWidth(1)
          .borderRadius(10)
          .textAlign(TextAlign.Center)
          .align(Alignment.Center)
          .padding(5)
          .backgroundColor(this.currentJustifyContent == FlexAlign.End ? Color.Orange : '')


      }
      .padding(5)

    }
    .width('100%')

  }
}

//AlignItems属性
@Component
struct RowAlignItemsAttribute {
  @Consume currentAlignItems: VerticalAlign
  @Consume currentAlignContent: FlexAlign

  build() {
    Column() {
      Text("交叉轴对齐方式")
        .fontSize(20)
      Flex({ justifyContent: FlexAlign.SpaceBetween }) {

        Text("Top")
          .onClick(() => {
            this.currentAlignItems = VerticalAlign.Top
            this.currentAlignContent = FlexAlign.Start
          })
          .fontSize(16)
          .borderColor(Color.Grey)
          .borderStyle(BorderStyle.Solid)
          .borderWidth(1)
          .borderRadius(10)
          .textAlign(TextAlign.Center)
          .align(Alignment.Center)
          .padding(5)
          .backgroundColor(this.currentAlignItems == VerticalAlign.Top ? Color.Orange : '')


        Text("Center")
          .onClick(() => {
            this.currentAlignItems = VerticalAlign.Center

          })
          .fontSize(16)
          .borderColor(Color.Grey)
          .borderStyle(BorderStyle.Solid)
          .borderWidth(1)
          .borderRadius(10)
          .textAlign(TextAlign.Center)
          .align(Alignment.Center)
          .padding(5)
          .backgroundColor(this.currentAlignItems == VerticalAlign.Center ? Color.Orange : '')

        Text("Bottom")
          .onClick(() => {
            this.currentAlignItems = VerticalAlign.Bottom

          })
          .fontSize(16)
          .borderColor(Color.Grey)
          .borderStyle(BorderStyle.Solid)
          .borderWidth(1)
          .borderRadius(10)
          .textAlign(TextAlign.Center)
          .align(Alignment.Center)
          .padding(5)
          .backgroundColor(this.currentAlignItems == VerticalAlign.Bottom ? Color.Orange : '')


      }
      .padding(5)


    }
    .width('100%')

  }
}