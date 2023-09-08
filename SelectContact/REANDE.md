# ArkTS与H5的交互（ArkTS）
### 简介
本篇Codelab主要介绍H5如何调用ArkTS侧相关功能并且获取ArkTS侧的回调数据。以“获取通讯录”为示例分步去讲解JSBridge桥接的实现。

![SelectContact](screenshots/device/SelectContact.gif)

### 相关概念
- [Web组件](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-basic-components-web-0000001477981205-V3?catalogVersion=V3)：提供具有网页显示能力的Web组件。
- [@ohos.web.webview](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/js-apis-webview-0000001427902720-V3)：提供web控制能力。

### 相关权限
无

### 使用说明
1. 进入应用首页，点击右侧联系人图标拉起系统通讯录页面，选中联系人后异步返回联系人信息。
2. 选择金额点击底部充值按钮会出现toast提示。


### 约束与限制
1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为Stage模型，支持API version 9。
3. 本示例需要使用DevEco Studio 3.1 Release版本进行编译运行。