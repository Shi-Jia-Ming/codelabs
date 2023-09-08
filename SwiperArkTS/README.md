# Swiper的使用（ArkTS）

### 简介

本篇Codelab主要介绍了滑动容器组件Swiper的几种常见应用场景，包括顶部导航、轮播图以及视频滑动播放。

![](screenshots/device/swiper.gif)



### 相关概念

- [Swiper](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-container-swiper-0000001427744844-V3?catalogVersion=V3)：滑动容器，提供子组件切换滑动的能力。
- [Stack](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-container-stack-0000001427584888-V3?catalogVersion=V3)：堆叠容器，子组件按照顺序依次入栈，后一个子组件覆盖前一个子组件。
- [Video](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-media-components-video-0000001427902484-V3?catalogVersion=V3)：用于播放视频文件并控制其播放状态的组件。
- [Observed和ObjectLink装饰器](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/arkts-observed-and-objectlink-0000001473697338-V3?catalogVersion=V3)：用于在涉及嵌套对象或数组的场景中进行双向数据同步。

### 相关权限

不涉及

### 使用说明

1.点击应用进入主页面，点击顶部导航标题可切换展示不同的界面内容；左右滑动展示内容，顶部导航标题随之变化。

2.界面“电影精选”部分为轮播广告，会定时切换内容展示。

3.点击图片会调整至视频播放界面，可通过上下滑动切换播放内容。

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为Stage模型，支持API Version 9。
3. 本示例需要使用DevEco Studio 3.1 Release版本进行编译运行。