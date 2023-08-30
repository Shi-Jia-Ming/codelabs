# 简易计算器（ArkTS）

### 简介

基于基础组件、容器组件，实现一个支持加减乘除混合运算的计算器。效果如图所示：

![image](screenshots/device/SimpleCalculator.gif)

### 相关概念

- [ForEach](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/arkts-rendering-control-foreach-0000001524537153-V3?ha_linker=eyJ0cyI6MTY5Mjg0NzY4MjA5NSwiaWQiOiJhMDEwYWRjNDg3N2ZhMWYwMzc0ZTYzNTdlMjk3ZDkzZCJ9)组件：ForEach基于数组类型数据执行循环渲染。
- [TextInput](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-basic-components-textinput-0000001427584864-V3?catalogVersion=V3&ha_linker=eyJ0cyI6MTY5Mjg0NzcwOTUwNSwiaWQiOiJhMDEwYWRjNDg3N2ZhMWYwMzc0ZTYzNTdlMjk3ZDkzZCJ9)组件：单行文本输入框组件。
- [Image](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-basic-components-image-0000001428061728-V3?catalogVersion=V3&ha_linker=eyJ0cyI6MTY5Mjg0NzcyNjUwMiwiaWQiOiJhMDEwYWRjNDg3N2ZhMWYwMzc0ZTYzNTdlMjk3ZDkzZCJ9)组件：Image为图片组件，常用于在应用中显示图片。Image支持加载string、[PixelMap](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/js-apis-image-0000001477981401-V3#ZH-CN_TOPIC_0000001523648994__pixelmap7)和[Resource](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-types-0000001477981241-V3#ZH-CN_TOPIC_0000001573928889__resource)类型的数据源，支持png、jpg、bmp、svg和gif类型的图片格式。

### 相关权限

不涉及

### 使用说明

1. 在键盘输入区域输入表达式。
2. 表达式输入框实时显示键盘输入区域输入的表达式。
3. 结果输出框实时显示表达式的计算结果。

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为Stage模型，支持API version 9及以上版本SDK。
3. 本示例需要使用DevEco Studio 3.1 Release及以上版本进行编译运行。