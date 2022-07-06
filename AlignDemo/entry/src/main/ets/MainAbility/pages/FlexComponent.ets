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

// 页面入口组件
@Entry
@Component
struct FlexComponent {
  @Provide list: number[]= [1, 2, 3, 4, 5, 6]
  @Provide currentFlexDirection: FlexDirection = FlexDirection.Row
  @Provide currentFlexWrap: FlexWrap = FlexWrap.NoWrap
  @Provide currentJustifyContent: FlexAlign = FlexAlign.Start
  @Provide currentAlignItems: ItemAlign = ItemAlign.Start
  @Provide currentAlignContent: FlexAlign = FlexAlign.Start

  build() {
    Column({ space: 10 }) {
      // 设置主轴方向组件
      FlexDirectionAttribute()
      // 设置元素排列方式组件
      FlexWrapAttribute()
      // 设置主轴对齐方向组件
      JustifyContentAttribute()
      // 设置交叉轴对齐方向组件
      AlignItemsAttribute()
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
//FlexWrap属性
@Component
struct FlexWrapAttribute {
  @Consume list: number[]
  @Consume currentFlexWrap: FlexWrap

  build() {
    Column() {
      Text("排列方式")
        .fontSize(20)
      Flex({ justifyContent: FlexAlign.SpaceBetween }) {
        Text("NoWrap")
          .onClick(() => {
            this.currentFlexWrap = FlexWrap.NoWrap
            this.list = [1, 2, 3, 4, 5, 6]
          })
          .fontSize(16)
          .borderColor(Color.Grey)
          .borderStyle(BorderStyle.Solid)
          .borderWidth(1)
          .borderRadius(10)
          .textAlign(TextAlign.Center)
          .align(Alignment.Center)
          .padding(5)
          .backgroundColor(this.currentFlexWrap == FlexWrap.NoWrap ? Color.Orange : '')

        Text("Wrap")
          .onClick(() => {
            this.currentFlexWrap = FlexWrap.Wrap
            this.list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
          })
          .fontSize(16)
          .borderColor(Color.Grey)
          .borderStyle(BorderStyle.Solid)
          .borderWidth(1)
          .borderRadius(10)
          .textAlign(TextAlign.Center)
          .align(Alignment.Center)
          .padding(5)
          .backgroundColor(this.currentFlexWrap == FlexWrap.Wrap ? Color.Orange : '')

        Text("WrapReverse")
          .onClick(() => {
            this.currentFlexWrap = FlexWrap.WrapReverse
            this.list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
          })
          .fontSize(16)
          .borderColor(Color.Grey)
          .borderStyle(BorderStyle.Solid)
          .borderWidth(1)
          .borderRadius(10)
          .textAlign(TextAlign.Center)
          .align(Alignment.Center)
          .padding(5)
          .backgroundColor(this.currentFlexWrap == FlexWrap.WrapReverse ? Color.Orange : '')

      }
      .padding(5)

    }
    .width('100%')

  }
}
//FlexDirection属性
@Component
struct FlexDirectionAttribute {
  @Consume list: number[]
  @Consume currentFlexDirection: FlexDirection
  @Consume currentJustifyContent: FlexAlign
  @Consume currentAlignItems: ItemAlign
  @Consume currentFlexWrap: FlexWrap
  @Consume currentAlignContent: FlexAlign

  build() {
    Column() {
      // Flex中元素对齐方式布局
      Flex({
        alignItems: this.currentAlignItems,
        direction: this.currentFlexDirection,
        justifyContent: this.currentJustifyContent,
        wrap: this.currentFlexWrap,
        alignContent: this.currentAlignContent
      }) {
        ForEach(this.list, (item) => {
          Text(item.toString())
            .fontSize(28)
            .width('40')
            .height('40')
            .textAlign(TextAlign.Center)
            .backgroundColor(0xF9CF93)
            .borderColor(Color.White)
            .borderWidth(1)
        }, item => item)
      }
      .padding(5)
      .width('100%')
      .height('45%')
      .backgroundColor(0xFAEEE0)
      .margin({ top: 10 })

      Text("主轴的方向")
        .fontSize(20)
        .margin({ top: 20 })
      Flex({ justifyContent: FlexAlign.SpaceBetween }) {
        Text("Row")
          .onClick(() => {
            this.currentFlexDirection = FlexDirection.Row
          })
          .fontSize(16)
          .borderColor(Color.Grey)
          .borderStyle(BorderStyle.Solid)
          .borderWidth(1)
          .borderRadius(10)
          .textAlign(TextAlign.Center)
          .padding(5)
          .backgroundColor(this.currentFlexDirection == FlexDirection.Row ? Color.Orange : '')

        Text("Column")
          .onClick(() => {
            this.currentFlexDirection = FlexDirection.Column
          })
          .fontSize(16)
          .borderColor(Color.Grey)
          .borderStyle(BorderStyle.Solid)
          .borderWidth(1)
          .borderRadius(10)
          .textAlign(TextAlign.Center)
          .padding(5)
          .backgroundColor(this.currentFlexDirection == FlexDirection.Column ? Color.Orange : '')

        Text("ColumnReverse")
          .onClick(() => {
            this.currentFlexDirection = FlexDirection.ColumnReverse
          })
          .fontSize(16)
          .borderColor(Color.Grey)
          .borderStyle(BorderStyle.Solid)
          .borderWidth(1)
          .borderRadius(10)
          .textAlign(TextAlign.Center)
          .padding(5)
          .backgroundColor(this.currentFlexDirection == FlexDirection.ColumnReverse ? Color.Orange : '')
      }
      .padding(5)


    }
    .width('100%')

  }
}


//JustifyContent属性
@Component
struct JustifyContentAttribute {
  @Consume currentJustifyContent: FlexAlign

  build() {
    Column() {
      Text("主轴的对齐方式")
        .fontSize(20)
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
struct AlignItemsAttribute {
  @Consume currentFlexWrap: FlexWrap
  @Consume currentAlignItems: ItemAlign
  @Consume currentAlignContent: FlexAlign

  build() {
    Column() {
      Text(this.currentFlexWrap == FlexWrap.NoWrap ? 'alignItem: 交叉轴对齐方式' : "alignContent: 交叉轴对齐方式")
        .fontSize(20)
      Flex({ justifyContent: FlexAlign.SpaceBetween }) {

        Text("Start")
          .onClick(() => {
            this.currentAlignItems = ItemAlign.Start
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
          .backgroundColor(this.currentAlignItems == ItemAlign.Start ? Color.Orange : '')


        Text("Center")
          .onClick(() => {
            this.currentAlignItems = ItemAlign.Center
            this.currentAlignContent = FlexAlign.Center
          })
          .fontSize(16)
          .borderColor(Color.Grey)
          .borderStyle(BorderStyle.Solid)
          .borderWidth(1)
          .borderRadius(10)
          .textAlign(TextAlign.Center)
          .align(Alignment.Center)
          .padding(5)
          .backgroundColor(this.currentAlignItems == ItemAlign.Center ? Color.Orange : '')

        Text("End")
          .onClick(() => {
            this.currentAlignItems = ItemAlign.End
            this.currentAlignContent = FlexAlign.End
          })
          .fontSize(16)
          .borderColor(Color.Grey)
          .borderStyle(BorderStyle.Solid)
          .borderWidth(1)
          .borderRadius(10)
          .textAlign(TextAlign.Center)
          .align(Alignment.Center)
          .padding(5)
          .backgroundColor(this.currentAlignItems == ItemAlign.End ? Color.Orange : '')


      }
      .padding(5)


    }
    .width('100%')

  }
}