# 健康生活（ArkTS）

### 简介
利用ArkTS声明式开发范式和HarmonyOS的关系型数据库等能力，实现了一个健康生活应用。

![](screenshots/health_life.gif)

### 相关概念
- [AppStorage](https://developer.harmonyos.com/cn/docs/documentation/doc-guides/ts-application-states-appstorage-0000001333321265#ZH-CN_TOPIC_0000001333321265__appstorage%E6%8E%A5%E5%8F%A3) : 应用程序中的单例对象，为应用程序范围内的可变状态属性提供中央存储。
- [@Observed和 @ObjectLink](https://developer.harmonyos.com/cn/docs/documentation/doc-guides/ts-other-states-observed-objectlink-0000001281201222)：@Observed 适用于类，表示类中的数据变化由UI页面管理；@ObjectLink 应用于被@Observed 装饰类的对象。
- [@Consume 和 @Provide](https://developer.harmonyos.com/cn/docs/documentation/doc-guides/ts-other-states-consume-provide-0000001333321277)：@Provide 作为数据提供者，可以更新子节点的数据，触发页面渲染。@Consume 检测到@Provide 数据更新后，会发起当前视图的重新渲染。
- [Flex](https://developer.harmonyos.com/cn/docs/documentation/doc-references/ts-container-flex-0000001281001250) : 一个功能强大的容器组件，支持横向布局，竖向布局，子组件均分和流式换行布局。
- [List](https://developer.harmonyos.com/cn/docs/documentation/doc-references/ts-container-list-0000001333800573): List 是很常用的滚动类容器组件之一，它按照水平或者竖直方向线性排列子组件， List 的子组件必须是 ListItem ，它的宽度默认充满 List 的宽度。
- [TimePicker](https://developer.harmonyos.com/cn/docs/documentation/doc-references/ts-basic-components-timepicker-0000001281480698):TimePicker 是选择时间的滑动选择器组件，默认以 00:00 至 23:59 的时间区创建滑动选择器。
- [toggle](https://developer.harmonyos.com/cn/docs/documentation/doc-references/ts-basic-components-toggle-0000001281361118): 组件提供勾选框样式、状态按钮样式及开关样式。
- [关系型数据库](https://developer.harmonyos.com/cn/docs/documentation/doc-references/js-apis-data-rdb-0000001281001102)：一种基于关系模型来管理数据的数据库。
- [首选项](https://developer.harmonyos.com/cn/docs/documentation/doc-references/js-apis-data-storage-0000001281360982)：首选项为应用提供Key-Value键值型的数据处理能力，支持应用持久化轻量级数据，并对其修改和查询。

### 相关权限
不涉及

### 使用说明

1. 用户可以创建最多6个健康生活任务（早起，喝水，吃苹果，每日微笑，刷牙，早睡），并设置任务目标、是否开启提醒、提醒时间、每周任务频率。
2. 用户可以在主页面对设置的健康生活任务进行打卡，其中早起、每日微笑、刷牙和早睡只需打卡一次即可完成任务，喝水、吃苹果需要根据任务目标量多次打卡完成。
3. 主页可显示当天的健康生活任务完成进度，当天所有任务都打卡完成后，进度为100%，并且用户的连续打卡天数加一。
4. 当用户连续打卡天数达到3、7、30、50、73、99天时，可以获得相应的成就。成就在获得时会以动画形式弹出，并可以在“成就”页面查看。
5. 用户可以查看以前的健康生活任务完成情况。

### 约束与限制
1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为Stage模型，支持API version 9及以上版本SDK。
3. 本示例需要使用DevEco Studio 3.1 Beta1及以上版本进行编译运行。


