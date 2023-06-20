# 图片编辑（JS）

## 简介
基于canvas组件、图片编解码，实现一个简易的图片编辑器应用。

![](screenshots/device/edit.gif)

## 相关概念

- [canvas组件](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/js-components-canvas-canvas-0000001427902536-V3): 提供画布组件。用于自定义绘制图形。 
- [图片处理](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/js-apis-image-0000001477981401-V3#ZH-CN_TOPIC_0000001477981401__imagecreatepixelmap8-1): 提供图片处理效果，包括通过属性创建PixelMap、读取图像像素数据、读取区域内的图片数据等。

## 相关权限
本篇Codelab使用了媒体文件存储能力，需要在配置文件config.json里添加媒体文件读写权限：
- ohos.permission.MEDIA_LOCATION
- ohos.permission.READ_MEDIA
- ohos.permission.WRITE_MEDIA

## 使用说明

1. 进入应用首页，按需裁剪、旋转、调节图片。
2. 可保存编辑后的图片、可恢复原图。

## 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为FA模型，支持API version 9及以上版本SDK。
3. 本示例需要使用DevEco Studio 3.1 Release及以上版本进行编译运行。