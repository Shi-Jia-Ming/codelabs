# 简易计算器（ArkTS）

### 简介

基于基础组件、容器组件，实现一个支持加减乘除混合运算的计算器。效果如图所示：

![image](screenshots/device/SimpleCalculator.gif)

### 相关概念

- [ForEach](https://developer.harmonyos.com/cn/docs/documentation/doc-guides/ets-rendering-control-0000001149698611)组件：循环渲染组件**，**迭代数组并为每个数组项创建相应的组件。
- [TextInput](https://developer.harmonyos.com/cn/docs/documentation/doc-references/ts-basic-components-textinput-0000001333321201)组件：单行文本输入框组件。
- [Image](https://developer.harmonyos.com/cn/docs/documentation/doc-references/ts-basic-components-image-0000001281001226)组件：图片组件，支持本地图片和网络图片的渲染展示。

### 相关权限

不涉及

### 使用说明

1. 在键盘输入区域输入表达式。
2. 表达式输入框实时显示键盘输入区域输入的表达式。
3. 结果输出框实时显示表达式的计算结果。

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为Stage模型，支持API version 9及以上版本SDK。
3. 本示例需要使用DevEco Studio 3.1 Beta2及以上版本进行编译运行。