# Web组件抽奖案例（ArkTS）

## 简介

本篇Codelab是基于ArkTS的声明式开发范式的样例，主要介绍了Web组件如何加载本地和云端H5小程序。

![image](screenshots/device/web.gif)

## 相关概念

[Web](https://developer.harmonyos.com/cn/docs/documentation/doc-references/ts-basic-components-web-0000001333720957)：提供具有网页显示能力的Web组件。

runJavaScript：异步执行JavaScript脚本，并通过回调方式返回脚本执行的结果。

onConfirm：网页调用confirm()告警时触发此回调。本篇Codelab用于回显抽奖结果。

## 相关权限

访问在线网页时需添加网络权限：ohos.permission.INTERNET。

## 使用说明

1.点击应用进入主页面，页面提供两个按钮，分别对应加载本地H5和加载云端H5，点击按钮跳转到抽奖页面，Web组件会加载H5抽奖小程序。

2.抽奖页面主要是由“点击抽奖”按钮和Web组件构成。给“点击抽奖”按钮绑定点击事件，实现点击按钮调用H5页面的抽奖函数，并且通过onConfirm回调返回抽奖结果，在原生页面弹窗显示。

3.点击返回键，回到应用主页面。

## 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为Stage模型，支持API Version 9及以上版本SDK。
3. 本示例需要使用DevEco Studio 3.1 Canary1及以上版本进行编译运行。