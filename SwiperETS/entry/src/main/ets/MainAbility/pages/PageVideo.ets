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
import {VideoItem, initializeOnStartup} from '../play/VideoItem'
import {PlayView} from '../play/PlayView'

@Entry
@Component
struct PageVideo {
  @State videoArray: Array<VideoItem> = initializeOnStartup() // 数据源

  @State index: number = 0 // 当前滑动的索引位置
  @State pageShow: boolean = false // 当前页面是否可见，仅对@Entry修饰的主页面PageVideo而言，子组件需要用@Watch监听该状态

  build() {
    Column() {
      Swiper() {
        ForEach(this.videoArray.map((item, index) => { return { i: index, data: item };}),
          item => {
            PlayView({ index: $index, pageShow: $pageShow, item: item.data,position:item.i })
          },
          item => item.data.id.toString())
      }
      .indicator(false) // 默认开启指示点
      .loop(false) // 默认开启循环播放
      .vertical(true) // 默认横向切换、更改为竖向滑动
      .onChange((index: number) => {
        this.index = index
      })
    }
  }

  // 当此页面可见时触发，仅@Entry修饰的自定义组件生效
   onPageShow(): void  {
    this.pageShow = true;
  }

  // 当此页面不可见时触发，仅@Entry修饰的自定义组件生效
   onPageHide(): void  {
    this.pageShow = false;
  }
}