# 简单视频播放器

### 简介

基于ArkUI框架，实现一个简单视频播放器，可支持海报轮播、视频播放等功能。

### 相关概念

[Video组件](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/arkui-ts/ts-media-components-video.md)：用于播放单个视频并控制其播放状态的组件。
[Slider组件](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/arkui-ts/ts-basic-components-slider.md)：滑动条组件，用来快速调节设置值，如音量、亮度等。
[Swiper组件](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/arkui-ts/ts-container-swiper.md)：滑块视图容器，提供子组件滑动轮播显示的能力。

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
3. 本示例需要使用DevEco Studio 3.1 Canary1及以上版本进行编译运行。