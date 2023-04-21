# 计步器应用（ArkTS）

### 简介
基于计步传感器、位置服务和后台任务，实现计步器应用。效果图如下：

![](screenshots/device/Steps.gif)

### 相关概念

- [传感器](https://developer.harmonyos.com/cn/docs/documentation/doc-guides/sensor-overview-0000001333640881) ：提供订阅传感器数据基本能力，主要包含查询传感器的列表、订阅/取消传感器的数据、执行控制命令等。

- [位置服务](https://developer.harmonyos.com/cn/docs/documentation/doc-guides/device-location-overview-0000001333720765) ：位置服务提供GNSS定位、网络定位、地理编码、逆地理编码、国家码和地理围栏等基本功能。

- [后台任务](https://developer.harmonyos.com/cn/docs/documentation/doc-guides/background-task-overview-0000001333321001) ：本模块提供后台任务管理能力。

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

1. 本示例仅支持标准系统上运行，支持设备：华为手机。
2. 本示例为Stage模型，支持API version 8版本SDK。
3. 本示例需要使用DevEco Studio 3.1 Beta2及以上版本进行编译运行。