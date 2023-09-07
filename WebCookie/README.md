# Web组件之cookie常见操作（ArkTS）

### 简介

本篇Codelab使用ArkTS语言实现一个简单的免登录过程，向大家介绍基本的cookie管理操作。

![](screenshots/device/Web.gif)



### 相关概念

- [Web](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-basic-components-web-0000001477981205-V3?catalogVersion=V3)：提供网页显示能力的组件。
- [WebCookieManager](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/js-apis-webview-0000001427902720-V3#ZH-CN_TOPIC_0000001523968634__webcookiemanager)：通过WebCookie可以控制Web组件中的cookie的各种行为，其中每个应用中的所有web组件共享一个WebCookieManager实例。

### 相关权限

网络使用权限：ohos.permission.INTERNET。

### 使用说明

1.设备接入网络，主页会加载HarmonyOS官网登录界面。

2.点击获取cookie，可以获取当前的cookie信息，并弹框展示。

3.点击设置cookie，会设置cookie信息，设置成功弹出显示“设置cookie成功”，此时点击获取cookie信息，cookie信息弹窗中包含“info=测试cookie写入”的内容。

4.点击验证cookie，跳转至新界面。若在首页完成登录操作，则可跳转至“账户中心>关于”界面；若未登录，则跳转至登录界面。

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为Stage模型，支持API Version 9。
3. 本示例需要使用DevEco Studio 3.1 Release版本进行编译运行。