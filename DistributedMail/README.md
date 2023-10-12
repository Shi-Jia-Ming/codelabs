# 分布式邮件（ArkTS）
### 简介

本篇Codelab基于应用接续和分布式文件系统等功能，实现分布式邮件应用。主要包含以下功能：

1. 实现分布式邮件在不同设备间的接续。
2. 使用分布式文件系统进行邮件附件的跨设备传输。

### 相关概念
- [应用接续](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V4/app-continuation-overview-0000001576391296-V4?catalogVersion=V4)：应用接续的主要工作是实现将应用当前任务（包括页面控件状态变量等）迁移到目标设备，能在目标设备上接续。
- 分布式文件系统：该模块提供了组件CollaborationCameraMenuItems和CollaborationCameraStateDialog，两者需要配合使用，完成分布式跨端拍照，如在PC端跨端调用手机端拍照。
- [分布式文件系统](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V4/distributed-fs-overview-0000001580345330-V4?catalogVersion=V4)：分布式文件系统为应用提供了跨设备文件访问的能力，开发者在多个设备安装同一应用时，通过基础文件接口，可跨设备读写其他设备该应用分布式文件路径（/data/storage/el2/distributedfiles/）下的文件。
### 相关权限
本篇Codelab用到分布式的能力，需要在配置文件module.json5里添加不同设备间的数据交换权限：ohos.permission.DISTRIBUTED_DATASYNC。
### 使用说明
1. 进入应用首页，可以在收件人、发件人、主题文本框输入相应内容。
2. 点击底部工具栏最左边的图标，会弹出文件选择窗口，选定需要的附件之后，就可以将附件进行跨设备迁移。
3. 本端打开分布式邮件应用，对端手机的快捷操作栏中会新增分布式邮件应用图标，点击分布式邮件应用，本端应用会接续到对端设备上去。


### 约束与限制
1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为Stage模型，支持API version 10及以上版本SDK。
3. 本示例需要使用DevEco Studio 4.0 及以上版本进行编译运行。
