# 应用首次启动（ArkTS）

### 简介
本篇Codelab基于自定义弹框、首选项和页面路由router实现了一个模拟应用首次启动的案例。效果图如下：

![](screenshots/device/FirstStartDemo.gif)

### 相关概念

[首选项](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/js-apis-data-preferences-0000001427745052-V3?catalogVersion=V3) ：首选项为应用提供Key-Value键值型的数据处理能力，支持应用持久化轻量级数据，并对其修改和查询。数据存储形式为键值对，键的类型为字符串型，值的存储数据类型包括数字型、字符型、布尔型以及这3种类型的数组类型。

[自定义弹窗](https://developer.harmonyos.com/cn/docs/documentation/doc-references/ts-methods-custom-dialog-box-0000001281001266) ：通过CustomDialogController类显示自定义弹窗。

[页面路由](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/js-apis-router-0000001478061893-V3?catalogVersion=V3) ：提供通过不同的url访问不同的页面，包括跳转到应用内的指定页面、用应用内的某个页面替换当前页面、返回上一页面或指定的页面等。

### 相关权限

不涉及

### 使用说明

1. 第一次打开应用进入启动页，显示隐私协议弹框。
2. 第一次打开应用进入启动页，点击隐私协议链接跳转隐私协议页面。
3. 第一次打开应用进入启动页，显示隐私协议弹框，点击不同意，退出应用。
4. 第一次打开应用进入启动页，显示隐私协议弹框，点击同意，3秒后跳转到广告页。
5. 进入广告页，2秒后自动跳转应用首页。
6. 进入广告页，点击右上角跳过按钮，跳转应用首页。

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为Stage模型，支持API version 9及以上版本SDK。
3. 本示例需要使用DevEco Studio 3.1 Beta1及以上版本进行编译运行。