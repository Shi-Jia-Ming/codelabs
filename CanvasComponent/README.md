# 自定义抽奖转盘（ArkTS）

### 简介

基于画布组件，实现自定义抽奖转盘功能。效果如图所示：

![image](screenshots/device/canvas.gif)

### 相关概念

- [Stack组件](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-container-stack-0000001427584888-V3?catalogVersion=V3)：堆叠容器，子组件按照顺序依次入栈，后一个子组件覆盖前一个子组件。
- [Canvas](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-components-canvas-canvas-0000001427744852-V3?catalogVersion=V3)：画布组件，用于自定义绘制图形。
- [CanvasRenderingContext2D对象](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-canvasrenderingcontext2d-0000001478181441-V3?catalogVersion=V3)：使用RenderingContext在Canvas组件上进行绘制，绘制对象可以是矩形、文本、图片等。
- [显式动画](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-explicit-animation-0000001478341181-V3?catalogVersion=V3)：提供全局animateTo显式动画接口来指定由于闭包代码导致的状态变化插入过渡动效。
- [自定义弹窗](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-methods-custom-dialog-box-0000001477981237-V3?catalogVersion=V3)： 通过CustomDialogController类显示自定义弹窗。

### 相关权限

不涉及

### 使用说明

1. 点击圆形转盘中**开始**抽奖图标，圆形转盘开始转动抽奖。
2. 转盘停止转动后，抽奖结束，弹出抽中的文本和图片信息。

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为Stage模型，支持API version 9及以上版本SDK。
3. 本示例需要使用DevEco Studio 3.1 Release及以上版本进行编译运行。