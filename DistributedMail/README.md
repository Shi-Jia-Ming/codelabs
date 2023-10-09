# 分布式邮件（ArkTS）
### 简介

本篇Codelab基于应用接续和跨端拍照等功能，实现分布式邮件应用。主要包含以下功能：

1. 实现跨设备拍照功能。
2. 通过点击系统Dock栏，使应用接续并进行数据传输。
3. 使用分布式文件系统跨设备获取图片。

![ShoppingApps](screenshots/device/DistributedMail.gif)
### 相关概念
- 跨端迁移：跨端迁移的主要工作是实现将应用当前任务（包括页面控件状态变量等）迁移到目标设备，能在目标设备上接续。
- 分布式跨端拍照组件：该模块提供了组件CollaborationCameraMenuItems和CollaborationCameraStateDialog，两者需要配合使用，完成分布式跨端拍照，如在PC端跨端调用手机端拍照。
- [分布式文件系统](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/file-access-across-devices-0000001505479413-V3?catalogVersion=V3)：分布式文件系统为应用提供了跨设备文件访问的能力，开发者在多个设备安装同一应用时，通过基础文件接口，可跨设备读写其他设备该应用分布式文件路径（/data/storage/el2/distributedfiles/）下的文件。
### 相关权限
本篇Codelab用到分布式的能力，需要在配置文件module.json5里添加不同设备间的数据交换权限：ohos.permission.DISTRIBUTED_DATASYNC。
### 使用说明
1. 进入应用首页，可以在收件人、发件人、主题文本框输入相应内容。
2. 点击底部工具栏最左边的图标，会弹出组网内具有对应相机能力的设备列表。用户选择对应的设备后，进行拍摄。图片拍照好后，会回传到本端设备上。
3. 本端打开分布式邮件应用，对端手机的Dock栏中会新增分布式邮件应用图标，点击分布式邮件应用，本端应用会接续到对端设备上去。


### 约束与限制
1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为Stage模型，支持API version 10及以上版本SDK。
3. 本示例需要使用DevEco Studio 4.0 及以上版本进行编译运行。
