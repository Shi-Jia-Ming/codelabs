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
import {VideoItem} from '../play/VideoItem'

@Component
export struct PlayView {
  // 四条控制页面可见、页面不可见的控制
  private isShow: boolean = false // 是否是可见状态
  @Link @Watch("needPageShow") index: number // 监听父组件索引index状态变化， 不能在组件内部进行初始化
  @Link @Watch("needPageShow") pageShow: boolean // 监听父组件是否可见pageShow状态变化， 不能在组件内部进行初始化
  private position: number // 当前页面所在位置

  @ObjectLink private item: VideoItem // @Observed与@ObjectLink配合使用实现 class修饰的模型数据改变触发UI更新
  @State private playState: number = 0 // 0表示停止播放--stop   1表示开始播放--start   2表示暂停播放--pause

  // @ts-ignore
  private videoController: VideoController = new VideoController() // 视频播放器控制器

  build() {
    Stack({ alignContent: Alignment.Center | Alignment.End }) {
      Video({
        src: this.item.src, // 视频播放地址
        controller: this.videoController // 视频播放器控制器
      })
        .controls(false) // 不需要控制栏
        .autoPlay(this.playState == 1 ? true : false) // 首次可见状态自动播放
        .objectFit(ImageFit.Contain) // 视频窗口自适应视频大小
        .loop(true) // 循环播放
        .onClick(() => { // 点击播放、再点击暂停播放
          if (this.playState == 1) {
            this.playState = 2;
            this.videoController.pause();
          } else if (this.playState == 2) {
            this.playState = 1;
            this.videoController.start();
          }
        })

      Column() {
        Image(this.item.isLikes ? $r('app.media.vote1') : $r('app.media.vote0')) // 点赞图标
          .width(36).height(36)
          .onClick(() => {
            if (this.item.isLikes) {
              this.item.likesCount--;
            } else {
              this.item.likesCount++;
            }
            this.item.isLikes = !this.item.isLikes;
          }).margin({ top: 40 })
        Text(this.item.likesCount == 0 ? '点赞' : ('' + this.item.likesCount)).fontSize(16).fontColor(0xffffff) // 评论图标

        Image($r('app.media.comment'))
          .width(36).height(36).margin({ top: 20 })
        Text(this.item.commentCount == 0 ? '评论' : ('' + this.item.commentCount))
          .fontSize(16)
          .fontColor(0xffffff) // 转发图标

        Image($r('app.media.share'))
          .width(36).height(36).margin({ top: 20 })
      }.offset({ x: '-5%', y: '-10%' }) // 位置调整

      Text(this.item.title)
        .fontSize(16)
        .fontColor(0xffffff)
        .margin(10)
        .offset({ x: '-50%', y: '40%' })
    }.backgroundColor(Color.Black)
    .width('100%')
    .height('100%')
  }

  // 自定义的方法。页面可见状态会被调用，多次调用
  onPageShow(): void  {
    if (this.playState != 1) {
      this.playState = 1;
      this.videoController.start();
    }
  }

  // 自定义的方法。页面不可见状态会被调用，多次调用,这种不可见是Swiper滑动时触发的
  private onPageSwiperHide(): void  {
    if (this.playState != 0) {
      this.playState = 0;
      this.videoController.stop(); // 停止视频播放
    }
  }

  // 自定义的方法。页面不可见状态会被调用，多次调用,这种不可见是点击页面跳转、或者应用回到桌面时触发的
  onPageHide(): void  {
    if (this.playState != 2) {
      this.playState = 2;
      this.videoController.pause(); // 暂停视频播放
    }
  }

  // 监听父组件index、pageShow属性变化就会触发的方法，@Watch
  needPageShow() {
    if (this.pageShow) { // 页面可见时触发
      if (this.position == this.index) { // 判断index与当前所在位置是否相同
        this.isShow = true;
        this.onPageShow()
      } else {
        if (this.isShow) { // 已经是可见的状态改为不可见，并触发不可见方法回调
          this.isShow = false;
          this.onPageSwiperHide()
        }
      }
    } else { // 页面不可见触发
      if (this.position == this.index) {
        if (this.isShow) { // 已经是可见的状态改为不可见，并触发不可见方法回调
          this.isShow = false;
          this.onPageHide()
        }
      }
    }
  }
}