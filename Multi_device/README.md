# 一次开发多端部署（ArkTS）

### 简介

随着终端设备类型的不断丰富，用户对于应用UI界面的设计开发有了多样化的诉求，应用需要在多种终端设备上实现操作与美观层面的统一。这要求开发者在应用开发初期就考虑应用在多种终端设备上的运行场景，并据此来设计开发多套代码以适配不同设备，增加了开发成本。ArkTS是HarmonyOS提供的一种声明式UI开发范式，它提供的UI开发能力，旨在简化应用开发场景，使开发者能快速部署应用UI界面，并能适配不同的设备屏幕形态，实现“一次开发，多端部署”的目的。

本篇Codelab使用ArkTS实现应用的“一次开发，多端部署”，效果如下图所示：

![image](screenshots/device/一多.gif)
![image](screenshots/device/平板.png)

### 相关概念

- [List](https://developer.harmonyos.com/cn/docs/documentation/doc-references/ts-container-list-0000001333800573)：包含一系列相同宽度的列表项，适合连续、多行呈现同类数据，例如图片和文本。

- [Flex](https://developer.harmonyos.com/cn/docs/documentation/doc-references/ts-container-flex-0000001281001250)：弹性布局组件。

- [Swiper](https://developer.harmonyos.com/cn/docs/documentation/doc-references/ts-container-swiper-0000001333321221)：滑动容器，提供切换子组件显示的能力。

### 相关权限

不涉及

### 使用说明

1. 当设备为手机时，首页顶部标签之间间隔较小，轮播图只显示一张，中间内容可上下滑动，每个栏目可左右滑动，底部页签分布均匀。
2. 当设备为平板时，首页顶部标签之间间隔增大，轮播图显示多张，中间内容可上下滑动，每个栏目无需滑动就可以显示全部内容，底部页签仍然分布均匀。

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为Stage模型，支持API version 9及以上版本SDK。
3. 本示例需要使用DevEco Studio 3.1 Beta2及以上版本进行编译运行。