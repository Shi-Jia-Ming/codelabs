# 自定义下拉刷新动画（ArkTS）

### 简介

本篇Codelab主要介绍组件动画animation属性设置。当组件的某些通用属性变化时，可以通过属性动画实现渐变效果，提升用户体验。

![image](screenshots/device/1.gif)

### 相关概念

- [属性动画](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-animatorproperty-0000001478181445-V3?catalogVersion=V3) ：组件的某些通用属性变化时，可以通过属性动画实现渐变效果，提升用户体验。支持的属性包括width、height、backgroundColor、opacity、scale、rotate、translate等。案例中自定义头部组件的属性动画设置主要涉及duration(动画时长)、tempo(动画速率)、delay(动画延时)、curve(动画曲线)、palyMode(动画模式)和iterations（动画播放次数）。

### 使用说明

1. 首次进入应用默认刷新加载一次数据。
2. 手指拉拽应用中部可刷新区域，刷新头部跟随手指拖拽显示/隐藏，动画未启动。
3. 松开手指停止拖拽，如果头部刷新组件未超出可刷新距离，自动回弹隐藏，或者头部刷新组件超出可刷新距离，动画启动，回弹至头部刷新组件完全显示距离，6s后刷新头部组件回弹隐藏。

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为Stage模型，支持API version 9。
3. 本示例需要使用DevEco Studio 3.1 Release版本进行编译运行。