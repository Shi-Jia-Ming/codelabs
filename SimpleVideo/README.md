# 简易视频播放器（ArkTS）

### 简介

基于ArkUI框架，实现一个简单视频播放器，可支持海报轮播、视频播放等功能。

![](screenshots/video.gif)

### 相关概念

- [Swiper](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-container-swiper-0000001427744844-V3?catalogVersion=V3&ha_linker=eyJ0cyI6MTY5Mjg1NzEzMDk3MiwiaWQiOiJhMDEwYWRjNDg3N2ZhMWYwMzc0ZTYzNTdlMjk3ZDkzZCJ9)组件：滑块视图容器，提供子组件滑动轮播显示的能力。
- [List](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-container-list-0000001477981213-V3?catalogVersion=V3&ha_linker=eyJ0cyI6MTY5Mjg1NzE2MjAyOCwiaWQiOiJhMDEwYWRjNDg3N2ZhMWYwMzc0ZTYzNTdlMjk3ZDkzZCJ9)组件：列表包含一系列相同宽度的列表项。适合连续、多行呈现同类数据，例如图片和文本。
- [Video](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-media-components-video-0000001427902484-V3?catalogVersion=V3&ha_linker=eyJ0cyI6MTY5Mjg1NzE4MDk3NCwiaWQiOiJhMDEwYWRjNDg3N2ZhMWYwMzc0ZTYzNTdlMjk3ZDkzZCJ9)组件：用于播放视频文件并控制其播放状态的组件。
- [Navigator](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-container-navigator-0000001427584884-V3?catalogVersion=V3&ha_linker=eyJ0cyI6MTY5Mjg1NzIxMDU4MywiaWQiOiJhMDEwYWRjNDg3N2ZhMWYwMzc0ZTYzNTdlMjk3ZDkzZCJ9)组件：路由容器组件，提供路由跳转能力。
- [ForEach](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/arkts-rendering-control-foreach-0000001524537153-V3?ha_linker=eyJ0cyI6MTY5Mjg1NzIzNDc5NiwiaWQiOiJhMDEwYWRjNDg3N2ZhMWYwMzc0ZTYzNTdlMjk3ZDkzZCJ9)组件：ForEach基于数组类型数据执行循环渲染。

### 相关权限

网络权限：ohos.permission.INTERNET

### 使用说明

1. 在首页点击轮播图中的图片，跳转到视频播放界面，播放应用视频资源。
2. 在联网的前提下，在首页点击其他模块列表图片，跳转到视频播放界面，播放网络视频资源。
3. 在视频播放界面，可通过点击屏幕左下方的图标播放/暂停视频。
4. 在视频播放界面，可通过点击/拖动进度条来控制视频播放进度。


### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为Stage模型，支持API version 9及以上版本SDK。
3. 本示例需要使用DevEco Studio 3.1 Release及以上版本进行编译运行。
