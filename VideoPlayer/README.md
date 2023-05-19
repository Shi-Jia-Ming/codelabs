# 视频播放器（ArkTS）

### 简介

基于HarmonyOS的播放管理类（AVPlayer），实现视频播放功能。

![image](screenshots/device/VideoPlayer.gif)

### 相关概念

- [AVPlayer](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/js-apis-media-0000001427902672-V3?ha_linker=eyJ0cyI6MTY4NDM5NDkyNzY4NCwiaWQiOiJhMDEwYWRjNDg3N2ZhMWYwMzc0ZTYzNTdlMjk3ZDkzZCJ9#ZH-CN_TOPIC_0000001493415664__avplayer9)播放管理类：视频播放组件。
- [XComponent](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-basic-components-xcomponent-0000001427902468-V3?catalogVersion=V3&ha_linker=eyJ0cyI6MTY4NDM5NDk3NTE1MywiaWQiOiJhMDEwYWRjNDg3N2ZhMWYwMzc0ZTYzNTdlMjk3ZDkzZCJ9)：可用于EGL/OpenGLES和媒体数据写入，并显示在XComponent组件。
- [自定义弹框](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-methods-custom-dialog-box-0000001477981237-V3?catalogVersion=V3&ha_linker=eyJ0cyI6MTY4NDM5NTAwNjQ4MCwiaWQiOiJhMDEwYWRjNDg3N2ZhMWYwMzc0ZTYzNTdlMjk3ZDkzZCJ9)：通过CustomDialogController类显示自定义弹窗。使用弹窗组件时，可优先考虑自定义弹窗，便于自定义弹窗的样式与内容。
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

1. 主页面使用Tabs组件实现本地视频、网络视频页面的切换。
2. 本地视频页面包括本地视频列表和扫描本地视频按钮。
3. 网络视频页面包括网络视频列表和添加网络视频按钮。
4. 播放页面包括标题、视频播放、播放控制、进度条四个子组件和亮度调节、音量设置两块区域。
5. 播放页面中的标题子组件，可设置倍速播放、播放模式（单片循环、连续播放）。
6. 播放页面中的视频播放子组件，使用播放管理类（AVPlayer）实现视频播放。
7. 播放页面中的播放控制子组件，可对视频进行暂停、播放、切换操作。
8. 播放页面中的进度条子组件，展示视频播放进度和总时长，也可拖动进度条设置视频播放位置。
9. 播放页面在标题栏和视频页面之间区域可上下滑动调节屏幕亮度；在视频页面和控制栏之间区域可左右滑动调节视频音量。

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为Stage模型，支持API version 9及以上版本SDK。
3. 本示例需要使用DevEco Studio 3.1 Release及以上版本进行编译运行。