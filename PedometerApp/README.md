# 计步器应用（ArkTS）

### 简介

基于计步传感器、位置服务和后台任务，实现计步器应用。效果图如下：

![](screenshots/device/Steps.gif)

### 相关概念

- [计步传感器](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/js-apis-sensor-0000001493584264-V3?ha_linker=eyJ0cyI6MTY5NTI2NjE5MTU5OSwiaWQiOiJmMDZiYWZkNWQ2NjAyMDUwZmY4NWVjYmE0ODYxNWU3ZCJ9#ZH-CN_TOPIC_0000001573928905__pedometer9)：订阅计步器传感器数据，系统返回相关数据。
- [后台任务管理](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/js-apis-resourceschedule-backgroundtaskmanager-0000001544584033-V3?ha_linker=eyJ0cyI6MTY5NTI2NjI0NzI0MCwiaWQiOiJmMDZiYWZkNWQ2NjAyMDUwZmY4NWVjYmE0ODYxNWU3ZCJ9)：应用中存在用户能够直观感受到的且需要一直在后台运行的业务时（如，后台播放音乐），可以使用长时任务机制。
- [位置服务](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/js-apis-geolocationmanager-0000001427745092-V3?ha_linker=eyJ0cyI6MTY5NTI2NjI2OTUyNiwiaWQiOiJmMDZiYWZkNWQ2NjAyMDUwZmY4NWVjYmE0ODYxNWU3ZCJ9)：位置服务提供GNSS定位、网络定位、地理编码、逆地理编码、国家码和地理围栏等基本功能。

### 相关权限

本篇Codelab需要添加以下权限：

- ohos.permission.LOCATION
- ohos.permission.LOCATION_IN_BACKGROUND
- ohos.permission.APPROXIMATELY_LOCATION
- ohos.permission.ACTIVITY_MOTION
- ohos.permission.KEEP_BACKGROUND_RUNNING
- ohos.permission.INTERNET

### 使用说明

1. 打开应用，显示计步器界面。
2. 在计步器界面，在运动时获取实时位置和计步器数据。
3. 在计步器界面，设置目标步数，点击开始获取计步器数据并计算完成度。
4. 在计步器界面，点击结束停止计算完成度。

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为FA模型，支持API version 9版本SDK。
3. 本示例需要使用DevEco Studio 3.1 Release版本进行编译运行。
