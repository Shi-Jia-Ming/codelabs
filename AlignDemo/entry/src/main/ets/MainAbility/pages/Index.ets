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
struct Index {
  @State list: object[] = [
    { name: 'Flex', path: 'pages/FlexComponent' },
    { name: 'Column', path: 'pages/ColumnComponent' },
    { name: 'Row', path: 'pages/RowComponent' },
    { name: 'Stack', path: 'pages/StackComponent' },
  ]

  build() {
    Row() {
      Column() {
        Text("常用布局容器对齐方式设置")
          .width('100%')
          .height(50)
          .fontSize(30)
          .textAlign(TextAlign.Start)
          .align(Alignment.Start)
          .fontColor(Color.Black)
        Grid() {
          ForEach(this.list, (item) => {
            GridItem() {
              Text(item.name)
                .fontSize(20)
                .fontColor(Color.White)
                .border({radius:20})
                .width('100%')
                .height('100%')
                .backgroundColor('#2788D9')
                .textAlign(TextAlign.Center)
                .onClick(() => {
                  router.push({
                    url: item.path
                  })
                })
            }

          }, item => item.name)
        }
        .columnsTemplate('1fr 1fr')
        .rowsTemplate('1fr 1fr')
        .border({radius:20,color:Color.Blue})
        .columnsGap(5)
        .rowsGap(5)
        .columnsGap(10)
        .rowsGap(10)
        .width('90%')
        .height(200)
      }
      .width('100%')
    }
    .height('100%')
  }
}
