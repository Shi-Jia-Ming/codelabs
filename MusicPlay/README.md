# 音乐播放原子化服务和卡片（ArkTS）

### 简介
基于自适应和响应式布局，实现一次开发，多端部署音乐播放原子化服务，并结合ArkTS卡片控制播放功能。效果图如下：

![](screenshots/device/music.gif)

### 相关概念
- [AVPlayer](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/js-apis-media-0000001427902672-V3?ha_linker=eyJ0cyI6MTY5MDg4MTU2NjA2OSwiaWQiOiJmMDZiYWZkNWQ2NjAyMDUwZmY4NWVjYmE0ODYxNWU3ZCJ9#ZH-CN_TOPIC_0000001523488666__avplayer9): AVPlayer主要工作是将Audio/Video媒体资源转码为可供渲染的图像和可听见的音频模拟信号，并通过输出设备进行播放，同时对播放任务进行管理，包括开始播放、暂停播放、停止播放、释放资源、设置音量、跳转播放位置、获取轨道信息等功能控制。
- [后台任务管理](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/js-apis-resourceschedule-backgroundtaskmanager-0000001544584033-V3?catalogVersion=V3&ha_linker=eyJ0cyI6MTY5MDg4MTU4NDQ1MiwiaWQiOiJmMDZiYWZkNWQ2NjAyMDUwZmY4NWVjYmE0ODYxNWU3ZCJ9): 本模块提供后台任务管理能力。

### 相关权限

本篇Codelab需要添加以下权限：

- ohos.permission.KEEP_BACKGROUND_RUNNING

### 使用说明

1. 分别在手机、折叠屏、平板安装并打开应用，不同设备的应用页面通过响应式布局和自适应布局呈现不同的效果。
2. 点击列表歌曲播放音乐，进入播放页面。
3. 点击评论按钮进入评论页面。
4. 添加卡片到桌面，卡片显示当前播放歌曲名等信息，通过按钮可以控制音乐播放状态。

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为Stage模型，支持API version 9及以上版本SDK。
3. 本示例需要使用DevEco Studio 3.1 Release及以上版本进行编译运行。