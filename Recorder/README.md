# 录音机（ArkTS）

### 简介

本篇Codelab使用AVPlayer和AVRecorder实现了一个录音机，可以录制并播放音频文件。效果图如下：

![image](screenshots/device/录音机.gif)

### 相关概念

- [AVPlayer](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/js-apis-media-0000001427902672-V3#ZH-CN_TOPIC_0000001523488666__avplayer9)：播放管理类，用于管理和播放媒体资源。

- [AVRecorder](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/js-apis-media-0000001427902672-V3#ZH-CN_TOPIC_0000001523488666__avrecorder9)：音视频录制管理类，用于音视频媒体录制。

- [媒体库管理](https://developer.harmonyos.com/cn/docs/documentation/doc-references/js-apis-medialibrary-0000001281001130)：用于访问和修改用户等个人媒体数据信息（如音频、视频、图片、文档等）。

### 相关权限

本篇Codelab需要添加以下权限：

- ohos.permission.INTERNET
- ohos.permission.MICROPHONE
- ohos.permission.MEDIA_LOCATION
- ohos.permission.READ_MEDIA
- ohos.permission.WRITE_MEDIA

### 使用说明

1. 在应用首页，点击录制按钮，可以跳转到录制页面进行录音，按停止按钮结束录音生成音频文件。
2. 在应用首页，点击音频文件，可以跳转到播放页面进行播放，按暂停按钮暂停播放。
3. 在应用首页，点击音频文件的播放按钮，可以播放音频文件，按暂停按钮暂停播放。

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为Stage模型，支持API version 9。
3. 本示例需要使用DevEco Studio 3.1 Release版本进行编译运行。