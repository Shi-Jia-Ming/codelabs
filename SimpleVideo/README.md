# 简单视频播放器（ArkTS）

### 简介

基于ArkUI框架，实现一个简单视频播放器，可支持海报轮播、视频播放等功能。

![](screenshots/video.gif)

### 相关概念

- [Swiper](https://developer.harmonyos.com/cn/docs/documentation/doc-references/ts-container-swiper-0000001333321221)组件：滑动容器，提供切换子组件显示的能力。
- [List](https://developer.harmonyos.com/cn/docs/documentation/doc-references/ts-container-list-0000001333800573)组件：列表包含一系列相同宽度的列表项。适合连续、多行呈现同类数据，例如图片和文本。
- [Video](https://developer.harmonyos.com/cn/docs/documentation/doc-references/ts-media-components-video-0000001333641101)组件：视频播放组件。
- [Navigator](https://developer.harmonyos.com/cn/docs/documentation/doc-references/ts-container-navigator-0000001333321217)组件：路由容器组件，提供路由跳转能力。
- [ForEach](https://developer.harmonyos.com/cn/docs/documentation/doc-guides/ets-rendering-control-0000001149698611)组件：循环渲染组件**，**迭代数组并为每个数组项创建相应的组件。

### 相关权限

网络权限：ohos.permission.INTERNET

### 使用说明

1. 在首页点击轮播图中的图片，跳转到视频播放界面，播放应用视频资源
2. 在联网的前提下，在首页点击其他模块列表图片，跳转到视频播放界面，播放网络视频资源
3. 在视频播放界面，可通过点击屏幕播放/暂停视频
4. 在视频播放界面，可通过点击/拖动进度条来控制视频播放进度


### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为Stage模型，支持API version 9及以上版本SDK。
3. 本示例需要使用DevEco Studio 3.1 Beta1及以上版本进行编译运行。
