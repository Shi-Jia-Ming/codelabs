# Stage模型下Ability的创建和使用（ArkTS）
### 简介
本篇Codelab是基于Stage模型，以购物应用为例，讲解Ability的创建和使用。效果图如下：

![](screenshots/device/screenshots.gif)
### 相关概念
- Ability：Ability是应用所具备能力的抽象，也是应用程序的重要组成部分。Ability是系统调度应用的最小单元，是能够完成一个独立功能的组件。一个应用可以包含一个或多个Ability。
- AbilityContext：Ability类拥有context属性，context属性为AbilityContext类，AbilityContext类拥有abilityInfo、currentHapModuleInfo等属性，启动Ability等方法。
- Want：应用开发者可以通过want传递启动参数，比如希望指定页面启动Ability，可以通过want中的uri参数或parameters参数传递pages信息。
- HiLog：HiLog日志系统，让应用可以按照指定类型、指定级别、指定格式字符串输出日志内容，帮助开发者了解应用的运行状态，更好地调试程序。
### 相关权限
不涉及
### 使用说明
1. 点击商品列表中的商品，跳转详情页。
2. 点击底部导航栏中的导航按钮，可以切换页面。
3. 点击详情页面顶部的返回按钮，关闭当前页面。
### 约束与限制
1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为Stage模型，支持API version 9及以上版本SDK。
3. 本示例需要使用DevEco Studio 3.0 Beta4及以上版本进行编译运行。

