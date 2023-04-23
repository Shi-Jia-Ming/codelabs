# UIAbility和自定义组件生命周期（ArkTS）

### 简介
本篇Codelab主要介绍UIAbility和自定义组件生命周期。

### 相关概念
- [UIAbility](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/uiability-overview-0000001477980929-V3)：UIAbility组件是一种包含UI界面的应用组件，主要用于和用户交互。UIAbility组件是系统调度的基本单元，为应用提供绘制界面的窗口；一个UIAbility组件中可以通过多个页面来实现一个功能模块。每一个UIAbility组件实例，都对应于一个最近任务列表中的任务。
- [自定义组件的生命周期](https://developer.harmonyos.com/cn/docs/documentation/doc-references/ui-ts-custom-component-lifecycle-callbacks-0000001436217309)：自定义组件的生命周期回调函数用于通知用户该自定义组件的生命周期，这些回调函数是私有的，在运行时由开发框架在特定的时间进行调用，不能从应用程序中手动调用这些回调函数。
- [窗口开发指导](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/window-overview-0000001428061588-V3?catalogVersion=V3)：窗口模块用于在同一块物理屏幕上，提供多个应用界面显示、交互的机制。

### 相关权限
不涉及

### 使用说明
1. 通过日志打印可以在控制台观察生命周期的调用过程。

### 约束与限制
1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为Stage模型，支持API version 9及以上版本SDK。
3. 本示例需要使用DevEco Studio 3.1 Beta2及以上版本进行编译运行。


