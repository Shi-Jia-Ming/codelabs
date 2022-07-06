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
import {TabBar} from '../bar/TabBar'
import {PageA} from '../home/PageA'
import {PageB} from '../home/PageB'
import {PageC} from '../home/PageC'
import {PageD} from '../home/PageD'


@Entry
@Component
struct PageTab {
  @State index: number = 0 // 当前滑动的索引位置
  @State pageShow: boolean = false // 当前页面是否可见，仅对@Entry修饰的主页面pageTab而言，子组件需要用@Watch监听该状态
  @Provide counts: number = 1 // @Provide、@Consume配合实现组件与子组件、子组件与子组件的数据同步

  build() {
    Flex({ direction: FlexDirection.Column }) {
      Swiper() {
        PageA()
        PageB()
        PageC({ index: $index, pageShow: $pageShow }) // @Link装饰的变量可以和父组件的@State变量建立双向数据绑定，传值需要使用$
        PageD()
      }
      .index(this.index) // 变化的索引，底部切换页面跟随变化
      .indicator(false) // 默认开启指示点
      .loop(false) // 默认开启循环播放
      .duration(50)
      .onChange((index: number) => {
        this.index = index
      })
      .flexGrow(1) // 占据全部比重

      TabBar({ index: $index }); // 自定义底部导航栏组件
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