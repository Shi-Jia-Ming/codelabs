# 二级联动（ArkTS）

### 简介
本篇Codelab是基于ArkTS的声明式开发范式的样例，主要介绍了如何基于List组件实现一个导航和内容的二级联动效果。效果图如下：

![](screenshots/device/TwoLevelLink.gif)

### 相关概念
- [List](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-container-list-0000001477981213-V3?catalogVersion=V3) ：列表包含一系列相同宽度的列表项。适合连续、多行呈现同类数据，例如图片和文本。

- [ListItemGroup](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-container-listitemgroup-0000001428061756-V3?catalogVersion=V3) ： 该组件用来展示列表item分组，宽度默认充满List组件，必须配合List组件来使用。。

### 相关权限

不涉及

### 使用说明

1. 打开应用，切换左侧导航选中状态，右侧内容滚动到对应的位置。
2. 打开应用，滑动右侧内容，当滑动到不同的导航时，左侧的导航会自动选中对应的导航Item。

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为Stage模型，支持API version 9。
3. 本示例需要使用DevEco Studio 3.1 Release版本进行编译运行。