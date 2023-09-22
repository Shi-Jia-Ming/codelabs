# 简易Native C++示例（ArkTS）

### 简介

本篇Codelab介绍如何使用DevEco Studio创建一个Native C++应用，调用C标准库实现计算两个给定数平方和的平方根。界面效果如图所示：

![native_template](screenshots/device/native_template.gif)

### 相关概念

- [NAPI](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/napi-guidelines-0000001493903956-V3?catalogVersion=V3)：NAPI提供的接口名与三方Node.js一致，目前支持部分接口。
- [NAPI中支持的标准库](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/musl-0000001478181805-V3)：目前支持标准C库、C++库、OpenSL ES、zlib。

### 相关权限

不涉及

### 使用说明

1. 输入两个数字，点击计算结果按钮，展示计算两数平方和的平方根结果。

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为Stage模型，支持API version 9。
3. 本示例需要使用DevEco Studio 3.1 Release版本进行编译运行。
