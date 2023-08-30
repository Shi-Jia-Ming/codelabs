# Stage模型下Ability的创建和使用（ArkTS）
### 简介
本篇Codelab是基于Stage模型，以购物应用为例，讲解Ability的创建和使用。效果图如下：

![](screenshots/device/screenshots.gif)
### 相关概念
- [UIAbility](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/uiability-overview-0000001477980929-V3)：UIAbility组件是系统调度的基本单元，为应用提供绘制界面的窗口；一个UIAbility组件中可以通过多个页面来实现一个功能模块。每一个UIAbility组件实例，都对应于一个最近任务列表中的任务。
- [UIAbilityContext](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/js-apis-inner-application-uiabilitycontext-0000001478341321-V3)：UIAbilityContext模块提供允许访问特定Ability的资源的能力，包括对Ability的启动、停止的设置、获取caller通信接口、拉起弹窗请求用户授权等。
- [Want](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/js-apis-inner-ability-want-0000001428061892-V3)：Want是对象间信息传递的载体, 可以用于应用组件间的信息传递。 Want的使用场景之一是作为startAbility的参数, 其包含了指定的启动目标, 以及启动时需携带的相关数据。
- [HiLog](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/js-apis-hilog-0000001428061984-V3)：HiLog日志系统，让应用可以按照指定类型、指定级别、指定格式字符串输出日志内容，帮助开发者了解应用的运行状态，更好地调试程序。
### 相关权限
不涉及
### 使用说明
1. 点击商品列表中的商品，跳转详情页。
2. 点击底部导航栏中的导航按钮，可以切换页面。
3. 点击详情页面顶部的返回按钮，关闭当前页面。
### 约束与限制
1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为Stage模型，支持API version 9及以上版本SDK。
3. 本示例需要使用DevEco Studio 3.1 Release及以上版本进行编译运行。
