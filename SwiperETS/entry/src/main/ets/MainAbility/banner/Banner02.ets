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
import {BannerItem, initializeOnStartup} from './BannerItem'

@Component
export struct Banner02 {
  @State index: number= 0; // Swiper滚动的索引位置，使用@State修饰，变化时修改UI显示
  private imageArray: Array<BannerItem> = []; // 数据源
  private swiperController: SwiperController = new SwiperController() // Swiper控制器
  private timerId: number = -1 // 定时器Id

  // 生命周期方法
  aboutToAppear() {
    this.imageArray = initializeOnStartup(1) // 准备数据
    this.startPlay() // 开启定时器
  }

  // 生命周期方法
  aboutToDisappear() {
    this.stopPlay() // 停止定时器
  }

  // 开始轮播图播放，每隔3秒切换下一个
  startPlay() {
    if (this.timerId = -1) {
      this.timerId = setInterval(() => {
        this.swiperController.showNext()
      }, 3000)
    }
  }

  // 结束播放
  stopPlay() {
    if (this.timerId > 0) {
      clearTimeout(this.timerId)
      this.timerId = -1
    }
  }

  build() {
    Stack({ alignContent: Alignment.BottomEnd }) { // Stack帧布局 设置Alignment.BottomEnd使所有子组件底部靠右对齐
      Swiper(this.swiperController) { // 传入控制器SwiperController
        ForEach(this.imageArray, item => { // ForEach循环渲染 item即是imageArray数组的每一项
          Image(item.image)
            .objectFit(ImageFit.Fill) // 图片铺满
        }, item => item.id.toString())
      }
      .index(this.index)
      .indicator(false) // 不使用系统指示点
      .duration(200) //子组件切换的动画时长
      .height(200) // 固定高度
      // 每页改变时得到当前索引
      .onChange((index: number) => {
        this.index = index;
      })
      // 控制手指触摸时不自动滑动下一页
      .onTouch((event: TouchEvent) => {
        switch (event.type) {
          case TouchType.Down:
            this.stopPlay()
            break;
          case TouchType.Up:
          case TouchType.Cancel: // 手指离开Swiper接触区域被调用，手指还与屏幕接触
            this.startPlay()
            break;
        }
      })


      Text(this.imageArray[this.index].name)
        .fontSize(14)
        .fontColor(0xFFFFFF)
        .height(30)
        .padding({ left: 10 })
        .width('100%')
        .backgroundColor('#80000000')

      Text((this.index + 1) + '/' + this.imageArray.length)
        .fontSize(12)
        .height(30)
        .fontColor(0xFFFFFF)
        .margin({ right: 10 })
        .align(Alignment.Center)
    }
    .clip(true) // 圆角裁剪,不使用该属性将得不到圆角的图片
    .borderRadius(10) // 圆角大小
    .margin({ top: 10, bottom: 10, left: 30, right: 30 }) //外边距
  }
}