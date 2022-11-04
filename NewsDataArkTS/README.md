# 新闻数据加载

## 简介

本篇Codelab是基于ArkTS的声明式开发范式的样例，主要介绍了数据请求和touch事件的使用。

![](screenshots/device/news.gif)

## 相关概念

[List](https://developer.harmonyos.com/cn/docs/documentation/doc-references/ts-container-list-0000001333800573)：列表包含一系列相同宽度的列表项；

[Tabs](https://developer.harmonyos.com/cn/docs/documentation/doc-references/ts-container-tabs-0000001281001258)、[TabContent组件](https://developer.harmonyos.com/cn/docs/documentation/doc-references/ts-container-tabcontent-0000001281201166)：通过页签进行内容视图切换；

[数据请求](https://developer.harmonyos.com/cn/docs/documentation/doc-references/js-apis-http-0000001281201030)：提供发起请求、中断请求、订阅/取消订阅HTTP Response Header 等方法；

[触摸事件onTouch](https://developer.harmonyos.com/cn/docs/documentation/doc-references/ts-universal-events-touch-0000001281001286)：触摸动作触发调用该方法；

## 相关权限

添加网络权限：ohos.permission.INTERNET。

## 使用说明

1.点击应用进入主页面，页面使用tabBar展示新闻分类，tabContent展示新闻列表。

2.点击页签或左右滑动页面，切换标签并展示对应新闻类型的数据。

3.新闻列表页面，滑动到新闻列表首项数据，接着往下滑动会触发下拉刷新操作，页面更新10条新闻数据，滑动到新闻列表最后一项数据，往上拉会触发上拉加载操作，新闻列表会在后面加载10条新闻数据。

## 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为Stage模型，支持API version 9及以上版本SDK。
3. 本示例需要使用DevEco Studio 3.1 Canary1及以上版本进行编译运行。
