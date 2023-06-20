# 下载通知（ArkTS）

## 简介
基于HarmonyOS通知能力，实现下载通知的案例。

![](screenshots/device/notifition.gif)

## 相关概念

- [通知](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/notification-overview-0000001428061584-V3?catalogVersion=V3): 应用可以通过通知接口发送通知消息，终端用户可以通过通知栏查看通知内容，也可以点击通知来打开应用。

## 相关权限

不涉及

## 使用说明

1. 点击下载，开始发送通知，下载进度持续增长。
2. 下载中，点击暂停，显示当前进度。
3. 暂停下载，点击继续，重复步骤一。
4. 下载进度达100%，下载完成。

## 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为Stage模型，支持API version 9及以上版本SDK。
3. 本示例需要使用DevEco Studio 3.1 Release及以上版本进行编译运行。