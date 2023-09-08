# 系统公共事件（ArkTS）

## 简介
本篇Codelab主要介绍订阅、退订系统的Wi-Fi连接状态事件和充电状态事件。效果如图所示：

![](screenshots/device/SystemCommonEvent.gif)

## 相关概念

- [公共事件](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/common-event-overview-0000001427744568-V3)：HarmonyOS通过CES（Common Event Service，公共事件服务）为应用程序提供订阅、发布、退订公共事件的能力。公共事件从系统角度可分为：系统公共事件和自定义公共事件。

## 相关权限

不涉及

## 使用说明

1. 打开应用，进入系统公共事件页面。
2. 动态订阅手机的Wi-Fi连接和充电状况的系统公共事件。
3. 当公共事件发布时，应用程序能够接收到所订阅公共事件的状态变化。
4. 退订系统公共事件。

## 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为Stage模型，支持API version 9。
3. 本示例需要使用DevEco Studio 3.1 Release版本进行编译运行。
