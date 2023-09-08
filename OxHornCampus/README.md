# 溪村小镇（ArkTS）

### 简介
本篇Codelab基于ArkUI实现了一个展示溪村小镇的应用，主要用于呈现ArkUI的基本能力和动画效果，效果图如下：

![](screenshots/device/example.gif)

### 相关概念

-   [Tabs组件](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-container-tabs-0000001478181433-V3?catalogVersion=V3)：通过页签进行内容视图切换的容器组件，每个页签对应一个内容视图。
-   [List组件](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-container-list-0000001477981213-V3?catalogVersion=V3)：列表包含一系列相同宽度的列表项，包含子组件ListItem。
-   [点击手势](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-basic-gestures-tapgesture-0000001428061720-V3)：支持单击、双击和多次点击事件的识别。
-   [拖动手势](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-basic-gestures-pangesture-0000001427744804-V3?catalogVersion=V3)：用于触发拖动手势事件，滑动的最小距离为5vp时拖动手势识别成功。
-   [捏合手势](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-basic-gestures-pinchgesture-0000001478181393-V3?catalogVersion=V3)：用于触发捏合手势事件，触发捏合手势的最少手指为2指，最大为5指，最小识别距离为3vp。
-   [属性动画](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-animatorproperty-0000001478181445-V3?catalogVersion=V3)：组件的某些通用属性变化时，可以通过属性动画实现渐变过渡效果，提升用户体验。
-   [自定义弹窗](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-methods-custom-dialog-box-0000001477981237-V3?catalogVersion=V3)：通过CustomDialogController类显示自定义弹窗。使用弹窗组件时，可优先考虑自定义弹窗，便于自定义弹窗的样式与内容。
-   [Canvas画布](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-components-canvas-canvas-0000001427744852-V3?catalogVersion=V3)：用于自定义绘制图形。
- [AVPlayer](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/js-apis-media-0000001427902672-V3?ha_linker=eyJ0cyI6MTY5MDg4MTU2NjA2OSwiaWQiOiJmMDZiYWZkNWQ2NjAyMDUwZmY4NWVjYmE0ODYxNWU3ZCJ9#ZH-CN_TOPIC_0000001523488666__avplayer9): AVPlayer主要工作是将Audio/Video媒体资源转码为可供渲染的图像和可听见的音频模拟信号，并通过输出设备进行播放，同时对播放任务进行管理，包括开始播放、暂停播放、停止播放、释放资源、设置音量、跳转播放位置、获取轨道信息等功能控制。
- [后台任务管理](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/js-apis-resourceschedule-backgroundtaskmanager-0000001544584033-V3?catalogVersion=V3&ha_linker=eyJ0cyI6MTY5MDg4MTU4NDQ1MiwiaWQiOiJmMDZiYWZkNWQ2NjAyMDUwZmY4NWVjYmE0ODYxNWU3ZCJ9): 本模块提供后台任务管理能力。

### 相关权限

不涉及

### 使用说明

1.  打开应用时进入启动页，启动页轮播展示溪村小镇风景图，之后进入应用首页。
2.  在首页的“地图浏览”标签页，可以拖动和缩放查看地图，并查找相应地标建筑。
3.  在首页的“区域导览”标签页，可以上下滑动查看溪村小镇不同区域的卡片，点击卡片可以进入对应的区域详情页并查看区域的详细介绍和高清建筑风景图。
4.  在首页的“小火车”标签页，可以查看溪村小火车的运行路线图。

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为Stage模型，支持API version 9。
3. 本示例需要使用DevEco Studio 3.1 Release版本进行编译运行。