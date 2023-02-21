# Swiper的使用（ArkTS）

### 简介

本篇Codelab主要介绍了滑动容器组件Swiper的几种常见应用场景，包括顶部导航、轮播图以及视频滑动播放。

![](screenshots/device/swiper.gif)



### 相关概念

- [Swiper](https://developer.harmonyos.com/cn/docs/documentation/doc-references/ts-container-swiper-0000001333321221)：滑动容器，提供子组件切换滑动的能力。

- [Stack](https://developer.harmonyos.com/cn/docs/documentation/doc-references/ts-container-stack-0000001333641093)：堆叠容器，子组件按照顺序依次入栈，后入栈组件在先入栈组件上方显示。

- [Video](https://developer.harmonyos.com/cn/docs/documentation/doc-references/ts-media-components-video-0000001333641101)：视频播放组件。

-  [Observed和ObjectLink数据管理](https://developer.harmonyos.com/cn/docs/documentation/doc-guides/ets-state-mgmt-page-level-0000001149818711#ZH-CN_TOPIC_0000001157388859__observed%E5%92%8Cobjectlink%E6%95%B0%E6%8D%AE%E7%AE%A1%E7%90%86)： 

  @Observed应用于类，表示该类中的数据变更被UI页面管理，例如：@Observed class ClassA {}。

  @ObjectLink应用于被@Observed所装饰类的对象，例如：@ObjectLink a: ClassA。

### 相关权限

不涉及

### 使用说明

1.点击应用进入主页面，点击顶部导航标题可切换展示不同的界面内容；左右滑动展示内容，顶部导航标题随之变化。

2.界面“电影精选”部分为轮播广告，会定时切换内容展示。

3.点击图片会调整至视频播放界面，可通过上下滑动切换播放内容。

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为Stage模型，支持API Version 9及以上版本SDK。
3. 本示例需要使用DevEco Studio 3.1 Beta1及以上版本进行编译运行。