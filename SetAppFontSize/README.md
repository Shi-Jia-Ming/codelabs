# 应用内字体大小调节（ArkTS）

### 简介

基于 [Slider](https://developer.harmonyos.com/cn/docs/documentation/doc-references/ts-basic-components-slider-0000001281201142) 组件和首选项，实现通过拖动滑块调节应用内字体大小的功能。

效果图如下：

![](screenshots/device/SetAppFontSize.gif)

### 相关概念

- 字体大小调节原理 ：通过组件Slider滑动，获取滑动数值，将这个值通过首选项进行持久化，页面的字体通过这个值去改变大小。

- [首选项](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/js-apis-data-preferences-0000001427745052-V3?catalogVersion=V3): 首选项为应用提供Key-Value键值型的数据处理能力，支持应用持久化轻量级数据，并对其修改和查询。

### 相关权限

不涉及

### 使用说明

1.应用包含“设置”、“字体大小设置”两个页面。

2.页面左上角都要一个返回按钮。

3.通过点击设置页的“设置字体大小”项，可以进入到字体大小设置页。

4.在字体大小设置页拖动滑块，设置页的设置项文字以及字体大小设置页的聊天文字大小会同步变化。

### 约束与限制

1.本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。

2.本示例为Stage模型，支持API version 9及以上版本SDK。

3.本示例需要使用DevEco Studio 3.1 Beta2及以上版本进行编译运行。