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
import {TabItem, initializeOnStartup} from './TabItem'

@Component
export struct TabBar {
  @Link index: number // 索引，@State、@Link配合实现父组件与子组件数据双向绑定
  private tabArray: Array<TabItem> = initializeOnStartup() // 数据源

  build() {
    Flex({ direction: FlexDirection.Row,
      justifyContent: FlexAlign.Center,
      alignItems: ItemAlign.Center }) {
      ItemBar0({ index: $index, item: this.tabArray[0] })
      ItemBar1({ index: $index, position: 1, item: this.tabArray[1] })
      ItemBar1({ index: $index, position: 2, item: this.tabArray[2] })
      ItemBar1({ index: $index, position: 3, item: this.tabArray[3] })
    }
    .width('100%')
    .height(60) // 设置高度，剩下的布局全部给Swiper组件占据
    .backgroundColor(0xFFFFFF)
  }
}

@Component
struct ItemBar0 {
  @Link index: number // 索引
  @Consume counts: number //数字提示 @Provide、@Consume配合实现组件与子组件、子组件与子组件的数据同步
  private item: TabItem //当前组件的Tab模型数据

  build() {
    Stack({ alignContent: Alignment.Center }) {
      Flex({ direction: FlexDirection.Column,
        justifyContent: FlexAlign.Center,
        alignItems: ItemAlign.Center }) { // 列方向布局、水平居中布局
        Image(this.index == 0 ? this.item.imagePressed : this.item.imageNormal) // 选中状态修改图片
          .width(30)
          .height(30)
          .onClick(() => {
            this.index = 0 // 点击修改索引为0
          })

        Text(this.item.name)
          .fontSize(12)
          .fontColor(this.index == 0 ? 0x45C01A : 0x000000)
          .onClick(() => {
            this.index = 0 // 点击修改索引index为0
          })
      }

      if (this.counts > 0) { //实现数字提示组件
        Text(this.counts > 99 ? "99+" : this.counts + ("")) // 这里实现超过99个用99+表示，0的时候不显示该组件
          .fontSize(10)
          .fontColor(0xffffff)
          .borderRadius(10)
          .backgroundColor(0xff0000)
          .padding({ left: 4, right: 4, top: 2, bottom: 2 })
          .offset({ x: 15, y: -15 }) // 相对位置的偏移量
      }
    }
    .height('100%')
    .width('100%')
    .layoutWeight(1) // Flex布局容器下占据1个比重
  }
}

@Component
struct ItemBar1 {
  @Link index: number // 索引
  private position: number // 该组件所在位置
  private item: TabItem // 该组件的模型数据

  build() {
    Flex({ direction: FlexDirection.Column,
      justifyContent: FlexAlign.Center,
      alignItems: ItemAlign.Center }) { // 列方向布局、水平居中布局
      Image(this.index == this.position ? this.item.imagePressed : this.item.imageNormal) // 选中状态修改图片
        .width(30)
        .height(30)
        .onClick(() => {
          this.index = this.position // 点击修改索引index为当前position
        })

      Text(this.item.name)
        .fontSize(12)
        .fontColor(this.index == this.position ? 0x45C01A : 0x000000)
        .onClick(() => {
          this.index = this.position // 点击修改索引index为当前position
        })
    }
    .height('100%')
    .width('100%')
    .layoutWeight(1) // Flex布局容器下占据1个比重
  }
}