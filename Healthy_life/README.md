# 健康生活应用（ArkTS）

### 简介
利用ArkTS声明式开发范式和HarmonyOS的关系型数据库等能力，实现了一个健康生活应用。

![](screenshots/health_life.gif)

### 相关概念
- [AppStorage](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/arkts-appstorage-0000001524417209-V3)：应用程序中的单例对象，为应用程序范围内的可变状态属性提供中央存储。
- [@Observed和@ObjectLink](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/arkts-observed-and-objectlink-0000001473697338-V3)：@Observed适用于类，表示类中的数据变化由UI页面管理；@ObjectLink应用于被@Observed装饰类的对象。
- [@Provide和@Consume](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/arkts-provide-and-consume-0000001473857338-V3)：@Provide作为数据提供者，可以更新子节点的数据，触发页面渲染。@Consume检测到@Provide数据更新后，会发起当前视图的重新渲染。
- [Flex](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-container-flex-0000001427902472-V3?catalogVersion=V3)：一个功能强大的容器组件，支持横向布局，竖向布局，子组件均分和流式换行布局。
- [List](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-container-list-0000001477981213-V3?catalogVersion=V3)：List是很常用的滚动类容器组件之一，它按照水平或者竖直方向线性排列子组件， List的子组件必须是ListItem，它的宽度默认充满List的宽度。
- [TimePicker](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-basic-components-timepicker-0000001478341149-V3?catalogVersion=V3)：TimePicker是选择时间的滑动选择器组件，默认以00:00至23:59的时间区创建滑动选择器。
- [Toggle](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-basic-components-toggle-0000001478061705-V3?catalogVersion=V3)： 组件提供勾选框样式、状态按钮样式及开关样式。
- [关系型数据库](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/data-persistence-by-rdb-store-0000001505752421-V3?catalogVersion=V3)：一种基于关系模型来管理数据的数据库。
- [首选项](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/data-persistence-by-preferences-0000001505432513-V3?catalogVersion=V3)：首选项为应用提供Key-Value键值型的数据处理能力，支持应用持久化轻量级数据，并对其修改和查询。
- [后台代理提醒](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/agent-powered-reminder-0000001663585481-V3?catalogVersion=V3)：后台代理提醒功能主要提供后台提醒通知发布接口，开发者可调用这些接口创建定时提醒，包括倒计时、日历、闹钟三种提醒类型。
- [ArkTS卡片](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/arkts-ui-widget-working-principles-0000001485485850-V3)：卡片框架的运作机制分三大模块：卡片使用方、卡片管理服务和卡片提供方。
  - 卡片使用方：负责卡片的创建、删除、请求更新以及卡片服务通信。
  - 卡片管理服务：负责卡片的周期性刷新、卡片缓存管理、卡片生命周期管理以及卡片使用对象管理。
  - 卡片提供方：提供卡片显示内容的应用，控制卡片的显示内容、控件布局以及控件点击事件。

### 相关权限
本篇Codelab用到了任务提醒功能，需要在配置文件module.json5里添加后台代理提醒权限：ohos.permission.PUBLISH_AGENT_REMINDER。

### 使用说明

1. 用户可以创建最多6个健康生活任务（早起，喝水，吃苹果，每日微笑，刷牙，早睡），并设置任务目标、是否开启提醒、提醒时间、每周任务频率。
2. 用户可以在主页面对设置的健康生活任务进行打卡，其中早起、每日微笑、刷牙和早睡只需打卡一次即可完成任务，喝水、吃苹果需要根据任务目标量多次打卡完成。
3. 主页可显示当天的健康生活任务完成进度，当天所有任务都打卡完成后，进度为100%，并且用户的连续打卡天数加一。
4. 当用户连续打卡天数达到3、7、30、50、73、99天时，可以获得相应的成就。成就在获得时会以动画形式弹出，并可以在“成就”页面查看。
5. 用户可以查看以前的健康生活任务完成情况。
6. 打开应用，显示主页面，点击加号添加任务，添加完任务后，任务列表显示所有添加的任务。
7. 应用退出到后台，长按应用，点击服务卡片，选择2x4卡片，添加到桌面，显示已添加任务。
8. 应用退出到后台，长按应用，点击服务卡片，选择2x2卡片，添加到桌面，显示任务完成进度。
9. 点击2x2或2x4元服务卡片，拉起主页面，看到任务列表。
10. 在卡片配置文件中，设置卡片更新时间，更新时间到后，桌面上2x2或2x4卡片会重置第二天任务，需要重新添加。

### 约束与限制
1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为Stage模型，支持API version 9。
3. 本示例需要使用DevEco Studio 3.1 Release版本进行编译运行。

