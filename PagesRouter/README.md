# UIAbility内页面间的跳转（ArkTS）

### 简介

基于Stage模型下的UIAbility开发，实现UIAbility内页面间的跳转。

效果图如下：

![](screenshots/device/pageRouter.gif)

### 相关概念

- [页面路由](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/js-apis-router-0000001478061893-V3?catalogVersion=V3): 提供通过不同的url访问不同的页面，包括跳转到应用内的指定页面、用应用内的某个页面替换当前页面、返回上一页面或指定的页面等。

### 相关权限

不涉及

### 使用说明

1.应用首页有一个文本和一个按钮，点击按钮跳转到下一个页面，并传递数据。

2.第二个页面有两个文本和一个按钮，其中一个文本展示从首页传递过来的数据。点击按钮返回上一个页面。

### 约束与限制

1.本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。

2.本示例为Stage模型，支持API version 9。

3.本示例需要使用DevEco Studio 3.1 Release版本进行编译运行。