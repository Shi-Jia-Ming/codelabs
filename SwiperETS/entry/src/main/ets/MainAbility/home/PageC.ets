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

@Component
export struct PageC {
  private tag: number= 2 // 当前页面所在位置
  @State text: string= ''

  // 以下四条控制页面的懒加载、页面可见、页面不可见的控制
  private hasLoad: boolean= false; // 是否进行过数据加载
  private hasShow: boolean= false; // 是否是可见状态
  @Link @Watch("needLoadData") index: number // 监听父组件索引index状态变化， 不能在组件内部进行初始化
  @Link @Watch("needPageShow") pageShow: boolean // 监听父组件是否可见pageShow状态变化， 不能在组件内部进行初始化

  // 生命周期 默认组件在Swiper中第一次会全部加载
  aboutToAppear(): void  {
    this.readyData();
    this.needLoadData();
  }

  // 初始化数据，做准备工作
  readyData() {

  }

  // 自定义的方法。仅加载一次，这里可以做网络请求等操作
  initLoadData() {
    this.text = '自定义的initLoadData()方法在可见状态仅执行一次，可用于加载网络请求'
  }

  // 自定义的方法。页面可见状态会被调用，多次调用，但页面第一次可见不被调用，会执行initLoadData()方法
   onPageShow(): void  {
    this.text = '自定义onPageShow()方法在页面每次可见状态均执行一次，'
    + '但在第一次可见时不会执行，会执行initLoadData()方法';
  }

  // 自定义的方法。页面不可见状态会被调用，多次调用，initLoadData()方法执行过才会触发
   onPageHide(): void  {
    this.text = 'onPageHide()方法在页面每次不可见状态均执行一次，'
    + 'initLoadData()方法执行过才会触发';
  }

  // 监听父组件index变化就会触发的方法，@Watch
  needLoadData() {
    if (this.tag == this.index) { // 需要index当前所在位置相同
      if (!this.hasLoad) { // 第一次数据有没有加载
        this.hasLoad = true;
        this.initLoadData(); // 触发第一次数据加载
      } else {
        this.needPageShow(); // 第一次数据加载加载后，接下来判断可见状态事件
      }
    }
  }

  // 监听父组件pageShow变化就会触发的方法，@Watch
  needPageShow() {
    if (this.hasLoad) { //第一次数据必须加载过
      if (this.pageShow) { // 页面可见时触发
        if (this.tag == this.index) { // 同样是判断index与当前所在位置是否相同
          this.hasShow = true;
          this.onPageShow()
        }
      } else { // 页面不可见触发
        if (this.hasShow) { // 已经是可见的状态改为不可见，并触发不可见方法回调
          this.hasShow = false;
          this.onPageHide()
        }
      }
    }
  }

  build() {
    Column() {
      Text('第三张页面')
        .fontSize(20)
        .fontColor(0x453354)
        .margin(20)

      Text(this.text)
        .fontSize(16)
        .fontColor(0x666666)
        .margin({top:100,left:10,right:10})
    }.backgroundColor(0xF0EFF4)
  }
}