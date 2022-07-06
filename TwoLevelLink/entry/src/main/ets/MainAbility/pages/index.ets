/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import {TabItem, CourseItem, getLinkData} from '../model/Model';

@Entry
@Component
struct Index {
  @State index: number= 0; // 一级分类选中的索引
  @State requestSuccess: boolean= false // 标识数据是否读取完成

  private tabArray: Array<TabItem> = [] // 一级分类数据
  private listArray: Array<CourseItem> = [] // 二级分类数据
  private scroller: Scroller = new Scroller() // 可滚动容器组件的控制器

  aboutToAppear() {
    // 延时数据加载
    setTimeout(() => {
      let linkDataItem = getLinkData();
      this.tabArray = linkDataItem.tabArray;
      this.listArray = linkDataItem.listArray;
      this.requestSuccess = true;
    }, 2000)
  }

  build() {
    Row() {
      if (this.requestSuccess) {
        Scroll() {
          Column() {
            ForEach(this.tabArray.map((item1, index1) => {
              return { index: index1, data: item1 };
            }), item => {
              Text(item.data.superName)
                .fontColor(0x696969)
                .backgroundColor(this.index == item.index ? 0xffffff : null)
                .fontSize(16)
                .width('100%')
                .height(60)
                .textAlign(TextAlign.Center)
                .onClick(() => {
                  if (this.index != item.index) {
                    this.index = item.index
                    this.scroller.scrollToIndex(item.data.position)
                  }
                })
            }, item => '' + item.data)
          }.height('100%')
        }.width(100).height('100%').backgroundColor(0xdddddd).scrollBar(BarState.Off)

        List({ scroller: this.scroller }) {
          ForEach(this.listArray, item => {
            if (item.tag) {
              ListItem() {
                Text(item.courseName)
                  .fontColor(0x696969)
                  .fontSize(20)
                  .height(40)
                  .width('100%')
                  .padding({ left: 10 })
                  .backgroundColor(0xefefef)
              }.sticky(Sticky.Normal)
            } else {
              ListItem() {
                Stack({ alignContent: Alignment.TopStart }) {
                  Image(item.imageUrl)
                    .objectFit(ImageFit.Cover)
                    .width(130)
                    .height(100)
                    .margin({ left: 10, top: 10 })

                  Text(item.courseName)
                    .fontColor(0x363636)
                    .fontSize(14)
                    .margin({ left: 150, top: 12 })
                    .maxLines(2)
                    .textOverflow({ overflow: TextOverflow.Clip })

                  Text(item.price == 0 ? '免费' : '¥' + item.price)
                    .fontColor(0xff6600)
                    .fontSize(24)
                    .position({ x: 0, y: '100%' })
                    .markAnchor({ x: 0, y: '100%' })
                    .margin({ bottom: 18, left: 150 })

                  Divider()
                    .margin({ left: 10, right: 10 })
                    .color(0xefefef)
                    .strokeWidth(0.7)
                    .position({ x: 0, y: '100%' })
                    .markAnchor({ x: 0, y: '100%' })
                }.height(120)
              }
            }
          }, item => '' + item)
        }
        .layoutWeight(1)
        .onScrollIndex((firstIndex: number) => {
          if (this.index != this.listArray[firstIndex].index) {
            this.index = this.listArray[firstIndex].index
          }
        })
      } else {
        Text('加载数据中...').textAlign(TextAlign.Center).width('100%').height('100%')
      }
    }.backgroundColor(0xffffff)
  }
}