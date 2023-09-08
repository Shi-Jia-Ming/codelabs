# 视频播放器（ArkTS）

### 简介

基于HarmonyOS的播放管理类（AVPlayer），实现视频播放功能。

![image](screenshots/device/VideoPlayer.gif)

### 相关概念

- [AVPlayer](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/js-apis-media-0000001427902672-V3?ha_linker=eyJ0cyI6MTY4NDM5NDkyNzY4NCwiaWQiOiJhMDEwYWRjNDg3N2ZhMWYwMzc0ZTYzNTdlMjk3ZDkzZCJ9#ZH-CN_TOPIC_0000001493415664__avplayer9)播放管理类：视频播放组件。
- [XComponent](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-basic-components-xcomponent-0000001427902468-V3?catalogVersion=V3&ha_linker=eyJ0cyI6MTY4NDM5NDk3NTE1MywiaWQiOiJhMDEwYWRjNDg3N2ZhMWYwMzc0ZTYzNTdlMjk3ZDkzZCJ9)：可用于EGL/OpenGLES和媒体数据写入，并显示在XComponent组件。
- [PanGesture](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-basic-gestures-pangesture-0000001427744804-V3?catalogVersion=V3&ha_linker=eyJ0cyI6MTY4NDM5NTAyNjY3NiwiaWQiOiJhMDEwYWRjNDg3N2ZhMWYwMzc0ZTYzNTdlMjk3ZDkzZCJ9)手势：平移手势，滑动最小距离为5vp时识别成功。

### 相关权限

本篇Codelab需要在module.json5中配置如下权限：

```typescript
"requestPermissions": [
  {
    "name": "ohos.permission.INTERNET"
  }
]
```



### 使用说明

1. 获取本地视频和网络视频。
2. 通过AVPlayer进行视频播放。
3. 通过手势调节屏幕亮度和视频播放音量。

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为Stage模型，支持API version 9。
3. 本示例需要使用DevEco Studio 3.1 Release版本进行编译运行。